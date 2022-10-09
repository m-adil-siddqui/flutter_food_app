import 'package:get/get.dart';

import '../../constants.dart';

class BaseProvider extends GetConnect{

  @override
  void onInit() {
    print('------------- base provider initialize-------------');
    httpClient.baseUrl            = localBaseUrl;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout            = const Duration(seconds: 30);
      print(httpClient.baseUrl);
    
    super.onInit();
  }
}