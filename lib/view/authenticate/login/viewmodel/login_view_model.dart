import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enum/button_state_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();

  @observable
  bool isStretched = false;

  @observable
  bool isDone = false;

  @observable
  bool isAnimating = true;

  @observable
  ButtonStates state = ButtonStates.INIT;

  @observable
  bool isObscure = true;

  String errorMessage = '';

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    isDone = state == ButtonStates.LOADING;
    isStretched = isAnimating || state == ButtonStates.INIT;
  }

  @action
  bool changeObsecureText() {
    return isObscure = !isObscure;
  }

  @action
  Future login() async {
    state = ButtonStates.LOADING;
    isDone = false;
    isStretched = true;

    state = ButtonStates.LOADING;
    isDone = false;
    isStretched = false;
    await Future.delayed(const Duration(milliseconds: 500));

    if (formState.currentState!.validate()) {
      formState.currentState!.save();
      signIn();
    } else {
      state = ButtonStates.INIT;
      isDone = false;
      isStretched = true;
      await Future.delayed(const Duration(milliseconds: 300));
      showSnackbarValidation(null, "Invalid e-mail adress!");
    }
  }

  @action
  changeAnimationState() {
    isAnimating = !isAnimating;
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      state = ButtonStates.DONE;
      isDone = true;
      isStretched = false;
      await Future.delayed(const Duration(milliseconds: 300));

      navigation.navigateToPageClear(NavigationConstants.TEST_VIEW, null);
    } on FirebaseAuthException catch (e) {
      state = ButtonStates.INIT;
      isDone = false;
      isStretched = true;
      await Future.delayed(const Duration(milliseconds: 300));
      showSnackbarValidation(e, null);
      return e.message;
    }

    state = ButtonStates.INIT;
    isDone = false;
    isStretched = true;
    await Future.delayed(const Duration(milliseconds: 300));
  }

  void showSnackbarValidation(FirebaseAuthException? e, String? message) {
    ScaffoldMessenger.of(context!)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(e!.message.toString()),
        backgroundColor: Colors.red,
      ));
  }
}
