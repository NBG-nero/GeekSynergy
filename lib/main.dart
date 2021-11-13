import 'package:flutter/material.dart';
import 'package:geek/Core/misc/Routes/route_gen.dart';
import 'package:provider/provider.dart';
import 'Core/misc/Routes/route_gen.dart';
import 'Core/data/dataProviders/providers/providers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        )
      ],
      child: Geek(),
    ),
  );
}

class Geek extends StatelessWidget {
  const Geek({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      debugShowCheckedModeBanner: false, 
    title: 'GeekSynergy',
    initialRoute: '?',
    onGenerateRoute: RouteGenerator.generatedRote,
    );
  }
}
