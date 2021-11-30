import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rimotest/controllers/signin_ctrl.dart';

class LoginUI extends StatelessWidget {
  LoginUI({Key? key}) : super(key: key);

  final ctrl = Get.put(SignInCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(79, 22, 153, 1),
      body: Form(
        key: ctrl.fbKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * .1,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_back_ios,
                          size: 17,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Sign in to your account',
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sign in to your Settl account and enjoy the \nendless possibilities.',
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        height: 2,
                        fontSize: 17,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            Container(
              height: Get.height * .6,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: ctrl.emailController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromRGBO(252, 251, 255, 1),
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "email must not be empty";
                        } else if (!val.isEmail) {
                          return "Invalid email";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                        controller: ctrl.passwordController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(252, 251, 255, 1),
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "password must not be empty";
                          } else if (val.length < 8) {
                            return "Password should be atleast 8 characters long";
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 45,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (ctrl.fbKey.currentState!.validate()) {
                            ctrl.fbKey.currentState!.save();
                            ctrl.signIn();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(79, 22, 153, 1),
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Forgot password?',
                      style: GoogleFonts.lato(
                          color: const Color.fromRGBO(79, 22, 153, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have a Settl account?',
                          style: GoogleFonts.lato(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Create an account',
                          style: GoogleFonts.lato(
                              color: const Color.fromRGBO(79, 22, 153, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
