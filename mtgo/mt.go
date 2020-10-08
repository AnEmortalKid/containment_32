package main

import (
	"fmt"
	"os"
	"strings"

	"github.com/MagicTheGathering/mtg-sdk-go"
)

// cerner_2^5_2020
func main() {
	argsWithoutProg := os.Args[1:]

	if len(os.Args) < 2 {
		fmt.Println("Nothing to search")
		os.Exit(1)
	}

	search := strings.Join(argsWithoutProg, " ")
	fmt.Println("Searching cards with name: ", search)
	cards, totalCardCount, err := mtg.NewQuery().Where(mtg.CardName, search).PageS(0, 1)
	fmt.Println(totalCardCount, " cards exist.")
	if err != nil {
		fmt.Println(err)
	}
	for _, c := range cards {
		fmt.Println(c.Name, "  costs: ", c.ManaCost)
		fmt.Println("Description: ", c.Text)
	}
}
