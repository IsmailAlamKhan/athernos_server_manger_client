import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppTextField extends HookConsumerWidget {
  AppTextField({
    super.key,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.autofocus = false,
    this.obscureText = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.validator,
    this.autofillHints,
    this.value,
    String? label,
    String? hint,
    InputDecoration decoration = const InputDecoration(),
  }) : decoration = decoration.copyWith(labelText: label, hintText: hint);
  final InputDecoration decoration;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool obscureText;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final Validator? validator;
  final Iterable<String>? autofillHints;
  final String? value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscureText = useState(this.obscureText);
    InputDecoration decoration = this.decoration;
    if (this.obscureText) {
      if (obscureText.value) {
        decoration = decoration.copyWith(
          suffixIcon: IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: () => obscureText.value = !obscureText.value,
          ),
        );
      } else {
        decoration = decoration.copyWith(
          suffixIcon: IconButton(
            icon: const Icon(Icons.visibility_off),
            onPressed: () => obscureText.value = !obscureText.value,
          ),
        );
      }
    }
    final controller = useTextEditingController(text: value);
    useEffect(() {
      if (controller.text != value) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.text = value ?? '';
        });
      }
      return null;
    }, [value]);
    return TextFormField(
      controller: controller,
      autofillHints: autofillHints,
      decoration: decoration,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      autofocus: autofocus,
      obscureText: obscureText.value,
      readOnly: readOnly,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      onChanged: onChanged,
      onEditingComplete: () {
        onEditingComplete?.call();
        TextInput.finishAutofillContext();
      },
      inputFormatters: inputFormatters,
      onFieldSubmitted: onSubmitted,
      validator: validator?.call,
    );
  }
}

class Validator {
  final String? Function(String?)? validator;

  Validator({this.validator});

  String? call(String? value) {
    return validator?.call(value);
  }

  static Validator required({String? message}) {
    return Validator(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return message ?? 'This field is required';
        }
        return null;
      },
    );
  }

  static Validator email({String? message}) {
    return Validator(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return message ?? 'This field is required';
        }
        if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value)) {
          return message ?? 'Invalid email';
        }
        return null;
      },
    );
  }

  static Validator password({String? message}) {
    return Validator(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return message ?? 'This field is required';
        }
        if (value.length < 6) {
          return message ?? 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }

  static Validator confirmPassword({String? message, String? password}) {
    return Validator(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return message ?? 'Please confirm your password';
        }
        if (value != password) {
          return message ?? 'Passwords does not match';
        }
        return null;
      },
    );
  }
}
