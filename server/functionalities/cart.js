const express = require('express');
const router = express();

const db = require('../db');

let cart_item;

// Get all items and total value in the cart of a user
// router.get('/:id', async (req,res)=>{
//     const sql = `select pr.title,it.price,ci.quantity,it.image,
//                         sum(it.price * ci.quantity) as total_value
//                     from cart_item ci
//                     join item it using(item_id)
//                     join product pr using(product_id)
//                     join cart ca using(cart_id)
//                     join customer cu using(customer_id)
//                     where cu.customer_id = ?
//                     group by pr.title,it.price,ci.quantity,it.image`;
//     [cart_item] = await db.query(sql,req.params.id);
//     res.send(cart_item);
//     console.log(cart_item);
// });

router.get("/:id", async (req, res) => {
    const sql = `select it.item_id, pr.title,it.price,ci.quantity,it.image,
                            sum(it.price * ci.quantity) as total_value
                        from cart_item ci
                        join item it using(item_id)
                        join product pr using(product_id)
                        join cart ca using(cart_id)
                        join customer cu using(customer_id)
                        where cu.customer_id = ?
                        group by pr.title,it.price,ci.quantity,it.image,it.item_id;`;
  
    const sql2 = `select t.attribute_name, t.variant_name 
                    from (select a.attribute_id, a.name attribute_name, v.name variant_name from attribute a 
                        left join variant v using(variant_id)) t 
                        right join (select * from item_configuration where Item_id = ?) x 
                        using(attribute_id);`;
  
    const [cart_item] = await db.query(sql, req.params.id);
    const cart_item1 = await Promise.all(
      cart_item.map(async (item) => {
        const [variant] = await db.query(sql2, item.item_id);
        item.variant = variant;
        return item;
      })
    );
    res.send(cart_item1);
    console.log(cart_item);
  });

router.get('/id/:id', async (req,res)=>{
  const sql = `SELECT Cart_id FROM cart WHERE Customer_id = ?`;
  const [data] = await db.query(sql,[req.params.id]);
  res.send(data);
});

router.post('/:id/:item/:num', async (req,res)=>{

    const sql = `insert into cart_item values(?,?,?)
                    on duplicate key update 
                    quantity = quantity+?`;
    await db.query(sql,[req.params.id,req.params.item,req.params.num,parseInt(req.params.num)]);
});

// Add a new item to the cart of a user
// router.post('/:id/:item', async (req,res)=>{
//     const sql1 = `select is_registered from customers where customer_id = ?`;
//     const sql2 = `select cart_id from carts where customer_id = ?`;
//     const sql3 = `insert into carts values(?,0)`;
//     const sql4 = `insert into cart_items(cart_id, unique_product_id, quantity)
//                         values(?,?,1)
//                     on duplicate key
//                         update quantity = quantity + 1 where cart_id = ?`;
//     let is_registered = await db.query(sql1,req.params.id);
//     if(!is_registered) res.send("You are not registered yet. Please get registered.");
//     else{
//         let cart_id = await db.query(sql2,req.params.id);
//         if(!cart_id) db.query(sql3,req.params.id);
//         cart_id = await db.query(sql2,req.params.id);
//         db.query(sql4,[cart_id,req.params.item,cart_id]);
//     }
// }); 

module.exports = router;