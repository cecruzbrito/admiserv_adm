// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../core/domain/entites/user_entity.dart';
import '../../../domain/entites/user_db_entity.dart';

class WidgetCardUser extends StatelessWidget {
  const WidgetCardUser({
    Key? key,
    required this.user,
    required this.onTapOnChangeUser,
  }) : super(key: key);
  final UserDBEntity user;
  final Function(bool? value, UserEntity user) onTapOnChangeUser;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(user.nome),
        trailing: Switch(value: user.hasEnabled, onChanged: (value) => onTapOnChangeUser(value, user)),
      ),
    );
  }
}
