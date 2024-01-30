import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'u_i_marker_model.dart';
export 'u_i_marker_model.dart';

class UIMarkerWidget extends StatefulWidget {
  const UIMarkerWidget({super.key});

  @override
  State<UIMarkerWidget> createState() => _UIMarkerWidgetState();
}

class _UIMarkerWidgetState extends State<UIMarkerWidget> {
  late UIMarkerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UIMarkerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container();
  }
}
