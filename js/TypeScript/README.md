




Typescript dodaje tipove na JS jezik.

# JS Modules
Pošto JS nije imao module, ljudi su izmišljali i krpili se kako znaju i umiju: RequireJS, ES5 moduli, UMD...

### RequireJS moduli
`const someLib = require("someLib")`
Često u NodeJS-u

### ES5 standardni moduli
Ovo je sad standard, podržano i u novijim NodeJS verzijama:  
`import * as a from 'b';`

# TS Definitely Typed
Eh sad, ako je lib napisan u čistom JSu, trebamo nekako "nakalemit tipove" na sve definicije iz tog modula.  
Koristi se sintaksa slična TS sintaksi.  
Za većinu libova već postoje definicije: https://github.com/DefinitelyTyped/DefinitelyTyped  
Dodamo kao dev dependency `foo.d.ts`, TS definicije za foo library...






