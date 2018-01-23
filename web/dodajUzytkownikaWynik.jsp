<%@page import="java.sql.*,java.util.*,java.text.SimpleDateFormat,java.util.Date;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dodaj Uzytkownika Wynik</title>
    </head>
<BODY>
<p align="center">
    <%

    
    String Login=request.getParameter("Login");
    String Haslo=request.getParameter("Haslo");
    String Imie=request.getParameter("Imie");
    String Nazwisko=request.getParameter("Nazwisko");
    int numerTelefonu=Integer.parseInt(request.getParameter("numerTelefonu"));
    String email=request.getParameter("email");
    int nip=Integer.parseInt(request.getParameter("nip"));
    String dataUrodzenia=request.getParameter("dataUrodzenia");
    String adresPierwszaLinijka=request.getParameter("adresPierwszaLinijka");
    String adresDrugaLinijka=request.getParameter("adresDrugaLinijka");


            try{
             Class.forName("com.mysql.jdbc.Driver");
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/serwisaukcyjnybaza","root","");
               Statement st=con.createStatement();
               int i=st.executeUpdate("insert into uzytkownik(Login, Haslo, Imie, Nazwisko, telefonNumer, email, nip, dataUrodzenia, adresPierwszaLinijka, adresDrugaLinijka) "+
                       " values('"+Login+"','"+Haslo+"','"+Imie+"','"+Nazwisko+"','"+numerTelefonu+"','"+email+"','"+nip+"','"+dataUrodzenia+"','"+adresPierwszaLinijka+"','"+adresDrugaLinijka+"')");
            out.println("Poprawnie dodano dane!");
            con.close();
            st.close();
            }

            catch(Exception e){
            out.println("Błąd: "+e);
            }
        
    %>
</p>       

</BODY>
</html>