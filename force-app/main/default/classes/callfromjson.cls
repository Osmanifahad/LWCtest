public with sharing class callfromjson {
    @AuraEnabled(cacheable=true)
    public static List<Object>  getTodos(){
        HttpRequest req= new HttpRequest();
        
        req.setEndpoint('https://jsonplaceholder.typicode.com/todos');
        req.setMethod('GET');
                     
                     Http ht = new Http();
                      HttpResponse res = ht.send(req);
        if(res.getStatusCode()==200){
            System.debug('Call wa successful');
            
            List<Object> todos=(List<Object>)JSON.deserializeUntyped(res.getBody());
            System.debug(todos);
            return todos;
            
        }else{
                System.debug('Fail to call API');
            
            return new List<Object>();
            }
        }
    }