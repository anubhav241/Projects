package OnlineBookStore;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class AddBookDAO {
	public int k=0;
	public int insert(BookBean bb) {
		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("INSERT INTO Book VALUES (?,?,?,?,?)");
			ps.setString(1, bb.getCode());
			ps.setString(2, bb.getName());
			ps.setString(3, bb.getAuthor());
			ps.setFloat(4, bb.getPrice());
			ps.setInt(5,bb.getQty());
			k = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return k;
	}
}
