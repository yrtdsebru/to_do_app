import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Dashboard extends StatefulWidget {
  final token;
  const Dashboard({@required this.token, Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String email;
  

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> JwtDecodedToken =
        JwtDecoder.decode(widget.token); // tokeni decode ettik
    email = JwtDecodedToken['email']; // emaili aldik
    //openBox();
  }

  //parametre yerine Hive kullansaydık bu şekilde olurdu
  // void openBox() async {
  //   var box = await Hive.openBox('settings');
  //   var myToken = box.get('token');
  //   Map<String, dynamic> JwtDecodedToken = JwtDecoder.decode(myToken); // tokeni decode etti
  //   email = JwtDecodedToken['email']; // emaili aldik
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(email),
          ),
        ],
      ),
    );
  }
}
