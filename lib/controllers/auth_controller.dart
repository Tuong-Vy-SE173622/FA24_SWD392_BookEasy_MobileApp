import '../models/auth_model.dart';
import '../services/auth_service.dart';

class AuthController {
  final AuthService _authService = AuthService();

  Future<AuthModel?> login(String username, String password) async {
    return await _authService.login(username, password);
  }

  Future<void> logout() async {
    await _authService.logout();
  }
}
