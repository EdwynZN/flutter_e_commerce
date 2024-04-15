import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/authentication/application/controller/auth_provider.dart';
import 'package:flutter_e_commerce/features/authentication/application/validation_form_hook.dart';
import 'package:flutter_e_commerce/features/authentication/application/widget/credential_text_fields.dart';
import 'package:flutter_e_commerce/features/authentication/domain/exception/auth_exception.dart';
import 'package:flutter_e_commerce/features/authentication/domain/exception/user_exception.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/session.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/user_info.dart';
import 'package:flutter_e_commerce/routing/route_names.dart';
import 'package:flutter_e_commerce/utils/constraints.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = useTextEditingController();
    final username = useTextEditingController();
    final password = useTextEditingController();
    ref.listen<Object?>(
      authServiceProvider.select((a) => a.maybeWhen(
            error: (error, _) => error,
            orElse: () => null,
          )),
      (_, logged) {
        final maybeMessenger = ScaffoldMessenger.maybeOf(context);
        if (logged == null) {
          maybeMessenger?.hideCurrentSnackBar();
          return;
        }
        final String message;
        if (logged is AuthException) {
          message = logged.message;
          /// if there is an AuthException it means the user was created 
          /// but failed to login
          context.goNamed(RouteName.login);
        } else if (logged is UserException) {
          message = 'Couldn\'t create account for ${logged.email}';
          context.goNamed(RouteName.login);
        } else {
          message =
              'There was a problem, check your internet connection and try again';
        }
        maybeMessenger
          ?..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(message)));
      },
    );
    return Form(
      child: AutofillGroup(
        child: _SignupForm(
          name: name,
          password: password,
          username: username,
        ),
      ),
    );
  }
}

class _SignupForm extends HookConsumerWidget {
  final TextEditingController name;
  final TextEditingController username;
  final TextEditingController password;

  const _SignupForm({
    // ignore: unused_element
    super.key,
    required this.password,
    required this.name,
    required this.username,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLoading = ref.watch(
      authServiceProvider.select((value) => value is AsyncLoading<Session>),
    );
    final theme = Theme.of(context);
    const decoration = InputDecorationTheme();
    return AbsorbPointer(
      absorbing: isLoading,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(12.0),
        children: [
          UserField(
            controller: name,
            isRequired: true,
            type: UserType.name,
            padding: const EdgeInsets.only(bottom: 8.0),
            style: theme.textTheme.bodyMedium,
            decorationTheme: decoration,
          ),
          UserField(
            controller: username,
            isRequired: true,
            padding: const EdgeInsets.only(bottom: 8.0),
            style: theme.textTheme.bodyMedium,
            decorationTheme: decoration,
          ),
          PasswordField(
            controller: password,
            style: theme.textTheme.bodyMedium,
            decorationTheme: decoration,
          ),
          gap12,
          _SignButton(
            name: name,
            username: username,
            password: password,
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}

class _SignButton extends HookConsumerWidget {
  final TextEditingController name;
  final TextEditingController username;
  final TextEditingController password;
  final bool isLoading;

  const _SignButton({
    // ignore: unused_element
    super.key,
    required this.name,
    required this.username,
    required this.password,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAvailable = useValidateForm([username, password, name]);
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: !isAvailable.value || isLoading
          ? null
          : () async {
              final FormState form = Form.of(context);
              if (form.validate()) {
                final authProvider = ref.read(authServiceProvider.notifier);
                final user = UserInfo(
                  name: name.text,
                  email: username.text,
                  password: password.text,
                );
                await authProvider.signUpUser(user);
              }
            },
      child: isLoading
          ? ConstrainedBox(
              constraints: BoxConstraints.tight(const Size.square(16.0)),
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                color: theme.colorScheme.onPrimary,
              ),
            )
          : const Text('Signup'),
    );
  }
}
