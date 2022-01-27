import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learn_language/core/constants/enum/button_state_enum.dart';
import 'package:learn_language/core/constants/image/image_constants.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/context_extension.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) =>
          Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.13),
        child: Form(
          key: viewModel.formState,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Padding(
                padding: context.paddingMediumVertical,
                child: Image.asset(
                  ImageConstants.instance.splashImage,
                  width: 120,
                ),
              ),
              TextFormField(
                controller: viewModel.emailController,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.mail),
                ),
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Enter a valid email'
                        : null,
              ),
              Padding(
                padding: context.paddingVerticalDefaultScreen,
                child: Observer(builder: (_) {
                  return TextFormField(
                    controller: viewModel.passwordController,
                    obscureText: viewModel.isObscure,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.vpn_key_sharp),
                      suffixIcon: IconButton(
                        icon: Icon(
                          viewModel.isObscure ? Icons.lock : Icons.lock_open,
                        ),
                        onPressed: viewModel.changeObsecureText,
                      ),
                      labelText: "Password",
                    ),
                  );
                }),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password",
                  style: context.textTheme.bodyText1!.copyWith(
                      color: context.colors.background,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Observer(builder: (_) {
                return Padding(
                  padding: context.paddingNormalVertical,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    width: viewModel.state == ButtonStates.INIT
                        ? context.screenWidth
                        : 70,
                    onEnd: viewModel.changeAnimationState,
                    height: 70,
                    child: viewModel.isStretched
                        ? buildButton(context, viewModel)
                        : buildSmallButton(context, viewModel),
                  ),
                );
              }),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, LoginViewModel viewModel) =>
      OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: const StadiumBorder(),
          side: BorderSide(width: 1, color: context.colors.secondary),
        ),
        child: FittedBox(
          child: Text(
            'Log in',
            style: TextStyle(
              fontSize: 16,
              color: context.colors.primary,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        onPressed: viewModel.login,
      );

  Widget buildSmallButton(BuildContext context, LoginViewModel viewModel) {
    final color = viewModel.isDone
        ? context.colors.primaryVariant
        : context.colors.secondaryVariant;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
        child: viewModel.isDone
            ? const Icon(
                Icons.done,
                size: 52,
                color: Colors.white,
              )
            : CircularProgressIndicator(
                backgroundColor: context.colors.primaryVariant,
                color: Colors.white,
              ),
      ),
    );
  }
}
