package com.spring.dto;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "users")
public class Users implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @Column(name = "email", length = 255)
    private String email;

    @Column(name = "login", length = 255)
    private String login;

    @Column(name = "name", length = 255)
    private String name;

    @Column(name = "surname", length = 255)
    private String surname;

    @Column(name = "password", length = 255)
    private String password;

    @Column(name = "fav_id")
    private int favId;

    @ManyToMany(fetch = FetchType.EAGER)
    private Set<Roles> roles;

    public Users() {
    }

    public Users(String email, String login, String name, String surname, String password,int favId,Set<Roles> roles) {
        this.email = email;
        this.login = login;
        this.name = name;
        this.surname = surname;
        this.password = password;
        this.favId = favId;
        this.roles = roles;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getFavId() {
        return favId;
    }

    public void setFavId(int favId) {
        this.favId = favId;
    }

    public Set<Roles> getRoles() {
        return roles;
    }

    public void setRoles(Set<Roles> roles) {
        this.roles = roles;
    }
}