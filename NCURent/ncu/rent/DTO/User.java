package ncu.rent.DTO;

public class User {
	private String ID;
    private String Password;
    private String Name;
    private String Birth;
    private String Gender;
    private String Department;
    private String Phone;
    private String Email;
    private String Type;
    private int Amount;
    private String Star;
    // GET method
    public String getID() {return ID;}
    public String getPassword() {return Password;}
    public String getName() {return Name;}
    public String getBirth() {return Birth;}
    public String getGender() {return Gender;}
    public String getDepartment() {return Department;}
    public String getPhone() {return Phone;}
    public String getEmail() {return Email;}
    public String getType() {return Type;}
    public int getAmount() {return Amount;}
    public String getStar() {return Star.substring(0, Star.indexOf(".")+2);} //Math.round(a*100)
    // SET method
    public void setID(String ID) {this.ID = ID;}
    public void setPassword(String Password) {this.Password = Password;}
    public void setName(String Name) {this.Name = Name;}
    public void setBirth(String Birth) {this.Birth = Birth;}
    public void setGender(String Gender) {this.Gender = Gender;}
    public void setDepartment(String Department) {this.Department = Department;}
    public void setPhone(String Phone) {this.Phone = Phone;}
    public void setEmail(String Email) {this.Email = Email;}
    public void setType(String Type) {this.Type = Type;}
    public void setAmount(int Amount) {this.Amount = Amount;}
    public void setStar(String Star) {this.Star = Star;}
}
