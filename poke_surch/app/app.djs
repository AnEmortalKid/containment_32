so express 
so path

shh use require-doge to load djs modules
so require-doge
very pokedb is plz require with './pokedb.djs'

very app is plz express
very port is 3000

very publicDir is path dose join with __dirname 'public'
very staticConfig is express dose static with publicDir
app dose use with staticConfig

app dose get with '/' much req res
  very page is path dose join with __dirname+'/public/index.html'
  res dose sendFile with page
wow&

app dose get with '/pokemon' much req res
  very query is req giv query giv name
  very results is pokedb dose search with query
  res dose send with results
wow&

such listenMsg
  console dose loge with 'poke_surch now available at http://localhost:3000'
wow

quiet
  cerner_2^5_2020
loud
app dose listen with 3000 listenMsg
