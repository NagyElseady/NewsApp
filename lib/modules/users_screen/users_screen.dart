import 'package:flutter/material.dart';
import 'package:udemyflutter/models/user/user_model.dart';

class UserScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(
      id: 1,
      name: 'Nagy Reda',
      phone: '+201271777807',
    ),
    UserModel(
      id: 2,
      name: 'Nagy ali',
      phone: '+201271548807',
    ),
    UserModel(
      id: 3,
      name: 'Nagy mojs',
      phone: '+201271658807',
    ),
    UserModel(
      id: 1,
      name: 'Nagy Reda',
      phone: '+201271777807',
    ),
    UserModel(
      id: 2,
      name: 'Nagy ali',
      phone: '+201271548807',
    ),
    UserModel(
      id: 3,
      name: 'Nagy mojs',
      phone: '+201271658807',
    ),
    UserModel(
      id: 1,
      name: 'Nagy Reda',
      phone: '+201271777807',
    ),
    UserModel(
      id: 2,
      name: 'Nagy ali',
      phone: '+201271548807',
    ),
    UserModel(
      id: 3,
      name: 'Nagy mojs',
      phone: '+201271658807',
    ),
    UserModel(
      id: 1,
      name: 'Nagy Reda',
      phone: '+201271777807',
    ),
    UserModel(
      id: 2,
      name: 'Nagy ali',
      phone: '+201271548807',
    ),
    UserModel(
      id: 3,
      name: 'Nagy mojs',
      phone: '+201271658807',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: users.length,
      ),
    );
  }

  //build item
  // build list
  // add item to list

  Widget buildUserItem(UserModel user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${user.id}',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${user.phone}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
