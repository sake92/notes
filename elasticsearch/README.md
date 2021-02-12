
ES GUI:
https://github.com/appbaseio/dejavu#6-get-dejavu


- index ~ baza
- type ~ tabela
- document ~ red

## index 
PUT http://localhost:9200/my_index -> create index  
GET http://localhost:9200/my_index -> get index metadata


## id
Dokument ima svoj id, isto kao u Mongu. Drzi se u polju "_id".  
Generalno sva predefined ES polja imaju underscore predznak.


## type
Svi dokumenti u indexu se trpaju u isti memorijski prostor.  
Tip se koristi samo za **logičko** razdvajanje.


Može se pretražit i CIJELI INDEX a i TIP POSEBNO.  
http://localhost:9200/bla/_search?pretty  
http://localhost:9200/bla/test/_search?pretty  

NE MOŽEŠ IMAT VIŠE TIPOVA U ISTOM INDEXU OD VERZIJE 6 !!!  
https://discuss.elastic.co/t/multiple-type-in-one-index-in-es-6-1/116803

## mapping
Kad se indexira dokument, ES automatski napravi mapping,
na osnovu sadrzaja dokumenta skonta...
Mapping kaze Elasticsearchu KAKO DA INDEXIRA dokument datog tipa.  
Moraš mu bukvalno reć da je polje "name" tipa string itd.  
Kasnije će ES tretirat to polje kao string, ako mu pošaljes integer baciće error.

Dobavlja se kroz `/{index}/_mapping/{type}`, npr. http://localhost:9200/my_index/_mapping/my_type

Ako ES ne moze mergeat stari mapping sa novim dobije se exception.
Treba se napravit novi mapping, reindexirat i vratit u stari index...!?? wtf

Kad u indexu nema podataka, obriše se i mapping automatski!!!?

### index opcije
opcije za indexiranje: 

- no -> nikako, ne moze se pretrazit po tom polju
- not_analyzed -> cijeli text je 1 term, whole string
- analyzed -> default, cijepa po space i zarez itd.

## tipovi fieldova

Osnovni tipovi polja su string, number, date i boolean.
Moze se zadat date format u mappingu, default je ISO 8601.

### "text" vs "keyword" 
"text" se analizira (cijepa na termove), a "keyword" ne (koristi se za UUID, id-jeve, sortiranje, agregiranje ...)  
Samo po keywordima se moze sortirat!! :)

https://discuss.elastic.co/t/what-is-the-difference-between-keyword-type-vs-text-type-with-keyword-analyzer/81176

## update

### replace
to je ustvari index. vidi gore insert/create

### s parcijalnim dokumentom
Moze se radit update tako sto se posalje parcijalni dokument.  
POST 'localhost:9200/my_index/my_type/2/_update
"doc": {
    "neko_polje": "fd6f7dsfs"
}

Ovo će ZAMIJENIT "neko_polje" u dokumentu!!

### skriptom, kad nam trebaju prethodne vrijednosti
Također ima podrška za skriptu, pošalje se skripta koja odradi update.

`ctx._source.str_array.remove( ctx._source.str_array.indexOf('a') );`


## search
Može se pretražit SVE u ES, INDEX, TIP:
- localhost:9200/_search
- localhost:9200/my_index/_search
- localhost:9200/my_index/my_type/_search
- localhost:9200/_all/my_type/_search


### analiziranje teksta
- match, match_phrase NE ANALIZIRA tekst, matcha BUKVALNO (contains)
- term, terms gleda TERM-ove posebno, npr "abc-def" gleda TERMOVE "abc" i "def" A NE CIJELU FRAZU !!!

### Query DSL
Polje "filter" određuje koje dokumente će zadržati u rezultatu.  
Bolje je isfiltrirat što više dokumenata.  
Filter **ne utiče** na score nikako!!!

Nakon filtera se gleda "query", rangiraju se dokumenti i dodjeljuje im se "score".
```json
{
    "query": {
        "bool": {
            "must": {
                "match": {
                    "keyword": "whatever1"
                }
            },
            "filter": [ 
                { "term":  { "status": "published" }},
                { "range": { "publish_date": { "gte": "2015-01-01" }}}
              ]
        }
    }
}
```

### term query
Term query gleda samo **jednu vrijednost** polja i na osnovu broja pojavljivanja daje score.
```json
"term": {
  "tags": "elasticsearch"
}
```
### terms query
Terms query radi isto ali gleda **više mogućih vrijednosti**.
```json
"terms": {
  "tags": ["jvm", "hadoop"]
}
```
Može se dati i **minimalan broj termova** koji mora matchat:

```json
"minimum_should_match": 2
```

### match query
Obično sadrži više **subquery**-ja, i koristi OR operaciju između njih.  
Ako hoćemo AND, moramo ručno napisat:
```json
"match": {
  "name": {
    "query": "Elasticsearch Denver",
    "operator": "and"
  }
}
```
Match ANALIZIRA i sami QUERY, dok "term" NE ANALIZIRA !!!
Ovo bi pretražilo **tačno frazu** "Elasticsearch Denver".  
Bez `"operator": "and"` query bi bio "Elasticsearch" OR "Denver".

Ako ne znamo tačno frazu, možemo navesti i **daljinu između riječi**, `"slop": 3`. Npr. ovo bi matchalo "Elasticsearch Denver" a također i "Elasticsearch a b Denver".

### must, should
Must mora matchat sve. 

Should po defaltu 1, ostali su opcioni, samo povećavaju skor. Ako imaš i must i should, onda je should 0, svi su opcioni.
https://stackoverflow.com/questions/28768277/elasticsearch-difference-between-must-and-should-bool-query

Mogu se koristit i u query a i u filteru.

## misc

Parcijalni update može samo PREKO ID.  
Ako treba update-by-query, mora preko skripte (`_source.my_field=params.my_field`).  
https://discuss.elastic.co/t/update-by-query-taking-a-partial-document/65940/2

https://stackoverflow.com/questions/35951244/how-do-i-make-sure-null-or-missing-fields-comes-first-during-sort-on-that-field

https://stackoverflow.com/questions/21461269/how-to-create-unique-constraint-in-elasticsearch-database


