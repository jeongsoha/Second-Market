package second.commentreply.DAO;

public class commentreply {
	
	private static ConnentreplyDAO dao = new CommentrepllyDAO();
	private CommentreplyDAO() {}
	public static Commentreply getInstance() {
		return dao;
		
	}

}
