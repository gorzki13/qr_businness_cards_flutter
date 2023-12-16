import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String email = 'JAN-KOWALSKI-789987789-JANKOWALSKI@GMAIL.COM';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Your Business Card'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: email,
              version: QrVersions.auto,
              size: 300,
              gapless: false,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
