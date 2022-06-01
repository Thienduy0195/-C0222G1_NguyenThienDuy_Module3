package services.impl;

import models.Product;
import repository.IProductRepo;
import repository.impl.ProductRepoImpl;
import services.IProductService;

import java.util.List;

public class ProductServiceImpl implements IProductService {
    IProductRepo productRepo = new ProductRepoImpl();

    @Override
    public List<Product> findAll() {
        return productRepo.findAll();
    }

    @Override
    public void addNew(Product product) {
        productRepo.addNew(product);
    }

    @Override
    public Product findById(int id) {
        return productRepo.findById(id);
    }

    @Override
    public void remove(int id) {
        productRepo.remove(id);
    }

    @Override
    public void update(int id, Product product) {
        productRepo.update(id, product);
    }
}
