package ncu.rent.DTO;
import com.google.gson.Gson;
import java.util.List;

public class User {
	private String ID;
    private String Password;
    private String Name;
    private String Birth;
    private String Gender;
    private String Department;
    private String Phone;
    private String Email;
    /*
    public User(String ID,String Password,String Name,String Birth,String Gender,String Department,String Phone,String Email) {
        this.ID = ID;
        this.Password = Password;
        this.Name = Name;
        this.Birth = Birth;
        this.Gender = Gender;
        this.Department = Department;
        this.Phone = Phone;
        this.Email = Email;
    }
    */
    // GET method
    public String getID() {return ID;}
    public String getPassword() {return Password;}
    public String getName() {return Name;}
    public String getBirth() {return Birth;}
    public String getGender() {return Gender;}
    public String getDepartment() {return Department;}
    public String getPhone() {return Phone;}
    public String getEmail() {return Email;}
    // SET method
    public void setID(String ID) {this.ID = ID;}
    public void setPassword(String Password) {this.Password = Password;}
    public void setName(String Name) {this.Name = Name;}
    public void setBirth(String Birth) {this.Birth = Birth;}
    public void setGender(String Gender) {this.Gender = Gender;}
    public void setDepartment(String Department) {this.Department = Department;}
    public void setPhone(String Phone) {this.Phone = Phone;}
    public void setEmail(String Email) {this.Email = Email;}
}
