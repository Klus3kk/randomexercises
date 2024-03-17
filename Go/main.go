package main // Zawsze się tego używa, komentarz wypisuje się za pomocą "//"

import "fmt" // Importuje pakiet fmt

/* Typy zmiennych:
[1] int (uint - bez znaku)
[2] float32
[3] string
[4] bool
*/
var nowe int = 3 // := to system wybiera typ zmiennej (TYLKO W FUNC MAIN)
var napis string = "Hello world!"
var zmienna float32 = 19.23
var tn bool = false

const stala int = 5 // Wartość stała

/* Print - zwykłe
Println - drukowanie z nową linią
Printf - wyraz formatowania: %v - wartość zmiennej, %T - typ zmiennej
*/

// "If" tak samo jak w C++

// Ciągi to inna sprawa... (są jeszcze slices)

var ciag = [10]int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10} // Można też podać długość tak: [...]
var ciag2 = [3]string{"Hej", "To", "Ja"}

var nowyslice = []int{1, 2, 3}

func wiadomosc() {
	fmt.Println("Elo")
}

func dodawanie(a int, b int) int { // Musi być podany typ return
	return a + b
}

type struktura struct { // Struct
	name   string
	age    int
	job    string
	salary int
}

var mapa = map[string]string{"brand": "Ford", "model": "Mustang", "year": "1964"} // map[KeyType]ValueType{key1:value1, key2:value2,...}

func main() { // Funkcja główna
	var person1 struktura
	person1.age = 45
	zmienna = 8.5
	fmt.Println("Hello world!")
	fmt.Println(zmienna)
	numbers := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
	// Original slice
	fmt.Printf("numbers = %v\n", numbers)
	fmt.Printf("length = %d\n", len(numbers))
	fmt.Printf("capacity = %d\n", cap(numbers))

	// Create copy with only needed numbers
	neededNumbers := numbers[:len(numbers)-10]
	numbersCopy := make([]int, len(neededNumbers))
	copy(numbersCopy, neededNumbers)

	fmt.Printf("numbersCopy = %v\n", numbersCopy)
	fmt.Printf("length = %d\n", len(numbersCopy))
	fmt.Printf("capacity = %d\n", cap(numbersCopy))

	for i := 0; i < 5; i++ { // for jak w C++ (switch,if)
		fmt.Println(i)
	}

	wiadomosc()
	dodawanie(5, 4)
}
