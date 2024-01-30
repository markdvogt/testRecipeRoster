import '/backend/backend.dart';
import '/components/gradient_button/gradient_button_widget.dart';
import '/components/top_nav/top_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'product_details_widget.dart' show ProductDetailsWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductDetailsModel extends FlutterFlowModel<ProductDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for gradientButton component.
  late GradientButtonModel gradientButtonModel;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue1;
  FormFieldController<List<String>>? choiceChipsValueController1;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue2;
  FormFieldController<List<String>>? choiceChipsValueController2;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ReviewsRecord>? listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  // Model for topNav component.
  late TopNavModel topNavModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    gradientButtonModel = createModel(context, () => GradientButtonModel());
    topNavModel = createModel(context, () => TopNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    gradientButtonModel.dispose();
    for (var s in listViewStreamSubscriptions1) {
      s?.cancel();
    }
    listViewPagingController1?.dispose();

    topNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, ReviewsRecord> setListViewController1(
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

  PagingController<DocumentSnapshot?, ReviewsRecord> _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ReviewsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryReviewsRecordPage(
          queryBuilder: (_) => listViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }
}
