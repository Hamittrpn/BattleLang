// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/components/text/locale_text.dart';
import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/utils/utils.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Scaffold body(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.secondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: context.paddingHorizontalDefaultScreen,
        child: Form(
          child: Column(
            children: [
              const Spacer(),
              buildForgotTitleText(context),
              const SizedBox(height: 24),
              buildForgotDescriptionText(context),
              buildForgotAnimation(context),
              buildEmailFormField(context),
              const SizedBox(height: 30),
              buildForgotPasswordButton(context),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }

  LocaleText buildForgotTitleText(BuildContext context) {
    return LocaleText(
      text: LocaleKeys.auth_forgot_forgot_password,
      style: context.textTheme.headline6!
          .copyWith(fontWeight: FontWeight.bold, color: context.colors.primary),
    );
  }

  Center buildForgotDescriptionText(BuildContext context) {
    return Center(
      child: LocaleText(
        text: LocaleKeys.auth_forgot_enter_registered_mail,
        style: context.textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.bold,
          color: context.colors.surface,
          height: 1.8,
        ),
      ),
    );
  }

  Padding buildForgotAnimation(BuildContext context) {
    return Padding(
      padding: context.paddingVerticalDefaultScreen,
      child: Lottie.asset(
        ImageConstants.instance.forgotPassword,
        width: context.screenWidth * 0.6,
      ),
    );
  }

  TextFormField buildEmailFormField(BuildContext context) {
    return TextFormField(
      controller: emailController,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: context.colors.primary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: context.colors.primary),
        ),
        labelText: LocaleKeys.general_email.tr(),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (email) =>
          email != null && EmailValidator.validate(emailController.text)
              ? LocaleKeys.validations_email.tr()
              : null,
    );
  }

  ElevatedButton buildForgotPasswordButton(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          maximumSize: const Size.fromHeight(50),
          minimumSize: Size(context.screenWidth, 50),
          onPrimary: context.colors.primary,
          primary: context.colors.primary),
      onPressed: resetPassword,
      icon: const Icon(Icons.send),
      label: LocaleText(
        text: LocaleKeys.auth_forgot_reset_password,
        style: context.textTheme.bodyText1!
            .copyWith(color: context.colors.surface),
      ),
    );
  }

  Future resetPassword() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController.text.trim());

        Utils.showSnackBar(
            LocaleKeys.auth_forgot_passowrd_reset_mail_sent.tr());
        Navigator.of(context).popUntil((route) => route.isFirst);
      } on FirebaseException catch (e) {
        Utils.showSnackBar(e.message);
      }
    }
  }
}
