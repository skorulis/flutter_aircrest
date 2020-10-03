import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'store/AppState.dart';
import "widget/main/AppTabsWidget.dart";
import "store/AppStore.dart";
import "widget/home/HomeDashboardWidget.dart";
import "widget/newCharacter/NewCharacterWidget.dart";

void main() {
  Redux.init();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreProvider<AppState>(
      store: Redux.store,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainAppConnector(),
      ));
}

class MainAppConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Build");
    print("MainConnect");
    return StoreConnector<AppState, MainAppViewModel>(
        model: MainAppViewModel(),
        builder: (BuildContext context, MainAppViewModel vm) =>
            MainAppWidget(viewModel: vm));
  }
}

class MainAppViewModel extends BaseModel<AppState> {
  MainAppViewModel();

  bool isLoggedIn;
  bool hasCharacter;

  MainAppViewModel.build({
    @required this.isLoggedIn,
    @required this.hasCharacter,
  }) : super(equals: [isLoggedIn, hasCharacter]);

  @override
  MainAppViewModel fromStore() {
    bool hasUser = state.authUser != null;
    return MainAppViewModel.build(
        isLoggedIn: hasUser,
        hasCharacter: hasUser && state.authUser.characterId != null);
  }
}

class MainAppWidget extends StatelessWidget {
  final MainAppViewModel viewModel;

  MainAppWidget({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("$viewModel");
    if (viewModel.isLoggedIn) {
      if (viewModel.hasCharacter) {
        return HomeDashboardWidget();
      } else {
        return NewCharacterWidget();
      }
    } else {
      return AppTabsWidget();
    }
  }
}
