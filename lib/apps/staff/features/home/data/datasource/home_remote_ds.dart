import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:thapasya/apps/student/features/global/data/model/cource_model.dart';
import 'package:thapasya/apps/student/features/home/data/model/dashboard_model.dart';
import 'package:thapasya/core/api/dio_client.dart';
import 'package:thapasya/core/error/error_handler.dart';
import 'package:thapasya/core/error/exception.dart';

class HomeRemoteDs {
  final DioClient client;
  HomeRemoteDs(this.client);



  Future<DashboardModel> getDsh(int id) async {
    try {
      final response = await client.dio.get("/student/dashboard/$id");
      debugPrint("success ${response.headers.map}");
      return DashboardModel.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint("failed dio: ${e.response?.statusCode}");
      throw ErrorHandler.handlerData(e);
    } catch (e) {
      debugPrint("failed ${e.toString()}");
      throw ApiException(e.toString());
    }
  }
}
