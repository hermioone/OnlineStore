package cn.it.shop.util;

import org.springframework.web.multipart.MultipartFile;

public interface FileUpload {
	public String uploadFile(MultipartFile file);
	
	public String[] getBankImage();
}