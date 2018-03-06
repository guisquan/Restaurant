<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gui
  Date: 18-2-28
  Time: 下午3:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留下您的宝贵意见</title>
    <link rel="stylesheet" href="<c:url value="/css/recommend.css"/>">
    <script type="text/javascript" src="<c:url value='/js/jquery-1.8.3.js' /> "></script>
    <script type="text/javascript">
        function checkSomthing(idName, reg) {
            if (idName === "" || reg === "") {
                return false;
            }

            var tmp = $("#" + idName).val();
            /**
             * 提示颜色
             * 默认红色：警告，绿色：通过
             * @type {string}
             */
            var color = "red";
            /**
             * 验证结果
             * @type {boolean}
             */
            var result = false;
            if (reg.test(tmp)) {
                color = "green";
                result = true;
            }
            $("#" + idName).css({"border": color + " 1px solid"});
            return result;
        }

        /**
         * 刷新验证码
         */
        function refreshVerificationCode() {
            var img = document.getElementById("vcode");
            img.setAttribute("src", "${pageContext.request.contextPath}/ImageCodeServlet?method=showCheckCode&" + Math.random());
        }

        /**
         * 检查邮箱
         * @returns {boolean|*}
         */
        function checkEmail() {
            return checkSomthing("mEmail", /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/);
        }

        /**
         * 检查消息
         * @returns {boolean|*}
         */
        function checkMessage() {
            return checkSomthing("message", /^[^ ]+$/);
        }

        /**
         * 检查填写的用户名
         * @returns {boolean|*}
         */
        function checkName() {
            return checkSomthing("name", /^[^ ]+$/);
        }

        /**
         * 检查验证码是否正确
         * @returns {boolean}
         */
        function checkVerificationCode() {
            var verification = $("#verification").val();
            if (verification === ${sessionScope.codes}) {
                alert(${sessionScope.codes});
                return true;
            }
            refreshVerificationCode();
            $("#verification").val("").css({"border": "1px red solid"});
            return false;
        }

        /**
         * 提交表单的事件
         * @returns {boolean}
         */
        function submitMessage() {
            var ckEmail = checkEmail();
            var ckMessage = checkMessage();
            var ckVcode = checkCodeMethod();
            var ckName = checkName();
            if ((!ckEmail) || (!ckMessage) || (!ckName) || (!ckVcode)) {
                // alert("error");
                return false;
            }
            $.get("${pageContext.request.contextPath}/MessageServlet?method=addMsg",
                {
                    uName: $("#name").val(),
                    mEmail: $("#mEmail").val(),
                    message: $("#message").val(),
                    mSubject: $("#mSubject").val()
                },
                function (data) {
                    if (data.indexOf('true') === -1) {
                        // flag = false;
                        // return true;
                        alert("faild");
                    } else {
                        // alert("add a goods");
                        //do something while true;
                    }
                }
            );
            return true;
        }

        /**
         * 关闭Ajax异步
         */
        $.ajaxSetup({
            async: false
        });

        function checkCodeMethod() {
            var code = $("#verification").val();
            var flag = true;
            $.post("${pageContext.request.contextPath}/messageServlet.do?method=addMsg",
                {
                    uName: $("#name").val(),
                    mEmail: $("#mEmail").val(),
                    message: $("#message").val(),
                    mSubject: $("#mSubject").val(),
                },
                function (data) {
                    if (data.indexOf('true') === -1) {
                        flag = false;
                        $("#verification").val("").css({"border": "1px red solid"});
                        // return true;
                    }
                }
            );
            return flag;
        }

    </script>
</head>
<body>

<form action="" method="post" class="bootstrap-frm" id="msgForm">
    <input type="hidden" name="method" value="addMsg">
    <h1>Contact Form
        <span>Please fill all the texts in the fields.</span>
    </h1>
    <label>
        <span>Your Name :</span>
        <input id="name" type="text" name="uName" placeholder="Your Full Name" onblur="checkName()"/>
    </label>

    <label>
        <span>Your Email :</span>
        <input id="mEmail" type="email" name="mEmail" placeholder="Valid Email Address" onblur="checkEmail()"/>

    </label>

    <label>
        <span>Message :</span>
        <textarea id="message" name="message" placeholder="Your Message to Us" onblur="checkMessage()"></textarea>
    </label>
    <label>
        <span>Subject :</span>
        <select name="mSubject" id="mSubject">
            <option value="1">Job Inquiry</option>
            <option value="2">General Question</option>
        </select>
    </label>
    <label>
        <span>Verification code：</span>
        <img src="<c:url value='/ImageCodeServlet?method=showCheckCode' />"
             id="vcode" onclick="refreshVerificationCode()"/>
        <input type="text" id="verification" name="verification" width="10"
               placeholder="click get a new Verification Code">
    </label>
    <label>
        <span>&nbsp;</span>
        <input type="button" class="button" value="Send" onclick="submitMessage()"/>
    </label>
</form>
</body>
</html>
