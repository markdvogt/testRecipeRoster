import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'main_favorites_widget.dart' show MainFavoritesWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MainFavoritesModel extends FlutterFlowModel<MainFavoritesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  Completer<ProductsRecord>? documentRequestCompleter;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProductsRecord>?
      listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    for (var s in listViewStreamSubscriptions1) {
      s?.cancel();
    }
    listViewPagingController1?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForDocumentRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = documentRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<DocumentSnapshot?, ProductsRecord> setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, ProductsRecord>
      _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProductsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProductsRecordPage(
          queryBuilder: (_) => listViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }
}
