{
  "$GMObject":"",
  "%Name":"oBreakableWall",
  "eventList":[
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":1,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"oBreakableWall",
  "overriddenProperties":[],
  "parent":{
    "name":"breakable walls",
    "path":"folders/Objects/terrain/breakable walls.yy",
  },
  "parentObjectId":{
    "name":"oWall",
    "path":"objects/oWall/oWall.yy",
  },
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"terrain","filters":[],"listItems":[
        "\"normal\"",
        "\"cave\"",
        "\"lava\"",
      ],"multiselect":false,"name":"terrain","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"\"normal\"","varType":6,},
    {"$GMObjectProperty":"v1","%Name":"threshhold","filters":[],"listItems":[],"multiselect":false,"name":"threshhold","rangeEnabled":false,"rangeMax":3.0,"rangeMin":1.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":1,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"sBreakableWall_Orange",
    "path":"sprites/sBreakableWall_Orange/sBreakableWall_Orange.yy",
  },
  "spriteMaskId":null,
  "visible":true,
}