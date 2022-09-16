import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/common/form_builder_password_field.dart';
import 'package:flutter_application_1/constants/keys.dart';
import 'package:flutter_application_1/constants/route.dart';
import 'package:flutter_application_1/services/alert_service.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final alertService = AlertService();

  void onRegister() {
    final isFormValid = _formKey.currentState!.saveAndValidate();

    if (isFormValid) {
      print(_formKey.currentState!.value.toString());

      AppKeys.navState.pushReplacementNamed(Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Register",
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 20,
              ),
              FormBuilderTextField(
                name: 'username',
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(
                height: 20,
              ),
              FormBuilderPasswordField(
                name: 'password',
                label: 'Password',
                validator: FormBuilderValidators.required(
                  errorText: "Required nè he!",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FormBuilderPasswordField(
                name: 'confirmPassword',
                label: 'Confirm Password',
                validator: FormBuilderValidators.compose<String>(
                  [
                    FormBuilderValidators.required(
                      errorText: "Required nè he!",
                    ),
                    (val) {
                      String password =
                          _formKey.currentState!.fields['password']!.value ??
                              "";

                      if (password.isNotEmpty && password != val) {
                        return "Not match";
                      }

                      return null;
                    }
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: onRegister,
                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
