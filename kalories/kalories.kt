import java.io.BufferedReader
import java.net.HttpURLConnection
import java.net.URL
import kotlin.system.exitProcess

// cerner_2^5_2020
fun main(args: Array<String>) {
    if (args.isNullOrEmpty()) {
        println("No arguments, nothing to call!")
        exitProcess(1);
    }

    val searchTerms = args.joinToString(separator="%20")
    val url ="https://world.openfoodfacts.org/cgi/search.pl?search_terms=$searchTerms&search_simple=1&action=process&json=1&tagtype_1=countries&tag_contains_1=contains&tag_1=United%20States&sort_by=unique_scans_n&page_size=1"

    val request = URL(url).openConnection().apply {
        // The API would like us to use a User-Agent in case they need to track us down
        addRequestProperty("User-Agent", "AnEmortalKid/containment_32/kalories - github.com/AnEmortalKid/containment_32")
    } as HttpURLConnection

    val json = BufferedReader(request.inputStream.reader()).readText()

    if(request.responseCode == 200) {
        val jsonData = Data(json)
        jsonData.products?.forEach { 
            println("${it.name} has ${it.nutriments.calories} kcal")
        }
    }
    else {
        println("Could not find data, got ${request.responseCode}: ${json}")
    }
}