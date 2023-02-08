// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
//
// class BaseScaffoldController extends StateNotifier<BaseScaffoldState>{
//
//   BaseScaffoldController(this.ref) : super(BaseScaffoldInitial());
//   final StateNotifierProviderRef ref;
//
//   Future<void> caller() async {
//     try {
//       state = BaseScaffoldLoading();
//
//       state = BaseScaffoldSuccess();
//     } catch (e) {
//       state = BaseScaffoldError(e.toString());
//     }
//   }
//
//
// }
//
//
// final base_scaffoldProvider =
//     StateNotifierProvider<BaseScaffoldController, BaseScaffoldState>((ref) {
//   return BaseScaffoldController(ref);
// });
//
//
//
//  abstract class BaseScaffoldState {}
//
//  class BaseScaffoldInitial extends BaseScaffoldState {}
//
//  class BaseScaffoldLoading extends BaseScaffoldState {}
//
//  class BaseScaffoldSuccess extends BaseScaffoldState {}
//
//  class BaseScaffoldError extends BaseScaffoldState {
//    final String message;
//
//    BaseScaffoldError(this.message);
//  }
