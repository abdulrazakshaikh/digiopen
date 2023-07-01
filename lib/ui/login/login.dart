import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/ui/login/forgot_password.dart';
import 'package:xceednet/ui/login/resend_confirmation.dart';
import 'package:xceednet/ui/login/select_location.dart';

import '../../utils/AppMsg.dart';
import '../../utils/AppUtils.dart';
import '../../view_model/auth_view_model.dart';

class Login extends StatefulWidget {
  bool isDisableUser = false;

  Login({this.isDisableUser = false});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  bool _passwordVisible = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isDisableUser) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        Widget yesButton = ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            alignment: Alignment.center,
          ),
          child: Text('Okay'),
        );
        AlertDialog alert = AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(
            "Session Timeout",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.titleLarge,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                fontSize: 18),
          ),
          content: Text(
            "Your session timeout please re-login to access app",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                letterSpacing: 1.2),
          ),
          actions: [
            Row(
              children: [
                SizedBox(width: 10),
                Expanded(child: yesButton),
              ],
            ),
          ],
        );
        // show the dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthViewModel authUserDataNotifier = context.watch<AuthViewModel>();
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
                    child: Image.asset('assets/images/signin_bg.png',
                        fit: BoxFit.contain),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Text(
                          'Login',
                          style: GoogleFonts.roboto(
                            textStyle:
                                Theme.of(context).textTheme.headlineLarge,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'enter details to login',
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
                            controller: usernameController,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                            autofocus: true,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 15),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: 'Enter Email'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  letterSpacing: 1.8,
                                  fontWeight: FontWeight.w300),
                              prefixIcon: Icon(Icons.alternate_email),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 1),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: TextField(
                            controller: passwordController,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                            autofocus: true,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 15),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: 'Password'.toLowerCase(),
                              hintStyle: GoogleFonts.roboto(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  letterSpacing: 1.8,
                                  fontWeight: FontWeight.w300),
                              prefixIcon: Icon(Icons.lock_outlined),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 1),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                  foregroundColor:
                                      Theme.of(context).colorScheme.primary,
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            alignment: Alignment.center,
                                            child: ForgotPassword());
                                      });
                                },
                                child: Text(
                                  'Forgot Password ?',
                                  style: GoogleFonts.roboto(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                  foregroundColor:
                                      Theme.of(context).colorScheme.primary,
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            alignment: Alignment.center,
                                            child: ResendConfirmation());
                                      });
                                },
                                child: Text(
                                  'Resend Confirmation',
                                  style: GoogleFonts.roboto(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                       authUserDataNotifier.isLoading ? CircularProgressIndicator(color: Theme.of(context).primaryColor,): Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    /* Navigator.pushReplacement<void, void>(
                                        context, MaterialPageRoute(
                                          builder: (BuildContext context) => BottomNavigation()
                                        )
                                      );*/
                                    String username =
                                        usernameController.text.toString();
                                    String password =
                                        passwordController.text.toString();
                                    bool isValid = true;
                                    if (username.isEmpty) {
                                      isValid = false;
                                      AppUtils.appToast(AppMsg.username_error);
                                      return;
                                    }
                                    if (password.isEmpty) {
                                      AppUtils.appToast(AppMsg.password_error);
                                      isValid = false;
                                      return;
                                    }
                                    if (isValid) {
                                      bool status = await authUserDataNotifier
                                          .userLogin(username, password);
                                      if (status) {
                                        AppUtils.appToast(AppMsg.login_success);
                                        Navigator.pushReplacement<void, void>(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        SelectLocation()));
                                      } else {
                                        AppUtils.appToast(
                                            authUserDataNotifier.error!);
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 20),
                                    alignment: Alignment.center,
                                  ),
                                  child: Text('Login'),
                                ),
                              )
                            ],
                          ),
                        ),
                        // Container(
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Text(
                        //         'Not Registered Yet ?'.toLowerCase(),
                        //         style: GoogleFonts.roboto(
                        //             textStyle: Theme.of(context).textTheme.labelLarge,
                        //             letterSpacing: 1.2,
                        //             fontWeight: FontWeight.w500),
                        //       ),
                        //       TextButton(
                        //         style: TextButton.styleFrom(
                        //           padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        //           foregroundColor: Theme.of(context).colorScheme.primary,
                        //         ),
                        //         onPressed: () {
                        //           Navigator.pushReplacement<void, void>(
                        //             context, MaterialPageRoute(
                        //               builder: (BuildContext context) => Signup()
                        //             )
                        //           );
                        //         },
                        //         child: Text(
                        //           'Signup',
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
                        // )
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
