// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

class Place {
  const Place({
    this.name = '',
    this.street = '',
    this.state = '',
    required this.country,
    this.houseNumber = '',
  });

  factory Place.fromJson(Map<String, dynamic> map) {
    final Map<String, dynamic> props =
        map['properties']! as Map<String, dynamic>;

    return Place(
      name: props['name'] as String? ?? '',
      street: props['street'] as String? ?? '',
      state: props['state'] as String? ?? '',
      country: props['country'] as String? ?? '',
      houseNumber: props['housenumber'] as String? ?? '',
    );
  }
  final String name;
  final String street;
  final String state;
  final String country;
  final String houseNumber;

  bool get hasState => state.isNotEmpty == true;
  bool get hasName => name.isNotEmpty == true;
  bool get hasStreet => street.isNotEmpty == true;
  bool get hasCountry => country.isNotEmpty == true;
  bool get hasHouseNumber => houseNumber.isNotEmpty == true;

  bool get isCountry => hasCountry && name == country;
  bool get isState => hasState && name == state;

  String get getBaseName {
    if (hasName) {
      return name;
    }
    if (hasStreet) {
      return street;
    }
    return '';
  }

  String get level1Address {
    // return '$houseNumber, $getBaseName';
    if (hasHouseNumber) {
      return '$houseNumber, $getBaseName';
    }
    return getBaseName;
  }

  String get address {
    if (isCountry) {
      return country;
    }

    if (hasHouseNumber) {
      return '$houseNumber, $getBaseName, $level2Address';
    }

    return '$getBaseName, $level2Address';
  }

  String get addressShort {
    if (isCountry) {
      return country;
    }
    return '$getBaseName, $country';
  }

  String get level2Address {
    if (isCountry || isState || !hasState) {
      return country;
    }
    if (!hasCountry) {
      return state;
    }
    return '$state, $country';
  }

  @override
  String toString() =>
      'Place(houseNumber: $houseNumber, name: $getBaseName, state: $state, country: $country)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is Place &&
        other.name == name &&
        other.state == state &&
        other.country == country &&
        other.houseNumber == houseNumber &&
        other.street == street;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      state.hashCode ^
      country.hashCode ^
      houseNumber.hashCode ^
      street.hashCode;
}
