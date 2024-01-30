import '/components/main_logo_small/main_logo_small_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'top_nav_widget.dart' show TopNavWidget;
import 'package:flutter/material.dart';

class TopNavModel extends FlutterFlowModel<TopNavWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for mainLogoSmall component.
  late MainLogoSmallModel mainLogoSmallModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mainLogoSmallModel = createModel(context, () => MainLogoSmallModel());
  }

  @override
  void dispose() {
    mainLogoSmallModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
