package furama.repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICRUDRepository<E, K, V> {
    List<E> selectAll();

    void save(E e);

    E select(String id);

    boolean update(E e) throws SQLException;

    boolean delete(String id) throws SQLException;

    List<E> search(String name);

    Map<K, V> getType();

    Map<K, V> getGender();

}
