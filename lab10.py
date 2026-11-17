#level intermediate
import pytest
def c_to_f(temp : float) -> float:
    """converts celcius to fahrenheit"""
    return temp * (9 / 5) + 32

def test_c_to_f() -> None:
    assert c_to_f(0) == 32

#2 
def is_long(word : str) -> bool:
    """checks if string is longer than 4 characters"""
    return len(word) > 4
def long_words_upper(words : list) -> list:
    """returns list of all words longer than 4 characters"""
    return list(map(lambda x: x.upper(), filter(is_long, words)))


def test_long_words():
    assert long_words_upper(["hello", "bye"]) == ["HELLO"]

#2A
def sum_positives(nums : list) -> list:
    """returns list of only positive values in list"""
    pos = [ ]
    for n in nums:
        if n > 0:
            pos = pos + [n]
    return pos
def test_sum_pos() -> None:
    assert sum_positives([3, 5, -2]) == [3, 5]

#2B

def longest_first(strlist : list) -> list:
    """returns list with largest character first"""
    return map(lambda x: len(x), filter(True, strlist))


def longest_word_info(str_list : list) -> tuple[str, float]:
    """finds longest word in list and returns word and length"""
    word0 = (str_list[0], len(str_list[0]))
    for x in str_list:
        if len(x) > len(word0[0]):
            word0 = (x, len(x))
    return word0
def test_longest_word() -> None:
    assert longest_word_info(["hi", "hello"]) == ("hello", 5.0)