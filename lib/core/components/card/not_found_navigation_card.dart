import 'package:flutter/material.dart';

class NotFoundNavigationCard extends StatelessWidget {
  const NotFoundNavigationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Not Found"),
      ),
    );
  }
}
