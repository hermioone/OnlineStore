package cn.it.shop.util;

import java.io.File;
import java.io.FilenameFilter;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

/**
 * 用来实现文件上传的业务逻辑
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
@Component("fileUpload")
public class FileUploadUtil implements FileUpload {
	//路径
	@Value("#{prop.basePath + prop.filePath}")
	private String filePath;
	
	@Value("#{prop.basePath + prop.bankPath}")
	private String bankPath;
	
	
	//读取并返回银行图标
	public String[] getBankImage() {
		return new File(bankPath).list(new FilenameFilter() {
			
			@Override
			public boolean accept(File dir, String name) {
				//通过后缀名实现文件的过滤
				return name.endsWith(".gif");
			}
		});
	}


	//1.通过文件名获取扩展名
	private String getFileExtension(String fileName) {
		return fileName.substring(fileName.lastIndexOf("."));
	}
	
	//2.生成UUID随机数，作为新的文件名
	private String newFileName(String fileName) {
		String ext = getFileExtension(fileName);
		return UUID.randomUUID().toString() + ext;
	}
	
	//3.实现文件上传功能，返回上传后新的文件名称
	public String uploadFile(MultipartFile file) {
		//获取新唯一文件名
		String pic = newFileName(file.getOriginalFilename());
		try {
			file.transferTo(new File(filePath, pic));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pic;
	}
}
