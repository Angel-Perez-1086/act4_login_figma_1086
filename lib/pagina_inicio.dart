import 'package:flutter/material.dart';
import 'pagina_register.dart';
class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCCFFD5),
    body:SafeArea(
      child: Column(
         children: [
        //Pantalla de imagen
        Align(
          alignment: Alignment.center,
          child: Image.network("https://raw.githubusercontent.com/Angel-Perez-1086/Papeleria_imagenes_app_flutter/refs/heads/main/papeinicio.png",
          scale: 4,
          ),
        ),
        const SizedBox(height: 27),
GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaginaRegister()), // Asegúrate de importar esta página
    );
  },
  child: Material( // Material necesario para que InkWell funcione bien
    color: Colors.transparent, // Para que el Container mantenga su color
    child: InkWell(
      borderRadius: BorderRadius.circular(15), // Efecto de clic redondeado
      splashColor: Colors.white.withOpacity(0.3), // Color del efecto de clic
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaginaRegister()),
        );
      },
      child: Container(
        height: 58,
        width: 248,
        decoration: BoxDecoration(
          color: Color(0xFF008C8C),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(1, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            "ENTRAR",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ),
  ),
),
      ],
      ),
    ),
    );
  }
}
