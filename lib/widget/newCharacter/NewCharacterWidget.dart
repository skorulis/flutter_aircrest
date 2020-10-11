import 'package:Aircrest/Constants.dart';
import 'package:Aircrest/model/EntityNetworkModel.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import "../../store/AppStore.dart";
import "../../store/MainActions.dart";
import "../../store/AppState.dart";

class NewCharacterConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("New character connector");
    return StoreConnector<AppState, NewCharacterViewModel>(
        model: NewCharacterViewModel(),
        builder: (BuildContext context, NewCharacterViewModel vm) =>
            NewCharacterWidget(viewModel: vm));
  }
}

class NewCharacterWidget extends StatefulWidget {
  final NewCharacterViewModel viewModel;

  NewCharacterWidget({Key key, this.viewModel}) : super(key: key);

  @override
  _NewCharacterState createState() {
    print("CREATE state");
    return _NewCharacterState(viewModel: this.viewModel);
  }
}

class _NewCharacterState extends State<NewCharacterWidget> {
  final nameController = TextEditingController();
  final NewCharacterViewModel viewModel;

  _NewCharacterState({@required this.viewModel});

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print("T1");
    super.didChangeDependencies();
    Redux.store.dispatchFuture(GetBackgroundsAction());
  }

  @override
  Widget build(BuildContext context) {
    print("TERS");
    String text = "" + viewModel.toString();
    //if (viewModel.backgrounds.length > 0) {
    //text = viewModel.backgrounds[0].id;
    //}

    return Scaffold(
      appBar: AppBar(title: Text("Aircrest")),
      body: Column(
        children: [
          TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Name")),
          RaisedButton(
              onPressed: () {
                print("TEST");
                Redux.store.dispatchFuture(GetBackgroundsAction());
                //CreateCharacterAction(backgroundId: null, name: null));
              },
              child: Text("Create")),
          Text(text)
        ],
      ),
    );
  }
}

class NewCharacterViewModel extends BaseModel<AppState> {
  NewCharacterViewModel();

  List<EntityNetworkModel> backgrounds;

  NewCharacterViewModel.build({
    @required this.backgrounds,
  }) : super(equals: [backgrounds]);

  @override
  NewCharacterViewModel fromStore() {
    List<EntityNetworkModel> backgrounds =
        state.ofType(EntityType.characterBackground);
    backgrounds.sort((a, b) => a.id.compareTo(b.id));
    print("From store");
    return NewCharacterViewModel.build(backgrounds: backgrounds);
  }
}
