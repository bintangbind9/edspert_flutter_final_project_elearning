import 'package:timeago/timeago.dart' as timeago;

class TimeAgo {
  String getIdShortTimeMessage(DateTime time) {
    timeago.setLocaleMessages('id_short', timeago.IdShortMessages());
    return timeago.format(time, locale: 'id_short');
  }

  String getIdTimeMessage(DateTime time) {
    timeago.setLocaleMessages('id', timeago.IdMessages());
    return timeago.format(time, locale: 'id');
  }
}