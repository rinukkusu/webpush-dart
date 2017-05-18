class PushSubscription {
  String endpoint;
  String p256dh;
  String auth;

  PushSubscription();
  PushSubscription.fromData(this.endpoint, this.p256dh, this.auth);
}
