// ignore_for_file: public_member_api_docs, sort_constructors_first
class ClientEntity {
  final String id;
  final String name;
  final String address;
  final String phone1;
  final String phone2;
  ClientEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.phone1,
    required this.phone2,
  });

  ClientEntity copyWith({
    String? id,
    String? name,
    String? address,
    String? phone1,
    String? phone2,
  }) {
    return ClientEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phone1: phone1 ?? this.phone1,
      phone2: phone2 ?? this.phone2,
    );
  }

  @override
  bool operator ==(covariant ClientEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.address == address &&
        other.phone1 == phone1 &&
        other.phone2 == phone2;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ address.hashCode ^ phone1.hashCode ^ phone2.hashCode;
  }
}
