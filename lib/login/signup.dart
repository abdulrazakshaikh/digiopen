import 'package:digiopeners/login/forgot_password.dart';
import 'package:digiopeners/login/login.dart';
import 'package:digiopeners/login/login_success.dart';
import 'package:digiopeners/login/resend_confirmation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with TickerProviderStateMixin {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
              ),
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 220,
                    width: 220,
                    child: Image.asset('images/signin_bg.png',
                        fit: BoxFit.contain),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Text(
                          'Signup',
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.headlineLarge,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'enter details to register',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodySmall,
                              letterSpacing: 1.5),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: TextField(
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                            autofocus: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 15),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: 'Enter Email'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(
                                textStyle: Theme.of(context).textTheme.bodyMedium,
                                letterSpacing: 1.8,
                                fontWeight: FontWeight.w300),
                              prefixIcon: Icon(Icons.alternate_email),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: TextField(
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                            autofocus: true,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 15),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: 'Password'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(
                                textStyle: Theme.of(context).textTheme.bodyMedium,
                                letterSpacing: 1.8,
                                fontWeight: FontWeight.w300),
                              prefixIcon: Icon(Icons.lock_outlined),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: TextField(
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                            autofocus: true,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 15),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: 'Confirm Password'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(
                                textStyle: Theme.of(context).textTheme.bodyMedium,
                                letterSpacing: 1.8,
                                fontWeight: FontWeight.w300),
                              prefixIcon: Icon(Icons.lock_outlined),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                              
                        //       TextButton(
                        //         style: TextButton.styleFrom(
                        //           padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        //           foregroundColor: Theme.of(context).colorScheme.primary,
                        //         ),
                        //         onPressed: () {
                        //           showDialog(
                        //             context: context,
                        //             builder: (BuildContext context) {
                        //             return Dialog(
                        //               elevation: 2,
                        //               shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(15)
                        //               ),
                        //               alignment: Alignment.center,
                        //               child: ForgotPassword());
                        //             });
                        //         },
                        //         child: Text(
                        //           'Forgot Password ?',
                        //           style: GoogleFonts.roboto(
                        //           textStyle: Theme.of(context).textTheme.titleSmall,
                        //             color: Theme.of(context).colorScheme.primary,
                        //             letterSpacing: 1,
                        //             fontWeight: FontWeight.bold
                        //           ),
                        //         ),
                        //       ),

                        //       TextButton(
                        //         style: TextButton.styleFrom(
                        //           padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        //           foregroundColor: Theme.of(context).colorScheme.primary,
                        //         ),
                        //         onPressed: () {
                        //           showDialog(
                        //             context: context,
                        //             builder: (BuildContext context) {
                        //             return Dialog(
                        //               elevation: 2,
                        //               shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(15)
                        //               ),
                        //               alignment: Alignment.center,
                        //               child: ResendConfirmation());
                        //             });
                        //         },
                        //         child: Text(
                        //           'Resend Confirmation',
                        //           style: GoogleFonts.roboto(
                        //           textStyle: Theme.of(context).textTheme.titleSmall,
                        //             color: Theme.of(context).colorScheme.primary,
                        //             letterSpacing: 1,
                        //             fontWeight: FontWeight.bold
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement<void, void>(
                                      context, MaterialPageRoute(
                                        builder: (BuildContext context) => Login()
                                      )
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                    alignment: Alignment.center,
                                  ),
                                  child: Text('Signup'),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          // padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already Registered'.toLowerCase(),
                                style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.labelLarge,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                  foregroundColor: Theme.of(context).colorScheme.primary,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement<void, void>(
                                    context, MaterialPageRoute(
                                      builder: (BuildContext context) => Login()
                                    )
                                  );
                                },
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.roboto(
                                  textStyle: Theme.of(context).textTheme.titleSmall,
                                    color: Theme.of(context).colorScheme.primary,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          
          
          ],
        ),
      ),
    );
  }
}
