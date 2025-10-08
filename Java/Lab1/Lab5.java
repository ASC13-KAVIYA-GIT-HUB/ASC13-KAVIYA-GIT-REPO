package Labs.Lab1;

public class Lab5 {
    static int countWords(String input) {
        String[] words = input.trim().split("\\s+");
        return words.length;
    }

    public static void main(String[] args) {
        String text = "Sum of 12 and 20 is 32";
        System.out.println(countWords(text));
    }
}