import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../flutter_chat_ui_kit.dart';
import '../../flutter_chat_ui_kit.dart' as cc;

class CometChatThreadedMessages extends StatefulWidget {
  const CometChatThreadedMessages(
      {Key? key,
      required this.parentMessage,
      this.title,
      this.closeIcon,
      this.messageActionView,
      this.messageComposerConfiguration,
      this.messageListConfiguration,
      this.threadedMessagesStyle,
      this.hideMessageComposer,
      this.bubbleView,
      required this.loggedInUser,
      this.theme})
      : super(key: key);

  ///[parentMessage] parent message for thread
  final BaseMessage parentMessage;

  ///[title] to be shown at head
  final String? title;

  ///to update Close Icon
  final Widget? closeIcon;

  ///[bubbleView] bubble view for parent message
  final Widget Function(BaseMessage, BuildContext context)? bubbleView;

  ///[messageActionView] custom action view
  final Function(BaseMessage message, BuildContext context)? messageActionView;

  ///[messageListConfiguration] configuration class for [CometChatMessageList]
  final MessageListConfiguration? messageListConfiguration;

  ///[messageComposerConfiguration] configuration class for [CometChatMessageComposer]
  final MessageComposerConfiguration? messageComposerConfiguration;

  ///[threadedMessagesStyle] style parameter
  final ThreadedMessageStyle? threadedMessagesStyle;

  ///[hideMessageComposer] toggle visibility for message composer
  final bool? hideMessageComposer;

  ///[loggedInUser] get logged in user
  final User loggedInUser;

  ///[theme] can pass custom theme
  final CometChatTheme? theme;

  @override
  State<CometChatThreadedMessages> createState() =>
      _CometChatThreadedMessagesState();
}

class _CometChatThreadedMessagesState extends State<CometChatThreadedMessages> {
  late CometChatThreadedMessageController threadedMessageController;
  late CometChatTheme _theme;

  @override
  void initState() {
    super.initState();
    threadedMessageController = CometChatThreadedMessageController(
      widget.parentMessage,
      widget.loggedInUser,
    );
    _theme = widget.theme ?? cometChatTheme;
  }

  Widget getMessageComposer(
      CometChatThreadedMessageController controller, BuildContext context) {
    return CometChatMessageComposer(
      user: controller.user,
      group: controller.group,
      placeholderText: widget.messageComposerConfiguration?.placeholderText,
      parentMessageId: widget.parentMessage.id,
      hideLiveReaction: true,
      attachmentIcon: widget.messageComposerConfiguration?.attachmentIcon,
      liveReactionIcon: widget.messageComposerConfiguration?.liveReactionIcon,
      messageComposerStyle: MessageComposerStyle(
          background: widget.messageComposerConfiguration?.messageComposerStyle
                  ?.background ??
              (widget.threadedMessagesStyle?.gradient != null
                  ? Colors.transparent
                  : widget.threadedMessagesStyle?.background),
          border: widget.messageComposerConfiguration?.messageComposerStyle?.border ??
              (widget.threadedMessagesStyle?.background != null ||
                      widget.threadedMessagesStyle?.gradient != null
                  ? null
                  : widget.threadedMessagesStyle?.border),
          borderRadius: widget.messageComposerConfiguration
                  ?.messageComposerStyle?.borderRadius ??
              widget.threadedMessagesStyle?.borderRadius,
          inputBackground: widget.messageComposerConfiguration
                  ?.messageComposerStyle?.inputBackground ??
              _theme.palette.getAccent100(),
          gradient:
              widget.messageComposerConfiguration?.messageComposerStyle?.gradient,
          height: widget.messageComposerConfiguration?.messageComposerStyle?.height,
          width: widget.messageComposerConfiguration?.messageComposerStyle?.width,
          attachmentIconTint: widget.messageComposerConfiguration?.messageComposerStyle?.attachmentIconTint,
          closeIconTint: widget.messageComposerConfiguration?.messageComposerStyle?.closeIconTint,
          dividerTint: widget.messageComposerConfiguration?.messageComposerStyle?.dividerTint ?? _theme.palette.getAccent500(),
          emojiIconTint: widget.messageComposerConfiguration?.messageComposerStyle?.emojiIconTint,
          inputTextStyle: widget.messageComposerConfiguration?.messageComposerStyle?.inputTextStyle,
          placeholderTextStyle: widget.messageComposerConfiguration?.messageComposerStyle?.placeholderTextStyle,
          sendButtonIcon: widget.messageComposerConfiguration?.messageComposerStyle?.sendButtonIcon,
          sendButtonIconTint: widget.messageComposerConfiguration?.messageComposerStyle?.sendButtonIconTint,
          stickerIconTint: widget.messageComposerConfiguration?.messageComposerStyle?.stickerIconTint,
          contentPadding: widget.messageComposerConfiguration?.messageComposerStyle?.contentPadding ?? EdgeInsets.zero),
    );
  }

