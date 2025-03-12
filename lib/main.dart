import 'package:flutter/material.dart';

class Reloj {
  final int id;
  final String marca;
  final String modelo;
  final String material;
  final double precio;
  final int anioLanzamiento;

  Reloj(
      {required this.id,
      required this.marca,
      required this.modelo,
      required this.material,
      required this.precio,
      required this.anioLanzamiento});
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lista de Relojes',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
        home: RelojesLista(),
      );
}

class RelojesLista extends StatelessWidget {
  final List<Reloj> relojes = [
    Reloj(
        id: 1,
        marca: 'Rolex',
        modelo: 'Submariner',
        material: 'Acero inoxidable',
        precio: 10000,
        anioLanzamiento: 1953),
    Reloj(
        id: 2,
        marca: 'Omega',
        modelo: 'Speedmaster',
        material: 'Acero inoxidable',
        precio: 5000,
        anioLanzamiento: 1957),
    Reloj(
        id: 3,
        marca: 'Casio',
        modelo: 'Hombre',
        material: 'Resina',
        precio: 50,
        anioLanzamiento: 2020),
    Reloj(
        id: 4,
        marca: 'Michael Kors',
        modelo: 'Mujer',
        material: 'Acero inoxidable',
        precio: 300,
        anioLanzamiento: 2022),
    Reloj(
        id: 5,
        marca: 'Seiko',
        modelo: 'Presage',
        material: 'Acero inoxidable',
        precio: 800,
        anioLanzamiento: 2023),
  ];

  Color _getIdColor(int id) =>
      {
        1: Colors.red,
        2: Colors.green,
        3: Colors.blue,
        4: Colors.orange,
        5: Colors.purple,
      }[id] ??
      Colors.grey;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Lista de Relojes'),
          backgroundColor: Color(0xff162230),
          elevation: 2,
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
        body: ListView.builder(
          itemCount: relojes.length,
          itemBuilder: (context, index) {
            final reloj = relojes[index];
            return Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text('${reloj.marca} ${reloj.modelo}',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                subtitle: Text(
                    'Material: ${reloj.material}, Precio: \$${reloj.precio.toStringAsFixed(2)}, Año: ${reloj.anioLanzamiento}',
                    style: TextStyle(color: Colors.grey[600])),
                leading: CircleAvatar(
                    backgroundColor: _getIdColor(reloj.id),
                    child: Text(reloj.id.toString(),
                        style: TextStyle(color: Colors.white))),
                trailing: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () =>
                        print('Comprar reloj con ID: ${reloj.id}')),
              ),
            );
          },
        ),
      );
}
