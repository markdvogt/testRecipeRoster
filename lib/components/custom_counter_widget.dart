import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_counter_model.dart';
export 'custom_counter_model.dart';

class CustomCounterWidget extends StatefulWidget {
  const CustomCounterWidget({super.key});

  @override
  State<CustomCounterWidget> createState() => _CustomCounterWidgetState();
}

class _CustomCounterWidgetState extends State<CustomCounterWidget> {
  late CustomCounterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomCounterModel());

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
          child: FlutterFlowIconButton(
            buttonSize: 40.0,
            icon: Icon(
              Icons.remove_rounded,
              color: FlutterFlowTheme.of(context).primary,
              size: 20.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
          child: Text(
            '1',
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
          child: FlutterFlowIconButton(
            buttonSize: 40.0,
            icon: Icon(
              Icons.add_rounded,
              color: FlutterFlowTheme.of(context).primary,
              size: 20.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
        ),
      ],
    );
  }
}
