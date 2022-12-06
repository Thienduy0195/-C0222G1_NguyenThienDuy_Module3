package excercise.repository;

import excercise.models.Patient;

import java.util.List;

public interface IPatientRepository {
    List<Patient> selectAllPatient();
}
