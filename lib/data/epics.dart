import 'dart:async';
import 'package:hn_app/api/hn_api.dart';
import 'package:hn_app/data/actions.dart';
import 'package:hn_app/data/entities.dart';
import 'package:redux_epics/redux_epics.dart';

var _storyCache = new Map<int, Story>();

Stream<dynamic> _fetchStoriesApiRequestEpic(
    Stream<dynamic> actions, EpicStore<AppState> store) {
  return actions
      .where((action) => action is FetchStoriesAction && action.forRequest)
      .asyncMap((action) async {
    try {
      Iterable<int> ids = (await HnApi().topStoryIds()).take(20);
      List<Story> items = await Future.wait(ids.map((id) =>
          _storyCache.containsKey(id)
              ? Future.value(_storyCache[id])
              : HnApi().item(id)));

//      print("[items]: $items");
      items.forEach((s) => _storyCache[s.id] = s);
//      print("[cache]: $_storyCache");

      return FetchStoriesAction(forRequest: false, response: items);
    } catch (e) {
      return FetchStoriesAction(forRequest: false, exception: e);
    }
  });
}

var appEpic = combineEpics([_fetchStoriesApiRequestEpic]);

var epicMiddleware = new EpicMiddleware(appEpic);
