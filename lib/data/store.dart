import 'package:hn_app/data/api_request_middleware.dart';
import 'package:hn_app/data/entities.dart';
import 'package:hn_app/data/reducers.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:redux_logging/redux_logging.dart';

Store<AppState> configureStore() {
  return new DevToolsStore<AppState>(reducer,
      initialState: AppState.initial(),
      middleware: [ApiRequestMiddleWare(), LoggingMiddleware.printer()]);
}
