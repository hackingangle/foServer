class AuthService {
  Future<bool> login(String username, String password) async {
    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));
    return username == 'admin' && password == 'admin';
  }
}