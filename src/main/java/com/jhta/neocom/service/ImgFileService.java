package com.jhta.neocom.service;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.neocom.mapper.ImgFileMapper;
import com.jhta.neocom.model.Product_ImgVo;

@Service
public class ImgFileService {
	@Value("${spring.servlet.multipart.location}")
	private String uploadFilePath;

	@Autowired
	private ImgFileMapper mapper;

	public Product_ImgVo uploadImg(MultipartFile img, int product_id, String img_category) {

		// 업로드할 폴더의 절대 경로 구하기
		String img_path = uploadFilePath + "\\product_img";

		System.out.println(img_path);

		String img_name_origin = img.getOriginalFilename(); // 전송된 파일명
		String img_name_save = UUID.randomUUID() + "_" + img_name_origin;
		long img_size = img.getSize();

		try {
			InputStream is = img.getInputStream();
			FileOutputStream fos = new FileOutputStream(img_path + "\\" + img_name_save);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			// 업로드된 파일정보 DB에 저장하기

			Product_ImgVo vo = new Product_ImgVo(0, product_id, img_name_save, img_name_origin, img_size, img_category);
			this.insert(vo);

			return vo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void setDao(ImgFileMapper mapper) {
		this.mapper = mapper;
	}

	public int insert(Product_ImgVo vo) {
		return mapper.insert(vo);
	}

	public List<Product_ImgVo> list() {
		return mapper.list();
	}

	public List<Product_ImgVo> find(int product_id) {
		return mapper.find(product_id);
	}

	public int delete(int product_img_no) {
		return mapper.delete(product_img_no);
	}

	public int update(Product_ImgVo vo) {
		return mapper.update(vo);
	}

	public Product_ImgVo selectone(int product_id) {
		return mapper.selectone(product_id);
	}

}
