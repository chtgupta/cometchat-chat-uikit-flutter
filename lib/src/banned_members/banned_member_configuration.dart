import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_kit/flutter_chat_ui_kit.dart';

class BannedMemberConfiguration {
  BannedMemberConfiguration(
      {this.requestBuilder,
      this.hideSeparator,
      this.childView,
      this.style = const BannedMembersStyle(),
      this.options,
      this.controller,
      this.theme,
      this.searchPlaceholder,
      this.backButton,
      this.showBackButton = true,
      this.searchBoxIcon,
      this.hideSearch = true,
      this.selectionMode,
      this.onSelection,
      this.title,
      this.errorText,
      this.emptyText,
      this.subtitle,
      this.tail,
      this.avatarStyle,
      this.hideUserPresence,
      this.loadingView,
      this.emptyView,
      this.errorView,
      this.hideError,
      this.statusIndicatorStyle,
      this.onError, this.onBack, this.onItemTap, this.onItemLongPress,this.activateSelection, this.appBarOptions, this.listItemStyle, this.bannedMemberProtocol, this.bannedMemberRequestBuilder, });

  ///[requestBuilder] set custom request builder
  final UIBannedGroupMemberRequestBuilder? requestBuilder;

  ///[hideSeparator] toggle visibility of separator
  final bool? hideSeparator;

  ///[childView] set custom view for each banned member
  final Widget Function(GroupMember)? childView;

  ///[style] sets style
  final BannedMembersStyle style;

  ///[controller] sets controller for the list
  final ScrollController? controller;

  ///[options]  set options which will be visible at slide of each banned member
  final List<CometChatOption>? Function(
      Group group,
      GroupMember member,
      CometChatBannedMembersController controller,
      BuildContext context)? options;

  ///[searchPlaceholder] placeholder text of search input
  final String? searchPlaceholder;

  ///[backButton] back button
  final Widget? backButton;

  ///[showBackButton] switch on/off back button
  final bool showBackButton;

  ///[searchBoxIcon] search icon
  final Widget? searchBoxIcon;

  ///[hideSearch] switch on/ff search input
  final bool hideSearch;

  ///[theme] can pass custom theme
  final CometChatTheme? theme;

  ///[selectionMode] specifies mode banned members module is opening in
  final SelectionMode? selectionMode;

  ///[onSelection] function will be performed
  final Function(List<GroupMember>?)? onSelection;

  ///[title] sets title for the list
  final String? title;

  ///[emptyText] text to be displayed when the list is empty
  final String? emptyText;

  ///[errorText] text to be displayed when error occurs
  final String? errorText;

  ///[subtitle] to set subtitle for each banned member
  final Widget? Function(GroupMember)? subtitle;

  ///[tail] to set tail/trailing widget for each banned member
  final Widget? Function(GroupMember)? tail;

  ///[hideUserPresence] controls visibility of status indicator
  final bool? hideUserPresence;

  ///[avatarStyle] is applied to the avatar of the user banned from the group
  final AvatarStyle? avatarStyle;

  ///[loadingView] returns view fow loading state
  final WidgetBuilder? loadingView;

  ///[emptyView] returns view fow empty state
  final WidgetBuilder? emptyView;

  ///[errorView] returns view fow error state behind the dialog
  final WidgetBuilder? errorView;

  ///[hideError] toggle visibility of error dialog
  final bool? hideError;

  ///[statusIndicatorStyle] is applied to the online/offline status indicator of the user banned from the group
  final StatusIndicatorStyle? statusIndicatorStyle;

  ///[onError] callback triggered in case any error happens when fetching users
  final OnError? onError;

  ///[onBack] callback triggered on closing this screen
  final VoidCallback? onBack;

  ///[onItemTap] callback triggered on tapping a user item
  final Function(User)? onItemTap;

  ///[onItemLongPress] callback triggered on pressing for long on a user item
  final Function(User)? onItemLongPress;

  ///[activateSelection] lets the widget know if banned members are allowed to be selected
  final ActivateSelection? activateSelection;

  ///[appBarOptions] list of options to be visible in app bar
  final List<Widget>? appBarOptions;

  ///[listItemStyle] style for every list item
  final ListItemStyle? listItemStyle;

  ///[bannedMemberProtocol] is a wrapper for request builder
  final BannedMemberBuilderProtocol? bannedMemberProtocol;

  ///[bannedMemberRequestBuilder] set custom request builder
  final BannedGroupMembersRequestBuilder? bannedMemberRequestBuilder;
}
