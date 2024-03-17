package main

import "fmt"
// 6. Functions
func myMessage() {
	fmt.Println("Eyooo")
}
func familyName(fname string) {
	fmt.Println("Hello", fname, "Refsnes")
}

func myFunction(x int, y string) (result int, txt1 string) {
	result = x + x
	txt1 = y + " World!"
	return
}

// 7. Struct
type Person struct {
	name string
	age int
	job string
	salary int
}


// Comment
func main() {
	// 1. Go, go, go!
	fmt.Println("Hello world!")
	// 2. Variables
	var test1 = 10 
	var student string = "John"
	test2 := 12 // used inside functions
	// there are three ways to declare a variable
	var a,b,c,d = 1,"Brick","Chart",5
	// there's also this way...
	var (
		e int
		f int = 1
		g string = "Straw"
	)
	const stala int = 10

	// 3. Formating verbs
	// %v - prints the value in the default format, %#v - go-syntax format, %T - type of the value
	fmt.Println(test1)
	fmt.Println(student)
	fmt.Println(test2)
	// 4. Arrays (index 0) (default value is 0)
	var arr1 = [3]int{1,2,3}
	arr2 := [5]int{4,5,6,7,8}
	arr3 := [...]int{4,5,6}
	var arr4 = [5]int{1:10,2:40}
	fmt.Println(len(arr3))
	// there are also slices (arrays v2)
	var slice1 = []int{1,2,3}
	// len() for length, cap() for capacity of the slice
	// 5. If, for etc.
	if 20 > 18 {
		fmt.Println("Wow.")
	}
	// switch

	for i:=0; i < 5; i++ {
		fmt.Println(i)
	}
	// 6. Functions
	myMessage()
	familyName("Liam")
	familyName("Jenny")
	familyName("Anja")
	z, y := myFunction(5, "Hello")
  	fmt.Println(a, b)
	// 7. Struct
	var pers1 Person
	var pers2 Person

	// Pers1 specification
	pers1.name = "Hege"
	pers1.age = 45
	pers1.job = "Teacher"
	pers1.salary = 6000

	// Pers2 specification
	pers2.name = "Cecilie"
	pers2.age = 24
	pers2.job = "Marketing"
	pers2.salary = 4500

	// Access and print Pers1 info
	fmt.Println("Name: ", pers1.name)
	fmt.Println("Age: ", pers1.age)
	fmt.Println("Job: ", pers1.job)
	fmt.Println("Salary: ", pers1.salary)

	// Access and print Pers2 info
	fmt.Println("Name: ", pers2.name)
	fmt.Println("Age: ", pers2.age)
	fmt.Println("Job: ", pers2.job)
	fmt.Println("Salary: ", pers2.salary)
	// 8. Hashmaps
	var t = make(map[string]string) // The map is empty now
	t["brand"] = "Ford"
	t["model"] = "Mustang"
	t["year"] = "1964"
									// a is no longer empty
	m := make(map[string]int)
	m["Oslo"] = 1
	m["Bergen"] = 2
	m["Trondheim"] = 3
	m["Stavanger"] = 4

	fmt.Printf("a\t%v\n", t)
	fmt.Printf("b\t%v\n", m)
	// delete elements: delete(map_name, key)

	x := map[string]int{"one": 1, "two": 2, "three": 3, "four": 4}

	for k, v := range x {
	  fmt.Printf("%v : %v, ", k, v)
	}

}
