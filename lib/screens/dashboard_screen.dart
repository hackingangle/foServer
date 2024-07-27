import 'package:flutter/material.dart';
import '../widgets/sidebar_menu.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('管理后台'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'admin',
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
      body: Row(
        children: <Widget>[
          SidebarMenu(),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '书管理概况：',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    // Add content for book management overview here
                    SizedBox(height: 20),
                    Text(
                      '用户概况：',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    // Add content for user overview here
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}