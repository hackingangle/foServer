import 'package:flutter/material.dart';

import '../screens/book_list_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                SizedBox(height: 8),
                Text(
                  'Gavano',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '人力资源经理',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('图书管理'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(BookListScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('仪表盘'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('财务'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('员工'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.business),
            title: Text('公司'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person_search),
            title: Text('候选人'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('日历'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('设置'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
