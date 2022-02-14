// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/text/locale_text.dart';
import '../../../../core/constants/enum/button_state_enum.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/register_view_model.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, RegisterViewModel viewModel) =>
          body(context, viewModel),
    );
  }

  Padding body(BuildContext context, RegisterViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.13),
      child: Form(
        key: viewModel.formState,
        child: Column(
          children: [
            const Spacer(),
            buildNameFormField(viewModel, context),
            buildSurnameFormField(context, viewModel),
            buildEmailFormField(viewModel, context),
            buildBirthdateFormField(context, viewModel),
            buildPasswordFormField(viewModel, context),
            buildPasswordConfirmFormField(context, viewModel),
            Observer(builder: (_) {
              return Padding(
                padding: context.paddingNormalVertical,
                child: buildAnimatedButton(context, viewModel),
              );
            }),
            const Spacer(flex: 5),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedButton(
      BuildContext context, RegisterViewModel viewModel) {
    return AnimatedContainer(
      duration: context.lowDuration,
      curve: Curves.easeIn,
      width: viewModel.state == ButtonStates.INIT ? context.screenWidth : 70,
      onEnd: viewModel.changeAnimationState,
      height: 70,
      child: viewModel.isStretched
          ? buildButton(context, viewModel)
          : buildSmallButton(context, viewModel),
    );
  }

  Padding buildPasswordConfirmFormField(
      BuildContext context, RegisterViewModel viewModel) {
    return Padding(
      padding: context.paddingVerticalForm,
      child: TextFormField(
        obscureText: true,
        controller: viewModel.passwordConfirmController,
        decoration: _setUnderlineColor(
            context,
            LocaleKeys.general_password_confirm.tr(),
            const Icon(Icons.vpn_key_sharp)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.validations_password.tr();
          }
          if (value != viewModel.passwordController.text) {
            return LocaleKeys.validations_password_not_match.tr();
          }
          return null;
        },
      ),
    );
  }

  TextFormField buildPasswordFormField(
      RegisterViewModel viewModel, BuildContext context) {
    return TextFormField(
      obscureText: true,
      controller: viewModel.passwordController,
      decoration: _setUnderlineColor(context, LocaleKeys.general_password.tr(),
          const Icon(Icons.vpn_key_sharp)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return LocaleKeys.validations_password;
        }
        return null;
      },
    );
  }

  Padding buildBirthdateFormField(
      BuildContext context, RegisterViewModel viewModel) {
    return Padding(
      padding: context.paddingVerticalForm,
      child: TextFormField(
        readOnly: true,
        controller: viewModel.dateController,
        onTap: () => viewModel.selectBirthdate(context),
        decoration: _setUnderlineColor(
            context,
            LocaleKeys.general_birthdate.tr(),
            const Icon(Icons.calendar_today)),
      ),
    );
  }

  TextFormField buildEmailFormField(
      RegisterViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.emailController,
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      decoration: _setUnderlineColor(
          context, LocaleKeys.general_email.tr(), const Icon(Icons.mail)),
      validator: (email) => email != null && !EmailValidator.validate(email)
          ? LocaleKeys.validations_email.tr()
          : null,
    );
  }

  Padding buildSurnameFormField(
      BuildContext context, RegisterViewModel viewModel) {
    return Padding(
      padding: context.paddingVerticalForm,
      child: TextFormField(
        controller: viewModel.surnameController,
        decoration: _setUnderlineColor(
            context, LocaleKeys.general_surname.tr(), const Icon(Icons.person)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.validations_surname.tr();
          }
          return null;
        },
      ),
    );
  }

  TextFormField buildNameFormField(
      RegisterViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.nameController,
      decoration: _setUnderlineColor(
        context,
        LocaleKeys.general_name.tr(),
        const Icon(Icons.person),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return LocaleKeys.validations_name.tr();
        }
        return null;
      },
    );
  }

  Widget buildButton(BuildContext context, RegisterViewModel viewModel) =>
      OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: const StadiumBorder(),
          side: BorderSide(width: 1, color: context.colors.primary),
        ),
        child: FittedBox(
          child: LocaleText(
            text: LocaleKeys.general_save.tr(),
            style: TextStyle(
              fontSize: 16,
              color: context.colors.primary,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        onPressed: viewModel.register,
      );

  Widget buildSmallButton(BuildContext context, RegisterViewModel viewModel) {
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

  InputDecoration _setUnderlineColor(
      BuildContext context, String name, Widget prefixIcon) {
    return InputDecoration(
      labelText: name,
      prefixIcon: prefixIcon,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: context.colors.primary),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: context.colors.primary),
      ),
    );
  }
}
