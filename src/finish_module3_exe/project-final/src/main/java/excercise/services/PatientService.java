package excercise.services;

import excercise.models.Patient;
import excercise.repository.IPatientRepository;
import excercise.repository.PatientRepository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PatientService implements IPatientService {
    IPatientRepository patientRepository = new PatientRepository();
    public static final String REGEX_NAME = "^[\\p{Lu}\\p{Ll}\\s]+$";

    @Override
    public List<Patient> selectAllPatient() {
        return patientRepository.selectAllPatient();
    }

    @Override
    public Map<String, String> update(Patient patient) throws SQLException {
        Map<String, String> map = new HashMap<>();
        if (!patient.getPatientName().matches(REGEX_NAME)) {
            map.put("patientName", "Invalid patient name!");
        }
        if (map.isEmpty()) {
            patientRepository.update(patient);
        }
        return map;
    }
}
