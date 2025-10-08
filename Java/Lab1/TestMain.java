package Labs.Lab1;

public class TestMain {
        public static void main(String[] args) {
            Student s1 = new Student();
            Student s2 = new Student();
            Student s3 = new Student();

            s1.setStudentId(1);
            s1.setStudentName("Kaviya");
            s1.setCity("Chennai");
            s1.setMarks1(70);
            s1.setMarks2(80);
            s1.setMarks3(90);
            s1.setFeePerMonth(1500);
            s1.setIsEligibleForScholarship(true);

            s2.setStudentId(2);
            s2.setStudentName("Vishranthi");
            s2.setCity("Mumbai");
            s2.setMarks1(60);
            s2.setMarks2(65);
            s2.setMarks3(70);
            s2.setFeePerMonth(1200);
            s2.setIsEligibleForScholarship(false);

            s3.setStudentId(3);
            s3.setStudentName("Soundarya");
            s3.setCity("Delhi");
            s3.setMarks1(85);
            s3.setMarks2(90);
            s3.setMarks3(95);
            s3.setFeePerMonth(1800);
            s3.setIsEligibleForScholarship(true);

            Student[] students = {s1, s2, s3};

            Student top = students[0];
            for (Student s : students) {
                if (s.getTotalMarks() > top.getTotalMarks()) top = s;
            }
            System.out.println(top.getStudentName());

            Student leastFee = students[0];
            for (Student s : students) {
                if (s.getFeePerMonth() < leastFee.getFeePerMonth()) leastFee = s;
            }
            System.out.println(leastFee.getStudentName() + " " + leastFee.getFeePerMonth());

            for (Student s : students) {
                System.out.println(s.getStudentName() + " " + s.getTotalMarks() + " " + s.getAverage() + " " + s.getResult() + " " + s.getIsEligibleForScholarship());
            }
        }
    }
