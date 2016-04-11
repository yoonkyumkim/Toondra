package kr.co.toondra.common.exception;

public class RuntimeLogicException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	private String msg = null;
	private String code = null;
	
	public RuntimeLogicException(String msg){
		this.msg = msg;
		this.code = "900";
	}
	
	public RuntimeLogicException(String msg, String code){
		this.msg = msg;
		this.code = code;
	}
	
	public String getMessage() {
		return msg;
	}
	
	public String getCode() {
		return code;
	}
}
