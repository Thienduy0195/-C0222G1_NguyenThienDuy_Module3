package excercise.models;

public class DocumentPatient {
    private String documentId;
    private String patientId;
    private String checkinDay;
    private String checkoutDay;
    private String checkinReason;

    public DocumentPatient() {
    }

    public DocumentPatient(String documentId, String patientId, String checkinDay, String checkoutDay, String checkinReason) {
        this.documentId = documentId;
        this.patientId = patientId;
        this.checkinDay = checkinDay;
        this.checkoutDay = checkoutDay;
        this.checkinReason = checkinReason;
    }

    public String getDocumentId() {
        return documentId;
    }

    public void setDocumentId(String documentId) {
        this.documentId = documentId;
    }

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }

    public String getCheckinDay() {
        return checkinDay;
    }

    public void setCheckinDay(String checkinDay) {
        this.checkinDay = checkinDay;
    }

    public String getCheckoutDay() {
        return checkoutDay;
    }

    public void setCheckoutDay(String checkoutDay) {
        this.checkoutDay = checkoutDay;
    }

    public String getCheckinReason() {
        return checkinReason;
    }

    public void setCheckinReason(String checkinReason) {
        this.checkinReason = checkinReason;
    }
}
