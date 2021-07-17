package movie.chat;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

//聊天方法
public class ChatDao {
    //存放聊天信息的
    public static List<String> infoList = new ArrayList<>();
    //所有的登录后的人的聊天的集合信息
    public static List<String> nickList = new ArrayList<>();
    //检测该登录的账号是否已经注册过了
    public static String checkNickIsHave(HttpServletRequest request){
        String nick = request.getParameter("nick");
        String result="-1";
        if(nickList.size()>0){
            for(String s:nickList){
                if(s.equals(nick)){
                    result="1";
                    break;
                }
            }
        }
        return result;
    }
    //获取信息 信息优化
    public static String getInfoList(HttpServletRequest request){

        SimpleDateFormat simp = new SimpleDateFormat("HH:mm:ss");
        String time = simp.format(new Date());

        String nick = request.getParameter("nick");
        String message = checkIsBadInfo(request.getParameter("message"));
        String newMessage = nick+" "+time+" "+message;
        infoList.add(newMessage);
        return newMessage;
    }

    //判断是否有脏话
    public static String checkIsBadInfo(String message){
        List<String> list = new ArrayList<>();
        list.add("sb");
        list.add("nmsl");
        for(String s:list){
            if(message.contains(s)){
                String str="";
                for(int i=0; i<s.length(); i++){
                    str+="*";
                }
                message = message.replaceAll(s, str);
            }
        }
        return message;
    }

    public static void main(String[] args) {
        System.out.println(checkIsBadInfo("n sb"));
    }
}
