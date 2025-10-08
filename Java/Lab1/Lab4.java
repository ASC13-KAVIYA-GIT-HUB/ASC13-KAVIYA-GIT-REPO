package Labs.Lab1;

public class Lab4 {

    static void printTableFor(int num) {
        for (int i = 1; i <= 10; i++) {
            System.out.println(num + " x " + i + " = " + (num * i));
        }
    }

    static void printTableWhile(int num) {
        int i = 1;
        while (i <= 10) {
            System.out.println(num + " x " + i + " = " + (num * i));
            i++;
        }
    }

    static void printTableDoWhile(int num) {
        int i = 1;
        do {
            System.out.println(num + " x " + i + " = " + (num * i));
            i++;
        } while (i <= 10);
    }

    public static void main(String[] args) {
        int input = 2;
        printTableFor(input);
        printTableWhile(input);
        printTableDoWhile(input);
    }
}
