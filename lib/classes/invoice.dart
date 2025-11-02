import 'package:invoice_app/classes/poduct.dart';

class Invoice {
  String customerName;
  int invoiceNo;
  List<Product> products;

  Invoice({
    required this.customerName,
    required this.invoiceNo,
    required this.products,
  });
  @override
  String toString() {
    String result = 'Invoice No: $invoiceNo\nProducts:\n';
    double total = 0.0;
    int totalQuantity = 0;
    int i = 1;
    for (var product in products) {
      result +=
          '$i- ${product.poductName}, Price: ${product.price}, Quantity: ${product.quantity}\n';
      total += product.price * product.quantity;
      totalQuantity += product.quantity;
      i++;
    }
    result += '\n\n\nTotal Price: $total';
    result += '\nTotal Quantity: $totalQuantity';
    return result;
  }
}
