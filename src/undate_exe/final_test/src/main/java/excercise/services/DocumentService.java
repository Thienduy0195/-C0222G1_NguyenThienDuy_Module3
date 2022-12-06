package excercise.services;

import excercise.repository.DocumentRepository;
import excercise.repository.IDocumentRepository;
import excercise.models.Document;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DocumentService implements IDocumentService{
    public static final String REGEX_ID ="^[AZaz]+$";
    public static final String REGEX_NAME = "^[\\p{Lu}\\p{Ll}\\s]+$";
//    private static final String REGEX_DATE = "\\d{4}(-)(([0][1-9])|([1][0,2]))(-)(([0-2][0-9])|([3][0-1]))";
    public static final String REGEX_NUMBER = "^[0-9]+$";
    public static final String REGEX_ID_CARD = "^[0-9]{9}$";
    public static final String REGEX_PHONE =   "^(84|0[3|5|7|8|9])+([0-9]{8})$"; //"^((\\(84\\)(\\+))|0)(90|91)+([0-9]{7})$";
    public static final String REGEX_EMAIL = "^[\\w\\-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
    IDocumentRepository documentRepository = new DocumentRepository();
    @Override
    public List<Document> selectAllDocument() {
        return documentRepository.selectAllDocument();
    }

    @Override
    public Map<String, String> save(Document document) {
        Map<String, String> map = new HashMap<>();
        if(!document.getDocumentId().matches(REGEX_ID)){
            map.put("id", "Invalid ID");
        }
        if (!regexCheckOutDay(document.getCheckinDay(), document.getCheckoutDay())){
            map.put("day","Check out day must be after checkin day!!");
        }
        if(map.isEmpty()){
            documentRepository.save(document);
        }
        return map;
    }

    @Override
    public Document select(String id) {
        return documentRepository.select(id);
    }

    @Override
    public Map<String, String> update(Document document) throws SQLException {
        Map<String, String> map = new HashMap<>();
        if(!document.getDocumentId().matches(REGEX_ID)){
            map.put("id", "Invalid ID");
        }
        if (!regexCheckOutDay(document.getCheckinDay(), document.getCheckoutDay())){
            map.put("day","Check out day must be after checkin day!!");
        }
        if(map.isEmpty()){
            documentRepository.update(document);
        }
        return map;
    }

    @Override
    public boolean delete(String id) throws SQLException {
        return documentRepository.delete(id);
    }

    @Override
    public List<Document> search(String name) {
        return documentRepository.search(name);
    }

    public boolean regexCheckOutDay(String checkin, String checkout){
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate checkinDay = LocalDate.parse(checkin, dtf);
            LocalDate checkoutDay = LocalDate.parse(checkout, dtf);
            if (checkoutDay.isAfter(checkinDay)){
                return true;
            } else {
                return false;
            }
    }
}
