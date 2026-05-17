/// Rating given after completing or abandoning a toolkit exercise.
enum FeedbackRating {
  helped,     // 0
  somewhat,   // 1
  notReally;  // 2

  int get value => index;

  static FeedbackRating fromValue(int value) =>
      FeedbackRating.values[value.clamp(0, 2)];

  String get label => switch (this) {
        helped => 'Yes, it helped',
        somewhat => 'Somewhat',
        notReally => 'Not really',
      };

  String get emoji => switch (this) {
        helped => '😊',
        somewhat => '🤷',
        notReally => '😕',
      };
}