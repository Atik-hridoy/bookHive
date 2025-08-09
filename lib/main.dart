import 'package:book_hive/app/bindings/app_bindings.dart';
import 'package:book_hive/app/constants/appTheme.dart';
import 'package:book_hive/app/data/local/local_storage_service.dart';
import 'package:book_hive/app/routes/app_pages.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      
      try {
        // Initialize LocalStorageService
        final localStorage = LocalStorageService();
        await Get.putAsync<LocalStorageService>(() => localStorage.init());
        
        runApp(
          GetMaterialApp(
            title: 'BookHive',
            initialBinding: AppBindings(),
            initialRoute: AppPages.initial,
            getPages: AppPages.routes,
            theme: AppTheme.lightTheme(AppTheme.lightColorScheme),
            darkTheme: AppTheme.darkTheme(AppTheme.darkColorScheme),
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
          ),
        );
      } catch (e, stackTrace) {
        debugPrint('Error during app initialization: $e');
        debugPrint('Stack trace: $stackTrace');
        
        // Fallback UI for initialization errors
        runApp(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Initialization Error',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text('Error: ${e.toString()}'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => main(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    },
    (error, stackTrace) {
      debugPrint('Uncaught error: $error');
      debugPrint('Stack trace: $stackTrace');
    },
  );
}