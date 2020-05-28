package second.common.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import second.common.dao.InformDAO;


@Service("informService")
public class InformServiceImpl implements InformService{
   Logger log = Logger.getLogger(this.getClass());
   
   @Resource(name="informDAO")
   private InformDAO informDAO;

   @Override
   public List<Map<String, Object>> informList(Map<String, Object> map) throws Exception {//게시글 전체보기
      // TODO Auto-generated method stub
      return informDAO.informList(map);
   }

   @Override
   public void informCofirm(Map<String, Object> map) throws Exception {
      // TODO Auto-generated method stub
      informDAO.informCofirm(map);
      
   }


}