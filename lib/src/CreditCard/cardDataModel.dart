class CardDataModel{
  final Map<String, dynamic> data;
  final String cardNameHolder;
  final String cardYearExpiration;
  final String cardNumber;
  final String cardMonthExpiration;
  final String paymentEmail;
 

  CardDataModel(
    {
      this.data,
      this.cardNameHolder,
      this.cardYearExpiration,
      this.cardNumber,
      this.cardMonthExpiration,
      this.paymentEmail
     
    }
  );

  factory CardDataModel.fromJson(Map<String,dynamic> json){
    return CardDataModel(
      data:{
        'cardMonthExpiration': json['cardMonthExpiration'],
         'cardNameHolder': json['cardNameHolder'],
         'cardNumber': json['cardNumber'],
         'cardYearExpiration': json['cardYearExpiration'],
         'paymentEmail': json['paymentEmail'],
      },
      cardMonthExpiration: json['cardMonthExpiration'],
     cardNameHolder : json['cardNameHolder'],
    cardNumber: json['cardNumber'],   
    cardYearExpiration: json['cardYearExpiration'],
    paymentEmail: json['paymentEmail']

    );
  } 



}