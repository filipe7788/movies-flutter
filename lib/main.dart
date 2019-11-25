import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_flutter/Screens/HomePage.dart';
import 'package:movies_flutter/Service/bloc/movies_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: BlocProvider(
          builder: (context) => MoviesBloc(),
          child: new Scaffold(
              backgroundColor: Colors.grey.withOpacity(1),
              appBar: AppBar(
                title: const Text('The Movie App'),
              ),
              body: Center(
                child: HomePage(),
              )),
        ));
  }
}
