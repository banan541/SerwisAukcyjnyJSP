<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kup przedmiot za pośrednictwem aukcji</title>
    </head>
    <body>
 
<!--Wyświetlenie nazwy produktu-->
<%
try{
String połączenieAdres = "jdbc:mysql://localhost:3306/serwisaukcyjnybaza";
Connection połączenie = null;
Statement zapytanie = null;
ResultSet wynik = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
połączenie = DriverManager.getConnection(połączenieAdres, "root", "");
zapytanie = połączenie.createStatement();
String QueryString = "SELECT nazwaPrzedmiotu FROM przedmiot WHERE IDPrzedmiotu=1";
wynik = zapytanie.executeQuery(QueryString);
wynik.next();
String foundType = wynik.getString(1);
%>
<h1> 
<%
        out.println(foundType);
        
%>  
</h1>

<!--WYŚWIETLANIE ZDJĘCIA-->
<!--<img src="#">-->

<!--WYŚWIETLANIE CENY PRZEDMIOTU-->
<%
    QueryString = "SELECT cenaKup FROM przedmiot WHERE IDPrzedmiotu=1";
    wynik = zapytanie.executeQuery(QueryString);
    wynik.next();
    foundType = wynik.getString(1);
%>
<h3>
    <%
        out.println("Cena Przedmiotu: "+ foundType +"zł" );
    %>
</h3>
<!--WYŚWITLENIE SPOSÓB TRANSPORTU-->
<h3>
    <%
    QueryString = "SELECT nazwaTransportu FROM przedmiot JOIN sposobtransportu ON przedmiot.IDTransport=sposobtransportu.IDTransport WHERE IDPrzedmiotu=1";
    wynik = zapytanie.executeQuery(QueryString);
    wynik.next();
    foundType = wynik.getString(1);
    out.println("Transport: "+ foundType +" ");
    
    QueryString = "SELECT cenaTransportu FROM przedmiot WHERE IDPrzedmiotu=1";
    wynik = zapytanie.executeQuery(QueryString);
    wynik.next();
    foundType = wynik.getString(1);
    out.println(foundType + "zł");
    %>
</h3>
<a>
    <h3>Kup:</h3>
    <form method="post" action="kupWynik.jsp">
        <table>
            <tr><td>Login:</td><td><input type="text" name="login"></td></tr>
            <tr><td>Hasło:</td><td><input type="password" name="haslo"></td></tr>
            <tr><td><input type="submit" value="Kup"></td></tr>
        </table>
    </form>

<!--<h3>Negocjuj:</h3>
<input type="text" name="negocjuj">
<button action="#">Negocjuj</button>-->
</a>
<h3>Opis przedmiotu:</h3>
<a>
<%
    QueryString = "SELECT opisPrzedmiotu FROM przedmiot WHERE IDPrzedmiotu=1";
    wynik = zapytanie.executeQuery(QueryString);
    wynik.next();
    foundType = wynik.getString(1);
    out.println(foundType);
%>
</a>
<!--ZAMKNIĘCIE POŁĄCZENIA-->
<%
    
wynik.close();
zapytanie.close();
połączenie.close();
}

catch (Exception e)
{
    out.println("Błąd:"+e);
}
%>

    </body>
</html>
