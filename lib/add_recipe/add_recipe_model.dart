import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_recipe_widget.dart' show AddRecipeWidget;
import 'package:flutter/material.dart';

class AddRecipeModel extends FlutterFlowModel<AddRecipeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues1;
  FormFieldController<List<String>>? checkboxGroupValueController1;
  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues2;
  FormFieldController<List<String>>? checkboxGroupValueController2;
  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues3;
  FormFieldController<List<String>>? checkboxGroupValueController3;
  // State field(s) for CountController widget.
  int? countControllerValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
