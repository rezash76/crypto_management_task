import 'package:crypto_management_task/core/utils/form_validations/validation.dart';
import 'package:crypto_management_task/core/utils/form_validations/validator.dart';
import 'package:crypto_management_task/domain/entities/user.dart';
import 'package:crypto_management_task/presentation/blocs/profile/profile_cubit.dart';
import 'package:crypto_management_task/presentation/widgets/main_button.dart';
import 'package:crypto_management_task/presentation/widgets/main_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  User? _user;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    context.read<ProfileCubit>().getUserProfile();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Phone number updated!')),
            );
          } else if (state is ProfileUpdateError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          //  if (state is ProfileLoaded) {
          if (state is ProfileLoaded) {
            _user = state.user;
            _fillUserControllers(_user);
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  MainTextFormField(
                    controller: _nameController,
                    labelText: 'Name',
                    enabled: false,
                  ),
                  const SizedBox(height: 16),
                  MainTextFormField(
                    controller: _emailController,
                    labelText: 'Email',
                    enabled: false,
                  ),
                  const SizedBox(height: 16),
                  MainTextFormField(
                    controller: _phoneController,
                    labelText: 'Phone Number',
                    validator: Validator.apply(context, [PhoneValidation()]),
                  ),
                  const SizedBox(height: 24),
                  MainButton(
                    isLoading: state is ProfileUpdateLoading,
                    onTap: _updatePhoneNumber,
                    title: 'Save',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _fillUserControllers(User? user) {
    _nameController.text = user?.name ?? '';
    _emailController.text = user?.email.value ?? '';
    _phoneController.text = user?.phoneNumber?.value ?? '';
  }

  void _updatePhoneNumber() {
    if (_formKey.currentState!.validate()) {
      context.read<ProfileCubit>().updatePhoneNumber(
        _phoneController.text,
        _user?.id ?? 0,
      );
    }
  }
}
