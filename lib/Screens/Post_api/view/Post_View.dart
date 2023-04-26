import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Post_Provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;
  TextEditingController namec = TextEditingController();
  TextEditingController jobc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Post Api"),backgroundColor: Colors.black,centerTitle: true),
            body: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: namec,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                     label: Text("Name",style: TextStyle(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: jobc,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      label: Text("Job",style: TextStyle(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () async {
                      String name = namec.text;
                      String job = jobc.text;
                      String? msg = await homeProviderFalse!.postApi(name, job);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("$msg"),
                        ),
                      );
                      namec.clear();
                      jobc.clear();
                    },
                    child: Container(
                      height: 42,
                      width: 92,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Post",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
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
}