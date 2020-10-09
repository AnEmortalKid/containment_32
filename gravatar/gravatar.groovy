// cerner_2^5_2020
if(!this.args) {
    println("Cannot gravatar nothing :(")
    System.exit(1)
}

def term=this.args[0]

// create dirs
new File("out/$term").mkdirs()

def dimensions = [100,150,200,250,400]
dimensions.each {dimension -> 
  println("Generating $dimension")
  new File("out/${term}/${dimension}.png").withOutputStream { out ->
    out << new URL("https://api.adorable.io/avatars/${dimension}/${term}.png").openStream()
  }
}
