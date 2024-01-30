import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'loading_list_model.dart';
export 'loading_list_model.dart';

class LoadingListWidget extends StatefulWidget {
  const LoadingListWidget({
    super.key,
    this.title,
    this.bodyText,
  });

  final String? title;
  final String? bodyText;

  @override
  State<LoadingListWidget> createState() => _LoadingListWidgetState();
}

class _LoadingListWidgetState extends State<LoadingListWidget> {
  late LoadingListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingListModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Lottie.asset(
            'assets/lottie_animations/mag_glass.json',
            width: 150.0,
            height: 130.0,
            fit: BoxFit.cover,
            frameRate: FrameRate(30.0),
            animate: true,
          ),
        ),
        Text(
          'No items on your list.',
          style: FlutterFlowTheme.of(context).headlineMedium,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
          child: Text(
            'It appears your shopping list is empty. Please select a recipe and add it to your list.',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).labelMedium,
          ),
        ),
      ],
    );
  }
}
