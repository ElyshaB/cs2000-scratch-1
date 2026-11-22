#level intermediate

#Problem 1 part A
def lemonade_stand_1(cups : int) -> float:
    """returns profit of stand 1 from x amount of cups"""
    if cups <= 0:
        return 0
    elif cups < 4:
        return cups - 2
    else:
        return 2 + lemonade_stand_1(cups - 4)

def test_lemstand1_none() -> None:
    assert lemonade_stand_1(0) == 0
def test_lemstand1_1() -> None:
    assert lemonade_stand_1(1) == -1   
def test_lemstand1_4() -> None:
    assert lemonade_stand_1(4) == 2 

#B
def lemonade_stand_2(cups : int) -> float:
    """returns profit of stand 2 from x cups"""
    if cups > 160:
        cups_sold = 160
    else:
        cups_sold = cups
    return cups_sold * 0.75 - 20
def test_lemstand2_0() -> None:
    assert lemonade_stand_2(0) == -20
def test_lemstand2_10() -> None:
    assert lemonade_stand_2(10) == -12.5 

#C
def which_stand_better(cups : int) -> int:
    """returns which stand would make more money given x cups sold"""
    if lemonade_stand_1(cups) == lemonade_stand_2(cups):
        return 0
    elif lemonade_stand_1(cups) > lemonade_stand_2(cups):
        return 1
    else: 
        return 2
def test_stands_equal() -> None:
    assert which_stand_better(80) == 0
def test_stands_1() -> None:
    assert which_stand_better(10) == 1
def test_stands_equal2() -> None:
    assert which_stand_better(100) == 2

#2
def tick(seconds : int) -> float:
    """returns the next second given a # of seconds"""
    if seconds < 59:
        return seconds + 1
    else:
        return 0
def test_tick_new() -> None:
    assert tick(59) == 0
def test_tick_34() -> None:
    assert tick(34) == 35

#3
def add_prefix(string : str, str_list : list) -> list:
    """adds the prefix string to every string in the string list"""
    x = []
    for s in str_list:
        x = x + [string + s]
    return x
def test_addpre1() -> None:
    assert add_prefix("pre", ["determine", "form"]) == ["predetermine", "preform"]

#4
def remove_odd_length_strings(str_list : list) -> list:
    """returns the string list without the ones with odd character length"""
    List = []
    for s in str_list:
        if len(s) % 2 == 0:
            List = List + [s]
    return List
def test_removing_oddlen1() -> None:
    assert remove_odd_length_strings(["hello", "hi"]) == ["hi"]

#5
x = 10

def f(x : int) -> int:
    """ the f function """
    x = x + 20
    return x

def g(y : int) -> None:
    """ the g function """
    global x
    x = f(y)

g(30)

print(x)