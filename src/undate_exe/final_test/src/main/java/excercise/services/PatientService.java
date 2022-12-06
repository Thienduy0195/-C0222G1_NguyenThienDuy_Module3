package excercise.services;

import excercise.models.Patient;

import java.util.List;

public class PatientService implements IPatientService {
    IPatientService patientService = new PatientService();
    @Override
    public List<Patient> selectAllPatient() {
        return patientService.selectAllPatient();
    }
}
