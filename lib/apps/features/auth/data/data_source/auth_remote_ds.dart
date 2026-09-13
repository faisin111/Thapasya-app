import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:thapasya/apps/features/auth/data/models/user_model.dart';

import 'package:thapasya/core/api/api_endpoints.dart';
import 'package:thapasya/core/api/dio_client.dart';
import 'package:thapasya/core/error/error_handler.dart';
import 'package:thapasya/core/error/exception.dart';

class AuthRemoteDs {
  final DioClient client;
  AuthRemoteDs(this.client);

  Future<String> loginPost(UserModel model) async {
    debugPrint("$model...${model.password}");
    try {
      final response = await client.dio.post(
        ApiEndpoints.login,
        data: model.toMap(),
      );
      debugPrint("success ${response.headers.map}");
      return response.data["role"];
    } on DioException catch (e) {
      debugPrint("failed dio: ${e.response?.statusCode}");
      throw ErrorHandler.handlerAuth(e);
    } catch (e) {
      debugPrint("failed ${e.toString()}");
      throw ApiException(e.toString());
    }
  }
}
