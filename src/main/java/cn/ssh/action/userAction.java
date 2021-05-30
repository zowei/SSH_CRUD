package cn.ssh.action;

import com.opensymphony.xwork2.ActionSupport;

public class userAction extends ActionSupport {

	public String login() {
		System.out.println("userAction执行了、、、、、、、、、、、、、、");
		return "login";
	}

}
