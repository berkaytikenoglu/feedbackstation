class PermissionModel {
  // İzinler için bool değişkenler
  String name;
  String category;

  bool canShowAdminPanel = false;
  bool canEditUser = false;
  bool canDeleteUser = false;
  bool canResponseRequest = false;
  bool canUploadAvatar = false;
  bool canAddFeedbackCategory = false;
  bool canDeleteFeedbackCategory = false;
  bool canReportRequest = false;

  PermissionModel({
    required this.name,
    required this.category,
    required this.canShowAdminPanel,
    required this.canEditUser,
    required this.canDeleteUser,
    required this.canResponseRequest,
    required this.canUploadAvatar,
    required this.canAddFeedbackCategory,
    required this.canDeleteFeedbackCategory,
    required this.canReportRequest,
  });

  // İzinleri güncelleme metodu
  void updatePermissions({
    bool? canShowAdminPanel,
    bool? canEditUser,
    bool? canDeleteUser,
    bool? canResponseRequest,
    bool? canUploadAvatar,
    bool? canAddFeedbackCategory,
    bool? canDeleteFeedbackCategory,
    bool? canReportRequest,
  }) {
    if (canShowAdminPanel != null) {
      this.canShowAdminPanel = canShowAdminPanel;
    }
    if (canEditUser != null) {
      this.canEditUser = canEditUser;
    }
    if (canDeleteUser != null) {
      this.canDeleteUser = canDeleteUser;
    }
    if (canResponseRequest != null) {
      this.canResponseRequest = canResponseRequest;
    }
    if (canUploadAvatar != null) {
      this.canUploadAvatar = canUploadAvatar;
    }

    if (canAddFeedbackCategory != null) {
      this.canAddFeedbackCategory = canAddFeedbackCategory;
    }
    if (canDeleteFeedbackCategory != null) {
      this.canDeleteFeedbackCategory = canDeleteFeedbackCategory;
    }
    if (canReportRequest != null) {
      this.canReportRequest = canReportRequest;
    }
  }
}
