import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:thapasya/apps/student/features/profile/data/model/user_model.dart';
import 'package:thapasya/core/api/api_endpoints.dart';
import 'package:thapasya/core/api/dio_client.dart';
import 'package:thapasya/core/error/error_handler.dart';
import 'package:thapasya/core/error/exception.dart';

class ProfileRemoteDs {
  final DioClient client;
  ProfileRemoteDs(this.client);

  Future<ProfileModel> getProfile() async {
    try {
      final response = await client.dio.get(ApiEndpoints.profile);

      return ProfileModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      debugPrint("failed dio: ${e.response?.statusCode}");
      throw ErrorHandler.handlerData(e);
    } catch (e) {
      debugPrint("failed ${e.toString()}");
      throw ApiException(e.toString());
    }
  }

  Future<String> logout() async {
    try {
      final response = await client.dio.post(ApiEndpoints.logout);

      return response.data["message"];
    } on DioException catch (e) {
      debugPrint("failed dio: ${e.response?.statusCode}");
      throw ErrorHandler.handlerData(e);
    } catch (e) {
      debugPrint("failed ${e.toString()}");
      throw ApiException(e.toString());
    }
  }
}
