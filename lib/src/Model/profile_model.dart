class ProfileResponseModel {
  final String error;
  final String profileId;

  ProfileResponseModel({this.error, this.profileId});

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
        profileId: json["profileId"] != null ? json["profileId"] : "",
        error: json["message"] != null ? json["message"] : "");
  }
}

class ProfileRequestModel {
  String firstName,
      lastName,
      apt,
      city,
      state,
      country,
      address,
      email,
      password,
      phoneNumber,
      idProfileGroup,
      billingFirstName,
      billingLastName,
      billingAddress,
      billingApt,
      billingCity,
      billingState,
      billingCountry,
      billingZipcode,
      billingPhoneNumber,
      token;

  bool sameBillingAddress, samePaymentAddress;

  ProfileRequestModel(
      {this.firstName,
      this.lastName,
      this.apt,
      this.city,
      this.state,
      this.country,
      this.address,
      this.email,
      this.password,
      this.phoneNumber,
      this.idProfileGroup,
      this.sameBillingAddress,
      this.samePaymentAddress,
      this.billingAddress,
      this.billingApt,
      this.billingCity,
      this.billingCountry,
      this.billingFirstName,
      this.billingLastName,
      this.billingPhoneNumber,
      this.billingState,
      this.billingZipcode,
      this.token});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "firstName": firstName.trim(),
      "lastName": lastName.trim(),
      "apt": apt.trim(),
      "city": city.trim(),
      "state": state.trim(),
      "country": country.trim(),
      "address": address.trim(),
      "email": email.trim(),
      "password": password.trim(),
      "phoneNumber": phoneNumber.trim(),
      "idProfileGroup": idProfileGroup.trim(),
      "sameBillingAddress": sameBillingAddress,
      "samePaymentAddress": samePaymentAddress,
      "billingFirstName": billingFirstName.trim(),
      "billingLastName": billingLastName.trim(),
      "billingAddress": billingAddress.trim(),
      "billingApt": billingApt.trim(),
      "billingCity": billingCity.trim(),
      "billingState": billingState.trim(),
      "billingCountry": billingCountry.trim(),
      "billingZipcode": billingZipcode.trim(),
      "billingPhoneNumber": billingPhoneNumber.trim(),
      "token": token.trim()
    };

    return map;
  }
}
