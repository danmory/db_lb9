use db_lab;

db.restaurants.find({});

db.restaurants.find({}, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 });

db.restaurants.find({ borough: 'Bronx' }).limit(5);

db.restaurants.find({$or: [
                            { $and: [
                                { cuisine: { $not: /American/ } },
                                { cuisine: { $not: /Chinese/ } }
                            ]},
                            { name: {$regex: /^Wil/} }
                    ]},
                    { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 });

db.restaurants.aggregate({ $match: { name: /mon/ } },
                         { $project: {
                                        name: 1,
                                        borough: 1,
                                        longitude: { $arrayElemAt: ['$address.coord', -1]},
                                        attitude: { $arrayElemAt: ['$address.coord', 0]},
                                        cuisine: 1
                         } });

db.restaurants.find({ borough: { $in : ['Staten Island', 'Queens', 'Bronx', 'Brooklyn'] }},
                    { restaurant_id: 1, name: 1, borough: 1, cuisine: 1  });