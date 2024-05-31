import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Actividad 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Paginaprincipal(),
    );
  }
}

class Paginaprincipal extends StatefulWidget {
  const Paginaprincipal({Key? key}) : super(key: key);

  @override
  State<Paginaprincipal> createState() => _Paginaprincipal();
}

class _Paginaprincipal extends State<Paginaprincipal> {
  String _nombre = '';

  void _setNombre(String nombre) {
    setState(() {
      _nombre = nombre;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividad 1'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Pagina 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Pagina 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Bienvenido',
              style: TextStyle(fontSize: 24),
            ),
            if (_nombre.isNotEmpty)
              Text(
                '$_nombre',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Escribe tu nombre'),
                      content: TextField(
                        onChanged: (value) {
                          _setNombre(value);
                        },
                        decoration: const InputDecoration(
                            hintText: 'Cual es tu nombre'),
                      ),
                    );
                  },
                );
              },
              child: const Text('Escribe tu nombre'),
            ),
          ],
        ),
      ),
    );
  }
}
