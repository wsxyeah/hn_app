import 'package:hn_app/data/actions.dart';
import 'package:hn_app/data/entities.dart';

AppState reducer(AppState state, dynamic action) {
  if (action is FetchStoriesAction) {
    if (action.forRequest) {
      return (state.toBuilder()..isLoading = true).build();
    } else if (action.response != null) {
      return (state.toBuilder()
            ..update((b) => b
              ..isLoading = false
              ..items = (b.items
                ..clear()
                ..addIterable(action.response,
                    key: (item) => item.id, value: (item) => item))
              ..itemIds = (b.itemIds
                ..clear()
                ..addAll(action.response.map((item) => item.id)))))
          .build();
    } else {
      return (state.toBuilder()..isLoading = false).build();
    }
  }
  return state;
}
