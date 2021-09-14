
https://www.youtube.com/watch?v=NdZqeAAIHzc




## Aggregates vs Value object
Value objekti su "obične" immutable vrijednosti.  
Primjeri: int, String, Instant itd.  


Agregati imaju svoj **identitet**.  
Dva agregata mogu imat sve iste propertije osim id-ja, po njima ih razlikujemo.

Agregati se koriste u smislu "transakcijske konzistentnosti".  
Npr. kad updateamo račun u banci, on mora ostati konzistentan prilikom updatea.  
Cilj je da se jedan update vrši na *samo jednom agregatu*.

Trebamo smanjit broj agregata što više možemo.  
Što više agregata možemo "pretvoriti" u value objekte to bolje!

U agregat idu svi propertiji koji *imaju smisla da se update-aju zajedno*.



Treba organizovat kod u layerima, npr: kontroler, servis, repozitorij.  
Svaki layer koristi samo onaj direktno ispod njega.

Domain/servis layer *ne bi trebao da zna o UI, persistence itd*.



