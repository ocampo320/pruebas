class OrderDetail {
  String typeOrder;
  String authorizationCode;
  String state;
  String observation;
  String deliverDate;
  String invoiceNumber;
  String uniqueTransportationGuide;
  String guideValidity;
  String typeTransport;
  String borderQuota;
  String nationalQuota;
  String additional;

  OrderDetail(
      this.typeOrder,
      this.authorizationCode,
      this.state,
      this.observation,
      this.deliverDate,
      this.invoiceNumber,
      this.uniqueTransportationGuide,
      this.guideValidity,
      this.typeTransport,
      this.borderQuota,
      this.nationalQuota,
      this.additional);
}
