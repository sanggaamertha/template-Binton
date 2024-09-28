import 'package:baca_mongo/menu/nav_bar/navigation_menu.dart';
import 'package:baca_mongo/page/homePage.dart';
import 'package:baca_mongo/page/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';

class CheckLoginScreen extends StatefulWidget {
  const CheckLoginScreen({Key? key}) : super(key: key);

  @override
  State<CheckLoginScreen> createState() => _CheckLoginScreenState();
}

class _CheckLoginScreenState extends State<CheckLoginScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LoginRealm>().checkLoggedInUser();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginRealm>(
      builder: (context, loginRealm, child) {
        if (loginRealm.user != null) {
          return NavigationMenu();
        }
        return SignIn2();
      },
    );
  }
}
