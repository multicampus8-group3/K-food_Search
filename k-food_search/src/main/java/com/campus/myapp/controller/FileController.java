package com.campus.myapp.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

public class FileController {
	@PostMapping("")
	@ResponseStatus(HttpStatus.CREATED)
	public List<String> upload(@RequestPart List<MultipartFile> files) throws Exception {
		List<String> list = new ArrayList<>();
		for (MultipartFile file : files) {
			String originalfileName = file.getOriginalFilename();
			File dest = new File("C:/uploadImg/" + originalfileName);
			file.transferTo(dest);
			// TODO
		}
		return list;
	}
}
