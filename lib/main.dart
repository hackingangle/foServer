import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '仪表盘',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circle Soft'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard('总员工数', '856', '+10.0%'),
                _buildStatCard('职位查看', '3,342', '+22.0%'),
                _buildStatCard('申请职位', '77', '+12.0%'),
                _buildStatCard('离职员工', '17', '-7.0%'),
              ],
            ),
            SizedBox(height: 16),
            _buildJobStatisticsChart(),
            SizedBox(height: 16),
            _buildEmployeeStatus(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String count, String percentage) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              count,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              percentage,
              style: TextStyle(
                fontSize: 12,
                color: percentage.startsWith('+') ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobStatisticsChart() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '职位统计',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Placeholder for the chart
            Container(
              height: 200,
              color: Colors.blue[50],
              child: Center(child: Text('图表占位符')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmployeeStatus() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '员工状态',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            DataTable(
              columns: [
                DataColumn(label: Text('姓名')),
                DataColumn(label: Text('部门')),
                DataColumn(label: Text('年龄')),
                DataColumn(label: Text('绩效')),
                DataColumn(label: Text('状态')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Justin Lipshutz')),
                  DataCell(Text('市场部')),
                  DataCell(Text('22')),
                  DataCell(Text('+100%')),
                  DataCell(Text('正式')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Marcus Culhane')),
                  DataCell(Text('财务部')),
                  DataCell(Text('24')),
                  DataCell(Text('+95%')),
                  DataCell(Text('合同工')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Leo Stanton')),
                  DataCell(Text('研发部')),
                  DataCell(Text('28')),
                  DataCell(Text('+89%')),
                  DataCell(Text('正式')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}