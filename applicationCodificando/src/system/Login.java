package system;

import java.util.ArrayList;

public class Login {

    //constutor
    public Login(User usuario){
        this.usuario = usuario;
        setIdLogin();
        usuario.setIdLogin(String.valueOf(idLogin));
    }

    //atributos
    private static int idUsuario = 0;
    private User usuario;
    private int idLogin;

    //lista de logins
    public static ArrayList<Login> logins = new ArrayList<Login>();

    //get's
    public User getUsuario(){
        return usuario;
    }

    public int getIdLogin(){
        return idLogin;
    }

    //atribui um id ao usuario logado
    public void setIdLogin(){
        idLogin = ++idUsuario;
    }

    //verifica se usuario esta logado
    public static boolean usuarioLogado(String email){
        boolean logado = false;
        for(int index = 0; index < logins.size(); index ++) {
            //recupera email
            String emailUsuario = logins.get(index).getUsuario().getEmail();

            //verifica se login corresponde
            if (emailUsuario.equals(email)) {
                logado = true;
            }
        }

        //retorna a resposta
        return logado;
    }

    //retorna login com base no ID de login
    public static String retornoEmail(int idLogin){
        String loginUser = null;

        //varre Array de logins a procura do login compativel com o ID passado
        for(Login login : logins){
            if(login.getIdLogin() == idLogin) {
                loginUser = login.getUsuario().getEmail();
            }
        }

        //retorna login caso exista com base no ID, ou retorna o null caso nao exista
        return loginUser;
    }

    //retorna ID de login com base no login
    public static int retornoIdLogin(String emailUser){
        int idLogin = 0;

        //varre Array de email a procura do login compativel com o ID passado
        for(Login login : logins){
            if(login.getUsuario().getEmail().equals(emailUser)) {
                idLogin = login.getIdLogin();
            }
        }

        //retorna login caso exista com base no ID, ou retorna o null caso nao exista
        return idLogin;
    }
}