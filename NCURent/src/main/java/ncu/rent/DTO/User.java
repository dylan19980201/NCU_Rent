package ncu.rent.DTO;
import com.google.gson.Gson;

public class User {
	public String ID;
    public String Password;
    public String Name;
    public String Birth;
    public String Gender;
    public String Department;
    public String Phone;
    public String Email;
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
}
