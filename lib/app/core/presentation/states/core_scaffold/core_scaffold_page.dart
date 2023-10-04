// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admiserv_adm/app/core/domain/exceptions/failure_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../widgets/snackbars/core_snack_bar_success.dart';
import '../../widgets/snackbars/core_snake_bar_error.dart';

abstract class CoreState<T extends StatefulWidget> extends State<T> {
  final String title;
  CoreState({required this.title});

  ColorScheme get colorScheme => Theme.of(context).colorScheme;

  final CoreScaffoldStore _store = Modular.get();

  void setLoading(bool value) => _store.setLoading(value);

  void setError(dynamic failure) => _store.setError(failure, force: true);

  void setSucess(String msg) => ScaffoldMessenger.of(context).showSnackBar(CoreSnackBarSuccess(message: msg).show());

  Future<Y?> showDialogApp<Y>(AlertDialog alertDialog) async =>
      await showDialog<Y>(context: context, builder: (_) => alertDialog);

  Widget body(BuildContext context);
  @override
  void initState() {
    super.initState();
    _store.observer(
        onError: (dynamic e) => ScaffoldMessenger.of(context)
            .showSnackBar(CoreSnackBarError(message: (e as FailureApp).message).show(context)));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: title,
        color: Colors.black,
        child: Scaffold(
          body: TripleBuilder<CoreScaffoldStore, CoreScaffoldState>(
              store: _store,
              builder: (_, trp) => trp.isLoading ? const Center(child: CircularProgressIndicator()) : body(context)),
        ));
  }
}

class CoreScaffoldState {
  final bool hasLoading;
  CoreScaffoldState({
    this.hasLoading = false,
  });
  static CoreScaffoldState initialState = CoreScaffoldState();

  CoreScaffoldState copyWith({
    bool? hasLoading,
  }) {
    return CoreScaffoldState(hasLoading: hasLoading ?? this.hasLoading);
  }
}

class CoreScaffoldStore extends Store<CoreScaffoldState> {
  CoreScaffoldStore() : super(CoreScaffoldState.initialState);
}
