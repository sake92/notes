
# Processes
Proces ima svoj PID, process ID.  
On jedinstveno identifikuje dati proces koji se izvršava.

Postoji virtuelni fajl sistem `/proc` na linuxu, u kom možemo pristupiti metapodacima o datom procesu.  
Npr. `/proc/32/environ/` su env varijable procesa s PID-om `32`.

### Trenutni folder procesa, cwd
Svaki proces ima svoj "current directory" tj. trenutni folder.  
U linuxu se zove `cwd`, može se isprintat u bashu sa `pwd`.  
Npr. ako otvorimo bash u `/opt/bla` i pokrenemo program `abc.jar`,
njegov `cwd` će biti `/opt/bla` tj. **naslijediće ga od parent procesa**.

Eh sad, ako u tom programu čitamo npr. `nesto/fajl.txt`, to se gleda **relativno u odnosu na cwd**!  
Ovo je u suštini najbitnije kad se programira.. :D

Ovaj cwd se može i promijeniti (u C-u bar, ne radi u Javi), sa `chdir`.

