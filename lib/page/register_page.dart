import 'package:flutter/material.dart';
import 'login_page.dart';

String username = "";
String password = "";

class RegisterPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("BUAT AKUN", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36
                  ),
                ),
                SizedBox(height: 24,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "NAMA",
                  ),
                  onSaved: (value) {
                    username = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "NAMA MASIH KOSONG KOCAK!";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "SANDI",
                  ),
                  obscureText: true,
                  onSaved: (value) {
                    password = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "SANDINYA KOSONG BANG!";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 36,),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("BERHASIL MASUK")));
      
                      Navigator.pushNamed(context, '/login', arguments: {
                        username: username,
                        password: password
                      });
                    }
                  },
                  child: const Text("Register", 
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                ),
                SizedBox(height: 150,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
