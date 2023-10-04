// ignore_for_file: public_member_api_docs, sort_constructors_first
class SideBarState {
  int selectedItem;
  SideBarState({this.selectedItem = 0});
  static SideBarState initalState = SideBarState();

  SideBarState copyWith({
    int? selectedItem,
  }) {
    return SideBarState(
      selectedItem: selectedItem ?? this.selectedItem,
    );
  }
}
