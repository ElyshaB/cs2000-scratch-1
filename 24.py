#level intermediate
import pytest
print("hello")
def gadget_cost(num_gadgets: int, label: str) -> float:
    """computes cost, at $0.50 per gadget plus $0.05 per character in label"""
    return num_gadgets * (0.50 + (len(label) * 0.05))

def add_shipping(order_amt: float) -> float:
    """adds 4 for orders <= 10 (but non-zero), 8 for orders < 30, 12 for larger orders"""
    if order_amt == 0:
        return 0
    elif order_amt <= 10:
        return order_amt + 4
    elif order_amt < 30:
        return order_amt + 8
    else:
        return order_amt + 12


def test_gadget_cost_small() -> None:
    assert gadget_cost(1, "hi") == pytest.approx(0.60)

def test_gadget_cost_medium() -> None:
    assert gadget_cost(10, "tech") == pytest.approx(7.00)
    # Intentionally wrong, so you can see a failing test (was 6.50 not 7.00)

def greet(name : str) -> str:
    """ produces Hello, name! """
    return "Hello, " + name + "!"

def test_greet() -> None:
    assert greet("Alice") == pytest.approx("Hello, Alice!")

def intro(name : str, age : int) -> str:
    """returns an intro Name is age years old"""
    return name + " is " + str(age) + " years old."
def test_intro() -> None:
    assert intro("Alice", 20) == pytest.approx("Alice is 20 years old.")

def shipping_cost(weight : int) -> int:
    """if weight <= 1, cost is $5; if weight <= 5, cost is $10; otherwise, $20"""
    if weight <= 1:
        return 5
    elif weight <= 5:
        return 10
    else: 
        return 20