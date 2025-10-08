package Labs.Lab1;

public class Student {
        int studentId;
        String studentName;
        String city;
        int marks1, marks2, marks3;
        float feePerMonth;
        boolean isEligibleForScholarship;

        void setStudentId(int id) { studentId = id; }
        void setStudentName(String name) { studentName = name; }
        void setCity(String c) { city = c; }
        void setMarks1(int m) { marks1 = m; }
        void setMarks2(int m) { marks2 = m; }
        void setMarks3(int m) { marks3 = m; }
        void setFeePerMonth(float fee) { feePerMonth = fee; }
        void setIsEligibleForScholarship(boolean b) { isEligibleForScholarship = b; }

        int getStudentId() { return studentId; }
        String getStudentName() { return studentName; }
        String getCity() { return city; }
        int getMarks1() { return marks1; }
        int getMarks2() { return marks2; }
        int getMarks3() { return marks3; }
        float getFeePerMonth() { return feePerMonth; }
        boolean getIsEligibleForScholarship() { return isEligibleForScholarship; }

        float getAnnualFee() { return feePerMonth * 12; }
        int getTotalMarks() { return marks1 + marks2 + marks3; }
        float getAverage() { return getTotalMarks() / 3.0f; }
        String getResult() {
            if (marks1 > 60 && marks2 > 60 && marks3 > 60) return "pass";
            else return "fail";
        }
    }

