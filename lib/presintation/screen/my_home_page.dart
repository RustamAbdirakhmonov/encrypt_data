import 'package:flutter/material.dart';

import '../../model/api.dart';
import '../../model/data/crypto.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Data',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

                  ElevatedButton(
                      onPressed: () async{
                        !controller.value.text.isEmpty?ApiResult().postEncryption(Cryptom().text(controller.value.text)):(){};
                        !controller.value.text.isEmpty?ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("status: ${await ApiResult().postEncryption(Cryptom().text(controller.value.text))}") ),
                        ):ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("enter data") ),
                        );
                      },
                      child: Text(
                        'Press',
                        style: TextStyle(color: Colors.deepOrangeAccent),
                      ),



            )
          ],
        ),
      ),
    );
  }
}
