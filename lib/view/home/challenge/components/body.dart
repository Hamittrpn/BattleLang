import 'package:flutter/material.dart';
import 'package:learn_language/core/extensions/context_extension.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      context.colors.secondaryVariant,
                      context.colors.onBackground,
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
