import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import 'custom_button_bar.dart';
import 'image_and_icons.dart';
import 'title_and_description.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ImageAndIcons(),
          const TitleAndDescription(
            title: "Brain Storm",
            description: "En sıradışı kelimelerle en çok puanı topla",
          ),
          SizedBox(height: context.normalValue),
          CustomButtonBar(
            primaryName: "Race",
            primaryPress: () {},
            secondaryName: "Invite",
            secondaryPress: () {},
          ),
        ],
      ),
    );
  }
}
