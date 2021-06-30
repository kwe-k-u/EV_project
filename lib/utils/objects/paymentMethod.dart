

class PaymentMethod{
  late String name;
  late String value;
  late PaymentMethodType type;

}



enum PaymentMethodType{
  cash,
  mobile_money,
  credit_card
}