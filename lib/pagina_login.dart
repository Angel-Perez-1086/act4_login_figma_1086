import 'package:flutter/material.dart';
import 'package:perez108/pagina_principal.dart';

// Asegúrate de importar tu página de inicio real si ya existe
// Este es un ejemplo básico

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({super.key});

  @override
  _PaginaInicioState createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaLogin> {
  final _formKey = GlobalKey<FormState>();
  bool _aceptoTerminos = false;
  bool _verPassword = false;

  TextEditingController correoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => PaginaPrincipal()),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child:
                  Text("INICIAR SESIÓN", style: TextStyle(color: Colors.black)),
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
                      campoTexto("CORREO", correoController),
                      campoTexto("CONTRASEÑA", passwordController,
                          isPassword: true),
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
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaginaPrincipal()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Debes aceptar los términos y condiciones")),
                                );
                              }
                            }
                          },
                          child: Text("INICIAR SESION",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(height: 20),
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

  Widget campoTexto(
    String label,
    TextEditingController controller, {
    bool isNumeric = false,
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          SizedBox(
            width: 250,
            child: TextFormField(
              controller: controller,
              textAlign: TextAlign.center,
              obscureText: isPassword && !_verPassword,
              keyboardType:
                  isNumeric ? TextInputType.number : TextInputType.text,
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
                suffixIcon: isPassword
                    ? IconButton(
                        icon: Icon(
                          _verPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _verPassword = !_verPassword;
                          });
                        },
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
