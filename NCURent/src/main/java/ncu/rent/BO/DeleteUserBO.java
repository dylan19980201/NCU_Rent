package ncu.rent.BO;
import ncu.rent.DAO.DeleteUserDAO;

public class DeleteUserBO {
    public boolean deleteUser(String id, String password) {
        DeleteUserDAO DeleteUserDAO = new DeleteUserDAO();
		return DeleteUserDAO.DeleteUserData(id, password);
    }
}
