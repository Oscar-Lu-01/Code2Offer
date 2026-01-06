"use server";
import { Flex, Menu, message , MenuProps} from "antd";
import { getQuestionBankVoByIdUsingGet } from "@/api/questionBankController";
import Title from "antd/es/typography/Title";
import { getQuestionVoByIdUsingGet } from "@/api/questionController";
import Sider from "antd/es/layout/Sider";
import { Content } from "antd/es/layout/layout";
import QuestionCard from "@/components/QuestionCard";
import Link from "next/link";
import "./index.css";

/**
 * 题库题目详情页
 * @constructor
 */
// 1. 定义 Params 的接口类型
interface PageProps {
  params: {
    questionBankId: string;
    questionId: string;
  };
}

export default async function BankQuestionPage({ params }: PageProps) {
  const { questionBankId, questionId } = params;

  // 获取题库详情
  let bank = undefined;
  try {
    const res = await getQuestionBankVoByIdUsingGet({
      id: Number(questionBankId),
      needQueryQuestion: true,
      // 可以自行扩展为分页实现
      pageSize: 200,
    });
    bank = res as any;
  } catch (e) {
    message.error("获取题库列表失败，" +  (e as Error).message);
  }
  // 错误处理
  if (!bank) {
    return <div>获取题库详情失败，请刷新重试</div>;
  }

  // 获取题目详情
  let question = undefined;
  try {
    const res = await getQuestionVoByIdUsingGet({
      id: Number(questionId),
    });
    question = res as any;
  } catch (e) {
    message.error("获取题目详情失败，" + (e as Error).message);
  }
  // 错误处理
  if (!question) {
    return <div>获取题目详情失败，请刷新重试</div>;
  }

  // 题目菜单列表
  // const questionMenuItemList = (bank.questionPage?.records || []).map((q) => {
  //   return {
  //     label: (
  //       <Link href={`/bank/${questionBankId}/question/${q.id}`}>{q.title}</Link>
  //     ),
  //     key: q.id,
  //   };
  // });

  // 2. 显式定义类型
  const questionMenuItemList: MenuProps["items"] = (
    bank.questionPage?.records || []
  ).map((q) => {
    return {
      label: (
        <Link href={`/bank/${questionBankId}/question/${q.id}`}>{q.title}</Link>
      ),
      key: String(q.id),
    };
  });

  return (
    <div id="bankQuestionPage">
      <Flex gap={24}>
        <Sider width={240} theme="light" style={{ padding: "24px 0" }}>
          <Title level={4} style={{ padding: "0 20px" }}>
            {bank.title}
          </Title>
          <Menu
            items={questionMenuItemList}
            selectedKeys={[String(question.id)]}
          />
        </Sider>
        <Content>
          <QuestionCard question={question} />
        </Content>
      </Flex>
    </div>
  );
}
