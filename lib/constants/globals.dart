library globals;

import 'package:get_storage/get_storage.dart';
import 'package:semper/models/post.dart';

String baseUrl = 'https://aungkoman.github.io/api-testing/';

final storage = GetStorage();
late Post post;
String token = '';

late bool isDarkTheme;
