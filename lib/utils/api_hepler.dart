import 'dart:convert';

import 'package:exam_round2/screen/home/modal/home_modal.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<List<Result>?> Data() async {
    String link="https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple";
    Uri uri = Uri.parse(link);
   var json =await  http.get(uri);
   var responce =quizFromJson(json.body);
   print(json.body);
   return responce.results;
  }
}
