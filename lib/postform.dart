import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loginform.dart';

class PostForm extends StatelessWidget {
  const PostForm({Key? key,}) : super(key: key);
  static const String _title = 'Food Wasteage Reduction';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: Post(),
    );
  }
}
class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _MySinginState();
}

class _MySinginState extends State<Post> {
  TextEditingController name= TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController number=TextEditingController();
  TextEditingController address =TextEditingController();
  GlobalKey <FormState>formkey= GlobalKey<FormState>();


  void  store(){
    final sname=name.text.trim();
    final semail=email.text;
    final sphone=number.text;
    final saddress=address.text;


    FirebaseFirestore.instance.collection("store")
        .add({
      "name":sname,
      "email":semail,
      "phone":sphone,
      "address":saddress,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child:
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                child: const Text(
                  'Post',
                  style: TextStyle(fontSize: 40),
                )
            ),

            Container(
              alignment:  Alignment.center,
              child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        controller: name,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Name"
                        ),
                        validator:
                        RequiredValidator(errorText:"Required")
                    ),

                    SizedBox(height: 10,),
                    TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email"
                        ),
                        validator:MultiValidator(
                            [
                              RequiredValidator(errorText: "Required"),
                              EmailValidator(errorText: "Invaild Email")
                            ]
                        )
                    ),

                    SizedBox(height: 10,),
                    TextFormField(
                      controller: number,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Phone"
                      ),
                      validator: MultiValidator(
                          [
                            RequiredValidator(errorText: "Required"),
                            MinLengthValidator(10, errorText: "Min Length 10")
                          ]
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller:address,
                      maxLines: 3,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Address"
                      ),
                      validator: RequiredValidator(errorText: "Required"),
                    ),
                    SizedBox(height: 10,),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ElevatedButton(
                          child: const Text('Post'),
                          onPressed: () {
                            if(formkey.currentState!.validate()){
                              store();
                            }
                            else
                            {
                              print("Error");
                            }
                          },
                        )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

