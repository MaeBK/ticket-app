import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ticket_app/api_connection/api_connection.dart';
import 'package:ticket_app/users/logins/login_screen.dart';
import 'package:ticket_app/users/model/user.dart';

class AccountCreationScreen extends StatefulWidget {
  const AccountCreationScreen({super.key});


  @override
  State<AccountCreationScreen> createState() => _AccountCreationScreenState();
}

class _AccountCreationScreenState extends State<AccountCreationScreen>
{

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObscure = true.obs;

  validateUserEmail() async {
    try{
     var response =  await http.post(
          Uri.parse(API.validateEmail),
        body: {
            'user_email': emailController.text.trim(),
        }
      );
      if(response.statusCode == 200){
        var responseBodyValidateEmail = jsonDecode(response.body);

        if(responseBodyValidateEmail['emailFound']){
          Fluttertoast.showToast(msg: "Email is already in use, try again.");
        }else{
          saveUserRecord();
        }
      }
    }
    catch(e){
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  saveUserRecord() async {
    User userModel = User(
      1,
      nameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim()
    );

    try{
      var response =  await http.post(
        Uri.parse(API.createAccount),
        body: userModel.toJson(),
      );
      if(response.statusCode == 200){
        var responseBodyOfAccountCreated = jsonDecode(response.body);

        if(responseBodyOfAccountCreated['success'] == true){
          Fluttertoast.showToast(msg: "New Account Created.");

          setState(() {
            nameController.clear();
            emailController.clear();
            passwordController.clear();
          });
        }else {
          Fluttertoast.showToast(msg: "Account could not be created at this time.");
        }
      }
    } catch(e){
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: LayoutBuilder(
        builder: (context, cons)
        {
          return  ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: cons.maxHeight,
            ),

            // Account Creation Header
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 285,
                    child:
                    Container(
                      alignment: Alignment.center,
                      child:
                      Text('Thank you for joining!',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  //Account Creation Form
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(60),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.black26,
                            offset: Offset(0, -3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                        child: Column(
                          children: [

                            //Already have an account
                            Form(
                              key: formKey,
                              child: Column(
                                children: [

                                  //Name
                                  TextFormField(
                                    controller: nameController,
                                    validator: (val) => val == "" ? "No Name Entered" : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                          Icons.person_2_outlined,
                                          color: Colors.deepPurple
                                      ),
                                      hintText: 'John Smith',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(25),
                                          borderSide: BorderSide(
                                              color: Colors.white
                                          )
                                      ),
                                      enabledBorder:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(25),
                                          borderSide: BorderSide(
                                              color: Colors.white
                                          )
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(25),
                                          borderSide: BorderSide(
                                              color: Colors.white
                                          )
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(25),
                                          borderSide: BorderSide(
                                              color: Colors.white
                                          )
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 15,
                                  ),

                                  //Email
                                  TextFormField(
                                    controller: emailController,
                                    validator: (val) => val == "" ? "No Email Entered" : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                          Icons.email_outlined,
                                          color: Colors.deepPurple
                                      ),
                                      hintText: 'User@email.com',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(25),
                                          borderSide: BorderSide(
                                              color: Colors.white
                                          )
                                      ),
                                      enabledBorder:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(25),
                                          borderSide: BorderSide(
                                              color: Colors.white
                                          )
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(25),
                                          borderSide: BorderSide(
                                              color: Colors.white
                                          )
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(25),
                                          borderSide: BorderSide(
                                              color: Colors.white
                                          )
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 15,
                                  ),

                                  //Password
                                  Obx(
                                        ()=> TextFormField(
                                      controller: passwordController,
                                      obscureText: isObscure.value,
                                      validator: (val) => val == "" ? "No Password Entered" : null,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                            Icons.vpn_key_outlined,
                                            color: Colors.deepPurple
                                        ),
                                        suffixIcon: Obx(
                                              ()=> GestureDetector(
                                            onTap: ()
                                            {
                                              isObscure.value = !isObscure.value;
                                            },
                                            child: Icon(
                                              isObscure.value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                              color: Colors.deepPurple,
                                            ),
                                          ),
                                        ),
                                        hintText: 'Password',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(25),
                                            borderSide: BorderSide(
                                                color: Colors.white
                                            )
                                        ),
                                        enabledBorder:OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(25),
                                            borderSide: BorderSide(
                                                color: Colors.white
                                            )
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(25),
                                            borderSide: BorderSide(
                                                color: Colors.white
                                            )
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(25),
                                            borderSide: BorderSide(
                                                color: Colors.white
                                            )
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 6,
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 15,
                                  ),

                                  //Login Button
                                  Material(
                                    color: Colors.deepPurple[300],
                                    borderRadius: BorderRadius.circular(25),
                                    child: InkWell(
                                      onTap: () {
                                        if(formKey.currentState!.validate()){
                                          validateUserEmail;
                                        }
                                      },
                                      borderRadius: BorderRadius.circular(25),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 28,
                                        ),
                                        child: Text(
                                          'Create Account',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            //Create Account
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: ()
                                    {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => LoginScreen())
                                      );
                                    },
                                    child: const Text(
                                        'Already Have An Account'
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
