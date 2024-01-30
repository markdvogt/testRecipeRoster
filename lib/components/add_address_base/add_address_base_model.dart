import '/flutter_flow/flutter_flow_util.dart';
import 'add_address_base_widget.dart' show AddAddressBaseWidget;
import 'package:flutter/material.dart';

class AddAddressBaseModel extends FlutterFlowModel<AddAddressBaseWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressController;
  String? Function(BuildContext, String?)? addressControllerValidator;
  // State field(s) for clonableURL widget.
  FocusNode? clonableURLFocusNode;
  TextEditingController? clonableURLController;
  String? Function(BuildContext, String?)? clonableURLControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;
  // State field(s) for state widget.
  FocusNode? stateFocusNode;
  TextEditingController? stateController;
  String? Function(BuildContext, String?)? stateControllerValidator;
  // State field(s) for zip widget.
  FocusNode? zipFocusNode;
  TextEditingController? zipController;
  String? Function(BuildContext, String?)? zipControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    addressFocusNode?.dispose();
    addressController?.dispose();

    clonableURLFocusNode?.dispose();
    clonableURLController?.dispose();

    cityFocusNode?.dispose();
    cityController?.dispose();

    stateFocusNode?.dispose();
    stateController?.dispose();

    zipFocusNode?.dispose();
    zipController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
