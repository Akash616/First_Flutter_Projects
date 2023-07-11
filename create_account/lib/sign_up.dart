import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'get_data_from_api.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  bool? isCheck = false;
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text("Sign Up").text.size(18).color(Colors.white).make(),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Close',
            icon: CircleAvatar(
                child: Icon(
                  Icons.clear_sharp,
                  color: Colors.black,
                ),
                backgroundColor: Colors.white),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Let's create your ",
                        style: TextStyle(fontSize: 25)),
                    TextSpan(
                        text: "Account",
                        style: TextStyle(color: Colors.orange, fontSize: 25))
                  ]),
                ),
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        30.heightBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('First Name*').text.color(Colors.white).make(),
                            10.heightBox,
                            TextField(
                              cursorColor: Colors.orange,
                              decoration: InputDecoration(
                                focusedBorder: myInputFocusedBorder(),
                                enabledBorder: myInputEnabledBorder(),
                              ),
                            ),
                            25.heightBox,
                            Text('Last Name*').text.color(Colors.white).make(),
                            10.heightBox,
                            TextField(
                                cursorColor: Colors.orange,
                                decoration: InputDecoration(
                                  focusedBorder: myInputFocusedBorder(),
                                  enabledBorder: myInputEnabledBorder(),
                                )),
                            25.heightBox,
                            Text('Mobile No*').text.color(Colors.white).make(),
                            10.heightBox,
                            TextField(
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.orange,
                              decoration: InputDecoration(
                                prefixText: "+91 ",
                                focusedBorder: myInputFocusedBorder(),
                                enabledBorder: myInputEnabledBorder(),
                              ),
                            ),
                            25.heightBox,
                            Text('Email*').text.color(Colors.white).make(),
                            10.heightBox,
                            TextField(
                              cursorColor: Colors.orange,
                              decoration: InputDecoration(
                                focusedBorder: myInputFocusedBorder(),
                                enabledBorder: myInputEnabledBorder(),
                              ),
                            ),
                            25.heightBox,
                            Text('Genres').text.color(Colors.white).make(),
                            10.heightBox,
                            TextField(
                              cursorColor: Colors.orange,
                              decoration: InputDecoration(
                                  focusedBorder: myInputFocusedBorder(),
                                  enabledBorder: myInputEnabledBorder(),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.arrow_downward_outlined,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15)
                                          ),
                                          elevation: 10,
                                          builder: (context) {
                                            return Wrap(
                                              children: [Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: GetDataFromApi(),
                                              )],
                                            );
                                          });
                                    },
                                  )),
                              onTap: () {},
                            ),
                            25.heightBox,
                            Text('Performace Type*')
                                .text
                                .color(Colors.white)
                                .make(),
                            10.heightBox,
                            Row(
                              children: [
                                Checkbox(
                                  value: isCheck,
                                  activeColor: Colors.orange,
                                  onChanged: (bool? newBool) {
                                    setState(() {
                                      isCheck = newBool;
                                    });
                                  },
                                ),
                                Text("In Person"),
                                Checkbox(
                                  value: isChecked,
                                  activeColor: Colors.orange,
                                  onChanged: (bool? newBool) {
                                    setState(() {
                                      isChecked = newBool;
                                    });
                                  },
                                ),
                                Text("Virtual")
                              ],
                            ),
                            25.heightBox,
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text("Submit").text.size(15).make(),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange.shade800),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder myInputFocusedBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white));
  }

  OutlineInputBorder myInputEnabledBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.5)));
  }
}
