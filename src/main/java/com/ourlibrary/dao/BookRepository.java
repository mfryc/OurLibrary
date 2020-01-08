package com.ourlibrary.dao;

import com.ourlibrary.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookRepository extends JpaRepository<Book, Integer> {

    public List<Book> findByAuthorsContainsOrTitleContainsAllIgnoreCase(String name, String lName);

}
