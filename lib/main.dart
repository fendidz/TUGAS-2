import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Produk',
      theme: ThemeData(
        // Menggunakan warna hijau sebagai primary color
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.green[50], // Background aplikasi
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green, // AppBar warna hijau
          foregroundColor: Colors.white, // Teks di AppBar berwarna putih
          elevation: 4,
        ),
        cardTheme: CardTheme(
          color: Colors.white, // Warna latar Card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Sudut Card
          ),
          elevation: 4,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Warna tombol hijau
            foregroundColor: Colors.white, // Teks tombol putih
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      home: const ProductListPage(),
    );
  }
}

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      'name': 'Laptop Gaming',
      'price': 85000000,
      'image': 'assets/images/produk1laptop.png',
      'description': 'Laptop dengan performa tinggi untuk gaming.'
    },
    {
      'name': 'Smartphone Gaming',
      'price': 12000000,
      'image': 'assets/images/produk2hp.png',
      'description': 'Smartphone dengan jaringan 5G dan processor terbaik dikelasya.'
    },
    {
      'name': 'Headphone Wireless',
      'price': 1200000,
      'image': 'assets/images/produk3headphone.png',
      'description': 'Headphone dengan konektivitas wireless dan suara jernih.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: Image.network(
                  product['image'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(product['name']),
                subtitle: Text('Rp ${product['price']}'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(product: product),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product['image'],
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              product['name'],
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Rp ${product['price']}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product['description'],
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
