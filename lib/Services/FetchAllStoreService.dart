import 'dart:convert';
import 'dart:io';
import 'package:BNB_New_UI/Models/StoreDetailsModel.dart';
import 'package:BNB_New_UI/Utils/api_constant.dart';
import 'package:BNB_New_UI/Utils/global_var.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:string_ext/string_ext.dart';

Future<List<StoreDetailsModel>> fetchAllStores() async {
  try {
    String username = GlobalVar.adminUsername;
    String password = GlobalVar.adminPassword;
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    var url = Uri.parse("${ApiConstants.baseAdminUrl}/store/filter/find-all");
    final response = await http
        .get(url, headers: <String, String>{'authorization': basicAuth});
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      return jsonResponse.map((data) => StoreDetailsModel.fromJson(data)).toList();
    } else if (response.body.isNullOrEmpty) {
      throw Exception('No Stores');
    } else {
      throw Exception('Failed to fetch Stores');
    }
  } catch (e) {
    if (e is SocketException) {
      const Text("Something went Wrong");
      // const PlaceholderContainer(message: "Please try again later");
    }
    throw Exception("Please try again");
  }
}
