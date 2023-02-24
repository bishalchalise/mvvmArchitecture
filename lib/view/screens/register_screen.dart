import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_botton.dart';
import 'package:mvvm/utils/routes/route_names.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();



  @override
  Widget build(BuildContext context) {
    final authVm = Provider.of<AuthViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                focusNode: emailFocusNode,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(fontSize: 20.0),
                  floatingLabelStyle: const TextStyle(fontSize: 20),
                  prefixIcon: const Icon(Icons.email_rounded),
                  label: const Text('Email'),
                  hintText: "Email",
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              ValueListenableBuilder(
                valueListenable: _obscurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    focusNode: passwordFocusNode,
                    obscureText: _obscurePassword.value,
                    style: const TextStyle(fontSize: 20.0),
                    controller: _passwordController,
                    decoration: InputDecoration(
                      floatingLabelStyle: const TextStyle(fontSize: 20),
                      prefixIcon: const Icon(Icons.lock_sharp),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obscurePassword.value = !_obscurePassword.value;
                          },
                          child: _obscurePassword.value
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                      label: const Text('Password'),
                      hintText: "Password",
                      hintStyle: const TextStyle(fontSize: 20.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onFieldSubmitted: (value) {

                    },
                  );
                },
              ),
              SizedBox(
                height: height * .05,
              ),
              RoundBotton(
                  loading: authVm.isRegisterLoading,
                  title: 'Register',
                  onPress: () {
                    if (_emailController.text.isEmpty |
                        _passwordController.text.isEmpty) {
                      Utils.snackBar(
                          context, 'Email or Password cannot be Empty');
                    } else if (!_emailController.text.contains('@')) {
                      Utils.snackBar(context, 'Invalid Email Address');
                    } else if (_passwordController.text.length < 6) {
                      Utils.snackBar(
                          context, 'Password length cannot be less than  6');
                    } else {
                      Map data = {
                        "email": _emailController.text.toString(),
                        "password": _passwordController.text.toString(),
                      };
                      authVm.registerApi(data, context);
                      print("Api has been Hit");
                    }
                  }),
              SizedBox(
                height: height * .05,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.login);
                  },
                  child: const Text("Already Have an Account? Login!")),
            ],
          ),
        ),
      ),
    );
  }
}
