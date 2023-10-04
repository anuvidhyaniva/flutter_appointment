import 'dart:convert';
import 'dart:developer';


import 'package:http/http.dart' as http;
class ApiService {

Future<String> get({
    required String apiEndpoint
    
  }) async {
    String decodedJson = "";
   
  http.Response resp;
     final uri = Uri(
      host: "my-json-server.typicode.com",
       
        path: apiEndpoint,
        scheme: "https",
      );

    
      try {
        resp = await http
            .get(
          uri,
          headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          
        }
,
          
        );
  decodedJson = json.decode(json.encode(resp.body));
 

      } catch (e) {
        log(e.toString());
      }

     
log(decodedJson.toString());
    return decodedJson;
  }}