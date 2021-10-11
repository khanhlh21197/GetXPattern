import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/data/model/LoginResponse.dart';
import 'package:getx_pattern/app/data/model/user.dart';
import 'package:getx_pattern/app/data/repository/user_repository.dart';
import 'package:getx_pattern/app/routes/app_pages.dart';
import 'package:meta/meta.dart';

class LoginController extends GetxController {
  final UserRepository repository;

  LoginController({@required this.repository}) : assert(repository != null);

  final _user = User().obs;

  get user => _user.value;

  set user(value) {
    _user.value = value;
  }

  final _authenticationStateStream = AuthenticationState().obs;

  get authenticationStateStream => _authenticationStateStream;

  set authenticationStateStream(value) {
    _authenticationStateStream.value = value;
  }

  AuthenticationState get state => _authenticationStateStream.value;

  Future<String> login(
      String phoneNumber, String password, bool isRemember) async {
    var responseStr = await repository.login(phoneNumber, password, isRemember);
    var loginResponse = loginResponseFromJson(responseStr);
    if (loginResponse.success) {
      Get.toNamed(Routes.INITIAL);
    }
    return loginResponse.message;
  }
}

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {}

class UnAuthenticated extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final User user;

  Authenticated({@required this.user});

  @override
  List<Object> get props => [user];
}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  AuthenticationFailure({@required this.message});

  @override
  List<Object> get props => [message];
}
