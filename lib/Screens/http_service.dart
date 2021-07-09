import 'package:dio/dio.dart';

class HttpService {
  Dio _dio;

  final baseUrl = "https://jsonplaceholder.typicode.com/";
  HttpService(){

    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      // headers:
    ));
    initializeInteceptors();
  }

  Future<Response> getRequest(String endpoint) async{
    Response response;
    try{
      response = await _dio.get(endpoint);
    }on DioError catch(e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  initializeInteceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error){
        print(error.message);
      },
      onRequest: (request){
        print("${request.method} ${request.path}");
      },
      onResponse: (response){
        print(response.data);
      }
    ));
  }
}