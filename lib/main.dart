import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_app/app.dart';
import 'package:tutorial_app/counter_observer.dart';

Future<String> getSimpleString() async {
  var value = '';
  for (int i = 0; i < 9000000; i++) {
    value += '$i';
  }
  return value;
}

Future<StringBuffer> getBufferString() async {
  var buffer = StringBuffer();
  for (int i = 0; i < 9000000; i++) {
    buffer.write('$i');
  }
  return buffer;
}

class Counter with ChangeNotifier{ //como mixin, adoptamos la clase con el comportamiento del cheange Notifier
  int _counter;
  Counter([this._counter = 0]);

  int get counter => _counter;
  set counter(int value) {
    _counter = value;
    notifyListeners();
  }

  void reset(){
    _counter = 0;
    notifyListeners();
  }

  void dispose() {
    print("el counter se esta liberando");
  }
}

class Servicio {
  bool loaded;
  Servicio() {
    print(" inicializing service...");
    loaded = true;
  }

  void dispose() {
    print("disposing service");
  }
}

void main() async {
  //esto es lo mismo que en java y c++ es necesario un main que ejecute el codigo

  //para el bloc con cubit
  Bloc.observer = CounterObserver();
  runApp(CounterApp());
  //para provider
  /* runApp(MyApp(
    texto: 'lalalalal',
  )); */
}

class MyApp extends StatelessWidget {
  //es el contrucotr de la aplicaion, no es necesario poner esta linea de codigo
  final String texto;
  MyApp({this.texto: 'hola'});

  @override
  Widget build(BuildContext context) {
    final service = Servicio();
    final counter = Counter();
    return //Provider<String>.value(
        //value: texto,
        ChangeNotifierProvider<Counter>(
      create: (_) => counter,
      //dispose: (_, counter) => counter.dispose(),
      //lazy: ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        /*  theme: ThemeData(
        
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
        ), */
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Notifier"), actions: [IconButton(icon: Icon(Icons.refresh), onPressed: () => context.read<Counter>().reset(),)],),
      body: CuerpoPage(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Increment',
        onPressed: () {
          //Provider.of<Counter>(context, listen: false).counter++;
          context.read<Counter>().counter++;
        }
      ),
    );
  }
}


class CuerpoPage extends StatelessWidget {
  const CuerpoPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final counterProvider = Provider.of<Counter>(context);
    return Center(
      //child: Title(),
      child: Consumer<Counter>(
        builder: (_, counterProvider, child) => Text('${counterProvider.counter}'),
        child: MaterialButton(child: Text("Consumer Button Parameter"), onPressed: (){},),
      )
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<String>(context);
    //final provider = Provider.of<Servicio>(context);
    final counterProvider = Provider.of<Counter>(context, listen: true);

    final numero = '${context.watch<Counter>().counter}';

    return Text(/* '${counterProvider.counter}' */numero, style: TextStyle(fontSize: 30));
  }
}
