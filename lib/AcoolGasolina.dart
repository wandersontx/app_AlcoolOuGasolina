import 'package:flutter/material.dart';

class AlcoolGasolina extends StatefulWidget {
  @override
  _AlcoolGasolinaState createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {
  TextEditingController _alcool = TextEditingController();
  TextEditingController _gasolina = TextEditingController();
  var _resultado = '';

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
                  controller: _alcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Preço Gasoina, ex 4.56'),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  controller: _gasolina,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    onPressed: () => _calcular(),
                    child: Text(
                      'Calcular',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _resultado,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )),
      ),
    );
  }

  void _calcular() {
    var precoAlcool = double.tryParse(this._alcool.text.replaceAll(',', '.'));
    var precoGasolina =
        double.tryParse(this._gasolina.text.replaceAll(',', '.'));
    var melhorOpcao =
        'Erro ao realizar cálculo, favor inserir os dados novamente.';

    if (precoAlcool != null &&
        precoGasolina != null &&
        precoGasolina > 0.0 &&
        precoAlcool > 0.0) {
      melhorOpcao = (precoAlcool / precoGasolina) > 0.7
          ? 'Abasteça com GASOLINA'
          : 'Abasteça com ÁLCOOL';
    }
    setState(() {
      this._resultado = melhorOpcao;
      this._limparCampos();
    });
  }

  void _limparCampos() {
    this._alcool.text = '';
    this._gasolina.text = '';
  }
}
