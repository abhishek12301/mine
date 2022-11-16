import 'package:flutter/material.dart';
import 'postform.dart';
class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("Home"),
        ),
      ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "No Post"
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PostForm()));
          },
          child: const Icon(Icons.add),
        ),
    );
  }
}
