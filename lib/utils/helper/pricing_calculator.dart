

class TPricingCalculator{
static double calculateTotalPrice(double productPrice, String location){
  double taxRate = getTaxRateForLocation(location);
  double taxAmount = productPrice * taxRate ;

  double shippingcost = getShippingCost(location);

  double totalPrice = productPrice + taxAmount + shippingcost;

  return totalPrice;
}

static double getTaxRateForLocation(String location){
  return 0.10;

}
static double getShippingCost(String location){
  return 5.00;

}



static String calculateShippingCost(double productPrice, String location){
  double shippingcost = getShippingCost(location);
  return shippingcost.toStringAsFixed(2);
    



}
static String calculateTax(double productPrice, String location){
  
    double taxRate = getTaxRateForLocation(location);
    
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);


}


}