// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  final _$isStretchedAtom = Atom(name: '_LoginViewModelBase.isStretched');

  @override
  bool get isStretched {
    _$isStretchedAtom.reportRead();
    return super.isStretched;
  }

  @override
  set isStretched(bool value) {
    _$isStretchedAtom.reportWrite(value, super.isStretched, () {
      super.isStretched = value;
    });
  }

  final _$isDoneAtom = Atom(name: '_LoginViewModelBase.isDone');

  @override
  bool get isDone {
    _$isDoneAtom.reportRead();
    return super.isDone;
  }

  @override
  set isDone(bool value) {
    _$isDoneAtom.reportWrite(value, super.isDone, () {
      super.isDone = value;
    });
  }

  final _$isAnimatingAtom = Atom(name: '_LoginViewModelBase.isAnimating');

  @override
  bool get isAnimating {
    _$isAnimatingAtom.reportRead();
    return super.isAnimating;
  }

  @override
  set isAnimating(bool value) {
    _$isAnimatingAtom.reportWrite(value, super.isAnimating, () {
      super.isAnimating = value;
    });
  }

  final _$stateAtom = Atom(name: '_LoginViewModelBase.state');

  @override
  ButtonStates get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ButtonStates value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$isObscureAtom = Atom(name: '_LoginViewModelBase.isObscure');

  @override
  bool get isObscure {
    _$isObscureAtom.reportRead();
    return super.isObscure;
  }

  @override
  set isObscure(bool value) {
    _$isObscureAtom.reportWrite(value, super.isObscure, () {
      super.isObscure = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginViewModelBase.login');

  @override
  Future<dynamic> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase');

  @override
  bool changeObsecureText() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.changeObsecureText');
    try {
      return super.changeObsecureText();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeAnimationState() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.changeAnimationState');
    try {
      return super.changeAnimationState();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isStretched: ${isStretched},
isDone: ${isDone},
isAnimating: ${isAnimating},
state: ${state},
isObscure: ${isObscure}
    ''';
  }
}
