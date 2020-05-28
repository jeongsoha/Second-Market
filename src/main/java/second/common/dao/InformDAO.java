package second.common.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;

@Repository("informDAO")
public class InformDAO extends AbstractDAO {

   public void informInsert(Map<String, Object> map, String str)throws Exception{
      map.put("INFORM_CONTENT", str);
      insert("inform.informinsert",map);
   }
   
   public void informInsert2(Map<String, Object> map, String str)throws Exception{
      
      map.put("INFORM_CONTENT2", str);
      insert("inform.informinsert2",map);
   }
   public List<Map<String, Object>> informList(Map<String, Object>map)throws Exception{
      
      return (List<Map<String, Object>>)selectList("inform.informList",map);
   }

   public void informCofirm(Map<String, Object> map)throws Exception {
      // TODO Auto-generated method stub
      update("inform.confirmUpdate",map);
      
   }
}