import 'package:flutter/material.dart';

import 'contato.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    List<Contato> contatos=[
    
    Contato( nome: 'Joe Doe', email: 'joe_doeoe@gmail.com'),
    Contato( nome: 'Alice O. Austin', email: 'AliceOAustin@rhyta.com'),
    Contato( nome: 'Douglas R. Brodway', email: 'DouglasRBrodway@dayrep.com'),
    Contato( nome: 'Zteste', email: 'teste@gmail'),
    Contato( nome: 'Teste', email: 'teste@gmail'),


  ];
   int favoritos =0;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: AppBar(
                    title: Text('Contatos favoritos: $favoritos'),
                     backgroundColor:  Colors.lightBlue[100],          
        ),
        body: ListView.builder(
            itemCount: contatos.length,
            itemBuilder: (BuildContext context, int index) {
              return
                ListTile(
                  leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img= $index'),
                  radius: 30,
                  
                   //child: Text(contatos[index].nome[0]),
                  // child: Image(image: NetworkImage('https://i.pravatar.cc/150?img= $index')),
                ),

              title: (Text(contatos[index].nome)),
              subtitle: Text(contatos[index].email),
              trailing: IconButton(
                icon: Icon(
              
                contatos[index].clicado  ? Icons.favorite
                    : Icons.favorite_border,
                color: contatos[index].clicado ? Colors.red : null,
                ),
                
                onPressed: () {
                  setState(() {
                    if( contatos[index].clicado == false){
                      contatos[index].clicado = true;
                      favoritos++;
                    
                    }else{
                       contatos[index].clicado = false;
                      favoritos --;
                    }
                  });
                },
              ),
              );

              
            },

        ),
        );
  }
}
