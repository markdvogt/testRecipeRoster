import '/auth/firebase_auth/auth_util.dart';
import '/components/main_logo_small/main_logo_small_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'top_nav_model.dart';
export 'top_nav_model.dart';

class TopNavWidget extends StatefulWidget {
  const TopNavWidget({super.key});

  @override
  State<TopNavWidget> createState() => _TopNavWidgetState();
}

class _TopNavWidgetState extends State<TopNavWidget> {
  late TopNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopNavModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((Theme.of(context).brightness == Brightness.dark) == true) {}
    });

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: wrapWithModel(
                  model: _model.mainLogoSmallModel,
                  updateCallback: () => setState(() {}),
                  child: const MainLogoSmallWidget(),
                ),
              ),
              if ((currentUserReference != null) &&
                  responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        'mainHomePage',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    text: 'Favorites',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle: FlutterFlowTheme.of(context).bodyLarge,
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              if ((currentUserReference != null) &&
                  responsiveVisibility(
                    context: context,
                    phone: false,
                  ))
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Text(
                                  valueOrDefault<String>(
                                    currentUserDisplayName,
                                    'Rafael Rudolph',
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyLarge,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 4.0, 0.0, 0.0),
                              child: Text(
                                currentUserEmail,
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              if (currentUserReference == null)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        'loginPage',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.bottomToTop,
                            duration: Duration(milliseconds: 220),
                          ),
                        },
                      );
                    },
                    text: 'Login',
                    options: FFButtonOptions(
                      height: 44.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context).titleSmall,
                      elevation: 2.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                      hoverColor: FlutterFlowTheme.of(context).accent1,
                      hoverBorderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      hoverTextColor: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
