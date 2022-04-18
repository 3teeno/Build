import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../chat_details/chat_details_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatMainWidget extends StatefulWidget {
  const ChatMainWidget({Key key}) : super(key: key);

  @override
  _ChatMainWidgetState createState() => _ChatMainWidgetState();
}

class _ChatMainWidgetState extends State<ChatMainWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.primaryColor,
              ),
            ),
          );
        }
        final chatMainUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: false,
            title: Text(
              'All Chats',
              style: FlutterFlowTheme.title1,
            ),
            actions: [],
            centerTitle: false,
            elevation: 4,
          ),
          backgroundColor: FlutterFlowTheme.background,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('FloatingActionButton pressed ...');
            },
            backgroundColor: FlutterFlowTheme.primaryColor,
            elevation: 8,
            child: Icon(
              Icons.add_comment_rounded,
              color: FlutterFlowTheme.tertiaryColor,
              size: 30,
            ),
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                  child: StreamBuilder<List<ChatsRecord>>(
                    stream: queryChatsRecord(
                      queryBuilder: (chatsRecord) => chatsRecord
                          .where('users', arrayContains: currentUserReference)
                          .orderBy('last_message_time', descending: true),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme   .primaryColor,
                            ),
                          ),
                        );
                      }
                      List<ChatsRecord> listViewChatsRecordList = snapshot.data;
                      if (listViewChatsRecordList.isEmpty) {
                        return Image.asset(
                          'assets/images/chatsEmpty.png',
                          width: 450,
                          height: 450,
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewChatsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewChatsRecord =
                              listViewChatsRecordList[listViewIndex];
                          return StreamBuilder<FFChatInfo>(
                            stream: FFChatManager.instance
                                .getChatInfo(chatRecord: listViewChatsRecord),
                            builder: (context, snapshot) {
                              final chatInfo = snapshot.data ??
                                  FFChatInfo(listViewChatsRecord);
                              return FFChatPreview(
                                onTap: chatInfo != null
                                    ? () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ChatDetailsWidget(
                                              chatUser:
                                                  chatInfo.otherUsers.length ==
                                                          1
                                                      ? chatInfo
                                                          .otherUsersList.first
                                                      : null,
                                              chatRef:
                                                  chatInfo.chatRecord.reference,
                                            ),
                                          ),
                                        )
                                    : null,
                                lastChatText: chatInfo.chatPreviewMessage(),
                                lastChatTime:
                                    listViewChatsRecord.lastMessageTime,
                                seen: listViewChatsRecord.lastMessageSeenBy
                                    .contains(currentUserReference),
                                title: chatInfo.chatPreviewTitle(),
                                userProfilePic: chatInfo.chatPreviewPic(),
                                color: FlutterFlowTheme.dark900,
                                unreadColor:
                                    FlutterFlowTheme.tertiary,
                                titleTextStyle: GoogleFonts.getFont(
                                  'Lexend Deca',
                                  color: FlutterFlowTheme
                                      .tertiaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                dateTextStyle: GoogleFonts.getFont(
                                  'Lexend Deca',
                                  color: FlutterFlowTheme.grayIcon,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                                previewTextStyle: GoogleFonts.getFont(
                                  'Lexend Deca',
                                  color: FlutterFlowTheme.grayIcon,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(8, 3, 8, 3),
                                borderRadius: BorderRadius.circular(0),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}