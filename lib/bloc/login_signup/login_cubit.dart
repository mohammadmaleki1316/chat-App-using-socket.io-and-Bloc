import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';


class LoginCubit extends Cubit<bool> {
  LoginCubit() : super(false);

  void trr() {
    emit(true);
  }
  void fll(){
    emit(false);

  }
}
