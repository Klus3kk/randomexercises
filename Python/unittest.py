# Using python -m pytest <file> -vvv


def isAdult(age: int) -> bool:
    return age >= 18

def test_isAdult():
    # given
    age = 18
    
    # when
    result = isAdult(age)
    
    # then    
    assert result 
    
def test_isNotAdult():
    assert not isAdult(14)