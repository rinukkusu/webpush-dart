class VapidDetails {
  String subject;
  String publicKey;
  String privateKey;

  VapidDetails();
  VapidDetails.fromData(this.subject, this.publicKey, this.privateKey);
}
