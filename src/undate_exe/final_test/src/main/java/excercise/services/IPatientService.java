package excercise.services;

import excercise.models.Patient;

import java.util.List;

public interface IPatientService {
    List<Patient> selectAllPatient();
}
