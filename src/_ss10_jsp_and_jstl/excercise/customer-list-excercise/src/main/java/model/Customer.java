package model;

public class Customer {
    private String customerName;
    private String dateOfBirth;
    private String address;
    private String image;
    private Integer gender;
    private double point;

    public Customer() {
    }

    public Customer(String customerName, String dateOfBirth, String address, String image, Integer gender, double point) {
        this.customerName = customerName;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.image = image;
        this.gender = gender;
        this.point = point;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public double getPoint() {
        return point;
    }

    public void setPoint(double point) {
        this.point = point;
    }
}
