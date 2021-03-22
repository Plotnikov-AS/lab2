package ru.labs.second.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "TABLE_VALUES")
@Data
public class Value {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long value;
}
