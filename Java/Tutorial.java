// 9. APIs, packages
import java.util.HashSet;
import java.util.Scanner; // input, reading a file
import java.time.LocalDate; // date
import java.time.LocalTime; // time
import java.util.ArrayList; // arraylist
import java.util.HashMap; //  hashmap
import java.util.HashSet; // set
import java.io.File; // files
import java.io.FileWriter; // writing to files
import java.io.IOException; // exceptions for files

// 8. Klasy
class Fruit {
    String f = "Banana";
    static void Metoda(String name) {
        System.out.println(name);
    }
}
class Vege {
    String name;
    Vege() {
        name = "Cucumber";
    }
}
// getter, setter
class Person {
    private String name; // private = restricted access
    // Getter
    public String getName() {
        return name;
    }
    // Setter
    public void setName(String newName) {
        this.name = newName;
    }
}
// inheritance
class Vehicle {
    protected String brand = "Ford";        // Vehicle attribute
    public void honk() {                    // Vehicle method
        System.out.println("Tuut, tuut!");
    }
}

class Car extends Vehicle {
    private String modelName = "Mustang";    // Car attribute
//    public static void main(String[] args) {
//
//        // Create a myCar object
//        Car myCar = new Car();
//
//        // Call the honk() method (from the Vehicle class) on the myCar object
//        myCar.honk();
//
//        // Display the value of the brand attribute (from the Vehicle class) and the value of the modelName from the Car class
//        System.out.println(myCar.brand + " " + myCar.modelName);
//    }
}
// polymorphism
class Animal {
    public void animalSound() {
        System.out.println("The animal makes a sound");
    }
}

class Pig extends Animal {
    public void animalSound() {
        System.out.println("The pig says: wee wee");
    }
}

class Dog extends Animal {
    public void animalSound() {
        System.out.println("The dog says: bow wow");
    }
}
// inner classes
class OuterClass {
    int x = 10;

    class InnerClass {
        int y = 5;
    }
}


