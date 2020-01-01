package com.ourlibrary.controller;

import com.ourlibrary.entity.Book;
import com.ourlibrary.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/books")
public class BookController {

    private BookService bookService;

    @Autowired
    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/list")
    public String showBookList(Model model) {

        List<Book> books = bookService.findAll();

        model.addAttribute("books", books);

        return "list-books";
    }

    @GetMapping("/addBookForm")
    public String showAddForm(Model model) {

        Book book = new Book();

        model.addAttribute("book", book);

        return "book-form";
    }

    @GetMapping("/updateBookForm")
    public String showUpdateForm(@RequestParam("bookId") int id, Model model) {

        Book book = bookService.findById(id);

        model.addAttribute("book", book);

        return "book-form";
    }

    @PostMapping("/saveBook")
    public String saveBook(@ModelAttribute("book") Book book) {

        bookService.save(book);

        return "redirect:/books/list";
    }

    @GetMapping("delete")
    public String deleteBook(@RequestParam("bookId") int id) {

        bookService.deleteById(id);

        return "redirect:/books/list";
    }

    @GetMapping("/detailsBookForm")
    public String showBookDetails(@RequestParam("bookId") int id, Model model) {

        Book book = bookService.findById(id);

        model.addAttribute("book", book);

        return "book-details-form";
    }
}
