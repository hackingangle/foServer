import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import '../services/auth_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    bool success = await _authService.login(username, password);

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      // Show login error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('用户名或密码错误')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '管理后台登录',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: _usernameController,
                  labelText: '用户名',
                ),
                CustomTextField(
                  controller: _passwordController,
                  labelText: '密码',
                  obscureText: true,
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: '登录',
                  onPressed: _login,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}