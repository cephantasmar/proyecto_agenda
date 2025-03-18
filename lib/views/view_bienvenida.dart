import 'package:flutter/material.dart';
import '../constantes.dart';
class Bienvenida extends StatelessWidget {
  const Bienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Background(),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Bienvenido", style: TextStyle(
                  fontSize: fLarge ,
                  color: PrimaryColor ,
                  fontWeight: FontWeight.bold,
                  ),
                ),

                Image.asset("assets/Imagenes/ilus2.png",height: size.height*0.45),
                Text("Iniciar como:", style: TextStyle(
                    fontSize: fSmall,
                    color: Color4 ),
                ),
                SizedBox(
                  height: size.height*0.02,
                ),
                SizedBox(
                  width: size.width * 0.6, // Ancho del 60% de la pantalla
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Empresa", style: TextStyle(fontSize: fBoton)),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      foregroundColor: Colors.white, // color fuente
                      backgroundColor: PrimaryColor, // color fondo
                      overlayColor: Color3,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*0.02,
                ),
                SizedBox(
                  width: size.width * 0.6, // Ancho del 60% de la pantalla
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Cliente", style: TextStyle(fontSize: fBoton)),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      foregroundColor: Colors.white, // color fuente
                      backgroundColor: ColorLight, // color fondo
                      overlayColor: Color3,
                    ),
                  ),
                )
            
            
            
            
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
          Positioned(
            bottom: -50,

              left: -50,

              child: Image.asset("assets/Imagenes/forma3.png", width: size.width*0.5,)
          )
        ],
      ),
    );
  }
}
