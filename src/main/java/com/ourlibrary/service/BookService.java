package com.ourlibrary.service;

import com.ourlibrary.dao.BookRepository;
import com.ourlibrary.entity.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BookService {

    private BookRepository bookRepository;

    @Autowired
    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public List<Book> findAll() {
        return bookRepository.findAll();
    }

    public Book findById(int id) {
        Optional<Book> result = bookRepository.findById(id);

        Book book = null;

        if (result.isPresent()) {
            book = result.get();
        } else {
            throw new RuntimeException("Book not found: id " + id);
        }

        return book;
    }

    public void save(Book book) {
        bookRepository.save(book);
    }

    public void deleteById(int id) {
        bookRepository.deleteById(id);
    }
}
