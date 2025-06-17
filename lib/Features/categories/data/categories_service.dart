import 'package:dio/dio.dart';

Future getCategories() async {
  Dio dio = Dio();
  try {
    Response response = await dio.get(
      'https://jsonplaceholder.typicode.com/posts',
    );
    if (response.statusCode == 200) {
      // print(response.data);
      return response.data;
    } else {
      print('error');
    }
  } catch (e) {
    print('exception');
  }
}