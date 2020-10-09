import groovy.json.*

def getAnswer() { 
  def ans = System.console().readLine "\nEnter one of [A,B,C,D]: "
  return ans
}
// cerner_2^5_2020
def ask(question)
{
    println("\n\n== [${question.category} (${question.difficulty})] ==\n${question.question}")
    def letterIndex = 65
    def answers = ([] << question.correct_answer << question.incorrect_answers).flatten().shuffled()
    answers.eachWithIndex { it, i -> println("${(char) (i + letterIndex)}) ${it}")}
    def ans = getAnswer()
    while (!(ans.toUpperCase() in ["A","B","C","D"])) {ans = getAnswer()}
    def index = ((int) (char) ans.toUpperCase()) - 65
    def result = answers.get(index)
    return result == question.correct_answer
}

def slurper = new JsonSlurper()
def questions = slurper.parse(new URL("https://opentdb.com/api.php?amount=10&type=multiple")).results

def total = 0
questions.each { 
    def score = ask(it)
    println("=>${score ? ' Correct! ' : ' Incorrect'}")
    total += score ? 1 : 0
}
println("== Final Score: ${total}/10 ==\n${total != 10 ? 'Better Luck Next Time' : 'Good Job'}")
