import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/emtpy_state/emtpy_state_widget.dart';
import '/components/gradient_button/gradient_button_widget.dart';
import '/components/top_nav/top_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'product_details_model.dart';
export 'product_details_model.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({
    super.key,
    this.productRef,
  });

  final ProductsRecord? productRef;

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget>
    with TickerProviderStateMixin {
  late ProductDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
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
          begin: const Offset(0.0, -70.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
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
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
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
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 100.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 250.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.productRef?.userRef != currentUserReference) {
        await ActivityRecord.collection.doc().set({
          ...createActivityRecordData(
            title: 'New viewed item!',
            content:
                '$currentUserDisplayName has viewed your item ${widget.productRef?.name}',
            sentAt: getCurrentTimestamp,
            productRef: widget.productRef?.reference,
          ),
          ...mapToFirestore(
            {
              'userList': [widget.productRef?.userRef],
              'unreadByUser': [widget.productRef?.userRef],
            },
          ),
        });
      } else {
        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.chevron_left_sharp,
                    color: FlutterFlowTheme.of(context).secondary,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: wrapWithModel(
                  model: _model.topNavModel,
                  updateCallback: () => setState(() {}),
                  child: const TopNavWidget(),
                ),
                actions: const [],
                centerTitle: true,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 4.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(
                              maxWidth: 1170.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2.0,
                              ),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 12.0, 0.0, 12.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 44.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    wrapWithModel(
                                                      model: _model
                                                          .gradientButtonModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          GradientButtonWidget(
                                                        action: () async {
                                                          context.pushNamed(
                                                            'mainHomePage',
                                                            extra: <String,
                                                                dynamic>{
                                                              kTransitionInfoKey:
                                                                  const TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        0),
                                                              ),
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons
                                                            .chevron_right_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 16.0,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Container(
                                                        height: 32.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              widget.productRef
                                                                  ?.name,
                                                              'name',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'rowOnPageLoadAnimation']!),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 4.0, 140.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: const [
                                                  BoxShadow(
                                                    blurRadius: 2.0,
                                                    color: Color(0x520E151B),
                                                    offset: Offset(0.0, 1.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(16.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child: Hero(
                                                                    tag: widget
                                                                        .productRef!
                                                                        .photoUrl,
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      child: Image
                                                                          .network(
                                                                        widget
                                                                            .productRef!
                                                                            .photoUrl,
                                                                        width:
                                                                            400.0,
                                                                        height:
                                                                            400.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                  tablet: false,
                                                                ))
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                widget.productRef!.name,
                                                                                style: FlutterFlowTheme.of(context).headlineLarge,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                12.0,
                                                                                0.0,
                                                                                12.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  widget.productRef?.price,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.automatic,
                                                                                  currency: '\$',
                                                                                ),
                                                                                '0.00',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                24.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                widget.productRef?.description,
                                                                                'It\'s the perfect mix: a splash of heritage Nike running and a whole lot of comfort. The fast-paced look also includes a revamped Air unit window to energize your every step.',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelLarge,
                                                                            ),
                                                                          ),
                                                                          Divider(
                                                                            height:
                                                                                36.0,
                                                                            thickness:
                                                                                1.0,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          ),
                                                                          Text(
                                                                            'Shoe Size',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).labelMedium,
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                12.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                FlutterFlowChoiceChips(
                                                                              options: const [
                                                                                ChipData('Size 8'),
                                                                                ChipData('Size 9'),
                                                                                ChipData('Size 10'),
                                                                                ChipData('Size 11'),
                                                                                ChipData('Size 12'),
                                                                                ChipData('Size 13')
                                                                              ],
                                                                              onChanged: (val) => setState(() => _model.choiceChipsValue1 = val?.first),
                                                                              selectedChipStyle: ChipStyle(
                                                                                backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall,
                                                                                iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 18.0,
                                                                                elevation: 4.0,
                                                                              ),
                                                                              unselectedChipStyle: ChipStyle(
                                                                                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                textStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 18.0,
                                                                                elevation: 0.0,
                                                                              ),
                                                                              chipSpacing: 8.0,
                                                                              rowSpacing: 12.0,
                                                                              multiselect: false,
                                                                              initialized: _model.choiceChipsValue1 != null,
                                                                              alignment: WrapAlignment.start,
                                                                              controller: _model.choiceChipsValueController1 ??= FormFieldController<List<String>>(
                                                                                [
                                                                                  'Size 8'
                                                                                ],
                                                                              ),
                                                                              wrapped: true,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                12.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Color',
                                                                              style: FlutterFlowTheme.of(context).labelMedium,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                12.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                FlutterFlowChoiceChips(
                                                                              options: const [
                                                                                ChipData('Gray'),
                                                                                ChipData('White'),
                                                                                ChipData('Black & Charcoal'),
                                                                                ChipData('Blue & White')
                                                                              ],
                                                                              onChanged: (val) => setState(() => _model.choiceChipsValue2 = val?.first),
                                                                              selectedChipStyle: ChipStyle(
                                                                                backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall,
                                                                                iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 18.0,
                                                                                elevation: 4.0,
                                                                              ),
                                                                              unselectedChipStyle: ChipStyle(
                                                                                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                textStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 18.0,
                                                                                elevation: 0.0,
                                                                              ),
                                                                              chipSpacing: 8.0,
                                                                              rowSpacing: 12.0,
                                                                              multiselect: false,
                                                                              initialized: _model.choiceChipsValue2 != null,
                                                                              alignment: WrapAlignment.start,
                                                                              controller: _model.choiceChipsValueController2 ??= FormFieldController<List<String>>(
                                                                                [
                                                                                  'Gray'
                                                                                ],
                                                                              ),
                                                                              wrapped: true,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ).animateOnPageLoad(
                                                                              animationsMap['columnOnPageLoadAnimation1']!),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            tabletLandscape:
                                                                false,
                                                            desktop: false,
                                                          ))
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        widget
                                                                            .productRef!
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              fontWeight: FontWeight.w800,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                            ),
                                                                      ),
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          if (widget.productRef?.isFavorite ??
                                                                              false) {
                                                                            return FlutterFlowIconButton(
                                                                              borderColor: FlutterFlowTheme.of(context).primary,
                                                                              borderRadius: 20.0,
                                                                              borderWidth: 1.0,
                                                                              buttonSize: 40.0,
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              icon: Icon(
                                                                                Icons.favorite,
                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                await widget.productRef!.reference.update(createProductsRecordData(
                                                                                  isFavorite: false,
                                                                                ));
                                                                              },
                                                                            );
                                                                          } else {
                                                                            return FlutterFlowIconButton(
                                                                              borderColor: FlutterFlowTheme.of(context).primary,
                                                                              borderRadius: 20.0,
                                                                              borderWidth: 1.0,
                                                                              buttonSize: 40.0,
                                                                              fillColor: FlutterFlowTheme.of(context).accent1,
                                                                              icon: Icon(
                                                                                Icons.favorite_border,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                await widget.productRef!.reference.update(createProductsRecordData(
                                                                                  isFavorite: true,
                                                                                ));
                                                                              },
                                                                            );
                                                                          }
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Divider(
                                                                    height:
                                                                        36.0,
                                                                    thickness:
                                                                        1.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                  Text(
                                                                    'Yield',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                        ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          160.0,
                                                                      height:
                                                                          50.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(25.0),
                                                                        shape: BoxShape
                                                                            .rectangle,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          FlutterFlowCountController(
                                                                        decrementIconBuilder:
                                                                            (enabled) =>
                                                                                FaIcon(
                                                                          FontAwesomeIcons
                                                                              .minus,
                                                                          color: enabled
                                                                              ? FlutterFlowTheme.of(context).primary
                                                                              : FlutterFlowTheme.of(context).alternate,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                        incrementIconBuilder:
                                                                            (enabled) =>
                                                                                FaIcon(
                                                                          FontAwesomeIcons
                                                                              .plus,
                                                                          color: enabled
                                                                              ? FlutterFlowTheme.of(context).primary
                                                                              : FlutterFlowTheme.of(context).alternate,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                        countBuilder:
                                                                            (count) =>
                                                                                Text(
                                                                          count
                                                                              .toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                              ),
                                                                        ),
                                                                        count: _model
                                                                            .countControllerValue ??= 1,
                                                                        updateCount:
                                                                            (count) =>
                                                                                setState(() => _model.countControllerValue = count),
                                                                        stepSize:
                                                                            1,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'columnOnPageLoadAnimation2']!),
                                                            ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Ingredients',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                            ),
                                                                      ).animateOnPageLoad(
                                                                          animationsMap[
                                                                              'textOnPageLoadAnimation']!),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: PagedListView<
                                                                DocumentSnapshot<
                                                                    Object?>?,
                                                                ReviewsRecord>(
                                                              pagingController:
                                                                  _model
                                                                      .setListViewController1(
                                                                ReviewsRecord
                                                                    .collection
                                                                    .where(
                                                                      'productRef',
                                                                      isEqualTo: widget
                                                                          .productRef
                                                                          ?.reference,
                                                                    )
                                                                    .orderBy(
                                                                        'dateCreated',
                                                                        descending:
                                                                            true),
                                                              ),
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              reverse: false,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              builderDelegate:
                                                                  PagedChildBuilderDelegate<
                                                                      ReviewsRecord>(
                                                                // Customize what your widget looks like when it's loading the first page.
                                                                firstPageProgressIndicatorBuilder:
                                                                    (_) =>
                                                                        const Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        Color(
                                                                            0xFF41EF66),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                // Customize what your widget looks like when it's loading another page.
                                                                newPageProgressIndicatorBuilder:
                                                                    (_) =>
                                                                        const Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        Color(
                                                                            0xFF41EF66),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                noItemsFoundIndicatorBuilder:
                                                                    (_) =>
                                                                        Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width:
                                                                        300.0,
                                                                    height:
                                                                        200.0,
                                                                    child:
                                                                        EmtpyStateWidget(
                                                                      title:
                                                                          'No Reviews',
                                                                      bodyText:
                                                                          'No reviews exist for this product.',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .star_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            90.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                itemBuilder:
                                                                    (context, _,
                                                                        listViewIndex) {
                                                                  final listViewReviewsRecord = _model
                                                                          .listViewPagingController1!
                                                                          .itemList![
                                                                      listViewIndex];
                                                                  return Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            12.0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            4.0,
                                                                            4.0,
                                                                            12.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  FutureBuilder<UsersRecord>(
                                                                                    future: UsersRecord.getDocumentOnce(listViewReviewsRecord.userRefReviewer!),
                                                                                    builder: (context, snapshot) {
                                                                                      // Customize what your widget looks like when it's loading.
                                                                                      if (!snapshot.hasData) {
                                                                                        return const Center(
                                                                                          child: SizedBox(
                                                                                            width: 50.0,
                                                                                            height: 50.0,
                                                                                            child: CircularProgressIndicator(
                                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                Color(0xFF41EF66),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                      final rowUsersRecord = snapshot.data!;
                                                                                      return Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    rowUsersRecord.displayName,
                                                                                                    'Ghost User',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                formatNumber(
                                                                                                  listViewReviewsRecord.rating,
                                                                                                  formatType: FormatType.decimal,
                                                                                                  decimalType: DecimalType.automatic,
                                                                                                ),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).headlineMedium,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'listViewOnPageLoadAnimation']!),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Instructions',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          ListView(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            children: const [],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 32.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 5.0,
                                              sigmaY: 2.0,
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              height: 80.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        setState(() {
                                                          FFAppState()
                                                              .addToCart(widget
                                                                  .productRef!
                                                                  .reference);
                                                          FFAppState().addToCartPriceSummary(
                                                              widget.productRef!
                                                                      .price *
                                                                  (_model
                                                                      .countControllerValue!));
                                                          FFAppState()
                                                              .addToCartItems(
                                                                  CartItemStruct(
                                                            itemRef: widget
                                                                .productRef
                                                                ?.reference,
                                                            quanity: _model
                                                                .countControllerValue,
                                                            totalPrice: widget
                                                                    .productRef!
                                                                    .price *
                                                                (_model
                                                                    .countControllerValue!),
                                                          ));
                                                        });
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'You have added ${widget.productRef?.name} to your cart!',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
                                                                  ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                          ),
                                                        );
                                                      },
                                                      text:
                                                          'Add to Shopping List',
                                                      options: FFButtonOptions(
                                                        width: 347.0,
                                                        height: 50.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall,
                                                        elevation: 2.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation']!),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
