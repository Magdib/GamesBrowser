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

  Future<Either<StatusRequest, Map>> postData(
      String linkurl, Map<String, dynamic> data) async {
    Dio dio = Dio(options);

    final formData = FormData.fromMap(data);
    if (await checkinternet()) {
      try {
        log("SendingRequest<<");

        var response = await dio.post(linkurl, data: formData);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.data);
          print(responseBody);

          return Right(responseBody);
        } else {
          return left(StatusRequest.offlinefailure);
        }
      } catch (e) {
        return const Left(StatusRequest.offlinefailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
