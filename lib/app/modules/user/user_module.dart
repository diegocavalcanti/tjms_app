import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tjms_app/app/core/http_client/http_client.dart';
import 'package:tjms_app/app/modules/user/pages/create_users_page.dart';
import 'package:tjms_app/app/modules/user/pages/get_users_page.dart';
import 'package:tjms_app/app/modules/user/pages/users_page.dart';
import 'package:tjms_app/app/modules/user/repositories/user_mock_repository.dart';
import 'package:uno/uno.dart';

import '../../core/services/http_client_dio_imp.dart';

class UserModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => UserMockRepositoryImp(i())),
        Bind.lazySingleton<HttpClient>((i) => HttpClientDioImp(i())),
        Bind.lazySingleton((i) => Dio(BaseOptions(
            baseUrl: 'https://63d3c5a4a93a149755b25aa3.mockapi.io'))),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const UsersPage()),
        ChildRoute('/get', child: (context, args) => const GetUsersPage()),
        ChildRoute('/create',
            child: (context, args) => const CreateUsersPage()),
      ];
}
