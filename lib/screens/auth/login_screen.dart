import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_application_1/constants/keys.dart';
import 'package:flutter_application_1/constants/route.dart';
import 'package:flutter_application_1/store/models/root_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late final RootStore store;

  @override
  void initState() {
    super.initState();
  }

  void onLogin() {
    final isFormValid = _formKey.currentState!.saveAndValidate();

    if (isFormValid) {
      print(_formKey.currentState!.value.toString());
    } else {
      print("nhu hach");
    }
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<RootStore>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                onChanged: () {
                  _formKey.currentState!.saveAndValidate();
                },
                child: Column(
                  children: [
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'userName',
                      validator: FormBuilderValidators.required(),
                      onChanged: (_) {
                        _formKey.currentState!.saveAndValidate();
                      },
                    ),
                    ElevatedButton(
                      // onPressed: onLogin,
                      onPressed: (_formKey.currentState?.validate() ?? false)
                          ? onLogin
                          : null,
                      child: Observer(
                        builder: (context) {
                          return Text('Login token ${store.autoStore.token}');
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
