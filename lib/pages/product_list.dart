import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project_one/pages/product.dart';
import 'add_new_screen.dart';

enum PopupMenuType { edit, delete }

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];

  @override
  void initState() {
    super.initState();
    getProductFromList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product List"),
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(productList[index].name ?? "Unknown"),
            subtitle: Wrap(
              spacing: 16,
              children: [
                Text(productList[index].id?? "Unknown"),
                Text(...?productList[index].data.entries.map(entry){
                  return Text("${entry.key}: ${entry.value}");
                }).toList(),
                Text("Product Total Price"),
                Text("Product Quantity"),
              ],
            ),
            trailing: PopupMenuButton<PopupMenuType>(
              onSelected: (selectedMenu) {
                print(selectedMenu);
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      Icon(Icons.edit),
                      Text("Edit"),
                    ],
                  ),
                  value: PopupMenuType.edit,
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      Icon(Icons.delete),
                      Text("Delete"),
                    ],
                  ),
                  value: PopupMenuType.delete,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNewScreen()),
          );
        },
        label: Text(
          "Add Product",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Future<void> getProductFromList() async {
    Uri uri = Uri.parse("https://api.restful-api.dev/objects");
    Response response = await get(uri);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      for (var item in decodedResponse) {
        Product product = Product(
          id: item["id"],
          name: item["name"],
          data: item["data"],
        );
        productList.add(product);
      }
      setState(() {});
    }
  }

}

