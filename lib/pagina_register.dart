import 'package:flutter/material.dart';
import 'pagina_login.dart';

class PaginaRegister extends StatefulWidget {
  const PaginaRegister({super.key});

  @override
  _PaginaInicioState createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaRegister> {
  final _formKey = GlobalKey<FormState>();
  bool _aceptoTerminos = false;
  
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController correoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCFFFD5),
      appBar: AppBar(
        backgroundColor: Color(0xffD9D9D9),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
  onPressed: () => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PaginaLogin()),
  ),
  style: OutlinedButton.styleFrom(
    side: BorderSide(color: Colors.black),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0), // Hace que sea completamente rectangular
    ),
  ),
  child: Text("INICIAR SESIÓN", style: TextStyle(color: Colors.black)),
),

          ),
        ],
      ),
  body: Center(
  child: SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // CENTRA TODO EL TEXTO
              children: [
                campoTexto("NOMBRE", nombreController),
                campoTexto("APELLIDO", apellidoController),
                campoTexto("TELÉFONO", telefonoController, isNumeric: true),
                campoTexto("DIRECCIÓN", direccionController),
                campoTexto("CORREO", correoController),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue[200],
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_aceptoTerminos) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PaginaLogin()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Debes aceptar los términos y condiciones")),
                          );
                        }
                      }
                    },
                    child: Text("REGISTRARSE", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // CENTRA EL CHECKBOX Y TEXTO
                  children: [
                    Checkbox(
                      value: _aceptoTerminos,
                      onChanged: (value) {
                        setState(() {
                          _aceptoTerminos = value!;
                        });
                      },
                    ),
                    Text(
                      "ACEPTO TERM. Y COND.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
),



    );
  }

Widget campoTexto(String label, TextEditingController controller, {bool isNumeric = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Centra las etiquetas
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        SizedBox(
          width: 250, // Controla el ancho para que no se expanda demasiado
          child: TextFormField(
            controller: controller,
            textAlign: TextAlign.center, // Centra el texto dentro del input
            keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Este campo es obligatorio";
              }
              if (isNumeric && int.tryParse(value) == null) {
                return "Debe ser un número válido";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "AGREGAR",
              hintStyle: TextStyle(color: Colors.grey),
              border: UnderlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ),
      ],
    ),
  );
}

}
