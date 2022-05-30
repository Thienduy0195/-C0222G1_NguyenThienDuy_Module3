package services;

import models.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void addNew(Product product);

    Product findById(int id);

    void remove(int id);

    void update(int id, Product product);
}
