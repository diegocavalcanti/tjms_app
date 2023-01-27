import 'package:either_dart/either.dart';
import 'package:tjms_app/app/core/http_client/http_exception.dart';
import 'package:tjms_app/app/modules/search_pokemon/errors/errors.dart';

import '../../../core/error/error_personalizado.dart';
import '../../../core/http_client/http_client.dart';
import '../interfaces/user_mock_repository.dart';
import '../models/user_model.dart';

class UserMockRepositoryImp implements UserMockRepository {
  final HttpClient httpClient;

  UserMockRepositoryImp(this.httpClient);

  @override
  Future<Either<ErroPersonalizado, bool>> createUser(
      {required UserModel user}) async {
    try {
      final userJson = user.toMap();
      final result = await httpClient.post("/user", data: userJson);
      return const Right(true);
    } on HttpException catch (e) {
      return Left(ErroDesconhecido());
    }
  }

  @override
  Future<Either<ErroPersonalizado, List<UserModel>>> getUsers(
      {String id = ''}) async {
    try {
      var params = '';
      if (id.isNotEmpty) {
        params = '/$id';
      }
      final result = await httpClient.get("/user$params");
      final users = result.data as List;
      final usersModel = users.map((e) => UserModel.fromMap(e));

      return  Right(usersModel.toList());
    } on HttpException catch (e) {
      return Left(ErroDesconhecido());
    }
  }
}
