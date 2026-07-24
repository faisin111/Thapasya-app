import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:thapasya/apps/student/features/global/data/model/attendance_model.dart';
import 'package:thapasya/apps/student/features/global/data/model/cource_model.dart';
import 'package:thapasya/core/api/dio_client.dart';
import 'package:thapasya/core/error/error_handler.dart';
import 'package:thapasya/core/error/exception.dart';

class GlobalRemoteDs {
  final DioClient client;
  GlobalRemoteDs(this.client);

  Future<AttendanceModel> getAttendance(int id) async {
    try {
      final response = await client.dio.get("/student/attendance-history/$id");
      debugPrint("success ${response.headers.map}");
      return AttendanceModel.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint("failed dio: ${e.response?.statusCode}");
      throw ErrorHandler.handlerData(e);
    } catch (e) {
      debugPrint("failed ${e.toString()}");
      throw ApiException(e.toString());
    }
  }

   Future<List<CourceModel>> getCource() async {
    try {
      final response = await client.dio.get("/student/my-courses");
      debugPrint("success ${response.headers.map}");
      return (response.data as List)
          .map((e) => CourceModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      debugPrint("failed dio: ${e.response?.statusCode}");
      throw ErrorHandler.handlerData(e);
    } catch (e) {
      debugPrint("failed ${e.toString()}");
      throw ApiException(e.toString());
    }
  }
}
