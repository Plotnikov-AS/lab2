package ru.labs.second.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ru.labs.second.model.Value;

import java.util.List;

@Repository
public interface ValuesRepo extends CrudRepository<Value, Long> {

    Value getById(Long id);

    @Query("SELECT val " +
            "FROM Value val " +
            "ORDER BY val.id ASC")
    List<Value> getAll();


}
