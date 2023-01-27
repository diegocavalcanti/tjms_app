import 'package:either_dart/either.dart';
import 'package:tjms_app/app/modules/user/models/user_model.dart';

import '../../../core/error/error_personalizado.dart';

abstract class UserMockRepository {
  const UserMockRepository();

  Future<Either<ErroPersonalizado, List<UserModel>>> getUsers({String id = ''});
  Future<Either<ErroPersonalizado, bool>> createUser({required UserModel user});
}
