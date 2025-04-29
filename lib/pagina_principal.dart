import 'package:flutter/material.dart';
class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color.fromARGB(255, 255, 255, 255),
    appBar: AppBar(
      backgroundColor: Color(0xFFCFFFD5),
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            'https://raw.githubusercontent.com/Angel-Perez-1086/Papeleria_imagenes_app_flutter/refs/heads/main/pAPELERIA-removebg-preview.png',
            height: 40,
          ),
          IconButton(
            icon: Icon(Icons.menu, size: 30, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, size: 30, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
    ),
    body: Column(
      children: [
        
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              botonSeccion(context, "productos"),
              botonSeccion(context, "sucursales"),
              botonSeccion(context, "empleados"),
              botonSeccion(context, "usuarios"),
              botonSeccion(context, "ventas"),
              botonSeccion(context, "proveedores"),
              botonSeccion(context, "clientes"),
            ],
          ),
        ),
      ],
    ),
  );
}

  Widget botonSeccion(BuildContext context, String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ElevatedButton(
        onPressed: () {
          // Aquí navegas a la sección correspondiente
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFB0F8C8),
          foregroundColor: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 14),
          side: BorderSide(color: Colors.black),
        ),
        child: Text(texto, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}