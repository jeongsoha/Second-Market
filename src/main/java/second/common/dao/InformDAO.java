package second.common.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;

@Repository("informDAO")
public class InformDAO extends AbstractDAO {
	
    public List<Map<String, Object>> selectAllMember(Map<String, Object>map)throws Exception{
 
    	 return (List<Map<String, Object>>)selectList("inform.selectAllMember",map);
	   }
    
    public void informInsertNotice(Map<String, Object> map, String str)throws Exception{
        
        map.put("INFORM_CONTENT", str);
        insert("inform.informinsertNotice",map);
     }
    

   public void informInsert(Map<String, Object> map, String str)throws Exception{
      map.put("INFORM_CONTENT", str);
      insert("inform.informinsert",map);
   }
   
   public void informInsert2(Map<String, Object> map, String str)throws Exception{
      
      map.put("INFORM_CONTENT2", str);
      insert("inform.informinsert2",map);
   }
   
   public void informinsertSeller(Map<String, Object> map, String str)throws Exception{
      map.put("INFORM_CONTENT", str);
      insert("inform.informinsertSeller",map);
	   }
   
   public List<Map<String, Object>> informList(Map<String, Object>map)throws Exception{
      
      return (List<Map<String, Object>>)selectList("inform.informList",map);
   }

   public void informCofirm(Map<String, Object> map)throws Exception {
      // TODO Auto-generated method stub
      update("inform.confirmUpdate",map);
      
   }
}