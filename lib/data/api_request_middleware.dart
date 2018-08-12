import 'dart:async';
import 'package:hn_app/api/hn_api.dart';
import 'package:hn_app/data/actions.dart';
import 'package:hn_app/data/entities.dart';
import 'package:redux/redux.dart';

class ApiRequestMiddleWare<S> implements MiddlewareClass<S> {
  @override
  void call(Store<S> store, action, NextDispatcher next) async {
    if (action is FetchStoriesAction) {
      if (action.forRequest) {
        print("[action] request ");
        next(action);
        Iterable<int> ids = (await HnApi().topStoryIds()).take(10);
        List<Story> items = await Future.wait(ids.map((id) => HnApi().item(id)));
        print("[items]: $items");
        store.dispatch(FetchStoriesAction(false, items, null));
        return;
      }
      next(action);
    }
  }
}
