import 'package:flutter/material.dart';
import 'package:pertemuan_3/login_page.dart';

void main() {
  runApp(const MyApp());
}

// stateless = statis -> tidak ada perubahan data pada halaman tersebut
// stateful = dinamis -> ada perubahan. menggunakan resource yang besar

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
