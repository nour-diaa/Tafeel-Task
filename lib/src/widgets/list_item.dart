import 'package:flutter/material.dart';

import '../models/user.dart';
import '../screens/details_screen.dart';

class UserItem extends StatelessWidget {
  final User user;

  UserItem(this.user);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DetailsScreen(user.id)));
      },
      child: Card(
        color: Color(0xff84c1ff),
        elevation: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                flex: 5,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(user.avatar,
                        width: double.infinity, fit: BoxFit.fill))),
            SizedBox(height: 10),
            Expanded(
                flex: 1,
                child: Text(
                  '${user.fname} ${user.lname}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
