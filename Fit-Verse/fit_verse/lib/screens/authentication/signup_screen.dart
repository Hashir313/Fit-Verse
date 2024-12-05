// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_verse/controllers/auth/auth_controller.dart';
import 'package:fit_verse/screens/home/home_screen.dart';
import 'package:fit_verse/utils/colors.dart';
import 'package:fit_verse/utils/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool showPassword = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: white,
                      child: Center(
                        child: Image.asset(
                          'assets/images/fitverse_logo.png',
                          width: 1.5.sw,
                          height: 1.5.sh,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: 1.sw,
                      decoration: BoxDecoration(
                        color: black.withOpacity(0.85),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(200.r),
                          topRight: Radius.circular(200.r),
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 332.w,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                              'Get Started Free',
                              style: GoogleFonts.poppins(
                                color: white,
                                fontSize: 150.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email Address',
                                    style: GoogleFonts.poppins(
                                      color: secondaryColor,
                                      fontSize: 60.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Card(
                                    elevation: 0,
                                    color: Colors.transparent,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        gradient: LinearGradient(
                                          colors: [
                                            white.withOpacity(0.1),
                                            white.withOpacity(0.3),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                      child: TextFormField(
                                        controller: emailController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your email';
                                          } else if (!value.contains('@')) {
                                            return 'Please enter a valid email';
                                          } else if (!value.contains('.')) {
                                            return 'Please enter a valid email';
                                          }
                                          return null;
                                        },
                                        style: GoogleFonts.poppins(
                                          color: white,
                                          fontSize: 60.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        cursorColor: white,
                                        decoration: InputDecoration(
                                          hintText: 'yourname@gmail.com',
                                          prefixIcon: Icon(
                                            Icons.email_outlined,
                                            color: secondaryColor,
                                          ),
                                          hintStyle: GoogleFonts.poppins(
                                            color: white.withOpacity(
                                              0.75,
                                            ),
                                            fontSize: 60.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          fillColor: Colors.transparent,
                                          filled: true,
                                          errorStyle: GoogleFonts.poppins(
                                            color: buttonColor,
                                            fontSize: 60.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: buttonColor,
                                            ),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    'Your Name',
                                    style: GoogleFonts.poppins(
                                      color: secondaryColor,
                                      fontSize: 60.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Card(
                                    elevation: 0,
                                    color: Colors.transparent,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        gradient: LinearGradient(
                                          colors: [
                                            white.withOpacity(0.1),
                                            white.withOpacity(0.3),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                      child: TextFormField(
                                        controller: nameController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your name';
                                          } else if (value.length < 3) {
                                            return 'Name must be at least 3 characters';
                                          }
                                          return null;
                                        },
                                        style: GoogleFonts.poppins(
                                          color: white,
                                          fontSize: 60.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        cursorColor: white,
                                        decoration: InputDecoration(
                                          hintText: '@yourname',
                                          prefixIcon: Icon(
                                            Icons.person_outline,
                                            color: secondaryColor,
                                          ),
                                          errorStyle: GoogleFonts.poppins(
                                            color: buttonColor,
                                            fontSize: 60.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: buttonColor,
                                            ),
                                          ),
                                          hintStyle: GoogleFonts.poppins(
                                            color: white.withOpacity(0.75),
                                            fontSize: 60.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          fillColor: Colors.transparent,
                                          filled: true,
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    'Password',
                                    style: GoogleFonts.poppins(
                                      color: secondaryColor,
                                      fontSize: 60.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Card(
                                    elevation: 0,
                                    color: Colors.transparent,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        gradient: LinearGradient(
                                          colors: [
                                            white.withOpacity(0.1),
                                            white.withOpacity(0.3),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                      child: TextFormField(
                                        controller: passwordController,
                                        obscureText: showPassword,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your password';
                                          } else if (value.length < 6) {
                                            return 'Password must be at least 6 characters';
                                          }
                                          return null;
                                        },
                                        style: GoogleFonts.poppins(
                                          color: white,
                                          fontSize: 60.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        cursorColor: white,
                                        decoration: InputDecoration(
                                          hintText: '********',
                                          prefixIcon: Transform.rotate(
                                            angle: 5.5,
                                            child: Icon(
                                              Icons.key_outlined,
                                              color: secondaryColor,
                                            ),
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                showPassword = !showPassword;
                                              });
                                            },
                                            icon: Icon(
                                              showPassword
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color: white.withOpacity(0.75),
                                            ),
                                          ),
                                          hintStyle: GoogleFonts.poppins(
                                            color: white.withOpacity(0.75),
                                            fontSize: 60.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          errorStyle: GoogleFonts.poppins(
                                            color: buttonColor,
                                            fontSize: 60.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: buttonColor,
                                            ),
                                          ),
                                          fillColor: Colors.transparent,
                                          filled: true,
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomButton(
                              buttonText: 'Sign up',
                              isLoading: isLoading,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });

                                  try {
                                    // Await the sign-up method
                                    UserCredential credential =
                                        await FirebaseServices()
                                            .signUpWithEmailAndPassword(
                                      context,
                                      emailController.text,
                                      passwordController.text,
                                    );
                                    if (kDebugMode) {
                                      print('Credential: $credential');
                                    }

                                    // Upload user details to Firestore if sign-up is successful
                                    await FirebaseServices().uploadUserDetails(
                                      context,
                                      nameController.text,
                                      emailController.text,
                                      credential.user!.uid,
                                    );

                                    setState(() {
                                      isLoading = false;
                                    });

                                    print('Uploaded user details');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Sign up successful')),
                                    );

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()),
                                    );
                                  } catch (error) {
                                    setState(() {
                                      isLoading = false;
                                    });

                                    // Handle error
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(error.toString())),
                                    );
                                    print('Error: $error');
                                  }
                                }
                              },
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
