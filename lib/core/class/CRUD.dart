import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';

import "package:dio/dio.dart";

import '../function/checkInternet.dart';
import 'enums.dart';

class CRUD {
  final BaseOptions options = BaseOptions(
    baseUrl: 'https://mgamesbrowser.000webhostapp.com/',
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
  );

  Future<Either<StatusRequest, Map>> getData(String linkurl) async {
    Dio dio = Dio(options);
    if (await checkinternet()) {
      try {
        log("SendingRequest<<");
        var response = await dio.get(linkurl);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.data);
          print(responseBody);

          return Right(responseBody);
        } else {
          return left(StatusRequest.serverfailure);
        }
      } catch (e) {
        print(e);
        return const Left(StatusRequest.offlinefailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  // Future<Either<StatusRequest, Map>> postDataWithFiles(
  //     String linkurl, Map data, File file) async {
  //   if (await checkinternet()) {
  //     var request = http.MultipartRequest("POST", Uri.parse(linkurl));
  //     var length = await file.length();
  //     var stream = http.ByteStream(file.openRead());
  //     var multipartFile = http.MultipartFile("image", stream, length,
  //         filename: basename(file.path));
  //     request.files.add(multipartFile);
  //     data.forEach((key, value) {
  //       request.fields[key] = value;
  //     });
  //     log("Sending //File// Request<<");
  //     var dataRequest = await request.send();
  //     log("SendingRequest<<");
  //     var response = await http.Response.fromStream(dataRequest);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       Map responseBody = jsonDecode(response.body);
  //       print(responseBody);
  //       return Right(responseBody);
  //     } else {
  //       return left(StatusRequest.serverfailure);
  //     }
  //   } else {
  //     return const Left(StatusRequest.offlinefailure);
  //   }
  // }
}
