import 'package:intl/intl.dart';

String formatTimestamp(String timestamp) {
  try {
    // Parse the timestamp into a DateTime object
    DateTime parsedDate = DateTime.parse(timestamp);

    // Format the DateTime object into "MMMM d, yyyy"
    return DateFormat("d,MMM yy").format(parsedDate);
  } catch (e) {
    // Handle invalid timestamps
    return "Invalid date";
  }
}
