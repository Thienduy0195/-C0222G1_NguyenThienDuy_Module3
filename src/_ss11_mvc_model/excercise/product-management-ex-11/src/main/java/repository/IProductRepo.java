package repository;

import models.Product;

import java.util.List;

public interface IProductRepo {
    List<Product> findAll();

    void addNew(Product product);

    Product findById(int id);

    void remove(int id);

    void update(int id, Product product);
}
