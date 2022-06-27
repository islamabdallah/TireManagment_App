String formatNumber(String number){
  String formattedNumber = "";
  int counter = 0;
  for(int i = (number.length - 1);  i >= 0; i--){
    counter++;
    String str = number[i];
    if((counter % 3) != 0 && i !=0){
      formattedNumber = "$str$formattedNumber";
    }else if(i == 0 ){
      formattedNumber = "$str$formattedNumber";

    }else{
      formattedNumber = ",$str$formattedNumber";
    }
  }
  return formattedNumber.trim();
}