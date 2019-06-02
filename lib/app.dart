import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/screens/home_page.dart';
import 'src/providers/user_provider.dart';
import 'src/providers/details_provider.dart';

class App extends StatelessWidget {
  UserProvider _userProvider = UserProvider();
  DetailsProvider _detailsProvider = DetailsProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserProvider>.value(value: _userProvider),
        Provider<DetailsProvider>.value(value: _detailsProvider),
      ],
      child: MaterialApp(
        home: MaterialApp(
          home: HomePage(),
        ),
      ),
    );
  }
}
