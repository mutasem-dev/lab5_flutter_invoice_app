import 'package:flutter/material.dart';
import 'package:invoice_app/widgets/main_page.dart';

class InvoiecsList extends StatelessWidget {
  const InvoiecsList({super.key});
  static int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Customers'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: MainPage.invoices.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                selectedIndex = index;
                Navigator.of(context).pushNamed('/invoiceDetails');
              },
              tileColor: Colors.blue.shade100,
              leading: Text(
                MainPage.invoices[index].customerName,
                style: TextStyle(fontSize: 22),
              ),
            ),
          );
        },
      ),
    );
  }
}
