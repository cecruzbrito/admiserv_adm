// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModificationsEntity {
  final String id;
  final DateTime date;
  final String idUser;
  final List<String> fieldsModificated;
  ModificationsEntity({
    required this.id,
    required this.date,
    required this.idUser,
    required this.fieldsModificated,
  });
}
