import 'package:flutter/material.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();
  final GlobalKey<FormState>  _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new product"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Product Name",
                  ),
                  validator: (String? value) {
                    if (value
                        ?.trim()
                        .isEmpty ?? true) {
                      return "Product name is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _codeController,
                  decoration: InputDecoration(
                      labelText: "Product ID",
                  ),
                  validator: (String? value) {
                    if (value
                        ?.trim()
                        .isEmpty ?? true) {
                      return "Product ID is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                      labelText: "Unit Price",
                  ),
                  validator: (String? value) {
                    if (value
                        ?.trim()
                        .isEmpty ?? true) {
                      return "Unit Price is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _capacityController,
                  decoration: InputDecoration(
                      labelText: "Capacity",
                  ),
                  validator: (String? value) {
                    if (value
                        ?.trim()
                        .isEmpty ?? true) {
                      return "Capacity is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _capacityController,
                  decoration: InputDecoration(
                    labelText: "Image",
                  ),
                  validator: (String? value) {
                    if (value
                        ?.trim()
                        .isEmpty ?? true) {
                      return "Capacity is required";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )

                    ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          print("Product added");
                        }
                      }, child: Text("Add Product"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
