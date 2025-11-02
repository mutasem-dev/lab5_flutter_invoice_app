import 'package:flutter/material.dart';
import 'package:invoice_app/classes/invoice.dart';
import 'package:invoice_app/classes/poduct.dart';

TextEditingController cnameController = TextEditingController();
TextEditingController pnameController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController quantityController = TextEditingController();
List<Product> products = [];

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static List<Invoice> invoices = [];
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int invoiceNo = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice#$invoiceNo'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(label: Text('customer name')),
            controller: cnameController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Products: ', style: TextStyle(fontSize: 22)),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Product info'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            decoration: InputDecoration(label: Text('name')),
                            controller: pnameController,
                          ),
                          TextField(
                            decoration: InputDecoration(label: Text('price')),
                            controller: priceController,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              label: Text('quantity'),
                            ),
                            controller: quantityController,
                          ),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            if (pnameController.text.isEmpty ||
                                priceController.text.isEmpty ||
                                quantityController.text.isEmpty) {
                              SnackBar snackBar = SnackBar(
                                content: Text('Please fill all fields'),
                              );
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(snackBar);
                              return;
                            }
                            products.add(
                              Product(
                                poductName: pnameController.text,
                                quantity: int.parse(quantityController.text),
                                price: double.parse(priceController.text),
                              ),
                            );
                            pnameController.clear();
                            priceController.clear();
                            quantityController.clear();
                            Navigator.of(context).pop();
                            setState(() {});
                          },
                          child: Text('add'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('cancel'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('add product'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.blue,
                    leading: Text(
                      products[index].poductName,
                      style: TextStyle(fontSize: 22),
                    ),
                    title: Text('price: ${products[index].price}'),
                    subtitle: Text('quantity: ${products[index].quantity}'),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          products.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (cnameController.text.isEmpty || products.isEmpty) {
                    SnackBar snackBar = SnackBar(
                      content: Text('Please fill all fields and add products'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }
                  MainPage.invoices.add(
                    Invoice(
                      invoiceNo: invoiceNo,
                      customerName: cnameController.text,
                      products: products,
                    ),
                  );
                  invoiceNo++;
                  cnameController.clear();
                  products = [];
                  setState(() {});
                },
                child: Text('add invoice'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/invoicesList');
                },
                child: Text('show all'),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
