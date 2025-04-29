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
  TextEditingController contrasenaController =
      TextEditingController(); // Nuevo controlador

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCFFFD5),
      appBar: AppBar(
        backgroundColor: const Color(0xffD9D9D9),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                side: const BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: const Text("INICIAR SESIÓN",
                  style: TextStyle(color: Colors.black)),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      campoTexto("NOMBRE", nombreController),
                      campoTexto("APELLIDO", apellidoController),
                      campoTexto("TELÉFONO", telefonoController,
                          isNumeric: true),
                      campoTexto("DIRECCIÓN", direccionController),
                      campoTexto("CORREO", correoController),
                      campoTexto("CONTRASEÑA", contrasenaController,
                          isPassword: true), // Nuevo campo
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue[200],
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: const BorderSide(color: Colors.black),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (_aceptoTerminos) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaginaLogin()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Debes aceptar los términos y condiciones")),
                                );
                              }
                            }
                          },
                          child: const Text("REGISTRARSE",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: _aceptoTerminos,
                            onChanged: (value) {
                              setState(() {
                                _aceptoTerminos = value!;
                              });
                            },
                          ),
                          const Text(
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

  Widget campoTexto(String label, TextEditingController controller,
      {bool isNumeric = false, bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          SizedBox(
            width: 250,
            child: TextFormField(
              controller: controller,
              textAlign: TextAlign.center,
              keyboardType:
                  isNumeric ? TextInputType.number : TextInputType.text,
              obscureText: isPassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Este campo es obligatorio";
                }
                if (isNumeric && int.tryParse(value) == null) {
                  return "Debe ser un número válido";
                }
                return null;
              },
              decoration: const InputDecoration(
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
