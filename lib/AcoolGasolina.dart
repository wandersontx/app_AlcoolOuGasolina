import 'package:flutter/material.dart';

class AlcoolGasolina extends StatefulWidget {
  @override
  _AlcoolGasolinaState createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
      ),
      body: Container(
        //Utilizado quando tivermos muitos conteudos no app e por isso
        //iremos necessitar um um scroll
        child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .stretch, // para que o butão ocupe toda a coluna
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset('images/logo.png'),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'saiba qual a melhor opção para abastecimento do seu carro',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Preço Álcool, ex 3.56'),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  controller: _textEditingController,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Preço Gasoina, ex 4.56'),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  controller: _textEditingController,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    onPressed: () {},
                    child: Text(
                      'Calcular',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Resultado',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
