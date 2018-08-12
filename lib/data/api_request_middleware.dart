import 'dart:async';
import 'package:hn_app/api/hn_api.dart';
import 'package:hn_app/data/actions.dart';
import 'package:hn_app/data/entities.dart';
import 'package:redux/redux.dart';

var _storyCache = new Map<int, Story>();

class ApiRequestMiddleWare<S> implements MiddlewareClass<S> {
  @override
  void call(Store<S> store, action, NextDispatcher next) async {
    if (action is FetchStoriesAction) {
      if (action.forRequest) {
        next(action);
        Iterable<int> ids = (await HnApi().topStoryIds()).take(10);
        List<Story> items = await Future.wait(ids.map((id) =>
            _storyCache.containsKey(id)
                ? Future.value(_storyCache[id])
                : HnApi().item(id)));
        print("[items]: $items");
        store.dispatch(FetchStoriesAction(forRequest: false, response: items));

        items.forEach((s) => _storyCache[s.id] = s);
        print("[cache]: $_storyCache");
        return;
      }
    }
    next(action);
  }
}
