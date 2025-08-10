import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObscure = true.obs;

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

                // Login Header
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
                                Text('Welcome to Your Ticket Buyer',
                                  style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                            ),
                      ),

                      //Login Form
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
                                Form(
                                  key: formKey,
                                  child: Column(
                                    children: [

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
                                          },
                                          borderRadius: BorderRadius.circular(25),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10,
                                                horizontal: 28,
                                              ),
                                            child: Text(
                                              'Login',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),

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
