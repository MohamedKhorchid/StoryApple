import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reading_page_model.dart';
export 'reading_page_model.dart';

/// generate the chapter reading page of this app all in french repecting the
/// app style
class ReadingPageWidget extends StatefulWidget {
  const ReadingPageWidget({
    super.key,
    required this.chapterRef,
    required this.chapterTitle,
    Color? backgroundColor,
    required this.totalPage,
  }) : this.backgroundColor = backgroundColor ?? const Color(0xFFEE8B60);

  final DocumentReference? chapterRef;
  final String? chapterTitle;
  final Color backgroundColor;
  final int? totalPage;

  @override
  State<ReadingPageWidget> createState() => _ReadingPageWidgetState();
}

class _ReadingPageWidgetState extends State<ReadingPageWidget> {
  late ReadingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReadingPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().currentPage = 1;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: valueOrDefault<Color>(
          widget!.backgroundColor,
          FlutterFlowTheme.of(context).tertiary,
        ),
        body: Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget!.backgroundColor,
                      FlutterFlowTheme.of(context).tertiary,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 20.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.arrow_back,
                                color: valueOrDefault<Color>(
                                  widget!.backgroundColor,
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                          ],
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget!.chapterTitle,
                            'Titre du chapitre',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Inter Tight',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ].divide(SizedBox(height: 30.0)),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(32.0, 60.0, 32.0, 70.0),
                    child: StreamBuilder<List<PagesRecord>>(
                      stream: queryPagesRecord(
                        queryBuilder: (pagesRecord) => pagesRecord
                            .where(
                              'chapterID',
                              isEqualTo: widget!.chapterRef?.id,
                            )
                            .where(
                              'pageNumber',
                              isEqualTo: FFAppState().currentPage,
                            ),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<PagesRecord> listViewPagesRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final listViewPagesRecord =
                            listViewPagesRecordList.isNotEmpty
                                ? listViewPagesRecordList.first
                                : null;

                        return ListView(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            FlutterFlowAdBanner(
                              width: MediaQuery.sizeOf(context).width * 3.2,
                              height: 50.0,
                              showsTestAd: false,
                              iOSAdUnitID:
                                  'ca-app-pub-5902757634604822/4961150854',
                              androidAdUnitID:
                                  'ca-app-pub-5902757634604822/1405049226',
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  listViewPagesRecord?.content,
                                  'contenu du chapitre à venir',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color: valueOrDefault<Color>(
                                        widget!.backgroundColor,
                                        FlutterFlowTheme.of(context).tertiary,
                                      ),
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            FlutterFlowAdBanner(
                              width: MediaQuery.sizeOf(context).width * 3.2,
                              height: 50.0,
                              showsTestAd: false,
                              iOSAdUnitID:
                                  'ca-app-pub-5902757634604822/2275277769',
                              androidAdUnitID:
                                  'ca-app-pub-5902757634604822/3634554911',
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (FFAppState().currentPage > 1)
                                  FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().currentPage =
                                          FFAppState().currentPage + -1;
                                      safeSetState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'sm1wty9z' /* Page Précédente */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 160.0,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: valueOrDefault<Color>(
                                        widget!.backgroundColor,
                                        FlutterFlowTheme.of(context).tertiary,
                                      ),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                if (FFAppState().currentPage <
                                    widget!.totalPage!)
                                  FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().currentPage =
                                          FFAppState().currentPage + 1;
                                      safeSetState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'hxtl7nj7' /* Page Suivante */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 160.0,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: valueOrDefault<Color>(
                                              widget!.backgroundColor,
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                            ),
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                              ],
                            ),
                          ].divide(SizedBox(height: 50.0)),
                        );
                      },
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 30.0)),
            ),
          ),
        ),
      ),
    );
  }
}
