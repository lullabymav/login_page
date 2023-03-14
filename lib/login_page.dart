import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = ""; //tidak boleh null (kalau null pakai tanda tanya)
  bool isLoginSuccess = true;
  bool isUsernameTrue = true;
  bool isPasswordTrue = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Login Page'),
            backgroundColor: (isUsernameTrue && isPasswordTrue) ? Colors.blue : Colors.red,
          ),
          body: Column(
            children: [
              _usernameField(), // _ (underscore) means private
              _passwordField(),
              _loginButton(),
            ],
          ),
        )
    );
  }
  Widget _usernameField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        onChanged: (value){
          username = value;
        },
        decoration: InputDecoration(
          labelText: 'Username',
          //border dipakai keduanya agar tampilan border tetap ada
          // dan biru sebelum dan setelah di klik
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: (isUsernameTrue) ? Colors.blue : Colors.red,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Colors.blue,
              )
          ),
        ),
      ),
    );
  }
  Widget _passwordField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        onChanged: (value){
          password = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          //border dipakai keduanya agar tampilan border tetap ada
          // dan biru sebelum dan setelah di klik
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: (isPasswordTrue) ? Colors.blue : Colors.red,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
  Widget _loginButton(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary : (isUsernameTrue && isPasswordTrue) ? Colors.blue : Colors.red
        ), // mengubah warna button
        onPressed: (){
          String text = "";
          if(username == "flutterMobile" && password == "luwakwhitecoffee"){
            setState(() {
              isUsernameTrue = true;
              isPasswordTrue = true;
              text = "Login Success";
            }); // generate ulang halaman dengan variabel baru
          } else if(username == "flutterMobile" && password != "luwakwhitecoffee"){
            setState(() {
              isUsernameTrue = true;
              isPasswordTrue = false;
              text = 'Login Gagal, Password Salah';
            });
          } else if(username != "flutterMobile" && password == "luwakwhitecoffee"){
            setState(() {
              isUsernameTrue = false;
              isPasswordTrue = true;
              text = 'Login Gagal, Username Salah';
            });
          } else {
            setState(() {
              isUsernameTrue = false;
              isPasswordTrue = false;
              text = 'Login Gagal, Username dan Password Salah';
            });
          }

          // menampilkan notif pesan Login
          SnackBar snackBar = SnackBar(
              content: Text(text)
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

        },
        child: Text('Login'),
      ),
    );
  }
}

