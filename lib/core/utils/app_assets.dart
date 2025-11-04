import 'package:flutter/material.dart';

class AppAssets {
  AppAssets._();

  static const String _basePath = 'assets/images/';


  //background image
  static const String backgroundImage = '${_basePath}background_icon.png';
  static const String backgroundImageSvg = '${_basePath}background.svg';
  static const String testHallImage = '${_basePath}test_hall_image.svg';
  static const String branchImage = '${_basePath}branch.svg';

  // Icons
    static const String designButtonIcon = '${_basePath}design_button_icon.png';
  static const String menuIcon = '${_basePath}menu_icon.svg';
  static const String profileIcon = '${_basePath}profile_icon.svg';
  static const String searchIcon = '${_basePath}search_icon.svg';
  static const String ringIcon = '${_basePath}ring_icon.svg';
  static const String priceIcon = '${_basePath}price_icon.svg';
  static const String locationIcon = '${_basePath}location_icon.svg';
  static const String serviceIcon = '${_basePath}service_icon.svg';
  static const String chatIcon = '${_basePath}chat_icon.svg';
  static const String capacityIcon = '${_basePath}capacity_icon.svg';
  static const String filteringIcon = '${_basePath}filter.svg';
  static const String cancelFilteringIcon = '${_basePath}cancel_filter.svg';
  static const String cakeIcon = '${_basePath}cake.svg';
  static const String cameraIcon = '${_basePath}camera.svg';
  static const String restaurantIcon = '${_basePath}restaurant.svg';
  static const String ring = '${_basePath}ring.svg';
  static const String lightIcon = '${_basePath}light.svg';
  static const String itemIcon = '${_basePath}item.svg';
  static const String hurt = '${_basePath}hurt.svg';
  static const String blackHurt = '${_basePath}black_hurt.svg';
  static const String details = '${_basePath}details.svg';
  static const String done = '${_basePath}done.svg';
  static const String message = '${_basePath}message.svg';
  static const String tasks = '${_basePath}tasks.svg';
  static const String star = '${_basePath}star.svg';
  static const String timeIcon = '${_basePath}time.svg';
  static const String budgetIcon = '${_basePath}budget.svg';
  static const String dateIcon = '${_basePath}date.svg';
  static const String leftHurt = '${_basePath}leftHurt.svg';
  static const String rightHurt = '${_basePath}rightHurt.svg';
  static const String typeIcon = '${_basePath}type.svg';
  static const String couples = '${_basePath}couples.png';
  static const String photoSVG = '${_basePath}photoSVG.svg';
  static const String title = '${_basePath}title.svg';
  static const String title1 = '${_basePath}title1.svg';
  static const String title2 = '${_basePath}title2.svg';
  static const String comment = '${_basePath}comment.svg';
  static const String service1 = '${_basePath}service1.svg';
  static const String service2 = '${_basePath}service2.svg';
  static const String back = '${_basePath}back.jpg';

  static const String reviewIcon = '${_basePath}review_icon.png';
  static const String homeIcon = '${_basePath}ic_home.png';

//  static const String profileIcon = '${_basePath}ic_profile.png';

  // Resolution-aware example
  static String getProfileImage(String filename) =>
      '$_basePath$_resolutionPrefix/$filename';

  static String get _resolutionPrefix {
    final ratio = WidgetsBinding.instance.window.devicePixelRatio;
    return ratio >= 3 ? '3.0x' : ratio >= 2 ? '2.0x' : '1.0x';
  }
}
