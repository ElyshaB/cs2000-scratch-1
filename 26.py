#level intermediate

def sum_list(num_list: list[float]) -> float:
    """Returns the sum of all numbers in the list."""
    run_total = 0
    for num in num_list:
        run_total = run_total + num
    return run_total
    

def test_sum_list_empty():
    assert sum_list([]) == 0

def test_sum_list_nonempty():
    assert sum_list([1, 2, 3]) == 6

def product_list(nums: list[float]) -> float:
    """returns a product of all elements in the list"""
    x = 1
    for n in nums:
        x = x * n
    return x

def test_product_list_empty():
    assert product_list([]) == 1

def test_product_list_nonmepty():
    assert product_list([1, 2, 3]) == 6


def count_occurrences(items: list[str], target: str) -> int:
    """counts how many times target is in list"""
    count = 0
    for x in items:
        if x == target:
            count = count + 1
    return count

assert count_occurrences(["a", "b", "a", "c", "a"], "a") == 3
assert count_occurrences(["a", "b", "c"], "z") == 0
assert count_occurrences([], "a") == 0

def reverse_list(lst: list) -> list:
    """returns the given list in reverse order"""

def sum_of_evens(num : float) -> float:
    """returns sum of all even numbers up to num"""
    