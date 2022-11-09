

import 'package:audioplayers/audioplayers.dart';
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
  late AudioPlayer  audioPlayer=AudioPlayer();



  Future<void> playerAudio(String url) async {
    audioPlayer.stop();
    audioPlayer.setSourceUrl(url);


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {


    });
  }




  
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
                  child: const Text("aceptar"),
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

                          return Column(
                            children: [
                              ListTile(
                                title: Text(data.word!),
                                subtitle: const Text("Prnonciation : "),
                                trailing: IconButton(
                                  onPressed: () {
                                    String path=data.phonetics![index].audio!;
                                    String path2=path.substring(2,path.length);
                                    playerAudio(path);
                                    print(path.toString());



                                }, icon:const Icon(Icons.audiotrack) ,

                                ),

                              ),
                              ListTile(
                                title: const Text("Definition :"),
                                subtitle: Text(data.meanings![index].definitions![index].definition!),
                              ),
                              ListTile(
                                title: const Text("Example  :"),
                                subtitle: Text(data.meanings![index].definitions![index].example!),
                              ),


                            ],
                          );
                        }

                        )
                    ),
                    );


                    print("yesss");
                  }
                  else if(snapshot.hasError){
                    return Text(snapshot.hasError.toString()+"NOOOO");
                    print("Nooo");
                  }
                  else{
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