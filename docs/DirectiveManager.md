# DirectiveManager Directives #

Used to add and remove directives to the response.

### setDirective ###
- - - -
Adds a directive to the response.

``` 
void setDirective(Model.AlexaDirective directive)
void setDirective(Model.AlexaDirective directive, List<Model.AlexaSlot> slots) 
```

Input                                | Description
-------------------------------------| ----------------------------------------------
directive (Model.AlexaDirective)     | The directive to add to the response
slots (List<Model.AlexaSlot>)        | Slots to add to the directive in the response

**Example:**
```
alexaforce.Model.AlexaDirective dir = new alexaforce.Model.AlexaDirective();
dir.type = 'Dialog.Delegate';
Directives.setDirective(dir);
```

### removeDirective ###
- - - -
Removes a directive from the response.

``` 
void removeDirective(Model.AlexaDirective directive)
```

Input                                | Description
-------------------------------------| -------------------------------------------------
directive (Model.AlexaDirective)     | The directive to add to remove from the response

**Example:**
```
alexaforce.Model.AlexaDirective dir = new alexaforce.Model.AlexaDirective();
dir.type = 'Dialog.Delegate';
Directives.removeDirective(dir);
```

### getDirectives ###
- - - -
Returns all directives currently queued up for the response.

``` 
Map<Model.AlexaDirective, List<Model.AlexaSlot>> getDirectives()
```

Output                                                | Description
----------------------------------------------------- | ------------------------------------------------------------------------
Map<Model.AlexaDirective, List<Model.AlexaSlot>>      | Returns a map, indexed by Directive, with a list of slots per directive

**Example:**
```
Map<Model.AlexaDirective, List<Model.AlexaSlot>> dirMap = Directives.getDirectives();
```




