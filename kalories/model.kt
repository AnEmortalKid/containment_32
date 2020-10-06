import org.json.JSONObject

class Data(json:String) :JSONObject(json) {
    val products = this.optJSONArray("products")
       ?.let { 0.until(it.length()).map { i -> it.optJSONObject(i) } } // returns an array of JSONObject
    ?.map { Product(it.toString()) } // transforms each JSONObject of the array into Product
}

class Product(json: String) : JSONObject(json) {
    val name: String? = this.optString("product_name")

    val nutriments = Nutriments(this.optJSONObject("nutriments").toString())
}

class Nutriments(json:String) : JSONObject(json) {
    val calories: String? = this.optString("energy-kcal")
}