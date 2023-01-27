import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tjms_app/app/modules/user/interfaces/user_mock_repository.dart';
import 'package:tjms_app/app/modules/user/models/user_model.dart';

class GetUsersPage extends StatefulWidget {
  const GetUsersPage({super.key});

  @override
  State<GetUsersPage> createState() => _GetUsersPageState();
}

class _GetUsersPageState extends State<GetUsersPage> {
  //instaciar o repo
  final UserMockRepository repository = Modular.get();

  var userList = <UserModel>[];
  bool isLoading = true;
  String error = '';
  @override
  void initState() {
    //obter o dados
    repository.getUsers().then((either) {
      setState(() {
        isLoading = false;
        either.fold(
            (left) => error = left.message, (right) => userList = right);
      });
      if (error.isNotEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error)));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: isLoading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  final user = userList[index];
                  return ListTile(
                    title: Text("${user.firstName} ${user.lastName}"),
                    subtitle: Text(user.jobTitle),
                  );
                },
              ));
  }
}
