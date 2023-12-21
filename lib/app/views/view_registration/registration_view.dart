import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/app/l10n/app_localizations.dart';
import 'package:to_do_app/app/routes/app_router.gr.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_app/core/constants/app_colors.dart';
import 'package:to_do_app/core/constants/config.dart';

@RoutePage()
class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isValid = false;

  void isButtonEnabled() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      setState(() {
        isValid = true;
      });

      var regBody = {
        "email": emailController.text,
        "password": passwordController.text
      };

      var response = await http.post(Uri.parse(registration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody));

      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse['status']);

      if (jsonResponse['status']) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Registration Successful"),
          ),
        );
        context.router.push(const SignInViewRoute());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Registration Failed"),
          ),
        );
        print("Something went wrong");
      }
      // print("Post Registration: $response");
      // print("Post Request: $regBody");
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
            Text(L10n.of(context)!.registration,
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
                Text(L10n.of(context)!.alreadyHaveAccount),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    context.router.push(const SignInViewRoute());
                  },
                  child: Text(
                    L10n.of(context)!.signIn,
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
                  isButtonEnabled();
                },
                child: Text(L10n.of(context)!.register,
                    style: const TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
