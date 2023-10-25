const db = require('../db');

module.exports.getAllCategories = async () => {
    const [main_categories] = await db.query("SELECT * FROM category WHERE Parent_category_id IS NULL");
    return main_categories;
}

module.exports.getUniqueCategory = async (id) => {
    const [unique_main_category] = await db.query(
        `SELECT * FROM product WHERE main_category IN
            (SELECT GetCategoryHierarchyIDs(category_id) AS category_hierachy
                FROM product_category
                WHERE Product_id = ?)`,
         [id]);
    return unique_main_category;
}

module.exports.deleteUniqueCategory = async (id) => {
    const [details] = await db.query("DELETE FROM main_categories WHERE Order_id = ?", [id]);
    return details.affectedRows;
}

module.exports.addOrUpdateCategory = async (obj, id=0) => {
    const [[[{affectedRows}]]] = await db.query("CALL categories_add_or_update(?,?,?)", 
        [id, obj.Name, obj.Image]);
    return affectedRows;
}