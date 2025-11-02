import 'package:flutter/material.dart';
import 'package:invoice_app/widgets/main_page.dart';
import 'package:invoice_app/widgets/invoices_list.dart';

class InvoiceDetails extends StatelessWidget {
  const InvoiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final invoice = MainPage.invoices[InvoiecsList.selectedIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(invoice.customerName),
        backgroundColor: Colors.blue,
      ),
      body: Text(invoice.toString(), style: TextStyle(fontSize: 20)),
    );
  }
}
