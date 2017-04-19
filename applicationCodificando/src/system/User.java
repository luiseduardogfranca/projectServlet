package system;

public class User {
	
	//constructor
	public User(String email, String password){
		this.email = email;
		this.password = password;
	}
	
	//attributes
	private String email;
	private String password;
	private String idLogin;
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setIdLogin(String idLogin) {
		this.idLogin = idLogin;
	}
	
	public String getIdLogin() {
		return idLogin;
	}
}
