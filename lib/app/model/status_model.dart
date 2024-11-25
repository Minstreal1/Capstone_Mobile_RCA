class StatusModel {
  String? status;
  String description;
  StatusModel({ this.status, required this.description});
}

List<StatusModel> listStatus =[
  StatusModel(status: null, description: 'Tất cả'),
  StatusModel(status: 'PENDING', description: 'Đợi xác nhận'),
  StatusModel(status: 'ACCEPTED', description: 'Đã xác nhận'),


];