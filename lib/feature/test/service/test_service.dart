import 'package:vexana/src/interface/INetworkService.dart';
import 'package:vexana/vexana.dart';

import '../../../product/model/query/product_queries.dart';
import '../model/product_model.dart';
import 'test_service_interface.dart';

enum _TestServicePath { products, categories }

//https://fakestoreapi.com/products/categories
class TestService extends ITestService {
  TestService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<ProductModel>?> fetchAllProducts({int count = 5}) async {
    final response = await networkManager
        .send<ProductModel, List<ProductModel>>(_TestServicePath.products.name,
            parseModel: ProductModel(),
            method: RequestType.GET,
            queryParameters:
                Map.fromEntries([ProductQueries.limit.toMapEntry('$count ')]));

    return response.data;
  }

  @override
  Future<List<String>?> fetchAllCategories() async {
    final response = await networkManager.sendPrimitive(
        '${_TestServicePath.products.name}/${_TestServicePath.categories.name}');

    return response is List ? response.map((e) => '$e').toList() : null;
  }
}
