package kr.co.librarylyh.aop;

import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.JoinPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.transaction.TransactionSystemException;


@Aspect
@Component
@Order(2)
@Log4j2
public class ExceptionHandlingAspect {
  @Autowired
  private LoggingAspect loggingAspect;

  @Pointcut("execution(* kr.co.librarylyh.service.*.*(..))")
  public void serviceMethods() {}

  @AfterThrowing(pointcut = "serviceMethods() && args(..)", throwing = "ex")
  public void handleException(JoinPoint joinPoint, Throwable ex){

    // 브라우저 오류를 보면 근본원인(Root Cause)라는 표기가 늘 보이고, 항상 대부분은 그 루트 근방에서 찾게 됨
    // 그래서 오류를 찾기 쉽게 핵심적으로 당장 살펴봐야하는 위치를 짚어주는 로거를 만들어보자 생각함.
    Throwable rootCause = findRootCause(ex);

    String location = joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName();
    Object[] args = joinPoint.getArgs();

    String argDetails = loggingAspect.formatArgs(args);

    if (rootCause instanceof NullPointerException) {
      handleNullPointerException((NullPointerException) rootCause, location, argDetails);
    } else if (rootCause instanceof NumberFormatException) {
      handleNumberFormatException((NumberFormatException) rootCause, location, argDetails);
    } else if (rootCause instanceof IllegalArgumentException) {
      handleIllegalArgumentException((IllegalArgumentException) rootCause, location, argDetails);
    } else if (rootCause instanceof IndexOutOfBoundsException) {
      handleIndexOutOfBoundsException((IndexOutOfBoundsException) rootCause, location, argDetails);
    } else if (rootCause instanceof ClassCastException) {
      handleClassCastException((ClassCastException) rootCause, location, argDetails);
    } else if (rootCause instanceof ClassNotFoundException) {
      handleClassNotFoundException((ClassNotFoundException) rootCause, location, argDetails);
    } else if (rootCause instanceof ArithmeticException) {
      handleArithmeticException((ArithmeticException) rootCause, location, argDetails);
    } else if (rootCause instanceof TransactionSystemException) {
      handleTransactionSystemException((TransactionSystemException) rootCause, location, argDetails);
    } else if (rootCause instanceof NoSuchMethodException) {
      handleNoSuchMethodException((NoSuchMethodException) rootCause, location, argDetails);
    } else if (rootCause instanceof RuntimeException) {
      handleRuntimeException((RuntimeException) rootCause, location, argDetails);
    } else {
      handleUnknownException(rootCause, location, argDetails);  // 목록에 없는 예외 처리
    }
  }

  // 근본 원인(root cause)을 찾는 메서드
  private Throwable findRootCause(Throwable ex) {
    Throwable rootCause = ex;
    while (rootCause.getCause() != null && rootCause.getCause() != rootCause) {
      rootCause = rootCause.getCause();
    }
    return rootCause;
  }

  private void handleNullPointerException(NullPointerException ex, String location, String args) {
    String message = "Null 값을 참조하려고 했습니다. " +
        "이 문제는 사용 중인 객체가 초기화되지 않았거나 null일 때 발생합니다. " +
        "코드에서 null 체크를 추가하세요. 혹은 객체가 초기화 되었는지 확인하세요.";
    sendFormattedLog("NullPointerException", location, args, ex.getMessage(), message);
  }

  private void handleIllegalArgumentException(IllegalArgumentException ex, String location, String args) {
    String message = "잘못된 인자가 전달되었습니다. " +
        "메서드에 전달된 값이 이상한거니까 값이 뭘로 보내졌는지 확인하세요. (콘솔확인) ";
    sendFormattedLog("IllegalArgumentException", location, args, ex.getMessage(), message);
  }

  private void handleIndexOutOfBoundsException(IndexOutOfBoundsException ex, String location, String args) {
    String message = "인덱스가 리스트나 배열의 범위를 초과했습니다. " +
        "배열이나 리스트의 크기를 확인하고, 유효한 인덱스를 사용하세요.";
    sendFormattedLog("IndexOutOfBoundsException", location, args, ex.getMessage(), message);
  }

  private void handleClassCastException(ClassCastException ex, String location, String args) {
    String message = "잘못된 타입 변환이 발생했습니다. " +
        "객체 타입을 올바르게 변환했는지 확인하세요.";
    sendFormattedLog("ClassCastException", location, args, ex.getMessage(), message);
  }

  private void handleNumberFormatException(NumberFormatException ex, String location, String args) {
    String message = "문자열을 숫자로 변환하는 과정에서 오류가 발생했습니다. " +
        "입력된 데이터가 올바른 숫자 형식인지 확인하세요.";
    sendFormattedLog("NumberFormatException", location, args, ex.getMessage(), message);
  }

  private void handleClassNotFoundException(ClassNotFoundException ex, String location, String args) {
    String message = "해당 클래스를 찾을 수 없습니다. " +
        "클래스 경로와 이름이 올바른지 확인하세요.";
    sendFormattedLog("ClassNotFoundException", location, args, ex.getMessage(), message);
  }

  private void handleArithmeticException(ArithmeticException ex, String location, String args) {
    String message = "산술 연산에서 오류가 발생했습니다. " +
        "특히 0으로 나누는 연산이 없는지 확인하세요.";
    sendFormattedLog("ArithmeticException", location, args, ex.getMessage(), message);
  }

  private void handleTransactionSystemException(TransactionSystemException ex, String location, String args) {
    String message = "트랜잭션 처리 중 문제가 발생했습니다. " +
        "트랜잭션의 대상이 되는 작업들을 확인하세요.";
    sendFormattedLog("TransactionSystemException", location, args, ex.getMessage(), message);
  }

  private void handleNoSuchMethodException(NoSuchMethodException ex, String location, String args) {
    String message = "해당 메서드를 찾을 수 없습니다. " +
        "메서드 이름과 매개변수가 올바른지 확인하세요.";
    sendFormattedLog("NoSuchMethodException", location, args, ex.getMessage(), message);
  }

  private void handleRuntimeException(RuntimeException ex, String location, String args) {
    String message = "알 수 없는 런타임 예외가 발생했습니다. " +
        "이 문제는 다양한 이유로 발생할 수 있으며, 예외 메시지 및 스택 트레이스를 통해 문제를 분석하세요.";
    sendFormattedLog("RuntimeException", location, args, ex.getMessage(), message);
  }

  // 목록에 없는 예외 처리 메서드
  private void handleUnknownException(Throwable ex, String location, String args) {
    String message = "저도몰라요 '" + ex.getClass().getSimpleName() + "' <- 이걸 복사하여 구글에 검색해보세요.";
    sendFormattedLog(ex.getClass().getSimpleName(), location, args, ex.getMessage(), message);
  }

  private void sendFormattedLog(String exceptionName, String location, String args, String exceptionMessage, String solution) {
    log.error("예외 발생: [{}]\n위치 : [{}].\n인자 값: [{}].\n 예외 메시지: [{}]\n", exceptionName, location, args, exceptionMessage);
    log.info("해결방안 : {}\n", solution);

    // 예외 메시지를 리스트에 추가
    String alertMessage = "[Error] 예외 발생: [" + exceptionName + "]<br>위치 : " + location + ".<br>인자 값: " + args + ".<br>예외 메시지: " + exceptionMessage + "<br>";
    loggingAspect.sendLog(alertMessage);
  }
}