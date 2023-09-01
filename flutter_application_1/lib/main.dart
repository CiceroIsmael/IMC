import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Imc(),
  ));
}

class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String infor ="Informe seus dados!";
  void reset(){
    pesoController.text ="";
    alturaController.text = "";
    infor ="Informe seus dados!";
  }

  void Calcular(){
    setState(() {
      double peso = double.parse(pesoController.text);
      double Altura = double.parse(pesoController.text)/100;
      double imc = peso/(Altura*Altura);
      // print imc
      if(imc<18.5){
        infor ="Abaixo do peso(${imc.toStringAsPrecision(3)})";
        
      }
      else if (imc>=18.5 && imc <=24.5){
          infor =" peso normal(${imc.toStringAsPrecision(3)})";
        }
        else if (imc>=25 && imc <=29.5){
          infor =" sobrepeso(${imc.toStringAsPrecision(3)})";
        }
          else if (imc>=30 && imc <=34.9){
          infor =" obesidade grau 1(${imc.toStringAsPrecision(3)})";
        }
        else {
          infor =" obesidade grau 2(${imc.toStringAsPrecision(3)})";
        }
        
    });
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          IconButton(onPressed: reset, icon: Icon(Icons.refresh))
        ],
      ),
      body:Container(
        padding: EdgeInsets.all(40),
        child:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.person_outline, size:120, color:Colors.green ,),
           TextField(keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Peso (kg)",
            labelStyle: TextStyle(color:Colors.green)
          ),
          textAlign:TextAlign.center,
          style: TextStyle(color: Colors.green, fontSize: 25),
          controller: pesoController,
          ),


         TextField(keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Altura (Cm)",
            labelStyle: TextStyle(color:Colors.green)
          ),
          textAlign:TextAlign.center,
          style: TextStyle(color: Colors.green, fontSize: 25),
          controller: alturaController,
          ),

          ElevatedButton(onPressed: Calcular,
           child: Text('Calcular'),
           style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            textStyle: const TextStyle(color: Colors.white, fontSize: 25)
           )
           ),
            Text(infor,
           textAlign: TextAlign.center,
           style: TextStyle(color: Colors.green, fontSize: 25),
           )
        ],
      ),
      )
    );
  }
}




