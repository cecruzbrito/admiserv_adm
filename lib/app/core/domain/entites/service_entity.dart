// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServiceEntity {
  final String id;
  final String desc;
  final int? daysToMaintenance;
  final bool hasEnabled;
  final DateTime dateCreated;

  ServiceEntity({
    required this.id,
    required this.desc,
    required this.daysToMaintenance,
    required this.hasEnabled,
    required this.dateCreated,
  });

  ServiceEntity makeCopy({required String desc, int? daysToMaintenance, required bool hasEnabled}) => ServiceEntity(
      id: id,
      desc: desc,
      daysToMaintenance: daysToMaintenance ?? this.daysToMaintenance,
      hasEnabled: hasEnabled,
      dateCreated: dateCreated);

  @override
  bool operator ==(covariant ServiceEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.desc == desc &&
        other.daysToMaintenance == daysToMaintenance &&
        other.hasEnabled == hasEnabled &&
        other.dateCreated == dateCreated;
  }

  @override
  int get hashCode {
    return id.hashCode ^ desc.hashCode ^ daysToMaintenance.hashCode ^ hasEnabled.hashCode ^ dateCreated.hashCode;
  }
}
