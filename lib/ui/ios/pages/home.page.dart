import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imc/blocs/imc.blocs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = new ImcBloc();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cálculo de IMC"),
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: CupertinoTextField(
              placeholder: "Altura (cm)",
              controller: bloc.heightCtrl,
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: CupertinoTextField(
              placeholder: "Peso (kg)",
              controller: bloc.weightCtrl,
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              bloc.result,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: CupertinoButton.filled(
              child: Text("Calcular"),
              onPressed: () {
                setState(() {
                  bloc.calculate();
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: CupertinoButton(
              color: Colors.black12,
              child: Text("Limpar"),
              onPressed: () {
                setState(() {
                  bloc.limpar();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
