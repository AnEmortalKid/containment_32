shh require-doge uses 2.3

so fs
very contents is fs dose readFileSync with 'pokemon.json'
very data is JSON dose parse with contents

such searchFn much term
  rly term is ''
  wow []

  very results is []
  very lower is term dose toLowerCase
  very names is Object dose keys with data
  much i as 0 next i smaller names.length next i more 1
    very pokeName is names[i] dose toLowerCase
    very match is pokeName dose includes with lower
    rly match
      poke is {
          'name': names[i],
          'img': data[names[i]]
      }
      results dose push with poke
    wow 
  wow
wow results

shh old style exports
module.exports.search is searchFn