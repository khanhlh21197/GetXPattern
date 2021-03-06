import 'package:flutter/material.dart';
import 'package:getx_pattern/app/transitions/slide_route.dart';

void navigatorPush(BuildContext context, Widget screen) {
  Navigator.of(context).push(SlideLeftRoute(page: screen));
}

void navigatorPushAndRemoveUntil(BuildContext context, Widget screen) {
  Navigator.of(context)
      .pushAndRemoveUntil(SlideTopRoute(page: screen), (_) => false);
}
