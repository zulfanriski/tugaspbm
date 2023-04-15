import 'package:flutter/material.dart';
import 'register_page.dart';

String logUsername = '';
String logPassword = '';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final String username;
  final String password;

  LoginPage({required this.username, required this.password});

  void _submit(BuildContext context) {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      if (logUsername == username && logPassword == password) {
        Navigator.pushNamed(context, '/home',
            arguments: {'username': username});
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("PASSWORD ATAU USERNAME LU SALAH BANH!"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OK",),
                ),
              ],
            );
          },
        );
      }
    }
  }

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

                Text("MASUK",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36
                  ),
                ),
                SizedBox(height: 24,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "NAMA PENGGUNA",
                  ),
                  onSaved: (value) {
                    logUsername = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "USERNAME MASIH KOSONG KOCAK!";
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
                    logPassword = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "SANDINYA KOSONG OM!";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 36,),
                ElevatedButton(
                  onPressed: () => _submit(context),
                  child: Text("MASUK",
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("YEAY!! BERHASiL MASUK")));
                    Navigator.pushNamed(context, '/register'); 
                  },
                  child: Text(
                    "GA ADA AKUN? YA BUAT LAH!"
                  )
                ),
                SizedBox(height: 150,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
