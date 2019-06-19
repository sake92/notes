

## EXPRESSION HAS CHANGED
- Angular u DEV modu nam "pomaže" da detektuje rekurzije 
https://stackoverflow.com/questions/34364880/expression-has-changed-after-it-was-checked/34364881#34364881

*********
DEBUG Typescript chrome:
https://stackoverflow.com/questions/36494938/debug-run-angular2-typescript-with-visual-studio-code


Kada input/select  ne PRIPADA DIREKTNO FORMI,
već ga bindamo i kreiramo pomoću nekog niza ili tako nešto... :D
Npr kad imamo model 
	class Person { countryId: string }
a input rendamo sa
	let countries  = [{id:"BA", name:"Bosna"}];
	
metne se ovo i radi:
	[ngModelOptions]="{standalone: true}"

*************************************************
Kad se bindaju nove komponenete u *ngFor
dodjeljuj array[i]!!!! ne može assing LOKALNU VARIJABLU (let varijabla!!!)
vidi:
https://github.com/angular/angular/issues/8602

<dok-prijave *ngFor="let d of webDokumentiPrijave; let i=index" [(dokument)]="webDokumentiPrijave[i]">
A NE
<dok-prijave *ngFor="let d of webDokumentiPrijave; let i=index" [(dokument)]="d">

***********************************
<div *ngFor="let _section of sectionsRow" >
	<neki-moj-hepek  [(section)]="_section">
	
- fazon: treba bit **razlićit naziv varijable** od atributa koji setaš, 
  npr "_section" (local) i "section" (u komponenti)
*************************************************
ne može na JEDNOM ELEMENTU imat 2+  angular bindinga tipa npr 
<div *ngIf="" *ngFor="" ...
zato što bi moglo biti ambiguous?

more se stavit pomoćni tag <ng-template umjesto diva:
http://stackoverflow.com/questions/40860933/ngif-and-ngfor-on-td-td-element

*************************************************
UPLOAD FAJLA

NE KORISTITI fazon FileReader()... !!! ne radi..
al zato ovo fercera:

<input type="file" #dokFileInput>
@ViewChild('dokFileInput') inputEl: ElementRef;

upload() {
	event.preventDefault();
	let inputEl: HTMLInputElement = this.inputEl.nativeElement;
	let fileCount = inputEl.files.length;
	let formData = new FormData();
}

****************
detekcija promjene RUTE u Angularu,
da može trznut REST je li logovan

http://stackoverflow.com/questions/33520043/how-to-detect-a-route-change-in-angular-2


*****************
BINDANJE polja type DATE
https://stackoverflow.com/questions/37055311/angular2-how-to-use-javascript-date-object-with-ngmodel-two-way-binding


***********
2- way BINDING komponentaaaaaaaaaa :)
moraju imat ISTO IME, model i change !!!
https://stackoverflow.com/questions/40747236/input-two-way-data-binding-not-working

https://stackoverflow.com/questions/37977688/angular2-rc2-expression-has-changed-after-it-was-checked







