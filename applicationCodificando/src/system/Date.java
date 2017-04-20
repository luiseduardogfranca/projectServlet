package system;

public class Date {
	
	public static boolean verifyDate(String date) {
		
        boolean validate = false;
        String[] dateSplit = date.split("/");
        
        if (dateSplit.length == 3) {
            int day = Integer.parseInt(dateSplit[0]);
            int month = Integer.parseInt(dateSplit[1]);
            int year = Integer.parseInt(dateSplit[2]);

            if ((day < 0 || day > 31) || (month < 0 || month > 12) || (year < 0)) {
                validate = false;
            }else{
                validate = true;
            }
        }else{
            validate = false;
        }

        return validate;
    }
	 
	public static String formatNormal(String dateSQL){
	        
	        String newDate = null;

	        String[] date = dateSQL.split("-");
	        if (date.length == 3) {
	            int year = Integer.parseInt(date[0]);
	            int month = Integer.parseInt(date[1]);
	            int day = Integer.parseInt(date[2]);
	            
	            String yearText = String.valueOf(year);
	            String monthText = String.valueOf(month);
	            String dayText = String.valueOf(day);

	            if (year > 0 && year < 10){
	            	yearText = "0" + String.valueOf(year);
	            }
	            if (month > 0 && month < 10){
	            	monthText = "0" + String.valueOf(month);
	            }
	            if (day > 0 && day < 10){
	            	dayText = "0" + String.valueOf(day);
	            }
	            
	            

	            newDate = dayText + "/" + monthText + "/" + yearText;
	        }

	        return newDate;
	    }
	
    public static String formatDatabse(String date){

    	String newDate = null;

        //se data estiver correta
        if(verifyDate(date)){
            String[] garantia = date.split("/");
            if (garantia.length == 3) {
                int day = Integer.parseInt(garantia[0]);
                int month = Integer.parseInt(garantia[1]);
                int year = Integer.parseInt(garantia[2]);

                newDate = year + "/" + month + "/" + day;
            }
        }

        //se tudo de certo, e retornado a data convertida
        return newDate;
    }
}
