class PackageInfo {
  String packageTypesId;
  String packageTypesName;
  String holidayDetailsId;
  String holidayCode;
  String countryId;
  String holidayName;
  String holidayTypes;
  String holidayDescription;
  String holidayNameArabic;
  String holidayDescriptionArabic;
  String packageDescription;
  String packageDescriptionArabic;
  String holidayAvailableFrom;
  String holidayAvailableTo;
  String holidayTravelDateFrom;
  String holidayTravelDateTo;
  String noOfNights;
  String noOfDays;
  String starRating;
  String packagePrice;
  String primaryImage;
  String status;
  String holidayLatitude;
  String holidayLogitude;
  Null holidayExtraDetails;
  String addedBy;
  String updatedBy;

  PackageInfo(
      {this.packageTypesId,
      this.packageTypesName,
      this.holidayDetailsId,
      this.holidayCode,
      this.countryId,
      this.holidayName,
      this.holidayTypes,
      this.holidayDescription,
      this.holidayNameArabic,
      this.holidayDescriptionArabic,
      this.packageDescription,
      this.packageDescriptionArabic,
      this.holidayAvailableFrom,
      this.holidayAvailableTo,
      this.holidayTravelDateFrom,
      this.holidayTravelDateTo,
      this.noOfNights,
      this.noOfDays,
      this.starRating,
      this.packagePrice,
      this.primaryImage,
      this.status,
      this.holidayLatitude,
      this.holidayLogitude,
      this.holidayExtraDetails,
      this.addedBy,
      this.updatedBy});

  PackageInfo.fromJson(Map<String, dynamic> json) {
    packageTypesId = json['package_types_id'];
    packageTypesName = json['package_types_name'];
    holidayDetailsId = json['holiday_details_id'];
    holidayCode = json['holiday_code'];
    countryId = json['country_id'];
    holidayName = json['holiday_name'];
    holidayTypes = json['holiday_types'];
    holidayDescription = json['holiday_description'];
    holidayNameArabic = json['holiday_name_arabic'];
    holidayDescriptionArabic = json['holiday_description_arabic'];
    packageDescription = json['package_description'];
    packageDescriptionArabic = json['package_description_arabic'];
    holidayAvailableFrom = json['holiday_available_from'];
    holidayAvailableTo = json['holiday_available_to'];
    holidayTravelDateFrom = json['holiday_travel_date_from'];
    holidayTravelDateTo = json['holiday_travel_date_to'];
    noOfNights = json['no_of_nights'];
    noOfDays = json['no_of_days'];
    starRating = json['star_rating'];
    packagePrice = json['package_price'];
    primaryImage = json['primary_image'];
    status = json['status'];
    holidayLatitude = json['holiday_latitude'];
    holidayLogitude = json['holiday_logitude'];
    holidayExtraDetails = json['holiday_extra_details'];
    addedBy = json['added_by'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_types_id'] = this.packageTypesId;
    data['package_types_name'] = this.packageTypesName;
    data['holiday_details_id'] = this.holidayDetailsId;
    data['holiday_code'] = this.holidayCode;
    data['country_id'] = this.countryId;
    data['holiday_name'] = this.holidayName;
    data['holiday_types'] = this.holidayTypes;
    data['holiday_description'] = this.holidayDescription;
    data['holiday_name_arabic'] = this.holidayNameArabic;
    data['holiday_description_arabic'] = this.holidayDescriptionArabic;
    data['package_description'] = this.packageDescription;
    data['package_description_arabic'] = this.packageDescriptionArabic;
    data['holiday_available_from'] = this.holidayAvailableFrom;
    data['holiday_available_to'] = this.holidayAvailableTo;
    data['holiday_travel_date_from'] = this.holidayTravelDateFrom;
    data['holiday_travel_date_to'] = this.holidayTravelDateTo;
    data['no_of_nights'] = this.noOfNights;
    data['no_of_days'] = this.noOfDays;
    data['star_rating'] = this.starRating;
    data['package_price'] = this.packagePrice;
    data['primary_image'] = this.primaryImage;
    data['status'] = this.status;
    data['holiday_latitude'] = this.holidayLatitude;
    data['holiday_logitude'] = this.holidayLogitude;
    data['holiday_extra_details'] = this.holidayExtraDetails;
    data['added_by'] = this.addedBy;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}
