import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tjms_app/app/modules/user/interfaces/user_mock_repository.dart';
import 'package:tjms_app/app/modules/user/models/user_model.dart';

class CreateUsersPage extends StatefulWidget {
  const CreateUsersPage({super.key});

  @override
  State<CreateUsersPage> createState() => _CreateUsersPageState();
}

class _CreateUsersPageState extends State<CreateUsersPage> {
  //instaciar o repo
  final UserMockRepository repository = Modular.get();

  var userList = <UserModel>[];
  bool isLoading = false;
  String error = '';
  String firstName = '';
  String lastName = '';
  String jobTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator.adaptive()
            : Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextField(
                      onChanged: (value) {
                        firstName = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Digite seu primeiro Nome",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      onChanged: (value) {
                        lastName = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Digite seu último Nome",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      onChanged: (value) {
                        jobTitle = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Digite sua função ",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        //criar modelo e chamar repositorio
                        final UserModel user = UserModel(
                            id: '',
                            firstName: firstName,
                            lastName: lastName,
                            jobTitle: jobTitle);

                        setState(() {
                          isLoading = true;
                        });
                        repository.createUser(user: user).catchError((error) {
                          this.error = error;
                        }).whenComplete(() {
                          setState(() {
                            isLoading = false;
                          });
                        });
                      },
                      child: const Text("Criar Usuario"),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
