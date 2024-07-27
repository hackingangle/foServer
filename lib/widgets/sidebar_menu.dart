import 'package:flutter/material.dart';

class SidebarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.red[100],
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Text(
              '管理后台',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('仪表盘'),
            onTap: () {
              // Handle dashboard navigation
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('图书管理'),
            onTap: () {
              // Handle book management navigation
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('用户管理'),
            onTap: () {
              // Handle user management navigation
            },
          ),
        ],
      ),
    );
  }
}