package ru.labs.second.dao;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import ru.labs.second.model.Value;
import ru.labs.second.repo.ValuesRepo;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

import static java.util.Objects.isNull;

@Repository
@Transactional
@RequiredArgsConstructor
public class ValuesDao {
    private final ValuesRepo valuesRepo;
    @PersistenceContext
    private final EntityManager entityManager;

    public Value addValue(Value value) {
        if (isNull(value))
            throw new IllegalArgumentException("New value is null");

        entityManager.persist(value);
        return value;
    }

    public void removeValue(Value value) {
        if (isNull(value))
            throw new IllegalArgumentException("Value for remove is null");

        entityManager.remove(value);
    }

    public void removeAll() {
        valuesRepo.deleteAll();
    }

    public List<Value> getAllValues() {
        return valuesRepo.getAll();
    }
}
