package personal.practice.app.welcome;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadForm implements Serializable {

    // omitted

    private MultipartFile file; // (1)

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}


    // omitted getter/setter methods.

}