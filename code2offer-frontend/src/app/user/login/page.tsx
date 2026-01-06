"use client";
import { LockOutlined, UserOutlined } from "@ant-design/icons";
import { LoginForm, ProFormText } from "@ant-design/pro-components";
import React from "react";
import Image from "next/image";
import Link from "next/link";
import { userLoginUsingPost } from "@/api/userController";
import { message } from "antd";
import { useDispatch } from "react-redux";
import { AppDispatch } from "@/stores";
import { setLoginUser } from "@/stores/loginUser";
import { ProForm } from "@ant-design/pro-form/lib";
import { useRouter } from "next/navigation";
import './index.css';

/**
 * 用户登录页面
 * @constructor
 */
const UserLoginPage: React.FC = () => {
  const [form] = ProForm.useForm();
  const dispatch = useDispatch<AppDispatch>();
  const router = useRouter();

  /**
   * 提交
   */
  const doSubmit = async (values: API.UserLoginRequest) => {
    try {
      //console.log("👉 1. 开始请求后端...");
      const res = await userLoginUsingPost(values);
      //console.log("👉 2. 后端返回:", res);
      if (res) {
       //console.log("👉 3. 进入成功分支，准备弹窗");
        message.success("登录成功");
        // 保存用户登录状态
        //console.log("👉 4. 准备保存状态");
        dispatch(setLoginUser(res as any));
        //console.log("👉 5. 准备跳转");
        router.replace("/");
        form.resetFields();
      }
    } catch (e) {
      message.error("登录失败，" + (e as Error).message);
    }
  };

  return (
    <div id="userLoginPage">
      <LoginForm
        form={form}
        logo={
          <Image src="/assets/logo.png" alt="面试鸭" height={44} width={44} />
        }
        title="Code2Offer - 用户登录"
        subTitle="程序员面试刷题网站"
        onFinish={doSubmit}
      >
        <ProFormText
          name="userAccount"
          fieldProps={{
            size: "large",
            prefix: <UserOutlined />,
          }}
          placeholder={"请输入用户账号"}
          rules={[
            {
              required: true,
              message: "请输入用户账号!",
            },
          ]}
        />
        <ProFormText.Password
          name="userPassword"
          fieldProps={{
            size: "large",
            prefix: <LockOutlined />,
          }}
          placeholder={"请输入密码"}
          rules={[
            {
              required: true,
              message: "请输入密码！",
            },
          ]}
        />
        <div
          style={{
            marginBlockEnd: 24,
            textAlign: "end",
          }}
        >
          还没有账号？
          <Link href={"/user/register"}>去注册</Link>
        </div>
      </LoginForm>
    </div>
  );
};

export default UserLoginPage;
