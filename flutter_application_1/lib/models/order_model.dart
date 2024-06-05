class OrderModel {
  late int id;
  late int userId;
  double? orderAmount;
  String? paymentStatus;
  String? paymentMethod;
  String? orderStatus;
  String? orderNote;
  String? createdAt;
  String? updatedAt;
  String? otp;
  String? pending;
  String? accepted;
  String? confirmed;
  String? processing;
  String? handover;
  String? picked_up;
  String? delivered;
  String? canceled;
  int? scheduled;
  String? failed;
  int? detailsCount;

  OrderModel({
    required this.id,
    required this.userId,
    this.orderAmount,
    this.paymentMethod,
    this.paymentStatus,
    this.orderNote,
    this.createdAt,
    this.updatedAt,
    this.otp,
    this.orderStatus,
    this.pending,
    this.accepted,
    this.confirmed,
    this.processing,
    this.handover,
    this.picked_up,
    this.delivered,
    this.canceled,
    this.scheduled,
    this.failed,
    this.detailsCount,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderAmount = json['order_amount'].toDouble();
    paymentStatus = json['payment_method'];
    paymentStatus = json['payment_status'] ?? "pending";
    orderNote = json['order_note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orderStatus = json['order_status'];
    otp = json['otp'];
    pending = json['pending'] ?? "";
    accepted = json['accepted'] ?? "";
    confirmed = json['confirmed'] ?? "";
    processing = json['processing'] ?? "";
    handover = json['handover'] ?? "";
    picked_up = json['picked_up'] ?? "";
    delivered = json['delivered'] ?? "";
    canceled = json['canceled'] ?? "";
    scheduled = json['scheduled'];
    failed = json['failed'] ?? "";
    detailsCount = json['details_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['order_amount'] = this.orderAmount;
    data['payment_method'] = this.paymentMethod;
    data['payment_status'] = this.paymentStatus;
    data['order_note'] = this.orderNote;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['otp'] = this.otp;
    data['pending'] = this.pending;
    data['accepted'] = this.accepted;
    data['confirmed'] = this.confirmed;
    data['processing'] = this.processing;
    data['handover'] = this.handover;
    data['picked_up'] = this.picked_up;
    data['delivered'] = this.delivered;
    data['canceled'] = this.canceled;
    data['scheduled'] = this.scheduled;
    data['failed'] = this.failed;
    data['details_count'] = this.detailsCount;
    return data;
  }
}
