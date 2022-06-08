package furama.models.person.customer;

public class CustomerType {
    private Integer customerTypeId;
    private String customerType;

    public CustomerType() {
    }

    public CustomerType(Integer customerTypeId, String customerType) {
        this.customerTypeId = customerTypeId;
        this.customerType = customerType;
    }

    public Integer getCustomerTypeId() {
        return customerTypeId;
    }

    public void setCustomerTypeId(Integer customerTypeId) {
        this.customerTypeId = customerTypeId;
    }

    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }
}