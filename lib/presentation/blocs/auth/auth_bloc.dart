import 'package:bloc/bloc.dart';
import 'package:crypto_management_task/application/dtos/dto.dart';
import 'package:crypto_management_task/application/dtos/login_dto.dart';
import 'package:crypto_management_task/application/transactions/check_user_is_login_transaction.dart';
import 'package:crypto_management_task/application/transactions/login_transaction.dart';
import 'package:crypto_management_task/domain/value_objects/email.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginTransaction _loginTransaction;
  final CheckUserIsLoginTransaction _checkUserIsLoginTransaction;
  AuthBloc(this._loginTransaction, this._checkUserIsLoginTransaction)
    : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<CheckUserIsLoginStatus>(_onCheckUserIsLogin);
  }

  void _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final loginDto = LoginDto(Email(event.email), event.password);
      await _loginTransaction(loginDto);
      emit(Authenticated());
    } catch (e) {
      emit(Unauthenticated(e.toString()));
    }
  }

  void _onCheckUserIsLogin(
    CheckUserIsLoginStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final result = await _checkUserIsLoginTransaction(NoDto());
      if (result) {
        emit(Authenticated());
      } else {
        emit(Unauthenticated('User is not logged in'));
      }
    } catch (e) {
      emit(Unauthenticated(e.toString()));
    }
  }
}
