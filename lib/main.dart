import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  var wtController = TextEditingController();
  var cmController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgcolor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade400 ,
      ),
      body: Container(
        color : bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    labelText: 'Enter Weight (Kg)',
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: cmController,
                  decoration: InputDecoration(
                    labelText: 'Enter Height (feet)',
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    labelText: 'Enter Height (inch)',
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 18,),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = cmController.text.toString();
                    var inch = inController.text.toString();

                    if (wt != "" && ft != "" && inch != "") {
                      var Wt = double.parse(wt);
                      var Ft = double.parse(ft);
                      var Inch = double.parse(inch);

                      var tInch = (Ft * 12) + Inch;
                      var tM = tInch * 0.0254;
                      var BMI = Wt / (tM * tM);
                      var cmt = "";

                      if (BMI > 25) {
                        cmt = "You're OVERWEIGHT!!!";
                        bgcolor = Colors.red.shade300;
                      }

                      else if (BMI < 18) {
                        cmt = "You're UNDERWEIGHT!!!";
                        bgcolor = Colors.orangeAccent;
                      }
                      else {
                        cmt = "You're HEALTHY!!!";
                        bgcolor = Colors.green.shade300;
                      }
                      result = "$cmt \n Your BMI is: ${BMI.toStringAsFixed(2)}";

                      setState(() {});
                    }else {
                      setState(() {
                        result = "Please fill all the required data!";
                      });
                    }
                  },
                  child: Text('Calculate'),
                ),
                Text(result, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


