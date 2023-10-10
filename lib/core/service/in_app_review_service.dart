import 'package:in_app_review/in_app_review.dart';

class InAppReviewService {
  static final InAppReviewService instance = InAppReviewService._internal();

  factory InAppReviewService() => instance;

  InAppReviewService._internal();

  final InAppReview _instance = InAppReview.instance;

  Future<void> request() async {
    await _instance.requestReview();
  }

  Future<void> openStore() async {
    await _instance.openStoreListing();
  }
}
