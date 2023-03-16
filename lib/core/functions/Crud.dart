import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dashbord/core/constant/statusRequest.dart';
import 'package:dashbord/core/functions/checkInternet.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUri, Map map) async {
    try {
      if (await checkInternet()) {
        ///سحب البياناات من الداتا 
        var res = await http.post(Uri.parse(linkUri), body: map);
        if (res.statusCode == 200 || res.statusCode == 201) {
          var resBody = jsonDecode(res.body);
          return Right(resBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offline);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
}
