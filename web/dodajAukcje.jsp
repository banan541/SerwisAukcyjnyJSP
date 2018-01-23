<%-- 
    Document   : dodajAukcje
    Created on : 2017-08-10, 16:19:15
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dodaj aukcje </title>
    </head>
    <body>
        <h1>Formularz wystawiania aukcji:</h1>
        <form method="post" action="wstawPlikDBServlet" enctype="multipart/form-data" id="wstawPlik">
            <table>
                <tr><td>Nazwa przedmiotu:</td><td><input type="text" name="przedmiotNazwa" size="20"></td></tr>
                <tr><td>Cena "Kup natychmiast":</td><td><input type="text" name="cenaKup"></td></tr>
                <tr><td>Minimalna cena negocjacji:</td><td><input type="text" name="cenaNegocjuj"></td></tr>
                <tr><td>Kategoria:</td><td><input type="text" name="kategoria"></td></tr>
                <tr><td>Zdjecie:</td><td><input type="file" name="zdjecieP"></td></tr>
                <tr><td>Promuj na stronie głównej:</td><td> <input type="checkbox" name="czyPromuj"></td></tr>               
                <tr><td>Sposób transportu:</td><td><input type="text" name="sposobTransportu"></td></tr>
                <!-- TRZEBA DODAĆ WYBRANIE SPOSOBU TRANSPORTU -->
                <tr><td><h3>Cena transportu:</h3></td><td><input type="text" name="cenaTransportu"></td></tr>
                <tr><td>Login:</td><td><input type="text" name="login"></td></tr>
                <tr><td>Hasło:</td><td><input type="password" name="haslo"></td></tr>
                <tr><td><input type="submit" value="Wystaw aukcję"></td></tr>
            </table>       
        </form>
        <h3>Opis przedmiotu:</h3>
        <textarea name="opisPrzedmiotu" form="wstawPlik"></textarea>
    </body>
</html>
