import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/common/form_builder_password_field.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_application_1/store/models/root_store.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  RootStore? store;

  @override
  void initState() {
    super.initState();
  }

  void onLogin() {
    final isFormValid = _formKey.currentState!.saveAndValidate();

    if (isFormValid) {
      print(_formKey.currentState!.value.toString());
      store!.autoStore.login();
    } else {
      print("nhu hach");
    }
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<RootStore>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          onChanged: () {
            _formKey.currentState!.saveAndValidate();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Log In",
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 20,
              ),
              FormBuilderTextField(
                name: 'userName',
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
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: onLogin,
                child: const Text("Login"),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account ?"),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Register !"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
