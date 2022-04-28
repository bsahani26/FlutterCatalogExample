import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatalogDrawer extends StatelessWidget {
  const CatalogDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _profileImage =
        "https://media-exp1.licdn.com/dms/image/C4D03AQHljP3wBQZ_RA/profile-displayphoto-shrink_200_200/0/1619122218915?e=2147483647&v=beta&t=O8yg5zAR9bzc6wi_xUhNRK542kZVr2mUyTixR4buP4g";
    return Drawer(
        child: Container(
      color: Colors.deepPurple,
      child: ListView(
        children: const [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: Text(
                "Bikash Sahani",
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text(
                "abc@gmail.com",
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(_profileImage),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
            ),
            title: Text(
              "Profile",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
            title: Text(
              "Email me",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ));
  }
}
