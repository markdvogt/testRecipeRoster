import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'product_list_view_model.dart';
export 'product_list_view_model.dart';

class ProductListViewWidget extends StatefulWidget {
  const ProductListViewWidget({
    super.key,
    required this.productRef,
    required this.favorited,
  });

  final ProductsRecord? productRef;
  final bool? favorited;

  @override
  State<ProductListViewWidget> createState() => _ProductListViewWidgetState();
}

class _ProductListViewWidgetState extends State<ProductListViewWidget>
    with TickerProviderStateMixin {
  late ProductListViewModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductListViewModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            'productDetails',
            queryParameters: {
              'productRef': serializeParam(
                widget.productRef,
                ParamType.Document,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              'productRef': widget.productRef,
            },
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 2.0,
                color: Color(0x520E151B),
                offset: Offset(0.0, 1.0),
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(
                        tag: widget.productRef!.photoUrl,
                        transitionOnUserGestures: true,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 500),
                            fadeOutDuration: const Duration(milliseconds: 500),
                            imageUrl: widget.productRef!.photoUrl,
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 8.0, 12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: Text(
                                  widget.productRef!.name,
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.productRef?.category,
                                    'category',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: ToggleIcon(
                        onPressed: () async {
                          setState(() => _model.favorited = !_model.favorited!);
                        },
                        value: _model.favorited!,
                        onIcon: Icon(
                          Icons.favorite_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 25.0,
                        ),
                        offIcon: Icon(
                          Icons.favorite_border,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 25.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (responsiveVisibility(
                context: context,
                tabletLandscape: false,
                desktop: false,
              ))
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 8.0, 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 4.0),
                          child: Text(
                            widget.productRef!.name,
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Text(
                            widget.productRef!.description,
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
