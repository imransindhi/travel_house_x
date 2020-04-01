class PackagesInformation {
  String holidayName;
  String packageDescription;
  String holidayAvailableFrom;
  String holidayAvailableTo;
  String holidayTravelDateFrom;
  String holidayTravelDateTo;
  String noOfNights;
  String noOfDays;
  String starRating;
  String packagePrice;
  String primaryImage;

  PackagesInformation(
        this.holidayName,
        this.packageDescription,
        this.holidayAvailableFrom,
        this.holidayAvailableTo,
        this.holidayTravelDateFrom,
        this.holidayTravelDateTo,
        this.noOfNights,
        this.noOfDays,
        this.starRating,
        this.packagePrice,
        this.primaryImage);

  PackagesInformation.fromJson(Map<String, dynamic> json) {
    holidayName = json['holiday_name'];
    packageDescription = json['package_description'];
    holidayAvailableFrom = json['holiday_available_from'];
    holidayAvailableTo = json['holiday_available_to'];
    holidayTravelDateFrom = json['holiday_travel_date_from'];
    holidayTravelDateTo = json['holiday_travel_date_to'];
    noOfNights = json['no_of_nights'];
    noOfDays = json['no_of_days'];
    starRating = json['star_rating'];
    packagePrice = json['package_price'];
    primaryImage = json['primary_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['holiday_name'] = this.holidayName;
    data['package_description'] = this.packageDescription;
    data['holiday_available_from'] = this.holidayAvailableFrom;
    data['holiday_available_to'] = this.holidayAvailableTo;
    data['holiday_travel_date_from'] = this.holidayTravelDateFrom;
    data['holiday_travel_date_to'] = this.holidayTravelDateTo;
    data['no_of_nights'] = this.noOfNights;
    data['no_of_days'] = this.noOfDays;
    data['star_rating'] = this.starRating;
    data['package_price'] = this.packagePrice;
    data['primary_image'] = this.primaryImage;
    return data;
  }
}