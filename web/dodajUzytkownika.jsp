<%-- 
    Document   : dodajUzytkownika
    Created on : 2017-08-10, 15:32:15
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dodaj użytkownika </title>
    </head>
    <body>
        <h1>Rejestracja użytkownika:</h1>
        <form method="post" action="dodajUzytkownikaWynik.jsp">
            <table>
                <tr><td>Login:</td><td><input type="text" name="Login"></td></tr>
                <tr><td>Hasło:</td><td><input type="password" name="Haslo"></td></tr>
                <tr><td>Imie:</td><td><input type="text" name="Imie"></td></tr>
                <tr><td>Nazwisko:</td><td><input type="text" name="Nazwisko"></td></tr>
                <tr><td>Numer telefonu:</td><td><input type="tel" name="numerTelefonu"></td></tr>
                <tr><td>Adres e-mail:</td><td><input type="email" name="email" value="przykładowy@email.com"></td></tr>
                <tr><td>NIP:</td><td><input type="text" name="nip" value="1234567890"></td></tr> 
                <tr><td><a style ="font-size: 8;">(pole opcjonalne)</a></td></tr>
                <tr><td>Data urodzenia:</td><td><input type="date" name="dataUrodzenia" value="19990101"></td></tr>
                <tr><td><h3>Adres:</h3></td></tr>
                <tr><td>1 linijka:</td><td><input type="text" name="adresPierwszaLinijka"></td></tr>
                <tr><td>2 linijka:</td><td><input type="text" name="adresDrugaLinijka"></td></tr>
                <tr><td></td><td><input type="submit" value="Submit"></td></tr>
            </table>       
        </form>
    </body>
</html>
