
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opolah/blocs/tab/tab_event.dart';
import 'package:opolah/models/tab.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  TabBloc() : super(AppTab.shop);

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      yield event.tab;
    }
  }
}
