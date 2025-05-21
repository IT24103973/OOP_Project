package CourseManagement.model;

public class OnCampusCourse extends Course {
    public OnCampusCourse(String code, String name, String unit, int seat, int duration, String date) {
        super(code, name, unit, seat, duration, date);
    }

    @Override
    public String getCourseType() {
        return "On-Campus";
    }
}
