// ignore_for_file: unused_import, avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Model/prodeuctapimodel.dart';

var base = "https://dummyjson.com";

getProduct() async {
  var response = await http.get(Uri.parse("$base/products"));

  try {
    if (response.statusCode == 200) {
      var data = myProductFromJson(response.body);
      return data.products;
    } else {
      return ("Error During Connection");
    }
  } catch (e) {
    print(e.toString());
  }
}
