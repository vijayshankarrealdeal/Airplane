import 'dart:ui';
import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/services/auth.dart';
import 'package:airplane/widgets/dialog.dart';
import 'package:airplane/widgets/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum SignOptions { signIn, signUp, forgetPass }

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  SignOptions _formType = SignOptions.signIn;
  bool isSpin = true;
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final String primaryText =
        _formType == SignOptions.signIn ? "Sign In " : "Sign Up";
    final String secondaryText = _formType == SignOptions.signIn
        ? "Need a Account ? Sign Up"
        : "Already Have An Account";
    final auth = Provider.of<Auth>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    final color = Provider.of<ColorManager>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(
          color: color.backButton(), //change your color here
        ),
        backgroundColor: color.appBarColorroute(),
      ),
      backgroundColor: color.colorofScaffoldroute(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          fonts.heading2("Flight+", color.textColor()),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.001,
          ),
          Container(
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: FormForApp(
              change: (s) {},
              addWordCount: false,
              email: _email,
              placeholder: 'Email',
            ),
          ),
          const SizedBox(height: 4.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: FormForApp(
              change: (s) {},
              addWordCount: false,
              callback: () => submit(_email.text.trim(), _password.text,
                  _confirmPassword.text, auth, color),
              email: _password,
              placeholder: 'Password',
              type: _formType == SignOptions.signUp
                  ? TextInputAction.next
                  : TextInputAction.done,
              hideText: true,
            ),
          ),
          const SizedBox(height: 4.0),
          _formType == SignOptions.signUp
              ? Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: FormForApp(
                    change: (s) {},
                    addWordCount: false,
                    type: TextInputAction.done,
                    email: _confirmPassword,
                    placeholder: 'Confirm Password',
                    hideText: true,
                  ),
                )
              : const Text(''),
          const SizedBox(height: 15.0),
          isSpin
              ? CupertinoButton(
                  child:
                      fonts.button(primaryText, color.labeledButtonoutside()),
                  onPressed: () => submit(_email.text.trim(), _password.text,
                      _confirmPassword.text, auth, color),
                )
              : CircularProgressIndicator(
                  color: color.textColor(),
                ),
          // CupertinoButton(
          //     padding: EdgeInsets.zero,
          //     child: GenralText(
          //       text: 'Sign In / Sign up with google',
          //       family: 'SF-Pro-Text-Semibold',
          //       color: CupertinoColors.activeBlue,
          //     ),
          //     onPressed: () {
          //       auth.signInWithGoogle();
          //     }),
          CupertinoButton(
              padding: EdgeInsets.zero,
              child: fonts.button(secondaryText, color.textColor()),
              onPressed: () {
                setState(() {
                  _formType = _formType == SignOptions.signIn
                      ? SignOptions.signUp
                      : SignOptions.signIn;
                });
                _email.clear();
                _password.clear();
              }),
          _formType == SignOptions.signIn
              ? CupertinoButton(
                  child: fonts.button('Forgot Password', Colors.grey),
                  onPressed: () => forgetPass(context, auth, fonts, color),
                  padding: const EdgeInsets.only(top: 0.5),
                )
              : const Text(''),
        ],
      ),
    );
  }

  void submit(
    String email,
    String password,
    String confirmPassword,
    Auth auth,
    ColorManager color,
  ) async {
    if (_formType == SignOptions.signIn) {
      try {
        if (email.isEmpty || password.isEmpty) {
          throw "Enter Email or Password";
        }
        setState(() {
          isSpin = false;
        });
        final _response = await auth.login(email, password);
        if (_response) {
          Navigator.pop(context);
        } else {
          throw "Enter valid Email or Password";
        }
      } catch (e) {
        setState(() {
          isSpin = true;
        });
        showAlertDialog(context, e.toString());
      }
    } else {
      try {
        setState(() {
          isSpin = false;
        });
        if (password == confirmPassword &&
            validateStructure(password) &&
            password.length > 6) {
          await auth.register(email, password, context);
          Navigator.pop(context);
        } else {
          throw "Password Not Match or\nor Password must be greater than 7 \nmake Strong Password For example Vignesh@123";
        }
      } catch (e) {
        setState(() {
          isSpin = true;
        });
        showAlertDialog(context, e.toString());
      }
    }
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  void forgetPass(BuildContext context, Auth auth, TypoGraphyOfApp typo,
      ColorManager colorManager) {
    TextEditingController _emailForget = TextEditingController();
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => Theme(
        data: ThemeData(
            brightness:
                colorManager.darkmode ? Brightness.dark : Brightness.light),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  typo.heading4("Forgot Password", colorManager.textColor()),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                    child: FormForApp(
                      change: (s) {},
                      addWordCount: false,
                      type: TextInputAction.done,
                      email: _emailForget,
                      placeholder: 'Enter Email',
                      hideText: true,
                    ),
                  ),
                  CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: typo.button(
                          "Submit", colorManager.labeledButtonoutside()),
                      onPressed: () async {
                        try {
                          setState(() {
                            isSpin = false;
                          });
                          //  await auth.forgotPassword(_emailForget.text);

                          _emailForget.clear();
                          setState(() {
                            isSpin = true;
                          });
                        } catch (e) {
                          setState(() {
                            isSpin = true;
                          });
                        }
                      }),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: typo.button("Back", colorManager.textColor()),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
