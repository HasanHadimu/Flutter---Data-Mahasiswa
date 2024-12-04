import 'package:balajarflutter/mahasiswa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Data Mahasiswa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Mahasiswa> ListMahasiswa = [
    Mahasiswa(nim: 113, name: 'Hanz', address: 'Maluku'),
    Mahasiswa(nim: 114, name: 'Budi', address: 'Jawa'),
    Mahasiswa(nim: 115, name: 'John', address: 'Makassar'),
    Mahasiswa(nim: 116, name: 'Anisa', address: 'Manado'),
    Mahasiswa(nim: 117, name: 'Bobby', address: 'Jakarta'),
    Mahasiswa(nim: 118, name: 'Zaki', address: 'Surakarta'),
    Mahasiswa(nim: 119, name: 'Ardi', address: 'Ambon'),
    Mahasiswa(nim: 120, name: 'Fany', address: 'Surabaya'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: ListMahasiswa.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text('Data Mahasiswa'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text('Name : '),
                                Text(ListMahasiswa[index].name)
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('${ListMahasiswa[index].nim}'),
                  ),
                  title: Text(ListMahasiswa[index].name),
                  subtitle: Text('${ListMahasiswa[index].address}'),
                ),
              ),
            );
          },
        ));
  }
}
