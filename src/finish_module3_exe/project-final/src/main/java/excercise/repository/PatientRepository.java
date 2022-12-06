package excercise.repository;

import excercise.models.Patient;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PatientRepository implements IPatientRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ALL_PATIENT = "select * from patient;";
    private static final String UPDATE_PATIENT_BY_ID = "update patient set patient_name = ? where patient_id = ?;";

    @Override
    public List<Patient> selectAllPatient() {
        List<Patient> patientList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_ALL_PATIENT);
            Patient patient;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                patient = new Patient();
                patient.setPatientId(resultSet.getString("patient_id"));
                patient.setPatientName(resultSet.getString("patient_name"));
                patientList.add(patient);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return patientList;
    }

    @Override
    public boolean update(Patient patient) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PATIENT_BY_ID);) {
            preparedStatement.setString(1, patient.getPatientName());
            preparedStatement.setInt(2, Integer.parseInt(patient.getPatientId()));
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}
