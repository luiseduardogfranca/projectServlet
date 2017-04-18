package system;

public class Date {
	 
	public static String formatNormal(String data){
	        
			//para amazenar data convertida
	        String novaData = null;

	        //se data estiver correta
	        String[] garantia = data.split("-");
	        if (garantia.length == 3) {
	            int ano = Integer.parseInt(garantia[0]);
	            int mes = Integer.parseInt(garantia[1]);
	            int dia = Integer.parseInt(garantia[2]);
	            
	            String anoTexto = String.valueOf(ano);
	            String mesTexto = String.valueOf(mes);
	            String diaTexto = String.valueOf(dia);

	            if (ano > 0 && ano < 10){
	            	anoTexto = "0" + String.valueOf(ano);
	            }
	            if (mes > 0 && mes < 10){
	            	mesTexto = "0" + String.valueOf(mes);
	            }
	            if (dia > 0 && dia < 10){
	            	diaTexto = "0" + String.valueOf(dia);
	            }
	            
	            

	            novaData = diaTexto + "/" + mesTexto + "/" + anoTexto;
	        }

	        //se tudo de certo, e retornado a data convertida
	        return novaData;
	    }
}
