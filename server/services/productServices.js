const db = require('../db');

module.exports.getAllProducts = async () => {
    const [products] = await db.query("SELECT * FROM product");
    return products;
}

// module.exports.getUniqueProduct = async (id) => {
//     const [unique_product] = await db.query("SELECT * FROM products WHERE Product_id = ?", [id]);
//     return unique_product;
// }

module.exports.getUniqueProduct = async (id) => {
    const [unique_product] = await db.query(`
        SELECT Product_id,Title,SKU,Weight,Description,p.Image,
                    MIN(price) as Min_price
        FROM product p
        LEFT JOIN item i using(product_id)
        WHERE p.Product_id = ?`, [id]);
    const [items] = await db.query(`
        SELECT * FROM item WHERE Product_id = ?`, [id]);
    return [unique_product,items];
}

module.exports.deleteUniqueProduct = async (id) => {
    const [details] = await db.query("DELETE FROM products WHERE Product_id = ?", [id]);
    return details.affectedRows;
}

module.exports.addOrUpdateProduct = async (obj, id=0) => {
    const [[[{affectedRows}]]] = await db.query("CALL products_add_or_update(?,?,?,?,?,?,?)", 
        [id, obj.Title, obj.SKU, obj.Weight, obj.Description, obj.Image, obj.main_category]);
    return affectedRows;
}