package repository.impl;

import models.Product;
import repository.IProductRepo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepoImpl implements IProductRepo {
    public static Map<Integer, Product> productMap;

    static {
        productMap = new HashMap<>();
        productMap.put(1, new Product(1, "Mazda Cx5", 5000, "Luxury product", "Mazda"));
        productMap.put(2, new Product(2, "Hyundai Santafe", 6000, "Luxury product", "Hyundai"));
        productMap.put(3, new Product(3, "KIA Sorento", 6000, "Vip product", "KIA"));
        productMap.put(4, new Product(4, "Toyota Vios", 2000, "Normal product", "Toyota"));
        productMap.put(5, new Product(5, "Hyundai Sonata", 5000, "Luxury product", "Hyundai"));
        productMap.put(6, new Product(6, "KIA K5", 5000, "Luxury product", "KIA"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void addNew(Product product) {
        productMap.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }

    @Override
    public void remove(int id) {
        productMap.remove(id);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id, product);
    }
}
