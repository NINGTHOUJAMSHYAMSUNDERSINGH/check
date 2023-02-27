import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:myphone/phone.dart';


class Enter extends StatefulWidget {
  const Enter({super.key});

  @override
  State<Enter> createState() => _EnterState();
}

class _EnterState extends State<Enter> {
  get phoneController => int;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Route'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "+91 Enter phone No."),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  
                  border: OutlineInputBorder(),
                  hintText: "Enter Password",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                
                  MaterialPageRoute(builder: (context) => LoginScreen())),
                 
              child: const Text("Log In"),
            

              // child: const Text("Press to verified phone no.")
              //  codeSent: (verificationId, resendingToken) async {
              //      setState(() {
              //       verficationid = verificationId;
              //       }
            )
          ]),
        ));
  }
}
