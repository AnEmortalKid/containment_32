import groovy.json.*
import com.vdurmont.emoji.EmojiParser
import groovy.xml.*

// cerner_2^5_2020
def key = System.getenv()["API_KEY"]
if(!key) {
    println("An API_KEY was not found and data cannot be retrieved")
    System.exit(1)
}

def toEmoji(emojiCode) {return EmojiParser.parseToUnicode(emojiCode)}
def toTimeEmoji(isDay) { return isDay == "yes" ? toEmoji(":sun_with_face:") : toEmoji(":full_moon_with_face:") }

codes =  new XmlSlurper().parseText(new File("./wwoConditionCodes.xml").text)
def findCondition(conditionCode) { codes.condition.find { it.code == conditionCode }}

//call the api and let it discover our location
def httpReq = new URL("http://api.weatherstack.com/current?access_key=$key&query=fetch:ip").openConnection()

def statusCode = httpReq.getResponseCode()
if(statusCode != 200) {
    println("${toEmoji(':boom:')} Could not retrieve data ${toEmoji(':sob:')}\n${httpReq.getInputStream().getText()}")
    System.exit(1)
}
def response = new JsonSlurper().parseText(httpReq.getInputStream().getText())

def current = response.current
def condition = findCondition(current.weather_code)
println("""${toEmoji(":memo:")} Weather for ${response.location.name},${response.location.region}

  ${toTimeEmoji(current.is_day)} ${condition.emoji ? toEmoji(condition.emoji.text()) : ''}
  ${condition.description}

  ${toEmoji(":temperature:")}  Temperature
    It is ${current.temperature} but it feels like ${current.feelslike}

  ${toEmoji(":wind_chime:")} Wind Conditions
    Wind blowing at ${current.wind_speed} ${current.wind_degree}° towards ${current.wind_dir}\n""")
