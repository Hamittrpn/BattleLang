// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterViewModel on _RegisterViewModelBase, Store {
  final _$nameAtom = Atom(name: '_RegisterViewModelBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$surnameAtom = Atom(name: '_RegisterViewModelBase.surname');

  @override
  String get surname {
    _$surnameAtom.reportRead();
    return super.surname;
  }

  @override
  set surname(String value) {
    _$surnameAtom.reportWrite(value, super.surname, () {
      super.surname = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegisterViewModelBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_RegisterViewModelBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$passwordConfirmAtom =
      Atom(name: '_RegisterViewModelBase.passwordConfirm');

  @override
  String get passwordConfirm {
    _$passwordConfirmAtom.reportRead();
    return super.passwordConfirm;
  }

  @override
  set passwordConfirm(String value) {
    _$passwordConfirmAtom.reportWrite(value, super.passwordConfirm, () {
      super.passwordConfirm = value;
    });
  }

  final _$birthdayAtom = Atom(name: '_RegisterViewModelBase.birthday');

  @override
  DateTime get birthday {
    _$birthdayAtom.reportRead();
    return super.birthday;
  }

  @override
  set birthday(DateTime value) {
    _$birthdayAtom.reportWrite(value, super.birthday, () {
      super.birthday = value;
    });
  }

  final _$isStretchedAtom = Atom(name: '_RegisterViewModelBase.isStretched');

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

  final _$isDoneAtom = Atom(name: '_RegisterViewModelBase.isDone');

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

  final _$isAnimatingAtom = Atom(name: '_RegisterViewModelBase.isAnimating');

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

  final _$stateAtom = Atom(name: '_RegisterViewModelBase.state');

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

  final _$registerAsyncAction = AsyncAction('_RegisterViewModelBase.register');

  @override
  Future<dynamic> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$_RegisterViewModelBaseActionController =
      ActionController(name: '_RegisterViewModelBase');

  @override
  dynamic changeAnimationState() {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.changeAnimationState');
    try {
      return super.changeAnimationState();
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
surname: ${surname},
email: ${email},
password: ${password},
passwordConfirm: ${passwordConfirm},
birthday: ${birthday},
isStretched: ${isStretched},
isDone: ${isDone},
isAnimating: ${isAnimating},
state: ${state}
    ''';
  }
}
