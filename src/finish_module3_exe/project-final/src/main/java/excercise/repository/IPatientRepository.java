package excercise.repository;

import excercise.models.Patient;

import java.sql.SQLException;
import java.util.List;

public interface IPatientRepository {
    List<Patient> selectAllPatient();

    boolean update(Patient patient) throws SQLException;
}
