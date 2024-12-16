import 'package:flutter/material.dart';

void main() {
  runApp(const CartridgeKingsApp());
}

class CartridgeKingsApp extends StatelessWidget {
  const CartridgeKingsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartridge Kings',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'CARTRIDGE KINGS',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Icon(Icons.search, color: Colors.black),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text('CART (1)'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Menu Navigation
            Container(
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavButton(label: 'HOME'),
                  NavButton(label: 'INK CARTRIDGES'),
                  NavButton(label: 'TONER CARTRIDGES'),
                  NavButton(label: 'CONTACT US'),
                  NavButton(label: 'LOGIN / REGISTER'),
                ],
              ),
            ),
            // Search Section
            Container(
              width: double.infinity,
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'FIND THE RIGHT CARTRIDGES FOR YOUR PRINTER',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 5,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                    labelText: '1. Printer Brand',
                                  ),
                                  items: const [],
                                  onChanged: (value) {},
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                    labelText: '2. Printer Series',
                                  ),
                                  items: const [],
                                  onChanged: (value) {},
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                    labelText: '3. Printer Model',
                                  ),
                                  items: const [],
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                            ),
                            child: const Text(
                              'FIND CARTRIDGES',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Featured Products Section
            const Text(
              'FEATURED PRODUCTS',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              children: const [
                ProductCard(
                  productName: 'HP 62 Black Ink Cartridge',
                  price: '\$9.49',
                  discountedPrice: '\$5.99',
                  imagePath: 'hp.jpg',
                ),
                ProductCard(
                  productName: 'Canon MF-3110 Toner',
                  price: '\$36.45',
                  imagePath: 'hp.jpg',
                ),
                ProductCard(
                  productName: 'HP 62 Black Ink Cartridge',
                  price: '\$9.49',
                  discountedPrice: '\$5.99',
                  imagePath: 'hp.jpg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for Navigation Buttons
class NavButton extends StatelessWidget {
  final String label;

  const NavButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// Widget for Product Cards
class ProductCard extends StatelessWidget {
  final String productName;
  final String price;
  final String? discountedPrice;
  final String imagePath;

  const ProductCard({
    Key? key,
    required this.productName,
    required this.price,
    this.discountedPrice,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 100, fit: BoxFit.contain),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              productName,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          if (discountedPrice != null)
            Text(
              discountedPrice!,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          Text(
            price,
            style: TextStyle(
              decoration:
                  discountedPrice != null ? TextDecoration.lineThrough : null,
              color: Colors.grey,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text(
              'ADD TO CART',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
