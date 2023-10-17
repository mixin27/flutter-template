import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OtpVerifyPage extends StatelessWidget {
  const OtpVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verify'),
      ),
      body: Center(
        child: Text(
          'OTP Verify Page',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
