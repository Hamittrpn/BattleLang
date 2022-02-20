import 'package:vexana/vexana.dart';

import '../../core/constants/app/app_constants.dart';

class ProductNetworkManager extends NetworkManager {
  ProductNetworkManager()
      : super(
            options:
                BaseOptions(baseUrl: ApplicationConstants.instance.baseUrl));
}