  Widget getMessageList(
      CometChatThreadedMessageController controller, BuildContext context) {
    MessagesRequestBuilder? _requestBuilder =
        widget.messageListConfiguration?.messagesRequestBuilder;
    if (_requestBuilder != null) {
      _requestBuilder.parentMessageId = widget.parentMessage.id;
    } else {
      _requestBuilder = MessagesRequestBuilder()
        ..parentMessageId = widget.parentMessage.id;
    }

    return CometChatMessageList(
      user: controller.user,
      group: controller.group,
      alignment:
          widget.messageListConfiguration?.alignment ?? ChatAlignment.standard,
      templates: widget.messageListConfiguration?.templates,
      // stateCallBack: messageListStateCallBack,
      messagesRequestBuilder: _requestBuilder,
      footerView: widget.messageListConfiguration?.footerView,
      headerView: widget.messageListConfiguration?.headerView,
      datePattern: widget.messageListConfiguration?.datePattern,
      avatarStyle: widget.messageListConfiguration?.avatarStyle,
      dateSeparatorPattern:
          widget.messageListConfiguration?.dateSeparatorPattern,
      deliveredIcon: widget.messageListConfiguration?.deliveredIcon,
      emptyStateText: widget.messageListConfiguration?.emptyStateText,
      emptyStateView: widget.messageListConfiguration?.emptyStateView,
      errorStateText: widget.messageListConfiguration?.errorStateText,
      errorStateView: widget.messageListConfiguration?.errorStateView,
      hideError: widget.messageListConfiguration?.hideError,
      hideTimestamp: widget.messageListConfiguration?.hideTimestamp,
      waitIcon: widget.messageListConfiguration?.waitIcon,
      showAvatar: widget.messageListConfiguration?.showAvatar,
      loadingStateView: widget.messageListConfiguration?.loadingStateView,
      disableSoundForMessages: true,
      messageListStyle: widget.messageListConfiguration?.messageListStyle ??
          MessageListStyle(
              contentPadding: widget.messageListConfiguration?.messageListStyle
                      ?.contentPadding ??
                  EdgeInsets.zero),

      sentIcon: widget.messageListConfiguration?.sentIcon,
      readIcon: widget.messageListConfiguration?.readIcon,
      scrollToBottomOnNewMessages:
          widget.messageListConfiguration?.scrollToBottomOnNewMessages,
      newMessageIndicatorText:
          widget.messageListConfiguration?.newMessageIndicatorText,
      timestampAlignment: widget.messageListConfiguration?.timestampAlignment ??
          TimeAlignment.bottom,
      customSoundForMessages:
          widget.messageListConfiguration?.customSoundForMessages,
      customSoundForMessagePackage:
          widget.messageListConfiguration?.customSoundForMessagePackage,
      // eventStreamController: controller.messageListEventStreamController,
    );
  }

  getThreadMessageHeader(
      CometChatThreadedMessageController controller, BuildContext context) {
    if (widget.bubbleView != null) {
      return widget.bubbleView!(controller.parentMessage, context);
    } else {
      return const SizedBox();
    }
  }

  Widget getActionView(CometChatThreadedMessageController controller,
      BuildContext context, CometChatTheme _theme) {
    if (widget.messageActionView != null) {
      return widget.messageActionView!(widget.parentMessage, context);
    }

    return Column(
      children: [
        const Divider(),
        Row(children: [
          Text(
            controller.replyCount.toString() +
                " " +
                (widget.parentMessage.replyCount > 1
                    ? cc.Translations.of(context).replies
                    : cc.Translations.of(context).reply),
            style: TextStyle(
                fontSize: _theme.typography.text1.fontSize,
                fontWeight: _theme.typography.text1.fontWeight,
                color: _theme.palette.getAccent600()),
          )
        ]),
        const Divider()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CometChatListBase(
        title: widget.title ?? cc.Translations.of(context).thread,
        hideSearch: true,
        backIcon: widget.closeIcon,
        showBackButton: true,
        theme: _theme,
        style: ListBaseStyle(
          background: widget.threadedMessagesStyle?.gradient == null
              ? widget.threadedMessagesStyle?.background
              : Colors.transparent,
          titleStyle: widget.threadedMessagesStyle?.titleStyle,
          gradient: widget.threadedMessagesStyle?.gradient,
          height: widget.threadedMessagesStyle?.height,
          width: widget.threadedMessagesStyle?.width,
          backIconTint: widget.threadedMessagesStyle?.closeIconTint,
          border: widget.threadedMessagesStyle?.border,
          borderRadius: widget.threadedMessagesStyle?.borderRadius,
        ),
        container: GetBuilder(
            init: threadedMessageController,
            tag: threadedMessageController.tag,
            builder: (CometChatThreadedMessageController value) {
              return Column(
                children: [
                  //----message list-----
                  getThreadMessageHeader(value, context),

                  getActionView(value, context, _theme),

                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            if (Platform.isIOS) {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                            }
                          },
                          child: getMessageList(value, context))),

                  //-----message composer-----
                  if (widget.hideMessageComposer != true)
                    getMessageComposer(value, context)
                ],
              );
            }));
  }
}
