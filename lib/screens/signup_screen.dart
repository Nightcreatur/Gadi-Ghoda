import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:uberclone/widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final nameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();
final textConfirmController = TextEditingController();
final phoneController = TextEditingController();
final addressController = TextEditingController();

bool isPassVisible = false;

final formKey = GlobalKey();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(padding: const EdgeInsets.all(10), children: [
            Image.asset(darkTheme
                ? 'assets/images/dark1.jpeg'
                : 'assets/images/light.jpeg'),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    color: darkTheme ? Colors.amber.shade400 : Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKey,
                    child: Column(
                      children: [
                        CoustomTextField(
                          controller: nameController,
                          hintText: 'Name',
                          text: 'Name',
                          icon: const Icon(Icons.person),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CoustomTextField(
                          hintText: 'Email',
                          text: 'Email',
                          controller: emailController,
                          icon: const Icon(Icons.email),
                        ),
                        CoustomTextField(
                          isPass: true,
                          controller: passwordController,
                          hintText: 'Password',
                          text: 'Password',
                          icon: const Icon(Icons.password),
                        ),
                        IntlPhoneField(
                          showCountryFlag: false,
                          dropdownIcon: Icon(
                            Icons.arrow_downward,
                            color:
                                darkTheme ? Colors.amber.shade400 : Colors.grey,
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
