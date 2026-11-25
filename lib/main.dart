import 'package:flutter/material.dart';

void main() {
  runApp(const Tes());
}

class Tes extends StatelessWidget {
  const Tes({super.key});

  final List<String> menu = const ["Soto", "Rawon"];
  final List<int> harga = const [9000, 11000];
  final List<String> gambar = const [
    "assets/Soto Bandung.jpg",
    "assets/rawon.jpg"
  ];

  String rupiah(int nilai) {
    return "Rp ${nilai.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+$)'),
          (m) => '${m[1]}.',
        )}";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF5F6FA),
        appBar: AppBar(
          title: const Text(
            "Menu Makanan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "Daftar Menu",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Table(
                border: TableBorder.all(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
                columnWidths: const {
                  0: FlexColumnWidth(0.7),
                  1: FlexColumnWidth(1.5),
                  2: FlexColumnWidth(1.5),
                  3: FlexColumnWidth(1.5),
                },
                children: [
                  // Header tabel
                  TableRow(
                    decoration: const BoxDecoration(
                      color: Colors.deepOrange,
                    ),
                    children: [
                      header("No"),
                      header("Gambar"),
                      header("Menu"),
                      header("Harga"),
                    ],
                  ),

                  // Isi tabel
                  for (int i = 0; i < menu.length; i++)
                    TableRow(
                      decoration: BoxDecoration(
                        color:
                            i % 2 == 0 ? Colors.white : Colors.orange.shade50,
                      ),
                      children: [
                        cell("${i + 1}"),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              gambar[i],
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        cell(menu[i]),
                        cell(rupiah(harga[i])),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget header(String teks) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        teks,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget cell(String teks) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Text(
          teks,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
