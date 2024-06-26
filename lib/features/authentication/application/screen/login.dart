import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/authentication/application/validation_form_hook.dart';
import 'package:flutter_e_commerce/features/authentication/domain/exception/auth_exception.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/session.dart';
import 'package:flutter_e_commerce/features/authentication/application/widget/credential_text_fields.dart';
import 'package:flutter_e_commerce/features/authentication/application/controller/auth_provider.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/credential.dart';
import 'package:flutter_e_commerce/utils/constraints.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Credential? credential = ref.watch(authServiceProvider.notifier
        .select((auth) => auth.session?.credential));
    final hasCredentials = useValueNotifier(credential != null);
    final username = useTextEditingController(text: credential?.email);
    final password = useTextEditingController(
        text: credential != null && credential is EmailAuthCredential
            ? credential.password
            : null);
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
        child: _LoginForm(
          password: password,
          username: username,
          hasCredentialsNotifier: hasCredentials,
        ),
      ),
    );
  }
}

class _LoginForm extends HookConsumerWidget {
  final TextEditingController username;
  final TextEditingController password;
  final ValueNotifier<bool> hasCredentialsNotifier;

  const _LoginForm({
    // ignore: unused_element
    super.key,
    required this.password,
    required this.username,
    required this.hasCredentialsNotifier,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasCredentials = useValueListenable(hasCredentialsNotifier);
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
          if (!hasCredentials)
            UserField(
              controller: username,
              isRequired: true,
              padding: const EdgeInsets.only(bottom: 8.0),
              style: theme.textTheme.bodyMedium,
              decorationTheme: decoration,
            )
          else ...[
            _ExistentAccount(username: username.text),
            Center(
              child: TextButton(
                onPressed: () => hasCredentialsNotifier.value = false,
                child: const Text('Change account'),
              ),
            ),
          ],
          PasswordField(
            controller: password,
            style: theme.textTheme.bodyMedium,
            decorationTheme: decoration,
          ),
          gap12,
          _LoginButton(
            username: username,
            password: password,
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}

class _LoginButton extends HookConsumerWidget {
  final TextEditingController username;
  final TextEditingController password;
  final bool isLoading;

  const _LoginButton({
    // ignore: unused_element
    super.key,
    required this.username,
    required this.password,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAvailable = useValidateForm([username, password]);
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: !isAvailable.value || isLoading
          ? null
          : () async {
              final FormState form = Form.of(context);
              if (form.validate()) {
                final authProvider = ref.read(authServiceProvider.notifier);
                final Credential credential =
                    Credential(email: username.text, password: password.text);
                await authProvider.loginWithCredential(credential);
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
          : const Text('Login'),
    );
  }
}

class _ExistentAccount extends StatelessWidget {
  final String username;

  const _ExistentAccount({
    // ignore: unused_element
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final child = Text(
      username,
      maxLines: 1,
      overflow: TextOverflow.fade,
      textAlign: TextAlign.center,
    );
    return DefaultTextStyle.merge(
      style: theme.textTheme.titleLarge,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: child,
      ),
    );
  }
}
