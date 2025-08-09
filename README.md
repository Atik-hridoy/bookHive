# 📚 BookHive - Modern Library Management System


*A complete Flutter solution for digital library management*

## 🌟 Key Features
- **JWT Authentication** with secure storage
- **Book Catalog** with search/filter capabilities
- **Borrowing System** with due dates (14-day limit)
- **Admin Dashboard** for content management
- **User Profiles** with borrowing history
- **Material Design 3** with dark/light mode
- **API Rate Limiting** (Django backend)


## 🛠 Tech Stack
| Layer            | Technology                      |
|------------------|---------------------------------|
| **Framework**    | Flutter 3.13+                  |
| **State Mgmt**   | GetX 4.6.6                     |
| **HTTP Client**  | Dio 5.4.0                      |
| **Local Storage**| flutter_secure_storage 8.1.0    |
| **Theming**      | Material Design 3               |
| **CI/CD**        | GitHub Actions                  |

## 🚀 Quick Start

### Prerequisites
- Flutter SDK 3.13.0+
- Dart 3.1.0+
- Android Studio/Xcode
- Backend API (Django) running

### Installation
```bash
git clone https://github.com/yourusername/bookhive.git
cd bookhive
flutter pub get


mkdir -p lib/app/{bindings,constants,data/{local,remote},modules/{auth/{controller,model,view},books/{controller,model,view},borrow/{controller,model,view},profile/{controller,model,view},admin/{controller,model,view}},routes,theme,widgets} lib/core/{extensions,utils,values}

touch lib/main.dart lib/app/{bindings/app_bindings.dart,constants/{storage_keys.dart,api_routes.dart,app_constants.dart},data/local/local_storage_service.dart,data/remote/{api_service.dart,auth_repository.dart,book_repository.dart,borrow_repository.dart},modules/auth/{controller/auth_controller.dart,model/auth_model.dart,view/{login_page.dart,register_page.dart}},modules/books/{controller/book_controller.dart,model/book_model.dart,view/books_page.dart},modules/borrow/{controller/borrow_controller.dart,model/borrow_model.dart,view/borrow_page.dart},modules/profile/{controller/profile_controller.dart,model/profile_model.dart,view/profile_page.dart},modules/admin/{controller/admin_controller.dart,model/admin_model.dart,view/admin_dashboard.dart},routes/app_pages.dart,theme/app_theme.dart,widgets/{main_drawer.dart,book_card.dart,loading_indicator.dart,error_widget.dart}} lib/core/{extensions/string_extensions.dart,utils/date_utils.dart,values/dimens.dart}


