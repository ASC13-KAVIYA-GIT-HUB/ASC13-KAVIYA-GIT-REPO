package Labs.Lab1;
public class Lab1 {
        public void add(int a, int b) {
            System.out.println(a + b);
        }
        public void add(int a, int b, int c) {
            System.out.println(a + b + c);
        }
        public void add(double a, double b) {
            System.out.println(a + b);
        }
        public void add(String s, int a) {
            System.out.println(s + " " + a);
        }
        public void add(short a, short b) {
            System.out.println(a + b);
        }
        public static void main(String[] args) {
            Lab1 lab1 = new Lab1();
            lab1.add(10, 20);
            lab1.add(10, 20, 30);
            lab1.add(10.5, 20.1);
            lab1.add("Hello", 20);
            lab1.add((short)5, (short)6);
        }
}

