package kr.co.librarylyh.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.librarylyh.domain.UserVO;

public class CartInterceptor implements HandlerInterceptor{

	
	// 인터셉터(Interceptor)
	
	/*
	 * 컨트롤러(Controller)의 핸들러(Handler)를 호출 하기 전과 후에 요청과 응답을 참조하거나 가공할 수 있는 필터
	 * 즉, 사용자 요청에 의해 서버에 들어온 Request 객체를 컨트롤러의 핸들러에 도달하기 전에 낚아채서 개발자가 원하는 추가적인 작업을 
	 * 한 후 핸들러로 보낼 수 있도록 해주는 것.
	 */
	
	/* 총 3가지의 메서드를 가지고 있는데
	  
	  1.preHandle()
	  
	 		컨트롤러가 호출되기 전에 실행된다.
	 		컨트롤러가 실행 이전에 처리해야 할 작업이 있을 경우나 요청 정보를 가공하거나 추가할 경우에 사용한다.
	  		실행되어야 할 '핸들러'에 정보를 인자 값으로 받기 때문에 '서블렛 필터'에 비해 세밀한 로직을 구성 할 수 있다.
	  		리턴 값은 Boolean 이며 True -> preHandle() 실행 후 핸들러에 접근하고 False -> 작업 중단하여 컨트롤러와 인터셉터 실행되지 않는다.
	  
	  2.postHandle()

			핸들러 실행은 되나 View 생생 되기 이전에 호출된다.
			ModelAndView 타입의 정보가 인자값으로 받으러 Controller에서 View에 정보 전달하기 위해 Model 객체의 정보를 참조하거나 조작할 수 있다.
			preHandle()에서 리턴 값이 False인 경우 실행 되지 않음.
			적용중인 인터셉터가 여러 개 인 경우 preHandle()는 역순으로 호출된다.
			비동기적 요청 처리에는 처리되지 않음.
 	 
 	  3.afterCompletion()
 	  
 	  		모든 View에서 최종 결과를 생성하는 일을 포함한 모든 작업 완료 후 실행된다.
 	  		요청 처리 중에는 사용한 리소스를 반환해주기 적당한 메서드.
 	  		preHandle()에서 리턴 값이 False인 경우 실행 되지 않음.
 	  		적용중인 인터셉터가 여러 개 인 경우 preHandle()는 역순으로 호출된다.
			비동기적 요청 처리에는 처리되지 않음.
			
					CartInterceptor -> preHandle() 사용
	 */
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// /library/cart/** url을 요청 하였을때 Controller 요청이 가기 전 요청자가 로그인을 하였는지 확인 하는 메서드
		// 로그인이면 정상적으로 요청이 Controller 로 전달, 로그인이 아니면 home으로 리다이렉트 
		
		HttpSession session = request.getSession();
		
		UserVO userVO = (UserVO)session.getAttribute("user_id");
		
		if(userVO == null) {// userVo 값이 널이면 ?
			
			response.sendRedirect("library/home");
			return false;
			// home으로 이동
		}else {
			
			return true;
			// 아니면 요청 -> Controller 전달
		}
		
	}
}
