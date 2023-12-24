import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/app/l10n/app_localizations.dart';
import 'package:to_do_app/app/routes/app_router.gr.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_app/app/views/view_signin/dashboard.dart';
import 'package:to_do_app/core/theme/theme.dart';
import 'package:to_do_app/core/constants/app_colors.dart';
import 'package:to_do_app/core/constants/config.dart';
import 'package:to_do_app/starter.dart';

@RoutePage()
class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isValid = false;

  void loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      setState(() {
        isValid = true;
      });

      var reqBody = {
        "email": emailController.text,
        "password": passwordController.text
      };

      var response = await http.post(Uri.parse(login),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));

      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse['status']);

      if (jsonResponse['status']) {
        var myToken = jsonResponse['token']; //tokeni aldik
        var box = await Hive.openBox(SETTINGS_BOX);
        box.put("token", myToken); //tokeni Hive'a kaydettik

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Successful"),
          ),
        );
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => Dashboard(
        //             token:
        //                 myToken))); //tokeni dashboard'a gonderdik, gormek amacli

        context.router.push(const HomeViewRoute());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Failed"),
          ),
        );
        print("Something went wrong");
      }
    } else {
      setState(() {
        isValid = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter email and password"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(L10n.of(context)!.signIn,
                style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 50),
            TextField(
              decoration: InputDecoration(
                labelText: L10n.of(context)!.email,
                hintText: L10n.of(context)!.enterEmail,
                suffixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: emailController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: L10n.of(context)!.password,
                hintText: L10n.of(context)!.enterPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  icon: isPasswordVisible
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: passwordController,
              obscureText: !isPasswordVisible,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(L10n.of(context)!.dontHaveAccount),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    context.router.push(const RegistrationViewRoute());
                  },
                  child: Text(
                    L10n.of(context)!.register,
                    style: const TextStyle(
                      color: AppColors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  minimumSize: const Size(300, 50),
                ),
                onPressed: () {
                  loginUser();
                },
                child: Text(L10n.of(context)!.signIn,
                    style: TextStyle(color: Themes.textColor))),
          ],
        ),
      ),
    );
  }
}
