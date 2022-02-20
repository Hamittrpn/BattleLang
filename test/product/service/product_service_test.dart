import 'package:flutter_test/flutter_test.dart';
import 'package:learn_language/core/constants/app/app_constants.dart';
import 'package:learn_language/feature/test/service/test_service.dart';
import 'package:learn_language/feature/test/service/test_service_interface.dart';
import 'package:vexana/vexana.dart';

void main() {
  late ITestService testService;
  setUp(() {
    testService = TestService(NetworkManager(
        options: BaseOptions(baseUrl: ApplicationConstants.instance.baseUrl)));
  });
  test('fetchAllProducts - test five elements', () async {
    final response = await testService.fetchAllProducts();

    expect(response, isNotEmpty);
  });

  test('fetchAllCategories - test five elements', () async {
    final response = await testService.fetchAllCategories();

    expect(response, isNotEmpty);
  });
}
