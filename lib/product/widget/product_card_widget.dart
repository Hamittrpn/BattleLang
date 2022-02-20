import 'package:flutter/material.dart';

import '../../core/constants/image/image_constants.dart';
import '../../core/extensions/context_extension.dart';
import '../../feature/test/model/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, this.model}) : super(key: key);
  final ProductModel? model;

  @override
  Widget build(BuildContext context) {
    if (model == null) return const SizedBox.shrink();
    return Card(
      elevation: 10,
      margin: context.paddingLow,
      child: ListTile(
        title: SizedBox(
            height: context.screenHeight * 0.4,
            child: Image.network(
                model?.image ?? ImageConstants.instance.dummyImage)),
        subtitle: Text(model?.description ?? ''),
      ),
    );
  }
}
