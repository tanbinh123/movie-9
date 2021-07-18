package movie.controller;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

public class BaseController {

    public Map<String,Object> getParamMap(HttpServletRequest request){
        Map<String, String[]> map = request.getParameterMap();
        Map<String,Object> paramMap = new HashMap<String, Object>();
        for(Map.Entry<String, String[]> entry : map.entrySet()){
            paramMap.put(entry.getKey(),entry.getValue()[0]);
        }
        return paramMap;
    }

    public List<Integer> getParamList(HttpServletRequest request,StringBuilder stringBuilder){
        String parameter = request.getParameter(String.valueOf(stringBuilder));
        String[] split = parameter.split(",");
        List list = new ArrayList<>();
        for(int i=0; i<split.length; i++){
            list.add(Integer.parseInt(split[i]));
        }
        System.out.println(list);
        return list;
    }

    //用来组装除了List之外的分页参数
    public Map<String, Object> getSelectTableList(Map<String, Object> paramMap,int totalCount){
        if(paramMap.get("pageSize") != null && paramMap.get("pageIndex") != null){
            int pageSize = Integer.parseInt(paramMap.get("pageSize").toString());
            int pageIndex = Integer.parseInt(paramMap.get("pageIndex").toString());
            int totalPage = totalCount%pageSize==0 ? totalCount/pageSize : totalCount/pageSize+1;
            int start = (pageIndex-1)*pageSize;//获取分页起始索引号
            paramMap.put("totalCount",totalCount);
            paramMap.put("totalPage",totalPage);
            paramMap.put("pageSize",pageSize);
            paramMap.put("start",start);
            System.out.println(paramMap);
        }
        System.out.println(paramMap);
        return paramMap;
    }

    public List<Object> uploadOneFile(MultipartFile file, HttpServletRequest request) throws IOException {
        String newFileName = null;
        InputStream in = null;//声明输入流
        FileOutputStream out = null;//声明文件输出流
        List<Object> fileInformation = new ArrayList<>();//文件的信息
        try {
            String filename = file.getOriginalFilename();//得到文件的名称
            //获取后缀名 .jpg
            String suffixName = filename.substring(filename.lastIndexOf("."));
            newFileName = "/img/"+UUID.randomUUID().toString()+suffixName;
            System.out.println("newFileName:"+newFileName);
            String path = "d:\\"+newFileName;
            in = file.getInputStream();
            out = new FileOutputStream(path);
            IOUtils.copy(in,out);
            fileInformation.add(newFileName);//文件的地址
            fileInformation.add(file.getSize());//每个文件的大小
        }catch (IOException e){
            System.out.println(e);
        }finally {
            in.close();
            out.close();
        }

        System.out.println("onload1");
        return fileInformation;
    }

    public List<List<Object>> uploadMoreFile(List<MultipartFile> files, HttpServletRequest request) throws IOException {
        List<List<Object>> fileInformation = new ArrayList<>();
        for(MultipartFile file:files){
            fileInformation.add(uploadOneFile(file,request));
        }
        return fileInformation;
    }
}
