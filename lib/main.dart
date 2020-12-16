import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Validação',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Validação"),
        ),
        body: FormPage(),
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>(); // Gerenciamento do form
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.4),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField( 
              validator: (value) {
                if (value.isEmpty) return "Campo é obrigatório.";
                if (value.length < 7)
                  return "O campo precisa ter mais de 6 caracters.";
                return null;
              },
            ),
            Divider(),
            RaisedButton(
              child: Text("Enviar"),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Enviando dados para o servidor!"),
                    duration: Duration(seconds: 5), //duração da msg
                  ));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

