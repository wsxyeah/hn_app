import 'package:hn_app/data/entities.dart';

class FetchStoriesAction {
  bool forRequest;
  List<Story> response;
  Exception exception;

  FetchStoriesAction({this.forRequest = true, this.response, this.exception});
}
