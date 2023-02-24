import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  get phoneController => int;

  String verficationid = " ";

  bool isOtpSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shya"),
      ),
      body: Container(
        child: Column(
          children: [
            isOtpSent
                ? TextField(
                    decoration: InputDecoration(hintText: "Enter OTP"),
                  )
                : TextField(
                    decoration: InputDecoration(hintText: "Enter OTP"),
                  ),
            ElevatedButton(
                onPressed: () async {
                  EasyLoading.show(status: "please wait while sending otp");
                  FirebaseAuth auth = FirebaseAuth.instance;
                  await auth.verifyPhoneNumber(
                    phoneNumber: "+918787566904",
                    verificationCompleted: (phoneAuthCredential) async {},
                    verificationFailed: (verificationFailed) async {
                      EasyLoading.showError("Error");
                    },
                    codeSent: (verificationId, resendingToken) async {
                      setState(() {
                        verficationid = verificationId;
                      });

                      EasyLoading.showSuccess('otp send');
                    },
                    codeAutoRetrievalTimeout: (verificationId) async {},
                  );
                },
                child: Text("Send otp")),
          ],
        ),
      ),
    );
  }
}
