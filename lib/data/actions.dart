import 'package:hn_app/data/entities.dart';

class FetchStoriesAction {
    bool forRequest;
    List<Story> response;
    Exception exception;

    FetchStoriesAction(this.forRequest, this.response, this.exception);
}
