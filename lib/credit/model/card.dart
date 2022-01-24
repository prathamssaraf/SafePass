final String tableCredit = 'credits';

class CreditFields {
  static final List<String> values = [
    /// Add all fields
    id, cvv, name, number, cardnumber, expiry, time
  ];

  static final String id = '_id';
  static final String cvv = 'cvv';
  static final String name = 'name';
  static final String number = 'number';
  static final String cardnumber = 'cardnumber';
  static final String expiry = 'expiry';
  static final String time = 'time';
}

class Credit {
  final int? id;
  final String cvv;
  final String name;
  final int number;
  final String cardnumber;
  final String expiry;
  final DateTime createdTime;

  const Credit({
    this.id,
    required this.cvv,
    required this.name,
    required this.number,
    required this.cardnumber,
    required this.expiry,
    required this.createdTime,
  });

  Credit copy({
    int? id,
    String? name,
    String? cvv,
    int? number,
    String? cardnumber,
    String? expiry,
    DateTime? createdTime,
  }) =>
      Credit(
        id: id ?? this.id,
        cvv: cvv ?? this.cvv,
        name: name ?? this.name,
        number: number ?? this.number,
        cardnumber: cardnumber ?? this.cardnumber,
        expiry: expiry ?? this.expiry,
        createdTime: createdTime ?? this.createdTime,
      );

  static Credit fromJson(Map<String, Object?> json) => Credit(
        id: json[CreditFields.id] as int?,
        cvv: json[CreditFields.cvv] as String,
        name: json[CreditFields.name] as String,
        number: json[CreditFields.number] as int,
        cardnumber: json[CreditFields.cardnumber] as String,
        expiry: json[CreditFields.expiry] as String,
        createdTime: DateTime.parse(json[CreditFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        CreditFields.id: id,
        CreditFields.cardnumber: cardnumber,
        CreditFields.cvv: cvv,
        CreditFields.name: name,
        CreditFields.number: number,
        CreditFields.expiry: expiry,
        CreditFields.time: createdTime.toIso8601String(),
      };
}
