// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../core/components/text/locale_text.dart';
import '../../../../core/constants/enum/button_state_enum.dart';
import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
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
          body(context, viewModel),
    );
  }

  Padding body(BuildContext context, LoginViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.13),
      child: Form(
        key: viewModel.formState,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Padding(
              padding: context.paddingMediumVertical,
              child: buildLogoImage(),
            ),
            buildEmailFormField(viewModel),
            Padding(
              padding: context.paddingVerticalDefaultScreen,
              child: Observer(builder: (_) {
                return buildPasswordFormField(viewModel);
              }),
            ),
            buildForgotPasswordButton(viewModel, context),
            Observer(builder: (_) {
              return Padding(
                padding: context.paddingNormalVertical,
                child: buildButtonAnimatedContainer(viewModel, context),
              );
            }),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  Image buildLogoImage() {
    return Image.asset(
      ImageConstants.instance.splashImage,
      width: 120,
    );
  }

  AnimatedContainer buildButtonAnimatedContainer(
      LoginViewModel viewModel, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      width: viewModel.state == ButtonStates.INIT ? context.screenWidth : 70,
      onEnd: viewModel.changeAnimationState,
      height: 70,
      child: viewModel.isStretched
          ? buildButton(context, viewModel)
          : buildSmallButton(context, viewModel),
    );
  }

  TextButton buildForgotPasswordButton(
      LoginViewModel viewModel, BuildContext context) {
    return TextButton(
      onPressed: viewModel.goToForgotPasswordScreen,
      child: LocaleText(
        text: LocaleKeys.auth_forgot_forgot_password,
        style: context.textTheme.bodyText1!.copyWith(
            color: context.colors.background, fontStyle: FontStyle.italic),
      ),
    );
  }

  TextFormField buildPasswordFormField(LoginViewModel viewModel) {
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
        labelText: LocaleKeys.general_password.tr(),
      ),
    );
  }

  TextFormField buildEmailFormField(LoginViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      decoration: InputDecoration(
        labelText: LocaleKeys.general_email.tr(),
        prefixIcon: const Icon(Icons.mail),
      ),
      validator: (email) => email != null && !EmailValidator.validate(email)
          ? LocaleKeys.validations_email.tr()
          : null,
    );
  }

  Widget buildButton(BuildContext context, LoginViewModel viewModel) =>
      OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: const StadiumBorder(),
          side: BorderSide(width: 1, color: context.colors.secondary),
        ),
        child: FittedBox(
          child: LocaleText(
            text: LocaleKeys.auth_login_login,
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
    final color =
        viewModel.isDone ? context.colors.primary : context.colors.secondary;

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
                backgroundColor: context.colors.primary,
                color: Colors.white,
              ),
      ),
    );
  }
}
