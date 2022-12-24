package ncu.rent.BO;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.List;

import jakarta.servlet.http.Part;

public class UploadBO {
	public void upload(Part filePart, Collection<Part> collection, String fileName) throws IOException {
		for (Part part : collection) {
			part.write(path() + fileName);
		}

	}

	private String path() {
		String path = getClass().getResource("/").getPath();
		path = path.substring(1, path.indexOf(".metadata")) + "\\NCURent\\WebContent\\upload\\";
		Path p = Paths.get(path);
		try {
			if (!Files.exists(p)) {
				Files.createDirectories(p);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return path;
	}
}
