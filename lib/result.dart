import 'package:flutter/material.dart';
import 'package:untitled/homepage.dart';
class ResultPage extends StatefulWidget {

   double ibm ;
   String unitRec;
   ResultPage(this.ibm , this.unitRec);
  @override
  _ResultPageState createState() => _ResultPageState(ibm,unitRec);
}

class _ResultPageState extends State<ResultPage> {
  double  ibm ;
  String unitRec;
  _ResultPageState(this.ibm , this.unitRec);

  String getResult() {
    if (ibm >= 25) {
      return 'You need to Lose Some Weight';
    } else if (ibm > 18.5) {
      return 'Your weight is normal, keep it up';
    } else {
      return 'You need to gain some Weight';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context, MaterialPageRoute(builder: (context) => HomePage() ) );
            },
            child: Icon(Icons.keyboard_backspace_rounded)),
        actions: [
          Icon(Icons.notifications_none_rounded),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [

                Text(ibm.toStringAsFixed(2) , style: TextStyle(fontSize: 70),),
                Text("$unitRec" , textAlign: TextAlign.center , style: TextStyle(fontSize: 20, color: Color.fromRGBO(170,174,177, 1)),),
              ],
            ),
          ),

           
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Text(getResult()  ,style: TextStyle(color: Color.fromRGBO(6,196,108, 1)),),
          )



        ],
      ),
    );
  }
}
