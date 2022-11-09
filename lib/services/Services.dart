


import 'dart:convert';

import 'package:englishproject/models/Model.dart';
import 'package:englishproject/resources/Url.dat.dart';
import "package:http/http.dart" as http;
class DiccionaryServices {

    Future <List<Diccionary>> getMeaning(String? word) async{

       // final url="$URL/$word";


        try{
            String url="https://api.dictionaryapi.dev/api/v2/entries/en/${word!}";

            final req=await http.get(Uri.parse(url));
            print(req.statusCode);
            if(req.statusCode==200){

                final res=json.decode(req.body);
                print(res);
                print(req.body);
                final  diccionary=diccionaryFromJson(req.body);
                return diccionary;
            }else{
                print(req.body);
                final Error=json.decode(req.body);
                final  diccionary=diccionaryFromJson(req.body);
                return diccionary;
            }

        }catch(_){
            return Future.error("Some thik occured");
        }



    }


}