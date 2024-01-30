import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'emtpy_state_model.dart';
export 'emtpy_state_model.dart';

class EmtpyStateWidget extends StatefulWidget {
  const EmtpyStateWidget({
    super.key,
    this.title,
    this.bodyText,
    this.icon,
  });

  final String? title;
  final String? bodyText;
  final Widget? icon;

  @override
  State<EmtpyStateWidget> createState() => _EmtpyStateWidgetState();
}

class _EmtpyStateWidgetState extends State<EmtpyStateWidget> {
  late EmtpyStateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmtpyStateModel());

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

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
            child: widget.icon!,
          ),
          Text(
            widget.title!,
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
            child: Text(
              widget.bodyText!,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
