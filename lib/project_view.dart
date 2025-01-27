import 'package:flutter/material.dart';

class ProjectReportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project Report"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildSection(
              "Project Details",
              [
                {"label": "Project Code", "value": "Q2IT-2024-216-A"},
                {"label": "Sales Order No", "value": "SOIT-2024-0034"},
                {"label": "Currency", "value": "AED"},
                {"label": "Total Project Value", "value": "10,500.00"},
              ],
            ),
            SizedBox(height: 16),
            buildSection(
              "Estimation Details",
              [
                {"label": "Initial Est. Cost", "value": "9,524.00"},
                {"label": "Total Act. Cost", "value": "9,512.00"},
                {"label": "Overhead", "value": "0.00"},
              ],
            ),
            SizedBox(height: 16),
            buildSection(
              "Profit and Markup Details",
              [
                {"label": "Total Est. Profit", "value": "976.00"},
                {"label": "Total Act. Profit", "value": "988.00"},
                {"label": "Est. Margin %", "value": "9.30"},
                {"label": "Act. Margin %", "value": "9.41"},
              ],
            ),
            SizedBox(height: 16),
            buildSection(
              "Purchase Collection Details",
              [
                {"label": "Paid Against Delivery", "value": "9,924.60"},
                {"label": "Advance Paid to Supplier", "value": "0.00"},
                {"label": "Paid from PV", "value": "0.00"},
              ],
            ),
            SizedBox(height: 16),
            buildSection(
              "Sales Receipt Details",
              [
                {"label": "Total Sales Value W. VAT", "value": "0.00"},
                {"label": "Delivered SI W. VAT", "value": "0.00"},
                {"label": "Delivered SI With VAT", "value": "0.00"},
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, List<Map<String, String>> data) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            Column(
              children: data
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item['label']!,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            item['value']!,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProjectReportView(),
  ));
}
