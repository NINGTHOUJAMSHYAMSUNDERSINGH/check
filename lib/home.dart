import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'enter.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  get phoneController => int;

  String verficationid = " ";
  String smsCode = '';
  bool isOtpSent = false;
  TextEditingController otp = TextEditingController();
  TextEditingController text = TextEditingController();
  // String? signature = await SmsVerification.getAppSignature();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shyam"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            isOtpSent
                ? Column(
                    children: [
                      TextField(
                        controller: otp,
                        decoration: InputDecoration(hintText: "Enter  otp "),
                      ),
                      ElevatedButton(onPressed: () {}, child: Text("verify")),
                    ],
                  )
                : Column(
                    children: [
                      TextField(
                        controller: text,
                        decoration: InputDecoration(hintText: "Enter no."),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            EasyLoading.showToast(otp.text);
                            EasyLoading.show(
                                status: "please wait while sending otp");
                            FirebaseAuth auth = FirebaseAuth.instance;

                            await auth.verifyPhoneNumber(
                              phoneNumber: "+91${text.text}",
                              verificationCompleted:
                                  (phoneAuthCredential) async {
                                PhoneAuthCredential credential =
                                    PhoneAuthProvider.credential(
                                        verificationId: verficationid,
                                        smsCode: smsCode);
                                await auth.signInWithCredential(credential);

                                log(phoneAuthCredential.toString());
                              },
                              verificationFailed: (e) async {
                                EasyLoading.showError(e.code);
                              },
                              codeSent: (verificationId, resendingToken) async {
                                setState(() {
                                  verficationid = verificationId;
                                  isOtpSent = true;
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Enter()));
                                });

                                EasyLoading.showSuccess('otp send');
                              },
                              codeAutoRetrievalTimeout:
                                  (verificationId) async {},
                            );
                          },
                          child: const Text("Send otp")),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
