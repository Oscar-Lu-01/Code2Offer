"use server";
import { message } from "antd";
import { getQuestionVoByIdUsingGet } from "@/api/questionController";
import QuestionCard from "@/components/QuestionCard";
import "./index.css";

/**
 * 题目详情页
 * @constructor
 */
// 1. 定义参数结构
interface PageProps {
  params: {
    questionId: string;
  };
}

export default async function QuestionPage({ params }: PageProps) {
  const { questionId } = params;

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

  return (
    <div id="questionPage">
      <QuestionCard question={question} />
    </div>
  );
}