public class Main { // nazwa pliku
    // 7. Functions
    static void funkcja1() {
        System.out.println("Eyo");
    }
    static void funkcja2(String name) {
        System.out.println("Siemano " + name);
    }
    static int funkcja3(int x) {
        return x + 5;
    }
    public static void main(String[] args) { // main loop
        // 1. Print
        System.out.println("Hello, World!");
        System.out.println("Your mom");
        System.out.println("Bye, then..."); // print with new line at the end
        System.out.print("Nie ma nowej linii :c"); // print with no new line at the end
        System.out.print("Widzisz?");
        System.out.println(" " + 43); // fajne użycie
        // 2. Variables
        String name = "as";
        System.out.println(name);
        int n1 = 6;
        System.out.println(n1);
        int n2;
        n2 = 15;
        System.out.println(n1 * n2);
        float fli = 5.99f;
        final int n3 = 10; // Final value, can't assign a new one
        // int, float, char, boolean, String, char, byte (-128:127), short, long, double,
        System.out.println("Mam " + (n2 - n1) + " lat");
        // String operations
        String s1 = "Jan";
        String s2 = " Krem";
        String sfull = s1 + s2; // you can also use .concat() function
        System.out.println(sfull);
        int l = s1.length(); // gives the length of the s1 string
        System.out.println(s1.toUpperCase()); // string in upper case letters
        System.out.println(s1.toLowerCase()); // string in lower case letters
        System.out.println(sfull.indexOf("Krem")); // returns the index of the first occurrence of the given word
        // 3. Math functions
        Math.max(5, 10);
        Math.min(3, 4);
        Math.sqrt(64);
        Math.abs(-5.7);
        Math.random(); // gives a random number between 0.0 and 1.0
        // 4. Booleans
        boolean isJavaFun = false;
        System.out.println(isJavaFun);
        System.out.println(n1 < n2);
        // 5. If, for etc.
        if(n1 > 0) {
            System.out.println("Hi positive number " + n1 + "!");
        } else if (n1 < 0){
            System.out.println("NOOOOOOOOOOO ITS A NEGATIVE ONE! RUNNNN");
        } else {
            System.out.println("oh. it's zero, bruh...");
        }
        // There's a thing called Ternary Operator
        int time = 18;
        String result = (time > 17) ? "Good morning" : "Yooo"; // if ? true : false
        System.out.println(result);
        //
        int day = 4;
        switch (day) {
            case 1:
                System.out.println("Monday");
                break;
            case 2:
                System.out.println("Tuesday");
                break;
            case 3:
                System.out.println("Wednesday");
                break;
            case 4:
                System.out.println("Thursday");
                break;
            case 5:
                System.out.println("Friday");
                break;
            case 6:
                System.out.println("Saturday");
                break;
            case 7:
                System.out.println("Sunday");
                break;
        }
        int i = 0;
        while (i < 5) {
            System.out.println(i);
            i++;
        }

        for (int y = 0; y < 5; y++) {
            System.out.println(y);
        }

        String[] cars = {"Volvo", "BMW", "Ford", "Mazda"};
        for (String g : cars) { // for each g in cars
            System.out.println(g);
        }
        // 6. Arrays
        int[] arra = {1,2,3,4,5};
        System.out.println(arra[3]); // 0 is the start of indexing
        System.out.println(arra.length); // without () for arrays
        int[][] myNumbers = { {1, 2, 3, 4}, {5, 6, 7} };
        System.out.println(myNumbers[1][2]); // Outputs 7
        // 7. Funkcje
        funkcja1();
        funkcja2("Chuj");
        System.out.println(funkcja3(64));
        // recurtion works as always
        // 8. Klasy
        Fruit f1 = new Fruit();
        System.out.println(f1.f);
        f1.Metoda("Harry");
        Vege f2 = new Vege();
        System.out.println(f2.name);
        // public, private, protected, final (cannot be inherited), abstract (no objects),
        // 10. Enums
        enum Level {
            LOW,
            MEDIUM,
            HIGH
        }
        Level myVar = Level.MEDIUM;
        System.out.println(myVar);
        // 11. User inputs (Scanner)
        Scanner myObj = new Scanner(System.in);

        System.out.println("Enter name, age and salary:");

        // String input
        String imie = myObj.nextLine();

        // Numerical input
        int age = myObj.nextInt();
        double salary = myObj.nextDouble();

        // Output input by user
        System.out.println("Name: " + imie);
        System.out.println("Age: " + age);
        System.out.println("Salary: " + salary);
        // 12. Time (LocalDate)
        LocalDate obiekt = LocalDate.now();
        System.out.println(obiekt);
        LocalTime czas = LocalTime.now();
        System.out.println(czas);
        // 13. ArrayList
        ArrayList<String> car = new ArrayList<String>();
        car.add("Volvo");
        car.add("BMW");
        car.add("Audi");
        System.out.println(car);
        car.get(0); // element by index
        car.set(1, "Sraka"); // setting in the index
        car.remove(0);
        car.clear(); // clearing the whole array
        car.size(); // length of the ArrayList
        // 14. HashMap
        HashMap<String, String> capitalCities = new HashMap<String, String>();
        capitalCities.put("England", "London");
        System.out.println(capitalCities);
        capitalCities.get("England"); // getting a value by refering to its key
        capitalCities.remove("England");
        capitalCities.clear();
        capitalCities.size();
        // 15. HashSet
        HashSet<String> drie = new HashSet<String>();
        drie.add("what");
        drie.contains("what"); // checks if an item exists
        drie.remove("what");
        drie.clear();
        drie.size();
        // 16. Try catch (best thing ever)
        try {
            int[] myNumber = {1, 2, 3};
            System.out.println(myNumber[10]);
        }
        catch(Exception e) {
            System.out.println("Something went wrong.");
        } finally {
            System.out.println("The 'try catch' is finished.");
        }
        // 17. Threads (parallel programming) (extends Thread)
        // 18. Lambda
        ArrayList<Integer> numbers = new ArrayList<Integer>();
        numbers.add(5);
        numbers.add(9);
        numbers.add(8);
        numbers.add(1);
        numbers.forEach( (n) -> { System.out.println(n); } );
        // 19. Files
        try {
            FileWriter myWriter = new FileWriter("filename.txt");
            myWriter.write("Files in Java might be tricky, but it is fun enough!");
            myWriter.close();
            System.out.println("Successfully wrote to the file.");
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
        try {
            File pliczek = new File("filename.txt");
            Scanner myReader = new Scanner(pliczek);
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                System.out.println(data);
            }
            myReader.close();
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }

    }
}

// Java powstała w 1995r. Oracle