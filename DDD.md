

## Aggregates vs Value object
Value objekti su "obične" immutable vrijednosti.  
Primjeri: int, String, Instant itd.

Agregati su kao entiteti u bazi, imaju svoj id.  
Npr. dva agregata mogu imat sve iste propertije osim id-ja, po njima ih razlikujemo.

Agregati se koriste u smislu "transakcijske konzistentnosti".  
Npr. kad updateamo račun u banci, on mora ostati konzistentan prilikom updatea.  
Cilj je da se jedan update vrši na *samo jednom agregatu*.











