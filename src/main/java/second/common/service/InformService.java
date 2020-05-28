package second.common.service;

import java.util.List;
import java.util.Map;

public interface InformService {
   
   List<Map<String, Object>> informList(Map<String, Object> map) throws Exception;
   
   void informCofirm(Map<String, Object> map) throws Exception;
   }