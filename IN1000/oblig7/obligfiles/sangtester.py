from sang import Sang

def hovedprogram():
    sang1 = Sang("Shallow", "Lady Gaga and Bradley Cooper")
    print("Spiller av test-objekt:")
    sang1.spill()
    
    print("Tester sjekkArtist med 'Lady Gaga and Bradley Cooper'")
    assert(sang1.sjekkArtist("Lady Gaga and Bradley Cooper"))     # True
    print("Tester sjekkArtist med 'Lord Gaga'") 
    assert(sang1.sjekkArtist("Lord Gaga"))        # True, ett ord finnes i artistnavnet
    print("Tester sjekkArtist med 'Sadley'")
    assert(not sang1.sjekkArtist("Sadley"))       # False
    print()

    
    print("Tester sjekkTittel med 'Shallow'")
    assert(sang1.sjekkTittel("Shallow"))          # True
    print("Tester sjekkTittel med 'shalLow'")
    assert(sang1.sjekkTittel("shalLow"))          # True
    print("Tester sjekkTittel med 'Hallow'")
    assert(not sang1.sjekkTittel("Hallow"))       # False
    print()
        
    print("Utforer spill:")
    sang1.spill()
    print()
    
    print("Tester sjekkArtistogTittel med 'Bradley Cooper' og 'Shallow'")
    assert(sang1.sjekkArtistogTittel('Bradley Cooper', 'Shallow')) # True
    print("Tester sjekkArtistogTittel med 'Booper' og 'Shallow'")
    assert(not sang1.sjekkArtistogTittel('Booper', 'Shallow')) # False
    
hovedprogram()