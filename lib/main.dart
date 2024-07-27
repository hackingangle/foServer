import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardPage(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text('Promage'),
            ),
            ListTile(
              title: Text('Dashboard'),
              leading: Icon(Icons.dashboard),
              onTap: () {},
            ),
            ListTile(
              title: Text('Projects'),
              leading: Icon(Icons.work),
              onTap: () {},
            ),
            ListTile(
              title: Text('Tasks'),
              leading: Icon(Icons.task),
              onTap: () {},
            ),
            ListTile(
              title: Text('Time Log'),
              leading: Icon(Icons.timelapse),
              onTap: () {},
            ),
            ListTile(
              title: Text('Resource Mgmt'),
              leading: Icon(Icons.people),
              onTap: () {},
            ),
            ListTile(
              title: Text('Users'),
              leading: Icon(Icons.person),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoCard(
                  title: 'Total revenue',
                  value: '\$53,00989',
                  change: '12% increase from last month',
                ),
                InfoCard(
                  title: 'Projects',
                  value: '95 /100',
                  change: '10% decrease from last month',
                ),
                InfoCard(
                  title: 'Time spent',
                  value: '1022 /1300 Hrs',
                  change: '8% increase from last month',
                ),
                InfoCard(
                  title: 'Resources',
                  value: '101 /120',
                  change: '2% increase from last month',
                ),
              ],
            ),
            SizedBox(height: 16),
            ProjectSummary(),
            SizedBox(height: 16),
            OverallProgress(),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final String change;

  InfoCard({required this.title, required this.value, required this.change});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text(change, style: TextStyle(color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Project summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            DataTable(
              columns: [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Project manager')),
                DataColumn(label: Text('Due date')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Progress')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Nelsa web development')),
                  DataCell(Text('Om prakash sao')),
                  DataCell(Text('May 25, 2023')),
                  DataCell(Text('Completed')),
                  DataCell(Text('100%')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Datascale AI app')),
                  DataCell(Text('Neilsan mando')),
                  DataCell(Text('Jun 20, 2023')),
                  DataCell(Text('Delayed')),
                  DataCell(Text('35%')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Media channel branding')),
                  DataCell(Text('Tiruvelly priya')),
                  DataCell(Text('Jul 13, 2023')),
                  DataCell(Text('At risk')),
                  DataCell(Text('68%')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OverallProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Overall Progress', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Center(
              child: CircularProgressIndicator(
                value: 0.72,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                strokeWidth: 8.0,
              ),
            ),
            SizedBox(height: 16),
            Center(child: Text('72% Completed')),
          ],
        ),
      ),
    );
  }
}