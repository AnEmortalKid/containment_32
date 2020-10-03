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

    val headers = mutableListOf<String>()
    val argIterator = args.iterator()
    var url = ""
    while (argIterator.hasNext()) {
        val arg = argIterator.next()
        when (arg) {
            "-H" -> headers.add(argIterator.next())
            else -> url = arg
        }
    }

    val request = URL(url).openConnection().apply {
        headers.forEach { addRequestProperty(it.split(":")[0], it.split(":")[1]) }
    } as HttpURLConnection
    println("${request.responseCode}\n${BufferedReader(request.inputStream.reader()).readText()}")
}