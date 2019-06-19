
Fielddata se koristi za `text` fieldove. 
Ako je enabled, ES ce storati i taj dodatni `fielddata`, 
pa se onda to polje moze koristiti i za sortiranje, agregiranje itd.  
Inače nema smisla sortirati po sadrzaju clanka npr.. Ali ima po naslovu npr.  
Također, treba nam i search po title. 
To polje bi moglo biti `text` + `fieldata`.



http://localhost:9200/my_index/my_type/_search
{
    "size": 0, // exclude hits results
    "query": {
        "bool": {
            "filter": {
                "term": {
                    "SOURCE.keyword": "TW"
                }
            }
        }
    },
    "aggregations": {
        "top_keywords": {
            "terms": {
                "field": "KEYWORD.keyword" // mora bit keyword !
            }
        },
        "trending_stats": {
            "extended_stats": {
                "field": "TRENDING_SCORE" // number mora bit !
            }
        }
    }
}