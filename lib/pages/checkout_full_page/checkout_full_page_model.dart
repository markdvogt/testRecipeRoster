import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_address_base/add_address_base_widget.dart';
import '/components/gradient_button/gradient_button_widget.dart';
import '/components/top_nav/top_nav_widget.dart';
import '/components/u_i_marker/u_i_marker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'checkout_full_page_widget.dart' show CheckoutFullPageWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CheckoutFullPageModel extends FlutterFlowModel<CheckoutFullPageWidget> {
  ///  Local state fields for this page.

  int stepNumber = 1;

  AddressStruct? address;
  void updateAddressStruct(Function(AddressStruct) updateFn) =>
      updateFn(address ??= AddressStruct());

  ShippingOptionsStruct? shippingOption;
  void updateShippingOptionStruct(Function(ShippingOptionsStruct) updateFn) =>
      updateFn(shippingOption ??= ShippingOptionsStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for topNav component.
  late TopNavModel topNavModel;
  // Model for gradientButton component.
  late GradientButtonModel gradientButtonModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // Model for addAddress_Base component.
  late AddAddressBaseModel addAddressBaseModel;
  // Model for UI_Marker component.
  late UIMarkerModel uIMarkerModel1;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // Model for UI_Marker component.
  late UIMarkerModel uIMarkerModel2;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

  // Model for UI_Marker component.
  late UIMarkerModel uIMarkerModel3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    topNavModel = createModel(context, () => TopNavModel());
    gradientButtonModel = createModel(context, () => GradientButtonModel());
    addAddressBaseModel = createModel(context, () => AddAddressBaseModel());
    uIMarkerModel1 = createModel(context, () => UIMarkerModel());
    uIMarkerModel2 = createModel(context, () => UIMarkerModel());
    uIMarkerModel3 = createModel(context, () => UIMarkerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    topNavModel.dispose();
    gradientButtonModel.dispose();
    expandableController1.dispose();
    addAddressBaseModel.dispose();
    uIMarkerModel1.dispose();
    expandableController2.dispose();
    uIMarkerModel2.dispose();
    expandableController3.dispose();
    uIMarkerModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
