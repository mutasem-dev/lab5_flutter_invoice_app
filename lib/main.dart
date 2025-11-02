import 'package:flutter/material.dart';
import 'package:invoice_app/widgets/invoice_details.dart';
import 'package:invoice_app/widgets/invoices_list.dart';
import 'package:invoice_app/widgets/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => MainPage(),
        '/invoicesList': (context) => InvoiecsList(),
        '/invoiceDetails': (context) => InvoiceDetails(),
      },
    );
  }
}
