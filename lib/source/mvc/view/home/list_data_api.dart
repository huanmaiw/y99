import 'package:flutter/material.dart';
import '../../../../core/auth/user_api.dart';

class MyHomePage extends StatelessWidget {
  final _service = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test API")),
      body: Center(
        child: ElevatedButton(
          child: Text("Gọi API"),
          onPressed: () {
            _service.getUsers();
          },
        ),
      ),
    );
  }
}
