package Labs.Lab1;

public class Lab6 {

    static void testCharAt(String s) {
        System.out.println("charAt(2): " + s.charAt(2));
    }

    static void testContains(String s) {
        System.out.println("contains(\"Sum\"): " + s.contains("Sum"));
    }

    static void testLength(String s) {
        System.out.println("length: " + s.length());
    }

    static void testIndexOf(String s) {
        System.out.println("indexOf(\"12\"): " + s.indexOf("12"));
    }

    static void testEquals(String s1, String s2) {
        System.out.println("equals: " + s1.equals(s2));
    }

    static void testEqualsIgnoreCase(String s1, String s2) {
        System.out.println("equalsIgnoreCase: " + s1.equalsIgnoreCase(s2));
    }

    static void testJoin() {
        String joined = String.join("-", "Sum", "of", "12", "and", "20");
        System.out.println("join: " + joined);
    }

    static void testLastIndexOf(String s) {
        System.out.println("lastIndexOf(\"2\"): " + s.lastIndexOf("2"));
    }

    static void testSubstring(String s) {
        System.out.println("substring(4, 6): " + s.substring(4, 6));
    }

    static void testToLowerCase(String s) {
        System.out.println("toLowerCase: " + s.toLowerCase());
    }

    static void testToUpperCase(String s) {
        System.out.println("toUpperCase: " + s.toUpperCase());
    }

    static void testTrim(String s) {
        System.out.println("trim: \"" + s.trim() + "\"");
    }

    public static void main(String[] args) {
        String input = "  Sum of 12 and 20 is 32  ";
        String compare = "sum of 12 and 20 is 32";

        testCharAt(input.trim());
        testContains(input);
        testLength(input);
        testIndexOf(input);
        testEquals(input.trim(), compare);
        testEqualsIgnoreCase(input.trim(), compare);
        testJoin();
        testLastIndexOf(input);
        testSubstring(input);
        testToLowerCase(input);
        testToUpperCase(input);
        testTrim(input);
    }
}
