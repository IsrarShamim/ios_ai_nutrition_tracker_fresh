import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../../../data/database/entities/user_information.dart';
import '../../../data/database/repositories/user_information_repo.dart';
import '../../auth/welcomescreens/2GoogleSignInScreen.dart';
import 'WeightGraph.dart';
// Import the WeightTrackerGraph widget we created earlier

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserInfoRepository _repository;
  UserInformationEntity? _userInfo;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _repository = Provider.of<UserInfoRepository>(context, listen: false);
    _loadUserInfo();
  }

  // Example of adding a new weight record
  Future<void> _addNewWeight(double weight) async {
    logger.d("weighting");
    await _repository.addWeightRecord(weight);
    await _loadUserInfo(); // Reload the UI
  }

  Future<void> _loadUserInfo() async {
    final userInfo = await _repository.getUserInformationEntity();
    setState(() {
      _userInfo = userInfo;
      _isLoading = false;
    });
  }

  Future<void> _showEditDialog({
    required String title,
    required String initialValue,
    required Function(String) onSave,
    TextInputType keyboardType = TextInputType.text,
  }) async {
    String value = initialValue;
    await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Edit $title'),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: CupertinoTextField(
            placeholder: initialValue,
            keyboardType: keyboardType,
            onChanged: (newValue) => value = newValue,
            decoration: BoxDecoration(
              border: Border.all(color: CupertinoColors.systemGrey4),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            child: const Text('Save'),
            onPressed: () {
              onSave(value);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection({
    required String title,
    required String value,
    required Function() onEdit,
    bool isMultiline = false,
  }) {
    // Make the profile sections more compact
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      // Reduced vertical margin
      decoration: BoxDecoration(
        color: CupertinoColors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8), // Slightly smaller radius
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        // Reduced padding
        onPressed: onEdit,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    '$title: ',
                    style: const TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              CupertinoIcons.chevron_right,
              color: CupertinoColors.systemGrey,
              size: 16, // Smaller icon
            ),
          ],
        ),
      ),
    );
  }

  /// Displays a confirmation dialog for logging out.
  Future<void> _showLogoutConfirmationDialog() async {
    await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text("Confirm Logout"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text("Log Out"),
            onPressed: () async {
              Navigator.pop(context); // Dismiss the dialog
              await FirebaseAuth.instance.signOut();
              context.goNamed('welcome', extra: {'clearStack': true});
            },
          ),
        ],
      ),
    );
  }

  /// Builds a custom-styled logout button.
  Widget _buildLogoutButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFEA544C),
            Color(0xFFA95353),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CupertinoButton(
        padding: const EdgeInsets.all(16),
        onPressed: _showLogoutConfirmationDialog,
        child: const Text(
          'Log Out',
          style: TextStyle(
            color: CupertinoColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.orange.shade50,
              Colors.blueGrey.shade50,
              Colors.blueGrey.shade50,
              Colors.white,
            ],
          ),
        ),
        child: _isLoading
            ? const Center(child: CupertinoActivityIndicator())
            : SafeArea(
                child: ListView(
                  padding: const EdgeInsets.only(top: 16),
                  children: [
                    // Profile Header (made smaller)
                    Row(
                      children: [
                        const SizedBox(width: 16),
                        Container(
                          width: 60, // Smaller profile picture
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CupertinoColors.systemGrey5,
                            border: Border.all(
                              color: CupertinoColors.systemGrey4,
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.person_fill,
                              size: 30,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _userInfo?.name ?? '',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${_userInfo?.age ?? 0} years',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: CupertinoColors.systemGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Weight Tracking Graph
                    if (_userInfo != null &&
                        _userInfo!.weightRecords.isNotEmpty &&
                        _userInfo!.weightRecordsTime.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: WeightTrackerGraph(
                          weightRecords: _userInfo!.weightRecords,
                          weightRecordsTime: _userInfo!.weightRecordsTime,
                          weightUnit: _userInfo!.weightUnit,
                          onUpdateWeight: () {
                            _showEditDialog(
                              title: 'Weight',
                              initialValue: '${_userInfo?.weight ?? 0}',
                              keyboardType: TextInputType.number,
                              onSave: (value) async {
                                await _repository
                                    .updateWeight(double.parse(value));
                                _addNewWeight(double.parse(value));
                                _loadUserInfo();
                              },
                            );
                          },
                        ),
                      ),

                    const SizedBox(height: 24),

                    // Section title for profile information
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Profile Information',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ),

                    // Personal Information Sections
                    _buildProfileSection(
                      title: 'Name',
                      value: _userInfo?.name ?? '',
                      onEdit: () => _showEditDialog(
                        title: 'Name',
                        initialValue: _userInfo?.name ?? '',
                        onSave: (value) async {
                          await _repository.updateName(value);
                          _loadUserInfo();
                        },
                      ),
                    ),
                    _buildProfileSection(
                      title: 'Age',
                      value: '${_userInfo?.age ?? 0} years',
                      onEdit: () => _showEditDialog(
                        title: 'Age',
                        initialValue: '${_userInfo?.age ?? 0}',
                        keyboardType: TextInputType.number,
                        onSave: (value) async {
                          await _repository.updateAge(int.parse(value));
                          _loadUserInfo();
                        },
                      ),
                    ),
                    _buildProfileSection(
                      title: 'Weight',
                      value:
                          '${_userInfo?.weight ?? 0} ${_userInfo?.weightUnit ?? 'kg'}',
                      onEdit: () => _showEditDialog(
                        title: 'Weight',
                        initialValue: '${_userInfo?.weight ?? 0}',
                        keyboardType: TextInputType.number,
                        onSave: (value) async {
                          await _repository.updateWeight(double.parse(value));
                          _loadUserInfo();
                        },
                      ),
                    ),
                    _buildProfileSection(
                      title: 'Height',
                      value:
                          '${_userInfo?.height ?? 0} ${_userInfo?.heightUnit ?? 'cm'}',
                      onEdit: () => _showEditDialog(
                        title: 'Height',
                        initialValue: '${_userInfo?.height ?? 0}',
                        keyboardType: TextInputType.number,
                        onSave: (value) async {
                          await _repository.updateHeight(double.parse(value));
                          _loadUserInfo();
                        },
                      ),
                    ),
                    _buildProfileSection(
                      title: 'Gender',
                      value: _userInfo?.gender ?? '',
                      onEdit: () async {
                        final option = await showCupertinoModalPopup<String>(
                          context: context,
                          builder: (context) => CupertinoActionSheet(
                            title: const Text('Select Gender'),
                            actions: ['Male', 'Female', 'Other']
                                .map((gender) => CupertinoActionSheetAction(
                                      onPressed: () =>
                                          Navigator.pop(context, gender),
                                      child: Text(gender),
                                    ))
                                .toList(),
                            cancelButton: CupertinoActionSheetAction(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                          ),
                        );
                        if (option != null) {
                          await _repository.updateGender(option);
                          _loadUserInfo();
                        }
                      },
                    ),
                    _buildProfileSection(
                      title: 'Diet',
                      value: _userInfo?.diet ?? '',
                      onEdit: () async {
                        final option = await showCupertinoModalPopup<String>(
                          context: context,
                          builder: (context) => CupertinoActionSheet(
                            title: const Text('Select Diet'),
                            actions: [
                              'Omnivore',
                              'Vegetarian',
                              'Vegan',
                              'Pescatarian',
                              'Keto',
                              'Paleo'
                            ]
                                .map((diet) => CupertinoActionSheetAction(
                                      onPressed: () =>
                                          Navigator.pop(context, diet),
                                      child: Text(diet),
                                    ))
                                .toList(),
                            cancelButton: CupertinoActionSheetAction(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                          ),
                        );
                        if (option != null) {
                          await _repository.updateDiet(option);
                          _loadUserInfo();
                        }
                      },
                    ),
                    _buildProfileSection(
                      title: 'Activity Level',
                      value: _userInfo?.currentActivityLevel ?? '',
                      onEdit: () async {
                        final option = await showCupertinoModalPopup<String>(
                          context: context,
                          builder: (context) => CupertinoActionSheet(
                            title: const Text('Select Activity Level'),
                            actions: [
                              'Sedentary',
                              'Lightly Active',
                              'Moderately Active',
                              'Very Active',
                              'Extra Active'
                            ]
                                .map((level) => CupertinoActionSheetAction(
                                      onPressed: () =>
                                          Navigator.pop(context, level),
                                      child: Text(level),
                                    ))
                                .toList(),
                            cancelButton: CupertinoActionSheetAction(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                          ),
                        );
                        if (option != null) {
                          await _repository.updateCurrentActivityLevel(option);
                          _loadUserInfo();
                        }
                      },
                    ),

                    const SizedBox(height: 24),

                    // Log Out Button with Confirmation Dialog
                    _buildLogoutButton(),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
      ),
    );
  }
}
