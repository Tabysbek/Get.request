import 'package:flutter/material.dart';
import 'package:json_example/data/model/user_model.dart';
import 'package:json_example/ui/presenter/user_provider.dart';
import 'package:provider/provider.dart';

class Registering extends StatelessWidget {
  final TextEditingController nameController=TextEditingController();
  final TextEditingController usernameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();

   Registering({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
                validator: (val)=>val!.isEmpty?'Name is required': null,
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'What do people call you?',
                  labelText: 'Full name*',
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        nameController.clear();
                      },
                      child: Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(width: 2.0)),
                )),
            SizedBox(height: 10,),
            TextFormField(
                validator: (val)=>val!.isEmpty?'Name is required': null,
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'User name',
                  labelText: 'Full  User name*',
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        usernameController.clear();
                      },
                      child: Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(width: 2.0)),
                )),
            SizedBox(height: 10,),
            TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  helperText: 'aaaa@gmail.com',
                  labelText: 'Email address',
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        emailController.clear();
                      },
                      child: Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(width: 2.0)),
                )),
            SizedBox(height: 10,),
            TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  helperText: '8747-777-77-77',
                  hintText: 'Where can we reach you?',
                  labelText: 'Phone number*',
                  prefixIcon: Icon(Icons.call),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        phoneController.clear();
                      },
                      child: Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(width: 2.0)),
                )),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(

                  onTap: (){
                    provider.addUser(User(
                        name: nameController.text,
                        username: usernameController.text,
                        email: emailController.text,
                        phone: phoneController.text));
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(80, 10, 80, 10),
                    height: 40,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    color: Colors.green
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    Text('   Save new Person',style: TextStyle(fontWeight: FontWeight.bold),),
                    Icon(Icons.person,)
                ],),
                  ),),

                TextButton(onPressed: (){
                   provider.getUser();
                   Navigator.pop(context);
                  // Navigator.pop(context);
                }, child: Text('Готовые данные'))
              ],
            ),

          ],),),),
    );
  }
}
