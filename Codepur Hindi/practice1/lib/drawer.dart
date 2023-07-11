import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // DrawerHeader(
          //   child: Text("Hi, I am drawer",style: TextStyle(color: Colors.white),),
          //   decoration: BoxDecoration(color: Colors.indigo),
          // ),
          UserAccountsDrawerHeader(
            accountName: Text("Akash Gupta"),
            accountEmail: Text("akash616@gmail.com"),
            //currentAccountPicture: Image.asset("assets/logo.jpg"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("http://images.unpsplash.com/photo-"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Account"),
            subtitle: Text("Personal"),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("Email"),
            subtitle: Text("akash616@gmail.com"),
            trailing: Icon(Icons.send),
          )
        ],
      ),
    );
  }

}