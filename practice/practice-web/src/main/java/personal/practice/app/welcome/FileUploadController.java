package personal.practice.app.welcome;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class FileUploadController {

	@ModelAttribute
	public FileUploadForm setFileUploadForm() {
		return new FileUploadForm();
	}

	@RequestMapping(value = "welcome/upload", method = RequestMethod.GET)
	public String uploadForm() {
		return "welcome/upload";
	}

	// (3)
	@RequestMapping(value = "welcome/upload", method = RequestMethod.POST)
	@ResponseBody
	public String upload(FileUploadForm form) {

		MultipartFile uploadFile = form.getFile();

		String fileName = uploadFile.getOriginalFilename();
		long size = uploadFile.getSize();
		System.out.println(fileName+size);
//		return "welcome/upload";

		return "sucsess:" + fileName + "  size:" + size;
	}
}
