import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/shared.dart';
import '../features.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);
    final controller = ref.watch(loginControllerProvider.notifier);
    void login(BuildContext context) {
      final form = Form.of(context);
      if (!form.validate()) {
        return;
      }
      controller.login();
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: AutofillGroup(
                  child: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppTextField(
                          value: state.username,
                          label: 'Username',
                          decoration: const InputDecoration(prefixIcon: Icon(Icons.person)),
                          onChanged: controller.usernameChanged,
                          textInputAction: TextInputAction.next,
                          validator: Validator.required(),
                        ),
                        const Gap(8),
                        Builder(builder: (context) {
                          return AppTextField(
                            value: state.password,
                            label: 'Password',
                            obscureText: true,
                            decoration: const InputDecoration(prefixIcon: Icon(Icons.lock)),
                            onChanged: controller.passwordChanged,
                            onSubmitted: (_) => login(context),
                            validator: Validator.required(),
                          );
                        }),
                        const Gap(16),
                        Builder(
                          builder: (context) {
                            return MinecraftButton(
                              onPressed: () => login(context),
                              text: 'Login',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
