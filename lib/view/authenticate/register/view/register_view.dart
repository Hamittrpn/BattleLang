import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/enum/button_state_enum.dart';
import '../../../../core/extensions/context_extension.dart';
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
          Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.13),
        child: Form(
          key: viewModel.formState,
          child: Column(
            children: [
              const Spacer(),
              TextFormField(
                controller: viewModel.nameController,
                decoration: _setUnderlineColor(
                  context,
                  "Name",
                  const Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                },
              ),
              Padding(
                padding: context.paddingVerticalForm,
                child: TextFormField(
                  controller: viewModel.surnameController,
                  decoration: _setUnderlineColor(
                      context, "Surname", const Icon(Icons.person)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                  },
                ),
              ),
              TextFormField(
                controller: viewModel.emailController,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                decoration: _setUnderlineColor(
                    context, "Email", const Icon(Icons.mail)),
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Enter a valid email'
                        : null,
              ),
              Padding(
                padding: context.paddingVerticalForm,
                child: TextFormField(
                  readOnly: true,
                  controller: viewModel.dateController,
                  onTap: () => viewModel.selectBirthdate(context),
                  decoration: _setUnderlineColor(
                      context, "Birhdate", const Icon(Icons.calendar_today)),
                ),
              ),
              TextFormField(
                obscureText: true,
                controller: viewModel.passwordController,
                decoration: _setUnderlineColor(
                    context, "Password", const Icon(Icons.vpn_key_sharp)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                },
              ),
              Padding(
                padding: context.paddingVerticalForm,
                child: TextFormField(
                  obscureText: true,
                  controller: viewModel.passwordConfirmController,
                  decoration: _setUnderlineColor(context, "Password Confirm",
                      const Icon(Icons.vpn_key_sharp)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    if (value != viewModel.passwordController.text) {
                      return 'paswords not match';
                    }
                  },
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
              const Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, RegisterViewModel viewModel) =>
      OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: const StadiumBorder(),
          side: BorderSide(width: 1, color: context.colors.primaryVariant),
        ),
        child: FittedBox(
          child: Text(
            'SAVE',
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

  InputDecoration _setUnderlineColor(
      BuildContext context, String name, Widget prefixIcon) {
    return InputDecoration(
      labelText: name,
      prefixIcon: prefixIcon,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: context.colors.primaryVariant),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: context.colors.primary),
      ),
    );
  }
}
