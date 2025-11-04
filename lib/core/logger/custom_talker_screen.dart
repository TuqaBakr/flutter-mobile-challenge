import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'logger.dart';

@RoutePage()
class CustomTalkerScreen extends StatelessWidget {
  const CustomTalkerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TalkerScreen(talker: talker);
  }
}
