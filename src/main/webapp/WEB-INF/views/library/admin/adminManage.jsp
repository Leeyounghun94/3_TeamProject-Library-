<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTL 코어 태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> <!-- JSTL 포매팅 태그 -->   
<%@ include file="../../includes/adminHeader.jsp" %>


                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Admin List</h1>
                    

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                             <button type="button" class="btn btn-warning" style="width:200px;"onclick="window.open('http://localhost:80/library/admin/adminRegister','_blank','width=700, height=600, top=50, left=50, scrollbars=yes')">관리자등록</button>
                        </div>
                       
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>이름</th>
                                            <th>생년월일</th>
                                            <th>전화번호</th>
                                            <th>이메일</th>
                                            <th>아이디</th>
                                            <th>패스워드</th>
                                        </tr>
                                    </thead>
                     
                                    <tbody>
                                       <c:forEach items="${list}" var="user"> <!-- 객체를 반복적으로 돌린다(list 객체) -->                                 
                                			<tr> <!-- 1행 추가 -->
			                                	<td><c:out value="${user.name}" /></td> <!-- 1열 -->
			                                	<td><c:out value="${user.birth}" /></td>
			                                	<td><c:out value="${user.phone}" /></td> <!-- 3열 -->
			                                	<td><c:out value="${user.email}" /></td>
			                                	<td><c:out value="${user.id}" /></td>
			                                	<td><c:out value="${user.pw}" /></td>
                                			</tr>
		                                </c:forEach> 
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

</body>

</html>