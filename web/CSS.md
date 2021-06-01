

https://www.internetingishard.com/html-and-css/introduction/
https://learnlayout.com/
https://www.youtube.com/watch?v=u00FY9vADfQ&list=PLbSquHt1VCf1kpv9WRGMCA9_Nn4vCLZ9Y&index=1

https://blog.theodo.com/2018/03/stop-using-bootstrap-layout-thanks-to-css-grid/

Already done patterns for layouts:
https://csslayout.io/

# Vertical align....
https://stackoverflow.com/questions/12415661/using-marginauto-to-vertically-align-a-div


# Flow layout
Postoje 2 osnovna tipa elemenata:
- block, 1 ispod drugog
- inline, 1 kraj drugog, s lijeva na desno (float: left)

Inline elementi se redaju koliko god mogu, kad nestane prostora, idući element pređe u novi red.  
Kaže se da elementi floataju nalijevo, lebde...  
Isto je fazon da se svi elementi "naguravaju" ka gore, žele da budu na vrhu stranice.  
Sa frameworcima/gridom možeš podijelit ekran/komponentu na više REDOVA...


# Flexbox
Zgodan trik sa marginom AUTO:
https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Aligning_Items_in_a_Flex_Container#using_auto_margins_for_main_axis_alignment

`margin: auto;` centrira horizontalno, ali i VERTIKALNO kada je `flex`/`grid`!


---------------
# Grid
grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
- auto-fit == Ponavljaj KOLKO GOD MORE
- minmax == od-do, minimalno 200px do max 1fr

### grid-column
`grid-column: 1 / 3;` se odnosi NA LINIJE, a ne na KOLONE!  
Kaže ovaj content ide od LINIJE 1 do LINIJE 3 (kolone 1 i 2).  

`grid-column: span 3;` kaže "zauzmi 3 kolone", slično kao u Bootstrapu.  
`grid-row: span 3;` kaže "zauzmi 2 reda", slično kao u HTML tabelama.

### Ufiksati element u gridu

```css
li:nth-child(6) {
  grid-row: 2 / 3;
  grid-column: 1 / 2;
}
```
Kaže da 6-i element (iz HTMLa) stavi između 2-3 linije, tj. drugi red, a u prvu kolonu...


----------
# Condition query
```css
@supports (abc: 123) {
    abc: 123;
}
```

u suštini je obični IF!  
Ako browser podržava taj property apply-jaće ga.




--------

# Scrollspy
Ručno:
https://codepen.io/zchee/pen/ogzvZZ?editors=0010


*********************************

koristi REM jedinice umjesto pixela, a pogotovo umjesto EM!!!!!!!!!!!!!!!!!!
REM se odnosi na veličinu fonta u ROOT elementu (<html>) !!!

INHERIT znači naslijedi od parenta neki property.



************
Specificity znači da se primjenjuje pravilo koje je najspecifičnije, "najbolje".
https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity
- broji se sami tag (div, ul ... to je najgeneralnije)
- klasa/pseudoklasa
- id 
- !important (prekoči sva pravila i primijeni ovo) - NIJE PREPORUČENO!





****** clearfix, tae to?
https://css-tricks.com/snippets/css/clear-fix/




******* BEM imenovanje elemenata, naming convention
https://css-tricks.com/bem-101/

.btn {}         /* blok */

.btn__price {}  /* Element UNUTAR bloka, koji NEMA SMISLA SAMOSTALNO */ 

.btn--orange {} /* STIL bloka  */
