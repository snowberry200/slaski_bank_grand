// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slaski/layout/password_layout.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../presentation/widget/database.dart';

// import '../homepage/homepage.dart';

class PasswordDesktop extends StatefulWidget {
  final String callback;

  const PasswordDesktop({super.key, required this.callback});

  @override
  State<PasswordDesktop> createState() => _PasswordDesktopState();
}

class _PasswordDesktopState extends State<PasswordDesktop> {
  bool isProgress = false;
  bool isChecked = true;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Text forgot = const Text('Forgot password?',
      style: TextStyle(decoration: TextDecoration.underline, fontSize: 12));
  bool isPasswordVissible = false;
  final TextEditingController _password = TextEditingController();

  Text passw = const Text(
    'Enter your password',
    style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.2),
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final checkmark = Checkbox(
      value: isChecked,
      onChanged: (value) => setState(() {
        isChecked = value!;
      }),
      activeColor: CupertinoColors.black,
      checkColor: CupertinoColors.white,
      hoverColor: CupertinoColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      side: const BorderSide(width: 0.5),
    );

    final paswordfield = TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(),
        ),
        contentPadding:
            const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
        suffixIcon: IconButton(
          hoverColor: Colors.transparent,
          icon: isPasswordVissible
              ? const Tooltip(
                  message: 'show characters',
                  textStyle:
                      TextStyle(fontSize: 14, color: CupertinoColors.white),
                  child: Text(
                    'Show',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 9,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : const Tooltip(
                  message: 'hide characters',
                  textStyle:
                      TextStyle(fontSize: 14, color: CupertinoColors.white),
                  child: Text(
                    'hide',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 9,
                        fontWeight: FontWeight.bold),
                  ),
                ),
          onPressed: () =>
              setState(() => isPasswordVissible = !isPasswordVissible),
        ),
      ),
      obscureText: isPasswordVissible,
      controller: _password,
      validator: (ifpassword) {
        if (ifpassword!.isNotEmpty && ifpassword.length < 6) {
          return 'Please enter a correct password';
        } else {
          return null;
        }
      },
    );

    Text eMail = const Text(
      'Email address',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 1.0),
    );

    return Scaffold(
        backgroundColor: CupertinoColors.white,
        body: Center(
            child: SizedBox(
                width: width / 3,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 50,
                        ),
                        child: Center(
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Walmart_Spark.svg/1925px-Walmart_Spark.svg.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Center(child: passw),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 30),
                          child: eMail,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Row(
                          children: [
                            Text(
                              widget.callback,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.0),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              hoverColor: CupertinoColors.white,
                              child: const Center(
                                child: Text(
                                  'Change',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1.0,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blue),
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => const PasswordLayout(
                                              email: '',
                                            )));
                              },
                            ),
                          ],
                        ),
                      ),
                      Form(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            top: 40, bottom: 20, left: 20, right: 20),
                        child: paswordfield,
                      )),
                      Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: MaterialButton(
                                hoverColor: Colors.white,
                                onPressed: () {},
                                child: forgot),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            Transform.scale(scale: 1.3, child: checkmark),
                            const SizedBox(width: 5),
                            const Text(
                              'Keep me signed in',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Row(
                          children: [
                            const Text(
                              'Uncheck if using public device.',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            MaterialButton(
                              hoverColor: Colors.white,
                              onPressed: () {},
                              child: const Text('More',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 16)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40, bottom: 10, left: 20, right: 20),
                        child:
                            //isProgress
                            // ? const CircularProgressIndicator(
                            //     color: CupertinoColors.activeBlue,
                            //   )
                            //:
                            ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0, backgroundColor: const Color.fromARGB(255, 37, 98, 228),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minimumSize: const Size.fromHeight(50),
                            fixedSize: const Size(150, 30),
                          ),
                          onPressed: () {
                            launchLink;

                            if (formkey.currentState!.validate()) {
                              debugPrint(
                                  'Email:${widget.callback}, Password:${_password.text}');
                              // setState(() {
                              //   isProgress = true;
                              // });

                              // FutureBuilder(
                              //     future: authClient.signIn(
                              //         email: widget.callback,
                              //         password: _password.text),
                              //     builder: (context, snapshot) {
                              //       if (snapshot.connectionState ==
                              //           ConnectionState.done) {
                              //         return const Text('All done');
                              //       } else {
                              //         return const CircularProgressIndicator(
                              //           color: Colors.red,
                              //         );
                              //       }
                              //     });

                              // User? user = await authClient.signIn(
                              //     email: widget.callback,
                              //     password: _password.text);
                              // setState(() {
                              //   isProgress = false;
                              // });
                              // if (user != null) {
                              //   Navigator.of(context).pushAndRemoveUntil(
                              //       MaterialPageRoute(
                              //           builder: (context) => HomePageLayout(
                              //                 user: user,
                              //               )),
                              //       (route) => false);
                              // }

                              FutureBuilder(
                                  future: Database(
                                          username: widget.callback,
                                          pass: _password.text)
                                      .getinfo(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return const CircularProgressIndicator();
                                    } else {
                                      return Container(
                                        color: Colors.red,
                                      );
                                    }
                                  });
                            } else {
                              return;
                            }
                          },
                          child: const Text('Sign in'),
                        ),
                      ),
                    ]))));
  }

  launchLink() async {
    const url = 'https://www.walmart.com/account/login?vid=oaoh';
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Couldnt launch url';
    }
  }
}
