import 'package:financy_app/common/constants/routes.dart';
import 'package:financy_app/services/secure_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _secureStorage = const SecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nova tela'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await _secureStorage.deleteOne(key: 'CURRENT_USER');
                if (!mounted) return;
                Navigator.popAndPushNamed(context, NamedRoutes.initial);
              },
              child: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
