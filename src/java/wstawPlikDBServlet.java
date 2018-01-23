import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import static java.lang.System.out;

    @MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
                 maxFileSize=1024*1024*50,      	// 50 MB
                 maxRequestSize=1024*1024*100)   	// 100 MB

@WebServlet(name = "wstawPlikDBServlet", urlPatterns ={"/wstawPlikDBServlet"})          
public class wstawPlikDBServlet extends HttpServlet {


   // ustawienia połączenia z bazą danych
      String dbURL = "jdbc:mysql://localhost:3306/serwisaukcyjnybaza";
      String dbUser = "root";
      String dbPass = "";

    protected void doPost(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException {
    // pobierz właściwości pliku
    String przedmiotNazwa=request.getParameter("przedmiotNazwa");
    out.println("Nazwa przedmiotu:"+ przedmiotNazwa);
    int cenaKup=1;//Integer.parseInt(request.getParameter("cenaKup"));
    int cenaNegocjuj=Integer.parseInt(request.getParameter("cenaNegocjuj"));
    boolean czyPromuj=request.getParameter("czyPromuj")!= null;
    String opisPrzedmiotu=request.getParameter("opisPrzedmiotu");
    int cenaTransportu=Integer.parseInt(request.getParameter("cenaTransportu"));
    String login=request.getParameter("login");
    String haslo=request.getParameter("haslo");
    
    //generowanie ID transportu
    int transportID=1;
    //generowanie ID przedmiotu
    int przedmiotID=1;
    //dodawanie ID kategorii
    int kategoriaID=1; // Integer.parseInt(request.getParameter("kategoria"));
    out.println(kategoriaID);
    //generowanie ID uzytkownika
    int uzytkownikID=1;
    

    InputStream inputStream=null; // strumień pliku

// obtains the upload file part in this multipart request
Part filePart = request.getPart("zdjecieP");
if (filePart != null) {
    // wyświetlanie informacji dla sprawdzenia poprawności procesu
    System.out.println(filePart.getName());
    System.out.println(filePart.getSize());
    System.out.println(filePart.getContentType());

  // określanie strumienia dla pliku
     inputStream = filePart.getInputStream();

}

Connection conn = null; // połączenie dla bazy danych
String message = null;  // wiadomość zostanie wysłana do klienta

try {
    // połączenie z bazą danych
    DriverManager.registerDriver(new com.mysql.jdbc.Driver());
    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

    // tworzenie polecenia SQL
    String sql = "INSERT INTO przedmiot "
            + "(`IDPrzedmiotu`, `IDUzytkownika`, `IDKategorii`, `nazwaPrzedmiotu`,"
            + " `cenaKup`, `cenaNegocjuj`, `zdjecieP`, `czyPromuj`, `opisPrzedmiotu`, `IDTransport`, `cenaTransportu`) "
            + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";


    PreparedStatement statement = conn.prepareStatement(sql);

    statement.setInt(1, przedmiotID);
    statement.setInt(2, uzytkownikID);
    statement.setInt(3, kategoriaID);
    statement.setString(4, przedmiotNazwa);
    statement.setInt(5, cenaKup);
    statement.setInt(6, cenaNegocjuj);
    
    //wysyłanie zdjęcia do bazy danych
   if (inputStream != null) {
    statement.setBlob(7, inputStream);
} else {
    statement.setNull(7, java.sql.Types.BLOB);
}

    statement.setBoolean(8, czyPromuj);
    statement.setString(9, opisPrzedmiotu);
    statement.setInt(10, transportID);
    statement.setInt(11, cenaTransportu);
    
    // wysyłanie polecenia do serwera bazy danych
    int row = statement.executeUpdate();
    if (row > 0) {
        message = "File uploaded and saved into database";
    }
} catch (SQLException ex) {
    message = "ERROR: " + ex.getMessage();
    ex.printStackTrace();
} finally {
    if (conn != null) {
        // zamykanie połączenia
        try {
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
  

    // przekierowanie na wynik/stronę główną
    getServletContext().getRequestDispatcher("/index.html").forward(request, response);
}
}
    
}
