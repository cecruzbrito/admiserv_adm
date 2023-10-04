import '../../../../../core/domain/entites/service_entity.dart';

class ServiceCreateEditState {
  final bool hasMaintain;
  final bool? hasEnabled;
  ServiceEntity? service;
  ServiceCreateEditState({this.hasMaintain = true, this.service, this.hasEnabled});

  static ServiceCreateEditState initialState = ServiceCreateEditState(hasMaintain: true);

  ServiceCreateEditState copyWith({
    bool? hasMaintain,
    bool? hasEnabled,
    ServiceEntity? service,
  }) {
    return ServiceCreateEditState(
      hasMaintain: hasMaintain ?? this.hasMaintain,
      hasEnabled: hasEnabled ?? this.hasEnabled,
      service: service ?? this.service,
    );
  }
}
