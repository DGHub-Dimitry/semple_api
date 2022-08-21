import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GoToLogin extends StatelessWidget {
  final double width;
  final double height;
  const GoToLogin({this.width = 200, this.height = 200, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/lotties/login.json',
              fit: BoxFit.fill, repeat: true, width: width, height: height),
          const Text(
            'Account login',
            style: TextStyle(fontSize: 15),
          ),
          const Text(
            'Please login your account',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                primary: theme.primaryColor, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/account');
              },
              child: const Text('Login')),
        ],
      ),
    );
  }
}
