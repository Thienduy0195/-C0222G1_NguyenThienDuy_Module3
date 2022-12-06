package excercise.services;

import excercise.models.Patient;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IPatientService {
    List<Patient> selectAllPatient();
    Map<String, String> update(Patient patient) throws SQLException;
}
