import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'formatter_providers.g.dart';

@riverpod
DateFormat formatDate(FormatDateRef ref, {String pattern = 'dd-MM-yyyy'}) {
  return DateFormat(pattern);
}

@riverpod
String currentTime(CurrentTimeRef ref) {
  return ref
      .read(formatDateProvider(pattern: 'yyyy-MM-dd HH:mm:ss.sss'))
      .format(DateTime.now());
}

@riverpod
String formattedDate(
  FormattedDateRef ref,
  DateTime date, {
  String pattern = 'dd-MM-yyyy',
}) {
  return ref.watch(formatDateProvider(pattern: pattern)).format(date);
}

@riverpod
NumberFormat currencyFormatter(CurrencyFormatterRef ref, {String? locale}) {
  /// Currency formatter to be used in the app.
  /// * If `en_US` is hardcoded to ensure all prices show with a dollar sign ($)
  return NumberFormat.currency(locale: locale);
}
