import 'package:bloc/bloc.dart';
import 'package:crypto_management_task/application/dtos/dto.dart';
import 'package:crypto_management_task/application/dtos/update_user_dto.dart';
import 'package:crypto_management_task/application/transactions/get_user_profile_transaction.dart';
import 'package:crypto_management_task/application/transactions/update_user_phone_number_transaction.dart';
import 'package:crypto_management_task/domain/entities/user.dart';
import 'package:crypto_management_task/domain/value_objects/phone_number.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetUserProfileTransaction _getUserProfileTransaction;
  final UpdateUserPhoneNumberTransaction _updateUserPhoneNumberTransaction;
  ProfileCubit(
    this._getUserProfileTransaction,
    this._updateUserPhoneNumberTransaction,
  ) : super(ProfileInitial());

  Future<void> getUserProfile() async {
    emit(ProfileLoading());
    try {
      final user = await _getUserProfileTransaction(NoDto());
      emit(ProfileLoaded(user));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updatePhoneNumber(String phoneNumber, int userId) async {
    emit(ProfileUpdateLoading());
    try {
      final updateUser = UpdateUserDto(userId, PhoneNumber(phoneNumber));
      await _updateUserPhoneNumberTransaction(updateUser);
      emit(ProfileUpdateSuccess());
      await getUserProfile(); // Refresh user info
    } catch (e) {
      emit(ProfileUpdateError(e.toString()));
    }
  }
}
