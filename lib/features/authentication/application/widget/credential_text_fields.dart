import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_commerce/utils/text_field_validators.dart';
import 'package:flutter_e_commerce/utils/text_input_formatter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum UserType { name, email }

class UserField extends HookWidget {
  final bool isRequired;
  final bool enabled;
  final String? initialValue;
  final TextEditingController? controller;
  final FormFieldSetter<String>? onSaved;
  final TextInputAction? textInputAction;
  final InputDecorationTheme? decorationTheme;
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  final UserType type;

  const UserField({
    super.key,
    this.isRequired = true,
    this.enabled = true,
    this.type = UserType.email,
    this.controller,
    this.onSaved,
    this.initialValue,
    this.textInputAction = TextInputAction.next,
    this.decorationTheme,
    this.padding,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        enabled: enabled,
        initialValue: initialValue,
        controller: controller,
        textInputAction: textInputAction,
        validator: isRequired ? (data) {
          final String trimmed = data!.trim();
          if (trimmed.isEmpty) {
            return 'required field';
          }
          return type == UserType.email ? Validator.validEmail(trimmed) : null;
        } : null,
        keyboardType: TextInputType.emailAddress,
        onSaved: onSaved,
        style: style,
        cursorColor: style?.color,
        onEditingComplete: FocusScope.of(context).nextFocus,
        inputFormatters: [
          LengthLimitingTextInputFormatter(40),
          FilteringTextInputFormatter.deny(RegExp(r'[\s]')),
          const LowerCaseTextFormatter(),
        ],
        autofillHints: const [AutofillHints.email],
        decoration: InputDecoration(
          labelText: switch(type) {
            UserType.email => 'E-mail',
            UserType.name => 'Name',
          },
          isDense: true,
          helperText: '',
        ).applyDefaults(
          decorationTheme ?? Theme.of(context).inputDecorationTheme,
        ),
      ),
    );
  }
}

/// PasswordField used commonly when login,
/// label doesn't show required attribute (*) because it's implied
/// that this field should always be obligatory
class PasswordField extends HookWidget {
  final bool isRequired;
  final String? initialValue;
  final TextEditingController? controller;
  final FormFieldSetter<String>? onSaved;
  final TextInputAction? textInputAction;
  final InputDecorationTheme? decorationTheme;
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;

  const PasswordField({
    super.key,
    this.isRequired = true,
    this.controller,
    this.onSaved,
    this.initialValue,
    this.textInputAction = TextInputAction.done,
    this.decorationTheme,
    this.padding,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final hidePassword = useState(true);
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        textInputAction: textInputAction,
        obscureText: hidePassword.value,
        validator: isRequired
            ? (data) => data!.isNotEmpty ? null : 'Type a password'
            : null,
        keyboardType: TextInputType.visiblePassword,
        onSaved: onSaved,
        style: style,
        cursorColor: style?.color,
        onEditingComplete: FocusScope.of(context).unfocus,
        inputFormatters: [
          LengthLimitingTextInputFormatter(40),
          FilteringTextInputFormatter.deny(RegExp(r'[\s]')),
        ],
        autofillHints: const [AutofillHints.password],
        decoration: InputDecoration(
          labelText: 'Password',
          isDense: true,
          suffixIcon: Material(
            type: MaterialType.transparency,
            clipBehavior: Clip.hardEdge,
            shape: const CircleBorder(),
            child: IconButton(
              color: IconTheme.of(context).color,
              icon: hidePassword.value
                  ? const Icon(
                      Icons.visibility_off_rounded,
                    )
                  : const Icon(Icons.visibility_rounded),
              onPressed: () => hidePassword.value = !hidePassword.value,
            ),
          ),
          helperText: '',
        ).applyDefaults(
          decorationTheme ?? Theme.of(context).inputDecorationTheme,
        ),
      ),
    );
  }
}
