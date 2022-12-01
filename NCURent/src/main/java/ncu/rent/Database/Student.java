package ncu.rent.Database;

public class Student {
    public String SID;
    public String SPassword;
    public String SName;
    public String SBirth;
    public String SGender;
    public String SDepartment;
    public String SPhone;
    public String SEmail;
    Student(String SID,String SPassword,String SName,String SBirth,String SGender,String SDepartment,String SPhone,String SEmail) {
        this.SID = SID;
        this.SPassword = SPassword;
        this.SName = SName;
        this.SBirth = SBirth;
        this.SGender = SGender;
        this.SDepartment = SDepartment;
        this.SPhone = SPhone;
        this.SEmail = SEmail;
    }
}
