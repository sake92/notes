
- `Observable`
- `Observer`
- `Subject` = `Observable` + `Observer` (kao Flow? međukorak)
    - `ReplaySubject` kešira zadnjih N elemenata, i uvijek ih republisha a svakog subscribera
    - `BehaviorSubject` pamti samo ZADNJI element i publisha njega samo.  
      MORA imat defaultnu vrijednost.  
        Ubio se za AJAXa, drži samo zadnji rezultat.  
        Obično se nikad ne kompletira, živi vječno.
    - `AsyncSubject` je nešto kao `Future`/`Promise`, čeka complete i onda publisha vrijednost

*********
Observable je DUAL od Iterable.  
Observer je DUAL od Iterator.

Npr. Iterator može dat `next: T`, `error: Exception` i `hasNext: Boolean`.
Prvo je normalni tip čiji iterator iteriramo, drugo je kad se desi exception a treće je kad je iterator iscrpljen (kao EOF).

Observer analogno ima `onNext(t: T)`, `onError(e: Exception)` i `onComplete()`.
DUAL je zato što je "odokativno" isto, tj. strukturalno, rade iste stvari...

Observable može signalizirat ILI onError ILI onComplete, dakle XOR relacija, either. Nikad oba!

Generalno se rijetko koristi Observer *direktno*. 
Postoji dosta helper metoda nad Observable koje možemo koristiti.
Npr. imamo metodu `subscribe(o: Observer)`, a i `subscribe(f: T => Unit)` koja napravi Observer u pozadini. :)

*********

An Observable is **cold** when data is **produced inside** the Observable 
and the Observable is **hot** when the data is produced **outside** the Observable.

```
Cold:   Observable.just(1,2,3)  
Hot:    Observable.fromEvent(document, 'click');
```

Hot je ŽIV !!! :D
On "odma" počinje da "radi"... To je glavno

COLD EMITUJE SAM, i to ****SVAKI PUT**** kad se neko SUBSCRIBE !!!

