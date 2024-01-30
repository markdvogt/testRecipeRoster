import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_counter2_model.dart';
export 'custom_counter2_model.dart';

class CustomCounter2Widget extends StatefulWidget {
  const CustomCounter2Widget({super.key});

  @override
  State<CustomCounter2Widget> createState() => _CustomCounter2WidgetState();
}

class _CustomCounter2WidgetState extends State<CustomCounter2Widget> {
  late CustomCounter2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomCounter2Model());

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
      child: Container(
        width: 100.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).tertiary,
          borderRadius: BorderRadius.circular(25.0),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 2.0,
          ),
        ),
        child: FlutterFlowCountController(
          decrementIconBuilder: (enabled) => FaIcon(
            FontAwesomeIcons.minus,
            color: enabled
                ? FlutterFlowTheme.of(context).error
                : FlutterFlowTheme.of(context).error,
            size: 10.0,
          ),
          incrementIconBuilder: (enabled) => FaIcon(
            FontAwesomeIcons.plus,
            color: enabled
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).error,
            size: 10.0,
          ),
          countBuilder: (count) => Text(
            count.toString(),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context).secondary,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
          count: _model.countControllerValue ??= 1,
          updateCount: (count) =>
              setState(() => _model.countControllerValue = count),
          stepSize: 1,
          minimum: 1,
          contentPadding: const EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
