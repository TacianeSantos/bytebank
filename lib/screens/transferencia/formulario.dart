import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';

const _labelCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloLabelRotulo = 'Nº Conta';
const _dicaCampoRotulo = '0000';

const _textBotaoConfirma = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {

  final TextEditingController _controladorCampoNumeroConta =   TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloLabelRotulo,
                dica: _dicaCampoRotulo,
              ),
              Editor(
                  controlador: _controladorCampoValor,
                  rotulo: _labelCampoValor,
                  dica: _dicaCampoValor,
                  icone: (Icons.monetization_on)),
              ElevatedButton(
                child: Text(_textBotaoConfirma),
                onPressed: () => _criaTransferencia(context),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if ((numeroConta != null) && (valor != null)) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('Criando transferência');
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$transferenciaCriada'),
          duration: Duration(milliseconds: 3000),
        ),
      );
    };
  }}