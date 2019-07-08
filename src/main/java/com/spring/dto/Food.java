package com.spring.dto;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;
@Entity
@Table(
        name = "food"
)
public class Food {

    @Id
    @GeneratedValue(
            strategy = GenerationType.AUTO
    )
    @Column(
            name = "id"
    )
    private Long id;
    @Column(
            name = "name"
    )
    private String name;
    @Column(
            name = "price"
    )
    private String price;

    public Food() {
    }

    public Food(Long id,String name, String price) {
        this.id=id;
        this.name = name;
        this.price = price;
        }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }


}
