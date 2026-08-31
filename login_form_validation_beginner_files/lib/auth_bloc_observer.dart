import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    // TODO: implement onCreate
    super.onCreate(bloc);
    print("${bloc.runtimeType} created -${bloc.state}");
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    print("$bloc change-$change");
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    print("$bloc transition $transition");
  }
}
