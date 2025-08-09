import 'package:book_hive/app/constants/app_constants.dart';
import 'package:book_hive/app/constants/storage_keys.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:book_hive/app/constants/api_routes.dart';
import 'package:book_hive/app/data/local/local_storage_service.dart';

class ApiService extends GetxService {
  final LocalStorageService storage = Get.find();
  late final Dio _dio;

  @override
  void onInit() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiRoutes.baseUrl,
      connectTimeout: const Duration(seconds: AppConstants.apiTimeoutSeconds),
    ));
    
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await storage.readSecure(StorageKeys.authToken);
        if (token != null) {
          options.headers['Authorization'] = 'Bearer \$token';
        }
        return handler.next(options);
      },
    ));
    super.onInit();
  }

  Future<Response> get(String path) async {
    return await _dio.get(path);
  }

  Future<Response> post(String path, dynamic data) async {
    return await _dio.post(path, data: data);
  }
}