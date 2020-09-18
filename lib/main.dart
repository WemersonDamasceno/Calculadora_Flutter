import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculadora Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String resultado = "0";
  String numero1 = ""; //Depois converte pra numeros
  String numero2 = "";
  String operacao = "";
  String txtNum1 = "";
  String txtNum2 = "";
  //Se operacao for "" os numeros que forem digitados ainda vão para o num 1
  //Se operação for != de "" o numeros vão para o num 2.

  void _getValor(String value) {
    if (operacao == "") {
      setState(() {
        if (resultado == "0") {
          resultado = "";
        }
        numero1 = value;
        resultado = resultado + numero1;
      });
    } else {
      setState(() {
        if (resultado == "0") {
          resultado = "";
        }
        numero2 = value;
        resultado = resultado + numero2;
      });
    }
  }

  void calcular() {
    if (txtNum1 == "0" || txtNum2 == "0") {
      print("Preencha todos os numeros");
    } else {
      int num1 = int.parse(txtNum1);
      int num2 = int.parse(txtNum2);

      if (operacao == "+") {
        int soma = num1 + num2;
        String result = soma.toString();
        setState(() {
          resultado = result;
        });
      } else if (operacao == "-") {
        int sub = num1 - num2;
        String result = sub.toString();
        setState(() {
          resultado = result;
        });
      } else if (operacao == "*") {
        int mult = num1 * num2;
        String result = mult.toString();
        setState(() {
          resultado = result;
        });
      } else if (operacao == "/") {
        double div = num1 / num2;
        String result = div.toString();
        setState(() {
          resultado = result;
        });
      }

      setState(() {
        operacao = "";
        numero1 = "";
        numero2 = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 5),
            Container(
              alignment: Alignment.bottomRight,
              height: 80,
              color: Colors.white,
              child: Text("$txtNum1",
                  style: TextStyle(color: Colors.black, fontSize: 30)),
            ),
            Container(
              alignment: Alignment.bottomRight,
              height: 80,
              color: Colors.white,
              child: Text("$txtNum2",
                  style: TextStyle(color: Colors.black, fontSize: 30)),
            ),
            Container(
              alignment: Alignment.bottomRight,
              height: 150,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '$resultado',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                height: 310,
                width: double.infinity,
                color: Colors.black12,
                child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FlatButton(
                        height: 60,
                        onPressed: () {
                          _getValor("1");
                        },
                        color: Colors.white,
                        child: Text(
                          "1",
                          style: TextStyle(color: Colors.black, fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      FlatButton(
                        height: 60,
                        onPressed: () {
                          _getValor("2");
                        },
                        color: Colors.white,
                        child: Text(
                          "2",
                          style: TextStyle(color: Colors.black, fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      FlatButton(
                        height: 60,
                        onPressed: () {
                          _getValor("3");
                        },
                        color: Colors.white,
                        child: Text(
                          "3",
                          style: TextStyle(color: Colors.black, fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      FlatButton(
                        height: 60,
                        onPressed: () {
                          setState(() {
                            operacao = "+";
                            txtNum1 = resultado;
                            resultado = "0";
                          });
                        },
                        color: Colors.blueAccent,
                        child: Text(
                          "+",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FlatButton(
                        height: 60,
                        onPressed: () {
                          _getValor("4");
                        },
                        color: Colors.white,
                        child: Text(
                          "4",
                          style: TextStyle(color: Colors.black, fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      FlatButton(
                        height: 60,
                        onPressed: () {
                          _getValor("5");
                        },
                        color: Colors.white,
                        child: Text(
                          "5",
                          style: TextStyle(color: Colors.black, fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      FlatButton(
                        height: 60,
                        onPressed: () {
                          _getValor("6");
                        },
                        color: Colors.white,
                        child: Text(
                          "6",
                          style: TextStyle(color: Colors.black, fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      FlatButton(
                        height: 60,
                        onPressed: () {
                          setState(() {
                            operacao = "-";
                            txtNum1 = resultado;
                            resultado = "0";
                          });
                        },
                        color: Colors.blueAccent,
                        child: Text(
                          "-",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FlatButton(
                        height: 60,
                        onPressed: () {
                          _getValor("7");
                        },
                        color: Colors.white,
                        child: Text(
                          "7",
                          style: TextStyle(color: Colors.black, fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      FlatButton(
                        height: 60,
                        onPressed: () {
                          _getValor("8");
                        },
                        color: Colors.white,
                        child: Text(
                          "8",
                          style: TextStyle(color: Colors.black, fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      FlatButton(
                        height: 60,
                        onPressed: () {
                          _getValor("9");
                        },
                        color: Colors.white,
                        child: Text(
                          "9",
                          style: TextStyle(color: Colors.black, fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      FlatButton(
                        height: 60,
                        onPressed: () {
                          setState(() {
                            operacao = "/";
                            txtNum1 = resultado;
                            resultado = "0";
                          });
                        },
                        color: Colors.blueAccent,
                        child: Text(
                          "/",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 60,
                        width: 86,
                        color: Colors.white,
                        child: Text(""),
                      ),
                      FlatButton(
                        height: 60,
                        onPressed: () {
                          _getValor("0");
                        },
                        color: Colors.white,
                        child: Text(
                          "0",
                          style: TextStyle(color: Colors.black, fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 86,
                        color: Colors.white,
                        child: Text(""),
                      ),
                      FlatButton(
                        height: 60,
                        onPressed: () {
                          setState(() {
                            operacao = "*";
                            txtNum1 = resultado;
                            resultado = "0";
                          });
                        },
                        color: Colors.blueAccent,
                        child: Text(
                          "x",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 60,
                        width: 86,
                        color: Colors.white,
                        child: Text(""),
                      ),
                      Container(
                        height: 60,
                        width: 86,
                        color: Colors.white,
                        child: Text(""),
                      ),
                      FlatButton(
                        height: 60,
                        onPressed: () {
                          setState(() {
                            numero1 = "";
                            txtNum1 = "";
                            txtNum2 = "";
                            numero2 = "";
                            resultado = "0";
                            operacao = "";
                          });
                        },
                        color: Colors.white,
                        child: Text(
                          "C",
                          style: TextStyle(color: Colors.green, fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      FlatButton(
                        height: 60,
                        onPressed: () {
                          setState(() {
                            txtNum2 = resultado;
                          });
                          calcular();
                        },
                        color: Colors.blueAccent,
                        child: Text(
                          "=",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
