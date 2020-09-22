import groovy.yaml.YamlSlurper
import groovy.json.*

def request = new YamlSlurper().parse(System.in)
def base = request.url

def url = base
// convert query params to encoded and appended url
if(request.queryParams) {
    def keyStrings = request.queryParams.collect { qp ->
    qp.getValue() instanceof java.lang.Iterable ? qp.getValue().collect { "${qp.getKey()}=${it}"} : "${qp.getKey()}=${qp.getValue()}"}
    base += "?" + URLEncoder.encode(keyStrings.flatten().join('&'))
}

def httpReq = new URL(request.url).openConnection()
httpReq.setRequestMethod(request.method)
// set headers
request.headers?.each { header -> httpReq.setRequestProperty(header.getKey(), header.getValue())}

// set body
if(request.body) {
    httpReq.setDoOutput(true)
    httpReq.getOutputStream().write(new JsonBuilder(request.body).toPrettyString().getBytes("UTF-8"))
}

println("${httpReq.getResponseCode()}:\n${httpReq.getInputStream().getText()}")
