import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variável que recebe o que é digitado no form
  final TextEditingController valor = TextEditingController();

  // lista que armazena as compras
  List<Map<String, dynamic>> compras = [
    {
      "name": "Macarrão",
      "isBought": false,
    },
    {
      "name": "Arroz",
      "isBought": false,
    },
  ];

  //add um item na lista
  void addItem(String value) {
    setState(() {
      compras.add({"name": value, "isBought": false});
    });
    valor.clear();
  }

  void remove(index) {
    setState(() {
      compras.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de compras',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.tealAccent[700],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: valor,
              decoration: InputDecoration(
                  hintText: 'Digite um item', border: OutlineInputBorder()),
            ),
          ),
          Container(
            width: double.infinity,
            height: 30,
            margin: const EdgeInsets.all(8),
            child: ElevatedButton(
                onPressed: () {
                  addItem(valor.text);
                },
                child: const Text('Adicionar item')),
          ),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.teal[600]!,
                    Colors.lightBlue[400]!,
                    Colors.blue[200]!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.5, 0.9],
                ),
              ),
              child: ListView.builder(
                itemCount: compras.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        compras[index]['name'],
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        remove(index);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
