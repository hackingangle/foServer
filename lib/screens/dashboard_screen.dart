import 'package:flutter/material.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/stat_card.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('仪表盘'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 1200),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatCard(title: '总员工数', count: '856', percentage: '+10.0%'),
                    StatCard(title: '职位查看', count: '3,342', percentage: '+22.0%'),
                    StatCard(title: '申请职位', count: '77', percentage: '+12.0%'),
                    StatCard(title: '离职员工', count: '17', percentage: '-7.0%'),
                  ],
                ),
                SizedBox(height: 16),
                _buildJobStatisticsChart(),
                SizedBox(height: 16),
                _buildEmployeeStatus(),
              ],
            ),
          ),
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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