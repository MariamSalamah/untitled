import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/result.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double weight = 50;
  double height = 165;
  int age = 20;
  bool selectedMale = false;
  bool selectedFemale = true;
 dynamic heightUnit ;
  dynamic weightUnit ;
  List<String> _weightUnits = ["kg","ibs"];
  List<String> _heightUnits = ["cm","in","m"];
  double ibm = 0;
  String unitReco = "";
  double endHeight=0;
  double endWeight=0;



  /*void calIbm (){
    if (heightUnit == "cm"){
     endHeight = height/100;
    }else{
      endHeight = height;
    }


    if (weightUnit == "kg" && (heightUnit == "cm" || heightUnit == "m" ) ){
      ibm = endWeight / (endHeight * endHeight);
      unitReco = "kg/m2";
    }else if(weightUnit == "ibs" && heightUnit == "in"  ) {
      ibm = 703 * endWeight / (endHeight * endHeight);
      unitReco = "in/ibs";
    }



  }

  just i want to try with myself :)


  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.filter_list),
        actions: [
          Icon(Icons.notifications_none_rounded),
        ],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text( "BMI Calculator", style: TextStyle(fontSize: 40),),
          Text( "Gender"),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          selectedMale = true;
                          selectedFemale= false;

                        });
                      },
                      child: Container(
                        width:MediaQuery.of(context).size.width/2.5,
                        height: MediaQuery.of(context).size.height/5,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(51,51,53,1),
                          border: Border.all(color: selectedMale? Color.fromRGBO(6,196,108,1) : Colors.transparent),
                        ),
                        child: Icon(Icons.male_rounded),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Icon(Icons.check_circle, color: selectedMale? Color.fromRGBO(6,196,108,1) : Color.fromRGBO(40,40,42,1)),),

                    Positioned(
                      right: 55,
                      bottom: 5,
                      child: Text("Male")
                    )],
                )
              ),


              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          selectedFemale = true;
                          selectedMale= false;

                        });
                      },
                      child: Container(
                        width:MediaQuery.of(context).size.width/2.5,
                        height: MediaQuery.of(context).size.height/5,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(51,51,53,1),
                          border: Border.all(color: selectedFemale? Color.fromRGBO(6,196,108,1) : Colors.transparent),
                        ),
                        child: Icon(Icons.female_rounded),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Icon(Icons.check_circle , color:selectedFemale? Color.fromRGBO(6,196,108,1) : Color.fromRGBO(40,40,42,1) ),),
                    Positioned(
                        right: 50,
                        bottom: 5,
                        child: Text("Female")
                    )
                  ],
                ),
              ),
            ],
          ),
          Text( "Weight"),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/2,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                   ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          weight--;
                        });
                      } ,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(51,51,53,1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.remove),
                      ),
                    ),

                      Text(weight.toInt().toString(),style: TextStyle(color: Colors.black),),
                    InkWell(
                      onTap: (){
                        setState(() {
                        weight++;
                      });
                        } ,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(51,51,53,1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.add),
                      ),
                    ),

                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: DropdownButton(
                  hint: Text('ibs' , style: TextStyle(fontSize: 13),), // Not necessary for Option 1
                  value: weightUnit ,
                  onChanged: (newValue) {
                    setState(() {
                      weightUnit = newValue;
                    });
                  },
                  items: _weightUnits.map((weight) {
                    return DropdownMenuItem(
                      child: new Text(weight),
                      value: weight,
                    );
                  }).toList(),
                ),
              ),


            ],
          ),
          Text( "Height"),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/2,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          height--;
                        });
                      } ,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(51,51,53,1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.remove),
                      ),
                    ),

                    Text(height.toInt().toString(),style: TextStyle(color: Colors.black),),
                    InkWell(
                      onTap: (){
                        setState(() {
                          height++;
                        });
                      } ,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(51,51,53,1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.add),
                      ),
                    ),

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: DropdownButton(
                  hint: Text('in' , style: TextStyle(fontSize: 13),), // Not necessary for Option 1
                  value: heightUnit ,
                  onChanged: (newValue) {
                    setState(() {
                     heightUnit = newValue;
                    });
                  },
                  items: _heightUnits.map((height) {
                    return DropdownMenuItem(
                      child: new Text(height),
                      value: height,
                    );
                  }).toList(),
                ),
              ),

            ],
          ),

          Text( "Age"),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/1.1,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          age--;
                        });
                      } ,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(51,51,53,1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.remove),
                      ),
                    ),

                    Text(age.toString(),style: TextStyle(color: Colors.black),),
                    InkWell(
                      onTap: (){
                        setState(() {
                          age++;
                            });
                      } ,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(51,51,53,1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.add),
                      ),
                    ),

                  ],
                ),
              ),


            ],
          ),

      InkWell(
        onTap: (){



          if (weightUnit == "kg" && heightUnit == "cm"){
            ibm = weight / pow(height / 100, 2);



            unitReco = "kg/m2";
          } else if (weightUnit == "kg" && heightUnit == "m"){
            ibm = weight / pow(height , 2);

            unitReco = "kg/m2";
          }


          else if(weightUnit == "ibs" && heightUnit == "in"  ) {
            ibm = 703 * weight / (height * height);

            unitReco = "in/ibs";
          }

          Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(ibm,unitReco) ) );
        },
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width-20,
            height: MediaQuery.of(context).size.height/15,
            decoration: BoxDecoration(
              color: Color.fromRGBO(6,196,108, 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text("Calculate"),
            ),

          ),
        ),
      ),


        ],

      ),

    );
  }
}
