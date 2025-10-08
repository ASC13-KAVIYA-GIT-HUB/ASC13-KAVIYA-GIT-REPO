

//1. Class Identification ////////////////////////////////////////////////////

    static class MeetingRoom {
        String id;
        int capacity;
        int floor;
    }

    static class ZoomMeetingRoom extends MeetingRoom {
        String zoomDeviceId;
        String zoomAccountId;
    }

    static class Booking {
        String employeeId;
        String meetingDate;
        String meetingTime;
        int duration;
    }


//2. Welcome Message Method ////////////////////////////////////////////////////

    public static String welcomeMessage(String name) {
        return "Hello " + name + ", Welcome to Java World!";
    }

//3. Largest Number Method ////////////////////////////////////////////////////

    public static int largest(int a, int b, int c) {
        return Math.max(a, Math.max(b, c));
    }

//4. Print Digits in Words ////////////////////////////////////////////////////

    public static void printDigitsInWords(int number) {
        String[] words = {"Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"};
        String numStr = String.valueOf(number);
        for (char digit : numStr.toCharArray()) {
            System.out.print(words[digit - '0'] + " ");
        }
        System.out.println();
    }

//5. Main Method ////////////////////////////////////////////////////

    public static void main(String[] args) {
        System.out.println(welcomeMessage("Alice"));
        System.out.println("Largest number: " + largest(12, 45, 23));
        System.out.print("Digits in words: ");
        printDigitsInWords(951);
    }
}
