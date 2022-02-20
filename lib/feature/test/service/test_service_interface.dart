import 'package:learn_language/feature/test/model/product_model.dart';
import 'package:vexana/vexana.dart';

abstract class ITestService {
  late final INetworkManager networkManager;

  ITestService(this.networkManager);

  Future<List<ProductModel>?> fetchAllProducts({int count = 5});
  Future<List<String>?> fetchAllCategories();
}
