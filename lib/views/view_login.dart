import 'package:flutter/material.dart';
import '../constantes.dart';

class ViewLogin extends StatelessWidget {
  const ViewLogin({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          BackgroundLogin(),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("Iniciar Sesión", style: TextStyle(
                  fontSize: fMedium ,
                  color: PrimaryColor ,
                  fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(
                  height: size.height*0.01,
                ),
                Image.asset("assets/Imagenes/ilus1.png",height: size.height*0.30),

                SizedBox(
                  height: size.height*0.02,
                ),
                SizedBox(
                  width: size.width * 0.7, // Ancho del 60% de la pantalla
                  child: TextField(
                    style: TextStyle(color: Color3, fontSize: fBoton),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorLight,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:  BorderSide.none
                      ),
                      hintText: 'Ingresa tu correo',
                      hintStyle: TextStyle(color: Color3, fontSize: fBoton),
                      prefixIcon: Icon(Icons.person, color: Color3)

                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*0.02,
                ),
                SizedBox(
                  width: size.width * 0.7, // Ancho del 60% de la pantalla
                  child: TextField(
                    style: TextStyle(color: Color3, fontSize: fBoton),
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorLight,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:  BorderSide.none
                        ),
                        hintText: "Contraseña",
                        hintStyle: TextStyle(color: Color3, fontSize: fBoton),
                        prefixIcon: Icon(Icons.lock, color: Color3)

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
                    child: Text("Iniciar sesión", style: TextStyle(fontSize: fBoton)),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      foregroundColor: Colors.white, // color fuente
                      backgroundColor: PrimaryColor, // color fondo
                      overlayColor: Color3,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*0.01,
                ),
                Text("¿No tienes? Crear una cuenta", style: TextStyle(
                  fontSize: fCuerpo ,
                  color: PrimaryColor ,
                  fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(
                  height: size.height*0.01,
                ),
                Text("O", style: TextStyle(
                  fontSize: fCuerpo ,
                  color: PrimaryColor ,
                  fontWeight: FontWeight.bold,
                ),
                ),
                IconButton(onPressed: (){},
                    icon:Image.asset("assets/Imagenes/google.png",height: 40),


                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
class BackgroundLogin extends StatelessWidget {
  const BackgroundLogin({super.key});

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
          ),
          Positioned(
            top: 10,
              left: 10,

              child: Row(
                children: [IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.keyboard_return, color: Color3,)
                ),
                  Text("Volver", style: TextStyle(
                    fontSize: fCuerpo ,
                    color: Color3 ,
                    fontWeight: FontWeight.bold,
                  ),
                  )
                ]
              )
          )
        ],
      ),
    );
  }
}
