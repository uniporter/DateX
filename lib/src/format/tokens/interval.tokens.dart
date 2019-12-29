import 'dart:math';

import 'package:datex/src/format/tokens/format_token.dart';
import 'package:datex/src/format/tokens/utility.tokens.dart';
import 'package:datex/src/core/interval.dart';
import 'package:datex/src/units/conversion.dart';

/// Identified by `DD...`, where [len] is determined by the number of `D`. Returns the total days spanned by [i] padded to length [len].
FormatToken<Interval> totalDays(int len) => (i) {
    final output = i.asDays().truncate().abs().toString();
    return output.length <= len ? output.substring(0, len) : output.padLeft(len, '0');
};

/// Identified by `HH...`, where [len] is determined by the number of `H`. Returns the total hours spanned by [i] padded to length [len].
FormatToken<Interval> totalHours(int len) => (i) {
    final output = i.asHours().truncate().abs().toString();
    return output.length <= len ? output.substring(0, len) : output.padLeft(len, '0');
};

/// Identified by `h`. Returns hours within a day without padding.
String h(Interval i) => i.hour.abs().toString();
/// Identified by `hh`. Returns hours within a day padded to length 2.
String hh(Interval i) => pad(h, 2)(i);

/// Identified by `MM...`, where [len] is determined by the number of `M`. Returns the total minutes spanned by [i] padded to length [len].
FormatToken<Interval> totalMinutes(int len) => (i) {
    final output = i.asMinutes().truncate().abs().toString();
    return output.length <= len ? output.substring(0, len) : output.padLeft(len, '0');
};

/// Identified by `m`. Returns minutes within an hour without padding.
String m(Interval i) => i.minute.abs().toString();
/// Identified by `mm`. Returns hours within an hour padded to length 2.
String mm(Interval i) => pad(m, 2)(i);

/// Identified by `SS...`, where [len] is determined by the number of `S`. Returns the total seconds spanned by [i] padded to length [len].
FormatToken<Interval> totalSeconds(int len) => (i) {
    final output = i.asSeconds().truncate().abs().toString();
    return output.length <= len ? output.substring(0, len) : output.padLeft(len, '0');
};

/// Identified by `s`. Returns seconds within a minute without padding.
String s(Interval i) => i.minute.abs().toString();
/// Identified by `ss`. Returns seconds within a minute padded to length 2.
String ss(Interval i) => pad(m, 2)(i);

/// Identified by `+`. Returns the sign of `i`.
String plus(Interval i) => i.asMicroseconds() >= 0 ? '+' : '-';

/// Identified by `-`. Returns the sign of `i` only when `i` is negative.
String minus(Interval i) => i.asMicroseconds() < 0 ? '-' : '';

/// Returns a token that displays [len]-digit fractional seconds.
FormatToken<Interval> fracSecConstLength(int len) => (i) {
    final remainder = i.millisecond * microsecondsPerMillisecond + i.microsecond;
    final output = len <= 6 ? remainder ~/ pow(10, (6 - len)) : remainder;
    return output.toString().padRight(len, '0');
};

/// Returns a token taht displays fractional seconds to the highest precision at most [len]-digit.
FormatToken<Interval> fracSecMinLength(int len) => (i) {
    final remainder = i.millisecond * microsecondsPerMillisecond + i.microsecond;
    return (remainder ~/ pow(10, 6 - len)).toString();
};