package movie.util;

import javax.swing.filechooser.FileSystemView;
import java.io.File;
import java.text.DecimalFormat;

public class ToolUtil {

    public static String getFileSuffixName(String  name){
        String s[]=name.split("\\.");
        String str=s[s.length-1];//后缀名
        return str;
    }

    //规范文件大小
    public static String FormetFileSize(long fileS) {
        DecimalFormat df = new DecimalFormat("#.00");
        String fileSizeString = "";
        if (fileS < 1024) {
            fileSizeString = df.format((double) fileS) + "B";
        } else if (fileS < 1048576) {
            fileSizeString = df.format((double) fileS / 1024) + "K";
        } else if (fileS < 1073741824) {
            fileSizeString = df.format((double) fileS / 1048576) + "M";
        } else {
            fileSizeString = df.format((double) fileS / 1073741824) + "G";
        }
        return fileSizeString;
    }

    //获取存储位置总大小、剩余大小
    public static String [] spaceInfo(){
        // 当前文件系统类
        FileSystemView fsv = FileSystemView.getFileSystemView();
        // 列出所有windows 磁盘
        File[] fs = File.listRoots();
        // 显示磁盘卷标
        String a = "总大小:";
        String b = "剩余空间:";
        for (int i = 0; i < fs.length; i++) {
            String str=fsv.getSystemDisplayName(fs[i]);
            System.out.println(str);
            if(str.equals("本地磁盘 (D:)")){
                System.out.println(str);
                a+= FormetFileSize(fs[i].getTotalSpace());
                b+=FormetFileSize(fs[i].getFreeSpace());
                System.out.print("总大小" + FormetFileSize(fs[i].getTotalSpace()));
                System.out.println("剩余" + FormetFileSize(fs[i].getFreeSpace()));
                break;
            }
        }
        return new String[]{a,b};
    }

//    public static void main(String[] args) {
//        totalSpace();
//    }




}

//    select * from  tb_user order by USER_ID desc
//
//    INSERT INTO
//
//    tb_user(USER_NAME,USER_AGE,USER_SEX)
//
//    VALUES
//
//            ('kfc',22,'男'),
//
//('kfc1',24,'男');
//
//    INSERT INTO
//    tb_user (USER_NAME,USER_AGE,USER_SEX)
//    select 'nba',45,'男' from dual union all
//    select 'nbn',34,'女' from dual;
//
//<insert id="bindRight" parameterType="java.util.List">
//    INSERT INTO T_P_USER_MODUEL (USER_ID, MODUEL_ID)
//		<foreach collection="list" item="item" index="index" separator=" UNION ALL ">
//    SELECT #{item.userId}, #{item.moduelId} FROM DUAL
//	    	</foreach>
//	    </insert>
