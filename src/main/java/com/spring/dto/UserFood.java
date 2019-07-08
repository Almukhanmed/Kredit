package com.spring.dto;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;
@Entity
@Table(
        name = "user_food"
)
public class UserFood {

    @Id
    @GeneratedValue(
            strategy = GenerationType.AUTO
    )
    @Column(
            name = "id"
    )
    private Long id;
    @Column(
            name = "fid"
    )
    private Long fid;
    @Column(
            name = "uid"
    )
    private Long uid;

    public UserFood() {
    }

    public UserFood(Long fid, Long uid) {

        this.fid = fid;
        this.uid = uid;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getFid() {
        return fid;
    }

    public void setFid(Long fid) {
        this.fid = fid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }
}
