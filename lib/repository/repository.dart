import 'dart:io';

import 'package:dio/dio.dart';
import 'package:semper/constants/globals.dart';
import 'package:semper/models/post.dart';
import '../service/api_service.dart';

class Repository {
  Repository();

  ApiService apiService = ApiService(Dio(BaseOptions(
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
      contentType: 'application/json',
      baseUrl: baseUrl,
      headers: {'Authorization': token} as Map<String, dynamic>?)));

  Future<List<Post>> getPost() async {
    return await apiService.getPost();
  }
}
