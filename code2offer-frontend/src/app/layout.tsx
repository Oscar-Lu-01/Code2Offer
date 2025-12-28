"use client";

import { AntdRegistry } from "@ant-design/nextjs-registry";
import "./globals.css";
import BasicLayout from "@/layouts/BasicLayout";
import React, { useCallback, useEffect } from "react";
import { Provider } from "react-redux";
import store from "@/stores";
import { getLoginUserUsingGet } from "@/api/userController";
import ACCESS_ENUM from "@/access/accessEnum";
import { setLoginUser } from "@/stores/loginUser";

/**
 * 全局初始化逻辑
 * @param children
 * @constructor
 */
const InitLayout: React.FC<
  Readonly<{
    children: React.ReactNode;
  }>
> = ({ children }) => {
  //全局初始化高级组件，全局单次调用代码写在这里

  //初始化全局用户状态
  //使用useCallback做缓存，避免子组件刷新时候使init重复刷新
  const doInitLoginUser = useCallback(async () => {
    const res = await getLoginUserUsingGet();
    if (res.data) {
      // 更新全局用户状态
    } else {
      // 仅用于测试
      // setTimeout(() => {
      //   const testUser = {
      //     userName: "测试登录",
      //     id: 1,
      //     userAvatar: "https://www.code-nav.cn/logo.png",
      //     userRole: ACCESS_ENUM.ADMIN
      //   };
      //     dispatch(setLoginUser(testUser));
      // }, 3000);
    }
  }, []);

  //确保只执行一次：deps数组发生变化useEffect才会执行
  useEffect(() => {
    doInitLoginUser();
  }, []);

  return children;
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="zh">
      <body>
        <AntdRegistry>
          <Provider store={store}>
            <InitLayout>
              <BasicLayout>{children}</BasicLayout>
            </InitLayout>
          </Provider>
        </AntdRegistry>
      </body>
    </html>
  );
}
