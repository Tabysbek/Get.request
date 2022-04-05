import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_example/ui/presenter/user_provider.dart';
import 'package:json_example/data/repository/user_repository.dart';
import 'package:json_example/ui/pages/register.dart';
import 'package:json_example/ui/pages/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(UserRepository()),
      child: MaterialApp(
        title: 'Http',
        theme: ThemeData(primarySwatch: Colors.amber),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Http'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Text(
              'Загрузите данные',
              style: TextStyle(fontSize: 25),
            )),
            provider.userList == null
                ? Text('Нет соединение')
                : UserList(users: provider.userList),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Registering()));
        },
        label: const Text('Add'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          provider.getUser();
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 70, 10),
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.green),
          child: Row(
            children: [
              Text(
                '       Готовые Персоналы',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              Icon(Icons.person,color: Colors.indigo,size: 30,)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
