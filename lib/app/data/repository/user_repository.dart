import 'package:getx_pattern/app/data/provider/api.dart';
import 'package:meta/meta.dart';

class UserRepository {
  final MyApiClient apiClient;

  UserRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<String> login(
      String phoneNumber, String password, bool isRemember) async {
    return apiClient.login(phoneNumber, password, isRemember);
  }
}
