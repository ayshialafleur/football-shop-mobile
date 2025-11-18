import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/screens/item_detail.dart';
import 'package:football_shop/widgets/item_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class MyProductsPage extends StatefulWidget {
  const MyProductsPage({super.key});

  @override
  State<MyProductsPage> createState() => _MyProductsPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {
  Future<List<ProductEntry>> fetchItem(CookieRequest request) async {
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2:8000
    final response = await request.get('http://localhost:8000/json/');

    // Convert json data to ProductEntry objects and filter by user
    List<ProductEntry> listItem = [];
    final loggedInUserId = request.jsonData['user_id'];

    for (var d in response) {
      if (d != null) {
        ProductEntry product = ProductEntry.fromJson(d);
        // Ensure comparison is type-safe by converting both to strings
        if (product.userId.toString() == loggedInUserId.toString()) {
          listItem.add(product);
        }
      }
    }
    return listItem;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchItem(request),
        builder: (context, AsyncSnapshot<List<ProductEntry>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "You have no products yet.",
                style: TextStyle(fontSize: 20, color: Color(0xFFFA7DAB)),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => ItemEntryCard(
                item: snapshot.data![index],
                onTap: () {
                  // Navigate to item detail page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetailPage(
                        item: snapshot.data![index],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}