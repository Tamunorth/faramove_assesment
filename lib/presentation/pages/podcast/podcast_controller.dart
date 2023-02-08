// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
//
// class PodcastController extends StateNotifier<PodcastState>{
//
//   PodcastController(this.ref) : super(PodcastInitial());
//   final StateNotifierProviderRef ref;
//
//   Future<void> caller() async {
//     try {
//       state = PodcastLoading();
//
//       state = PodcastSuccess();
//     } catch (e) {
//       state = PodcastError(e.toString());
//     }
//   }
//
//
// }
//
//
// final podcastProvider =
//     StateNotifierProvider<PodcastController, PodcastState>((ref) {
//   return PodcastController(ref);
// });
//
//
//
//  abstract class PodcastState {}
//
//  class PodcastInitial extends PodcastState {}
//
//  class PodcastLoading extends PodcastState {}
//
//  class PodcastSuccess extends PodcastState {}
//
//  class PodcastError extends PodcastState {
//    final String message;
//
//    PodcastError(this.message);
//  }
