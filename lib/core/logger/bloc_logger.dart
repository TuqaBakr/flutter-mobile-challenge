
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

import 'logger.dart';

TalkerBlocObserver get blocLogger => TalkerBlocObserver(
  talker: talker,
  settings: TalkerBlocLoggerSettings(
    enabled: true,
    printChanges: true,
    printClosings: true,
    printCreations: true,
    printEvents: true,
    printTransitions: true,
    // transitionFilter: (bloc, transition) =>
    // bloc.runtimeType.toString() == 'AuthBloc',
  ),
);
