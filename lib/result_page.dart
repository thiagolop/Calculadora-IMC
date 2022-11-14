import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final double soma;

  const ResultPage(this.soma, {super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<FaixaModel> faixas = [
    FaixaModel(nome: 'Magreza', percentual: 18.5, cor: Colors.yellow),
    FaixaModel(nome: 'Normal', percentual: 24.9, cor: Colors.green),
    FaixaModel(nome: 'Sobrepeso', percentual: 29.9, cor: Colors.orange),
    FaixaModel(nome: 'Obesidade', percentual: 30.0, cor: Colors.red),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              setState(() {
                Navigator.of(context).pop();
              });
            }),
      ),
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          const SizedBox(height: 50),
          SizedBox(
            child: Column(children: [
              SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: faixas.length,
                  itemBuilder: (context, index) {
                    return FaixaCard(faixa: faixas[index]);
                  },
                ),
              ),
              const SizedBox(height: 50),
              Text(
                widget.soma.toStringAsFixed(2),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class FaixaModel {
  final String nome;
  final double percentual;
  final Color cor;

  FaixaModel({required this.nome, required this.percentual, required this.cor});
}

class FaixaCard extends StatelessWidget {
  const FaixaCard({Key? key, required this.faixa}) : super(key: key);

  final FaixaModel faixa;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        color: faixa.cor,
        child: ListTile(
          title: Text(
            faixa.nome,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          trailing: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Text(
                '< ${faixa.percentual.toString()}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              )),
        ));
  }
}
