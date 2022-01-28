import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../login/view/login_view.dart';
import '../../register/view/register_view.dart';
import '../viewmodel/auth_view_model.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView>
    with SingleTickerProviderStateMixin {
  bool isShowRegister = false;

  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;

  void setAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: context.lowDuration);

    _animationTextRotate =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  void updateView() {
    setState(() {
      isShowRegister = !isShowRegister;
    });
    isShowRegister
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void initState() {
    setAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      viewModel: AuthViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, AuthViewModel viewModel) =>
          Scaffold(
        body: AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return Stack(
                children: [
                  //Login Form
                  AnimatedPositioned(
                    duration: context.lowDuration,
                    width: context.screenWidth * 0.88,
                    height: context.screenHeight,
                    left: isShowRegister ? -context.screenWidth * 0.76 : 0,
                    child: GestureDetector(
                      child: Container(
                        color: context.colors.primaryVariant,
                        child: const LoginView(),
                      ),
                    ),
                  ),
                  //Register Form
                  AnimatedPositioned(
                    duration: context.lowDuration,
                    height: context.screenHeight,
                    width: context.screenWidth * 0.88,
                    left: isShowRegister
                        ? context.screenWidth * 0.12
                        : context.screenWidth * 0.88,
                    child: Container(
                      color: context.colors.secondaryVariant,
                      child: const RegisterView(),
                    ),
                  ),
                  // Login Text
                  AnimatedPositioned(
                    duration: context.lowDuration,
                    bottom: isShowRegister
                        ? context.screenHeight / 2 - 80
                        : context.screenHeight * 0.2,
                    left: isShowRegister ? 0 : context.screenWidth * 0.44 - 80,
                    child: AnimatedDefaultTextStyle(
                      duration: context.lowDuration,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: !isShowRegister ? 30 : 22,
                        fontWeight: FontWeight.bold,
                        color: isShowRegister ? Colors.white : Colors.white70,
                      ),
                      child: Transform.rotate(
                        angle: -_animationTextRotate.value * pi / 180,
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () {
                            if (isShowRegister) {
                              updateView();
                            } else {
                              //LOGIN
                            }
                          },
                          child: Container(
                            padding:
                                context.paddingVerticalDefaultScreen * 0.75,
                            width: 160,
                            child: Text(
                              "Log In".toUpperCase(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Register Text
                  AnimatedPositioned(
                    duration: context.lowDuration,
                    bottom: !isShowRegister
                        ? context.screenHeight / 2 - 80
                        : context.screenHeight * 0.2,
                    right: isShowRegister ? context.screenWidth * 0.44 - 80 : 0,
                    child: AnimatedDefaultTextStyle(
                      duration: context.lowDuration,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: !isShowRegister ? 20 : 32,
                        fontWeight: FontWeight.bold,
                        color: isShowRegister ? Colors.white : Colors.white70,
                      ),
                      child: Transform.rotate(
                        angle: (90 - _animationTextRotate.value) * pi / 180,
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            if (isShowRegister) {
                              //SignUp
                            } else {
                              updateView();
                            }
                          },
                          child: Container(
                            padding:
                                context.paddingVerticalDefaultScreen * 0.75,
                            width: 160,
                            child: Text(
                              "Sign Up".toUpperCase(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
