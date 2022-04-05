import 'package:flutter/material.dart';
import 'package:json_example/data/model/user_model.dart';
import 'package:json_example/ui/presenter/user_provider.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  final List<User> users;
  const UserList({Key? key,required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: users.map((e) => Use(user: e)).toList(),

    );
  }
}

class Use extends StatelessWidget {
  final User user;
  const Use({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<UserProvider>(context);
    return Column(
      children: [
        Text(user.name),
        Text(user.username),
        Text(user.email),
        Text(user.phone),
        TextButton(onPressed: (){
          provider.removeUser(user);
        },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Delete'),
                Icon(Icons.delete_forever,color: Colors.red,)
              ],
            ))
      ],
    );
  }
}
