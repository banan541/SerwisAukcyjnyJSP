<%-- 
    Document   : kupWynik
    Created on : 2017-09-21, 11:46:07
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <%
       
try{
String połączenieAdres = "jdbc:mysql://localhost:3306/serwisaukcyjnybaza";
Connection połączenie = null;
Statement zapytanie = null;
ResultSet wynik = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
połączenie = DriverManager.getConnection(połączenieAdres, "root", "");
zapytanie = połączenie.createStatement();


//GENEROWANIE ID UZYTKOWNIKA:
String login = request.getParameter("login");
String haslo = request.getParameter("haslo");
String QueryString = "SELECT IDUzytkownika FROM `uzytkownik` WHERE Login = '"+login+"' AND Haslo = '"+haslo+"' ";
wynik = zapytanie.executeQuery(QueryString);
wynik.next();
String foundType = wynik.getString(1);

int pobraneID = Integer.parseInt(foundType); 
QueryString = "INSERT INTO `transakcja` (`IDKupujacego`, `IDPrzedmiotu`, `ilosc`, `wniosekOpis`, `cenaProduktu`, `czyNegocjowana`, `IDTransport`, `cenaTransportu`) "
        + "VALUES ('"+pobraneID+"', '1', '1', NULL, NULL, NULL, '1', '15')";
zapytanie.executeUpdate(QueryString);
out.println("Kupiłeś przedmiot!");
}
 catch (Exception e)
{
    out.println("Błąd:"+e);
} 
            %>           
        </h1>

    </body>
</html>
