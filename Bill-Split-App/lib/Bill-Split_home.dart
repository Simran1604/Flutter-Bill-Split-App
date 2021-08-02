import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TipCalc extends StatefulWidget {
  @override
  _TipCalcState createState() => _TipCalcState();
}

class _TipCalcState extends State<TipCalc> {

  int tipPercentage=0;
  int persons=1;
  double billAmt=0.0;
  double tip=0;
  @override
  Widget build(BuildContext context) {
    tip=tipPercentage*billAmt/100.0;
    
    return Scaffold(
      body: Container(alignment: Alignment.center,
      margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.1),
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20.5),
        children:[
          Container(
            width:150,
            height:150,
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade100.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Total per person",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple
                    ),),
                  ),
                  Text("Rs ${bill()}",
                                    style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold
                                    ),),
                                ],),
                              ),
                            ),
                            Container(
                              
                              margin: EdgeInsets.all(20),
                              padding: EdgeInsets.all(10), 
                              decoration: BoxDecoration(
                                color:Colors.transparent,
                                border: Border.all(
                                  color:Colors.blueGrey.shade200,
                                  style: BorderStyle.solid
                                ),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              
                              child: Column(
                                
                                children:<Widget> [
                                  TextField(
                                    keyboardType: TextInputType.numberWithOptions(decimal:true),
                                    style: TextStyle(color: Colors.deepPurple),
                                    decoration: InputDecoration(
                                      prefixText: "Bill Amount: ",
                                      prefixIcon: Icon(Icons.money)                    
                                    ),
                                    onChanged: (String val){
                                      try {
                                      billAmt=double.parse(val);
                                    } catch (exception) {
                                      billAmt=0.0;
                                    }
                                    }
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:<Widget> [
                                        Text("Split",
                                        style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontSize: 18,
                                          ),
                                      ),
                                      Row(
                                      children:<Widget>[
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              if(persons>1)
                                              persons-=1;
                                               
                                            });
                                          },
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            color: Colors.deepPurple.shade100.withOpacity(0.5),
                                                     
                                          child:Center(
                                              child: Text("-",
                                              style: TextStyle(
                                                color:Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold
                                              ),),
                                            ),
                                          ),
                                         
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text("$persons",
                                          style: TextStyle(color: Colors.deepPurple,
                                          fontSize:17,
                                          fontWeight: FontWeight.bold
                                          ),),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            setState((){
                                              persons++;
                                            });
                                          },
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            color: Colors.deepPurple.shade100.withOpacity(0.5),
                                                     
                                          child:Center(
                                              child: Text("+",
                                              style: TextStyle(
                                                color:Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold
                                              ),),
                                            ),
                                          ),
                                             ),
                                           
                                    
                                      ]
                                       )
                                   ],),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:<Widget> [
                                        Text("Tip",
                                        style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontSize: 18,
                                          ),
                                      ),
                                      
                                         Padding(
                                           padding: const EdgeInsets.all(20.0),
                                           child: Text("Rs $tip",
                                        style:
                                        TextStyle(color: Colors.deepPurple,
                                              fontSize:17,
                                              fontWeight: FontWeight.bold
                                              ),
                                              ),
                                              
                                         ),
                                         
                                      
                                    ] 
                                   ),
                                   Column(
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.all(18.0),
                                               child: Text("$tipPercentage%",
                                               style:
                                        TextStyle(color: Colors.deepPurple,
                                                fontSize:17,
                                                fontWeight: FontWeight.bold
                                                ),
                                                ),
                                             ),
                                             Slider(
                                               min: 0,
                                               max: 100,
                                               divisions:20,
                                               activeColor: Colors.deepPurple,
                                               inactiveColor: Colors.deepPurple.shade200,
                                               value: tipPercentage.toDouble(), 
                                             onChanged:(double value){
                                               setState(() {
                                                 tipPercentage=value.round();
                                               });
                                             })
                                           ],
                                         ),
                                                                ],
                                                                ),
                                                              ),
                                                            ],
                                                            ),
                                                          ),   
                                                             
                                                        );
                                                        
                                                      }
                  
                    bill() {
                      if (billAmt<0 || billAmt.toString().isEmpty || billAmt==null)
                      {}                      
                      else 
                      {double d= (billAmt+tip)/persons;
                      return d.toStringAsFixed(2);
                      }
                    }
                                     
                                     
                                     
}//class end


