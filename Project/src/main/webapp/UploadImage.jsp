<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileUploadException"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.io.FilenameUtils"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.UUID"%>
<%@ page import="user.Sign_upDTO"%>
<%@ page import="user.Sign_upDAO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.regex.*"%>

<%
// Check if the request contains multipart content
boolean isMultipart = ServletFileUpload.isMultipartContent(request);

if (isMultipart) {
  // Create a factory for disk-based file items
  FileItemFactory factory = new DiskFileItemFactory();

  // Create a new file upload handler
  ServletFileUpload upload = new ServletFileUpload(factory);
  
  // Set the encoding of the request
  upload.setHeaderEncoding("UTF-8");

  try {
    // Parse the request to get file items
    List<FileItem> items = upload.parseRequest(request);

    for (FileItem item : items) {
      // Process only file upload fields
      if (!item.isFormField()) {
        // Generate a unique file name
        String fileName = UUID.randomUUID().toString() + "-" + FilenameUtils.getName(item.getName());

        // Specify the directory to save the file
        // String uploadDir = this.getServletContext().getRealPath("/") + "upload/";
		// System.out.println(uploadDir);
		// 해당 폴더에 이미지를 저장시킨다
		String uploadDir = this.getClass().getResource("").getPath();
		// C:/Startup_Project/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/work/Catalina/localhost/Project/org/apache/jsp/
		System.out.println(uploadDir);
		uploadDir = uploadDir.substring(1, uploadDir.indexOf(".metadata")) + "Project/src/main/webapp/upload";
		System.out.println(uploadDir);
		out.println("절대경로 : " + uploadDir + "<br/>");
        // Create the directory if it doesn't exist
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) {
          uploadDirFile.mkdirs();
        }

        // Save the file
        item.write(new File(uploadDir, fileName));
      }
    }

    // File upload successful
    out.println("File uploaded successfully!");
  } catch (FileUploadException e) {
    // Error occurred while handling the file upload
    out.println("File upload failed: " + e.getMessage());
  }
} else {
  // No file upload found in the request
  out.println("No file uploaded!");
}
%>

