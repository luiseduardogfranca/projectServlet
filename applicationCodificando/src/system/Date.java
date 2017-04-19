package system;

public class Date {
	 
	public static String formatNormal(String dateSQL){
	        
	        String newDate = null;

	        String[] date = dateSQL.split("-");
	        if (date.length == 3) {
	            int year = Integer.parseInt(date[0]);
	            int month = Integer.parseInt(date[1]);
	            int day = Integer.parseInt(date[2]);
	            
	            String anoTexto = String.valueOf(year);
	            String mesTexto = String.valueOf(month);
	            String diaTexto = String.valueOf(day);

	            if (year > 0 && year < 10){
	            	anoTexto = "0" + String.valueOf(year);
	            }
	            if (month > 0 && month < 10){
	            	mesTexto = "0" + String.valueOf(month);
	            }
	            if (day > 0 && day < 10){
	            	diaTexto = "0" + String.valueOf(day);
	            }
	            
	            

	            newDate = diaTexto + "/" + mesTexto + "/" + anoTexto;
	        }

	        return newDate;
	    }
}
