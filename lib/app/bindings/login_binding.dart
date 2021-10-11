import 'package:get/get.dart';
import 'package:getx_pattern/app/controller/login/login_controller.dart';
import 'package:getx_pattern/app/data/provider/api.dart';
import 'package:getx_pattern/app/data/repository/user_repository.dart';
import 'package:http/http.dart' as http;

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController(
          repository: UserRepository(
              apiClient: MyApiClient(httpClient: http.Client())));
    });
  }
}
