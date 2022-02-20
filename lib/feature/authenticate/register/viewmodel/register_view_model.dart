import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enum/button_state_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../model/user.dart';

part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store, BaseViewModel {
  Duration defaultDuration = const Duration(seconds: 3);
  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  @observable
  String name = "";

  @observable
  String surname = "";

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  String passwordConfirm = "";

  @observable
  DateTime birthday = DateTime.now();

  @observable
  bool isStretched = false;

  @observable
  bool isDone = false;

  @observable
  bool isAnimating = true;

  @observable
  ButtonStates state = ButtonStates.INIT;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    emailController = TextEditingController();
    dateController = TextEditingController();

    isDone = state == ButtonStates.LOADING;
    isStretched = isAnimating || state == ButtonStates.INIT;
  }

  @action
  Future register() async {
    state = ButtonStates.LOADING;
    isDone = false;
    isStretched = true;
    await Future.delayed(const Duration(milliseconds: 300));

    state = ButtonStates.LOADING;
    isDone = false;
    isStretched = false;

    if (formState.currentState!.validate()) {
      formState.currentState!.save();

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        final docUser = FirebaseFirestore.instance.collection('users').doc();

        final user = AppUser(
            id: docUser.id,
            name: nameController.text,
            surname: surnameController.text,
            birthday: birthday);

        final json = user.toJson();
        await docUser.set(json);

        state = ButtonStates.DONE;
        isDone = true;
        isStretched = false;
        await Future.delayed(const Duration(seconds: 1));

        context!.router.pushNamed(NavigationConstants.EMAIL_VERIFIED_VIEW);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    } else {
      if (kDebugMode) {
        print("Validation Hatası!");
      }
    }

    state = ButtonStates.INIT;
    isDone = false;
    isStretched = true;
    await Future.delayed(const Duration(seconds: 1));
  }

  @action
  changeAnimationState() {
    isAnimating = !isAnimating;
  }

  Future<void> selectBirthdate(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: birthday,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (newDate == null) return;
    dateController.text = newDate.day.toString() +
        "/" +
        newDate.month.toString() +
        "/" +
        newDate.year.toString();

    birthday = newDate;
  }
}
