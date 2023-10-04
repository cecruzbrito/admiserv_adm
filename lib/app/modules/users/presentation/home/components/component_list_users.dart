// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:admiserv_adm/app/modules/users/domain/entites/user_db_entity.dart';

import '../../../../../core/domain/entites/user_entity.dart';
import '../widgets/widget_card_user.dart';

class ComponentListUsers extends StatelessWidget {
  const ComponentListUsers({super.key, required this.stts});
  final SttsListUsers stts;
  @override
  Widget build(BuildContext context) {
    if (stts.users == null) return Container();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Usuários", style: Theme.of(context).textTheme.headlineLarge),
          Text("Esses são os usuários vinculados a empresa, edite-os se desejar",
              style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 10),
          const Divider(),
          ...stts.users!.map((e) => WidgetCardUser(user: e, onTapOnChangeUser: stts.onTapOnChangeUser)).toList()
        ],
      ),
    );
  }
}

class SttsListUsers {
  final List<UserDBEntity>? users;
  final Function(bool? value, UserEntity user) onTapOnChangeUser;

  SttsListUsers({
    this.users,
    required this.onTapOnChangeUser,
  });
}
