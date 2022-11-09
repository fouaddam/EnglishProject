

import 'package:englishproject/models/Model.dart';
import 'package:englishproject/services/Services.dart';
import 'package:flutter/material.dart';

import 'CustomViews/RFTextField.dart';

class FirstView extends StatefulWidget{
  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  RFTextFiled textFiled=RFTextFiled(title: 'text',);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            textFiled,
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {
                    if(textFiled.getText().isNotEmpty){
                      setState(() {

                      });
                    }


                  },
                  child: Text("aceptar"),
                ),
              ],
            ),
            const SizedBox(height: 200,),
            FutureBuilder(
                future: DiccionaryServices().getMeaning(textFiled.getText()),
                builder: (context, AsyncSnapshot<List<Diccionary>> snapshot){
                  print("Data $snapshot");
                  if(snapshot.hasData){
                    return Expanded(child:
                    ListView(
                        children: List.generate(snapshot.data!.length, (index) {

                          final data=snapshot.data![index];
                          return Container(
                            child: Column(
                              children: [
                                Container(
                                  child: ListTile(
                                    title: Text(data.word!),
                                    subtitle: Text(data.phonetics![index].text!),
                                    trailing: IconButton(onPressed: () {
                                      print(data.phonetics![index]);
                                      
                                    }, icon:const Icon(Icons.audiotrack) ,
                                      
                                    ),

                                  ),
                                ),

                              ],
                            ),
                          );
                        }

                        )
                    ),
                    );


                    print("yesss");
                  }else if(snapshot.hasError){
                    return Text(snapshot.hasError.toString()+"NOOOO");
                    print("Nooo");
                  }else{
                    return CircularProgressIndicator();
                  }

                  return Text("holaaa");
               }
            )

          ],
        ),

      ),
    );
  }
}