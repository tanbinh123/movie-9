package movie.controller;

import movie.chat.ChatDao;
import movie.service.IUserService;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.*;


@Controller
@RequestMapping("/")
public class UserController extends BaseController{

    @Autowired
    private IUserService userService;

    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request){
        Map<String, Object> paramMap = getParamMap(request);
        System.out.println(paramMap);
        getSelectTableList(paramMap,userService.selectUserCount(paramMap)).put("list",userService.selectUserList(paramMap));
        System.out.println(paramMap);
        return new ModelAndView("index", paramMap);
    }

    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    @RequestMapping(value = "/insertUser", method = RequestMethod.POST)
    public String insertUser(HttpServletRequest request){
//        System.out.println(paramMap);
        int count = userService.insertUser(getParamMap(request));
        return "redirect:/index";
    }

    @RequestMapping(value = "/deleteUsers")
    public String deleteUsers(HttpServletRequest request){
        String data = request.getParameter("data");
        userService.deleteUserByIds(getParamList(request,new StringBuilder("data")));
        return "redirect:/index";
    }

    @RequestMapping(value = "ajax")
    public String ajax(){
        return "ajax";
    }

    @RequestMapping(value = "/checkAccount", method = RequestMethod.GET)
    public  @ResponseBody String checkAccount(HttpServletRequest request){
        List<String> list=new ArrayList<String>();
        list.add("admin1");
        list.add("admin2");
        String userAccount= request.getParameter("userAccount");
        String result="0";
        for (int i=0;i<list.size();i++){
            if(list.get(i).equals(userAccount)){
                result="1";
                break;
            }
        }
        return result;
    }

    @RequestMapping(value = "/checkAccount1", method = RequestMethod.GET)
    public  @ResponseBody String checkAccount1(HttpServletRequest request){
        StringBuilder builder = new StringBuilder();
        List<String> list = new ArrayList<>();
        list.add("apple");
        list.add("banana");
        list.add("admin2");
        String userAccount= request.getParameter("userAccount");
        String result="0";
        for (int i=0;i<list.size();i++){
            if(list.get(i).substring(0,userAccount.length()).equals(userAccount)){
                builder.append(list.get(i)+",");
            }
        }
        if(builder.toString().length()!=0){
            builder.delete(builder.length()-1,builder.length());    //去除最后一个,
        }
        return builder.toString();
    }

    @RequestMapping(value = "/checkAccount2", method = RequestMethod.GET)
    public  @ResponseBody List<Map<String,Object>> checkAccount2(HttpServletRequest request){
        List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
        Map<String,Object> map1=new HashMap<String,Object>();
        map1.put("name","admin1");
        map1.put("age",23);
        map1.put("sex","男");
        Map<String,Object> map2=new HashMap<String,Object>();
        map2.put("name","admin2");
        map2.put("age",24);
        map2.put("sex","女");
        list.add(map1);
        list.add(map2);
        return list;
    }

    @RequestMapping(value = "/chat", method = RequestMethod.GET)
    public  String  chat(HttpServletRequest request){
        return "chat";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public  String  login(HttpServletRequest request){
        return "login";
    }

    @RequestMapping(value = "/checkNick", method = RequestMethod.GET)
    public  @ResponseBody String  checkNick(HttpServletRequest request){
        return ChatDao.checkNickIsHave(request);
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public  String  login1(HttpServletRequest request){
        request.getSession().setAttribute("nick",request.getParameter("nick"));
        ChatDao.nickList.add(request.getParameter("nick"));
        return "redirect:/chat";
    }

    //loadNickList
    @RequestMapping(value = "/loadNickList", method = RequestMethod.GET)
    public  @ResponseBody List<String> loadNickList(HttpServletRequest request) {
        return ChatDao.nickList;
    }

    @RequestMapping(value = "/loadInfoList", method = RequestMethod.GET)
    public  @ResponseBody List<String> loadInfoList(HttpServletRequest request) {
        return ChatDao.infoList;
    }

    @RequestMapping(value = "/sendMessage", method=RequestMethod.POST)
    @ResponseBody
    public String sendMessage(HttpServletRequest request) {
        System.out.println("send");
        if(request.getParameter("nick")==null || request.getParameter("message").toString().equals(""))
            return "0";
        ChatDao.getInfoList(request);
        return "1";
    }

    //跳转upload页面
    @RequestMapping(value = "/upload", method=RequestMethod.GET)
    public String upload(HttpServletRequest request) {
        System.out.println("onload");
        return "upload";
    }
    //执行上传的代码One
    @RequestMapping(value = "/uploadOne", method=RequestMethod.POST)
    public ModelAndView uploadOne(@RequestParam("attr") MultipartFile file, HttpServletRequest request) throws IOException {
        Map<String,Object> map = getParamMap(request);
        String url = uploadOneFile(file,request);
        System.out.println(url);
        map.put("url",url);
        return new ModelAndView("photo",map);
    }
    //执行上传的代码More
    @RequestMapping(value = "/uploadMore", method=RequestMethod.POST)
    public ModelAndView uploadMore(@RequestParam("attrs") List<MultipartFile> files, HttpServletRequest request) throws IOException {
        Map<String,Object> map = getParamMap(request);
        List<String> urls = uploadMoreFile(files,request);
        System.out.println(urls);
        map.put("urls",urls);
        return new ModelAndView("photo",map);
    }

    //跳转movie页面
    @RequestMapping(value = "/movie", method=RequestMethod.GET)
    public String movie(HttpServletRequest request) {
        System.out.println("onload");
        return "movie";
    }
    //执行上传的代码More
    @RequestMapping(value = "/uploadMovie", method=RequestMethod.POST)
    public ModelAndView uploadMovie(@RequestParam("attrs") List<MultipartFile> files, HttpServletRequest request) throws IOException {
        Map<String,Object> map = getParamMap(request);
        for(int i=0; i<files.size(); i++){
            System.out.println(files.get(i).getOriginalFilename());
        }
        List<String> urls = uploadMoreFile(files,request);
        //循环插入
        for(int i=0; i<map.size(); i++){
            String video_title = map.get("video_title"+i).toString();//拿到视频标题值
            Date video_upload_time = new Timestamp(System.currentTimeMillis());
            String video_img_url = urls.get(i*2);
            String video_movie_url = urls.get(i*2+1);
            Map<String,Object> mapDate = new HashMap<>();
            mapDate.put("video_title",video_title);
            mapDate.put("video_upload_time",video_upload_time);
            mapDate.put("video_img_url",video_img_url);
            mapDate.put("video_movie_url",video_movie_url);
            System.out.println("data"+mapDate);
            userService.insertUser(mapDate);
        }
        System.out.println(urls);
        map.put("urls",urls);
        return new ModelAndView("photo",map);
    }

    public static void main(String[] args) {
        System.out.println(UUID.randomUUID().toString());
//        String filename = "ab.jpg";
//        System.out.println(filename.lastIndexOf("."));
//        System.out.println(filename.substring(2));
    }
}
