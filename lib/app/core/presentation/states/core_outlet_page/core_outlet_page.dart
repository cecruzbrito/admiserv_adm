import 'package:admiserv_adm/app/core/presentation/states/core_scaffold/core_scaffold_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/exceptions/failure_app.dart';
import '../../widgets/snackbars/core_snake_bar_error.dart';

abstract class CoreOutletPage<T extends StatefulWidget> extends CoreState<T> {
  CoreOutletPage({required super.title});

  final CoreScaffoldStore _store = Modular.get();

  @override
  void setLoading(bool value) => _store.setLoading(value);

  @override
  void initState() {
    super.initState();
    _store.observer(
        onError: (dynamic e) => ScaffoldMessenger.of(context)
            .showSnackBar(CoreSnackBarError(message: (e as FailureApp).message).show(context)));
  }

  Scaffold? configScaffold() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: title,
        color: Colors.black,
        child: TripleBuilder<CoreScaffoldStore, CoreScaffoldState>(
            store: _store,
            builder: (_, trp) => Scaffold(
                floatingActionButton: configScaffold() != null ? configScaffold()!.floatingActionButton : null,
                backgroundColor: colorScheme.surface,
                body: (trp.isLoading ? const Center(child: CircularProgressIndicator()) : body(context)))));
  }
}
