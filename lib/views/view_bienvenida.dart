

import 'package:flutter/material.dart';
import 'package:proy_agenda/views/view_login.dart';
import '../constantes.dart';
class Bienvenida extends StatelessWidget {
  const Bienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String tipoUsuario = "";
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Background(),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Bienvenido a", style: TextStyle(
                  fontSize: fMedium ,
                  color: PrimaryColor ,

                  ),
                ),

                Text("CYYF Calendar", style: TextStyle(
                  fontSize: fLarge ,
                  color: Color3 ,
                  fontWeight: FontWeight.bold,
                ),
                ),

                Text("Agenda Coorporativa", style: TextStyle(
                  fontSize: fCuerpo ,
                  color: PrimaryColor ,
                  fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(
                  height: size.height*0.15,
                ),

                Image.asset("assets/Imagenes/logo1.png",width: size.width*0.45),

                SizedBox(
                  height: size.height*0.2,
                ),
                SizedBox(
                  width: size.width * 0.6, // Ancho del 60% de la pantalla
                  child: TextButton(
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewLogin()),
                      );
                    },
                    child: Text("Comenzar", style: TextStyle(fontSize: fBoton)),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      foregroundColor: Colors.white, // color fuente
                      backgroundColor: PrimaryColor, // color fondo
                      overlayColor: Color3,
                    ),
                  ),
                ),



            
            
            
              ],
            ),
          )
        ],
      ),
    );
  }
  
}
class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: -50,
              right: -50,
              child: Image.asset("assets/Imagenes/hoja2.png", width: size.width*0.5,)
          ),

        ],
      ),
    );
  }
}
