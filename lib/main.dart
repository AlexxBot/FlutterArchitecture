import 'package:flutter/material.dart';

 Future<String> getSimpleString() async{
  var value = '';
  for(int i=0; i< 9000000; i++){
    value += '$i';
  }
  return value;
 }

 Future<StringBuffer> getBufferString() async{
  var buffer = StringBuffer();
  for(int i = 0 ; i< 9000000; i++)
  {
    buffer.write('$i');
  }
  return buffer;
 }

void main() async {
  //esto es lo mismo que en java y c++ es necesario un main que ejecute el codigo
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //es el contrucotr de la aplicaion, no es necesario poner esta linea de codigo
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SocialMediaListScreen(),
    );
  }
}


