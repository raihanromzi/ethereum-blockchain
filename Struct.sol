// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract myStruct {

    struct Book {
        string title;
        string author;
        uint book_id;
    }

    Book buku;

    function setBook() public {
        buku = Book( "Harry Potter", " JK Rowling", 1 );
    }

    function getBookID() public view returns (uint) {
        return buku.book_id;
    }

    function getAuthor() public view returns (string memory) {
        return buku.author;
    }

    function getTitle() public view returns (string memory) {
        return buku.title;
    }

}
