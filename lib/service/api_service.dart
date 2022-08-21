import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:semper/models/post.dart';
part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('data.json')
  Future<List<Post>> getPost();
}
