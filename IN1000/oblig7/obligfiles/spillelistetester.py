from sang import Sang
from spilleliste import Spilleliste

def hovedprogram():

    allMusikk = Spilleliste('Hele musikkbiblioteket')
    allMusikk.lesFraFil('musikk.txt')
    
    print("Tester spillAlle: Spiller alle sanger i listen:")
    allMusikk.spillAlle()
    print()
    
    nySang = Sang("Mil etter mil", "Jahn Teigen")
    allMusikk.leggTilSang(nySang)
    print("Spiller alle sanger i listen inkl ny sang:")
    allMusikk.spillAlle()
    print()
    
    print("Spiller ny sang:")
    allMusikk.spillSang(nySang)
    print()
    
    funnetSang = allMusikk.finnSang("Mil etter mil")
    if funnetSang is not None:
        print("Fant sangen:")
        allMusikk.spillSang(funnetSang)
    else:
        print("Fant ikke sangen\n")
    assert(funnetSang in allMusikk.hentArtistUtvalg("Jahn"))
    print()
    
    # Tester om flere sanger returneres for samme artist
    queenListe = allMusikk.hentArtistUtvalg("Queen")
    print("Spiller sanger med Queen hentet fra listen: ")
    for queenSang in queenListe:
        queenSang.spill()
    
    allMusikk.fjernSang(funnetSang)
    assert(not (funnetSang in allMusikk.hentArtistUtvalg("Jahn")))
    
hovedprogram()
