package database;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;

public class CodificandoDAO {

	//singleton
	private CodificandoDAO(){}
	private static CodificandoDAO instance = new CodificandoDAO();
	public static CodificandoDAO getCodificandoDAO(){
		return instance;
	}

	//configuration of the databse
	private Connection connection;
	private Statement statement;

	public boolean connectDatabase(){

		//url
		String server = "127.0.0.1";
        String database = "codificando";
        String url = String.format("jdbc:mysql://%s:3306/%s??autoReconnect=true&useSSL=false", server, database);

        String password = "23111998";
        String user = "root";

        try{
          DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            Class.forName("com.mysql.jdbc.Driver");

            //open connection
            connection = DriverManager.getConnection(url, user, password);
            return true;
        }catch(SQLException excpetion){
            excpetion.printStackTrace();
        }catch (ClassNotFoundException notFound){
            notFound.printStackTrace();
        }

        return false;
	}

	public boolean insert(String insertSQL){

        boolean connected = connectDatabase();

        if(connected) {
            try {

                statement = connection.createStatement();
                statement.executeUpdate(insertSQL);
                return true;

            } catch (SQLException exception) {
                exception.printStackTrace();

            }finally {
                try {
                    connection.close();
                    statement.close();
                }catch (SQLException exception){
                    exception.printStackTrace();
                }
            }
        }

        return false;
    }

	public boolean delete(String deleteSQL){

		boolean connected = connectDatabase();

        if(connected) {
            try {

                statement = connection.createStatement();
                statement.executeUpdate(deleteSQL);
                return true;

            } catch (SQLException exception) {
                exception.printStackTrace();

            }finally {
                try {
                    connection.close();
                    statement.close();
                }catch (SQLException exception){
                    exception.printStackTrace();
                }
            }
        }

        return false;
	}

	public boolean update(String updateSQL){

		boolean connected = connectDatabase();

        if(connected) {
            try {

                statement = connection.createStatement();
                statement.executeUpdate(updateSQL);
                return true;

            } catch (SQLException exception) {
                exception.printStackTrace();

            }finally {
                try {
                    connection.close();
                    statement.close();
                }catch (SQLException exception){
                    exception.printStackTrace();
                }
            }
        }

        return false;
	}

	public ArrayList<String> read(String query, String attribute){

		boolean connected = connectDatabase();

        ArrayList<String> valueReturn = new ArrayList<String>();

        if(connected){
            try{
                statement = connection.createStatement();
                ResultSet retorno = statement.executeQuery(query);

                while (retorno.next()){
                    valueReturn.add(retorno.getString(attribute));
                }

            }catch(SQLException exception){
                exception.printStackTrace();

            }finally {
                try{
                    statement.close();
                    connection.close();
                }catch (SQLException exception){
                    exception.printStackTrace();
                }
            }
        }

        return valueReturn;
	}
}
