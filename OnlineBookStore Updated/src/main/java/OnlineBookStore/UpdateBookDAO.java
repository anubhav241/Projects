package OnlineBookStore;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UpdateBookDAO {
	public int k = 0;
	public int update(BookBean bb) {
		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("UPDATE Book SET bprice=?,bqty=? where bcode=?");
			ps.setFloat(1,bb.getPrice());
			ps.setInt(2,bb.getQty());
			ps.setString(3,bb.getCode());
			k = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return k;
	}
}
