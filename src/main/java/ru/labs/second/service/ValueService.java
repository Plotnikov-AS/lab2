package ru.labs.second.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ru.labs.second.dao.ValuesDao;
import ru.labs.second.model.Value;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ValueService {
    private final ValuesDao valuesDao;

    public List<Value> addValue(Long newValue, Integer n1) {
        List<Value> values = valuesDao.getAllValues();
        Value value = new Value();
        value.setValue(newValue);
        value = valuesDao.addValue(value);
        values.add(value);
        while (values.size() > n1) {
            Value valueToRemove = values.get(0);
            valuesDao.removeValue(valueToRemove);
            values.remove(valueToRemove);
        }
        return values;
    }

    public void deleteAllValues() {
        valuesDao.removeAll();
    }
}
