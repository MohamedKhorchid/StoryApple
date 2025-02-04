import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notation_page_model.dart';
export 'notation_page_model.dart';

/// generate the "please note the app on store" page with some text and a
/// button that will allow the user to go to the the app store page of the app
/// in the same minimalist style and color of the app with an animation of 5
/// stars empty getting filled everything in french no image with 2 buttons,
/// one for playstore other for appstore and a close iconbutton
class NotationPageWidget extends StatefulWidget {
  const NotationPageWidget({super.key});

  @override
  State<NotationPageWidget> createState() => _NotationPageWidgetState();
}

class _NotationPageWidgetState extends State<NotationPageWidget> {
  late NotationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotationPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().lastTimeNoteStory = getCurrentTimestamp;
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
        backgroundColor: FlutterFlowTheme.of(context).tertiary,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderRadius: 20.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                icon: Icon(
                  Icons.close,
                  color: FlutterFlowTheme.of(context).tertiary,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed('homePage');
                },
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'i3yhozu9' /* Vous aimez notre app ? */,
                      ),
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Inter Tight',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'qoo1m0wz' /* Votre avis compte. Prenez un i... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 32.0,
                        ),
                        Icon(
                          Icons.star,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 32.0,
                        ),
                        Icon(
                          Icons.star,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 32.0,
                        ),
                        Icon(
                          Icons.star,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 32.0,
                        ),
                        Icon(
                          Icons.star,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 32.0,
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            await launchURL(
                                'https://apps.apple.com/us/app/story-lecture-et-histoires/id6740210549');
                          },
                          text: FFLocalizations.of(context).getText(
                            '872pp0of' /* Noter sur l'App Store */,
                          ),
                          icon: Icon(
                            Icons.apple,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: 250.0,
                            height: 50.0,
                            padding: EdgeInsets.all(8.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await launchURL(
                                'https://play.google.com/store/apps/details?id=com.mycompany.storyappplus');
                          },
                          text: FFLocalizations.of(context).getText(
                            'eqsnh3qm' /* Noter sur Google Play */,
                          ),
                          icon: Icon(
                            Icons.android,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: 250.0,
                            height: 50.0,
                            padding: EdgeInsets.all(8.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ].divide(SizedBox(height: 24.0)),
              ),
            ].divide(SizedBox(height: 100.0)),
          ),
        ),
      ),
    );
  }
}
