package CourseManagement.model;

public class OnlineCourse extends Course {
    public OnlineCourse(String code, String name, String unit, int seat, int duration, String date) {
        super(code, name, unit, seat, duration, date);
    }

    @Override
    public String getCourseType() {
        return "Online";
    }
}
