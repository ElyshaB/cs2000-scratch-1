#level intermediate
fruits = ["apple", "banana", "cherry", "date"]
fruits_with_a = list(filter(lambda f: "a" in f, fruits))
# ["apple", "banana", "date"]
fruits_upper = list(map(lambda f: f.upper(), fruits))
# ["APPLE", "BANANA", "CHERRY", "DATE"]
#from dataclasses import dataclass

@dataclass
class Fruit:
    name: str
    color: str

num_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
num_list_sq = list(map(lambda f: (f * f), num_list))
#all_even(nums: list) -> list
def is_even(num : int) -> bool:
    """tells us if a number is even"""
    if num % 2 == 0:
        return True
    else: 
        return False

def all_even(nums : list) -> list:
    """returns list of all even numbers"""
    return list(filter(is_even, nums))
def capitalize_all(words : list) -> list:
    """returns list of all words capitalized"""
    return list(map(lambda f: f.upper(), words))
# 1. lengths of each word
words1 = ["hello", "world", "python"]
word_lengths = list(map(lambda w: len(w), words1))
# [5, 5, 6]

# 2. what happens without list()
not_a_list = map(lambda w: len(w), words1)
# print(not_a_list) shows something like <map object at 0x...>
# map is lazy, it gives a map object instead of the actual values
# you need list(...) to see the results

# 3. Book dataclass
@dataclass
class Book:
    title: str
    author: str
    pages: int

# 4. long_books(books: list) -> list
def is_long(book : Book) -> bool:
    """tells us if a book has more than 300 pages"""
    if book.pages > 300:
        return True
    else:
        return False

def long_books(books : list) -> list:
    """returns list of titles of books with more than 300 pages"""
    return list(map(lambda b: b.title, filter(is_long, books)))

# 5. list of Book instances
b1 = Book("Dune", "Frank Herbert", 412)
b2 = Book("The Hobbit", "J.R.R. Tolkien", 310)
b3 = Book("Animal Farm", "George Orwell", 112)
b4 = Book("The Silmarillion", "J.R.R. Tolkien", 365)
b5 = Book("1984", "George Orwell", 328)
all_books = [b1, b2, b3, b4, b5]

assert long_books(all_books) == ["Dune", "The Hobbit", "The Silmarillion", "1984"]
assert long_books([b3]) == []
assert long_books([]) == []

# 6. filter_by_author(books: list, author: str) -> list
def filter_by_author(books : list, author : str) -> list:
    """returns list of titles of books by the given author"""
    return list(map(lambda b: b.title,
                    filter(lambda b: b.author == author, books)))

assert filter_by_author(all_books, "George Orwell") == ["Animal Farm", "1984"]
assert filter_by_author(all_books, "J.R.R. Tolkien") == ["The Hobbit", "The Silmarillion"]
assert filter_by_author(all_books, "Nobody") == []