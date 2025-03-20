import 'package:flutter/material.dart';
import '../constantes.dart';
import 'view_login.dart';
import '../Services/auth_service.dart';
class ViewCrearcuenta extends StatelessWidget {
  ViewCrearcuenta({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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

                Text("Crear cuenta",
                  style: TextStyle(
                  fontSize: fMedium ,
                  color: PrimaryColor ,
                  fontWeight: FontWeight.bold,
                ),


                ),
                SizedBox(
                  height: size.height*0.01,
                ),
                Image.asset("assets/Imagenes/ilus2.png",height: size.height*0.30),

                SizedBox(
                  height: size.height*0.02,
                ),
                SizedBox(
                  width: size.width * 0.7, // Ancho del 60% de la pantalla
                  child: TextField(
                    controller: _emailController,
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
                    controller: _passwordController,
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
                    onPressed: () async{
                      await AuthService().signup(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context:context
                      );
                    },
                    child: Text("Crear cuenta", style: TextStyle(fontSize: fBoton)),
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
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>ViewLogin()),
                    );
                  },
                  child:Text("¿Tienes una cuenta? Iniciar sesión",
                    style: TextStyle(
                      fontSize: fCuerpo ,
                      color: PrimaryColor ,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
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
