import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/login_controller.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final controller= Get.put(LoginController());
  final emailController= TextEditingController();
  final passwordController= TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                TextFormField(
                controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Name",
                    // labelText: "Name",
                    border: OutlineInputBorder(
                      // borderRadius:BorderRadius.circular(10),
            
                    ),
                enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red)
            
                  ),focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent)
            
                  )
            
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "password",
            
                    border: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(10),
            
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)
            
                    ),
                    focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent)
                    )
                  ),
                ),
                Obx(() {
                  return controller.isLoading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                    onPressed: () {
                      String email = emailController.text.trim();
                      String pass = passwordController.text.trim();
                      controller.fetchPost(email, pass);
                    },
                    child: Text("Login"),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
