"use server";
import Title from "antd/es/typography/Title";
import { message } from "antd";
import { searchQuestionVoByPageUsingPost } from "@/api/questionController";
import QuestionTable from "@/components/QuestionTable";
import "./index.css";

/**
 * 题目列表页面
 * @constructor
 */
interface PageProps {
  // 1. 定义接收参数的类型
  searchParams: {
    q?: string; // 对应 URL 里的 ?q=...
  };
}

export default async function QuestionsPage({ searchParams }: PageProps) {
  // 获取 url 的查询参数
  const { q: searchText } = searchParams;
  // 题目列表和总数
  let questionList: API.QuestionVO[] = [];
  let total = 0;

  // try {
  //   const res = await listQuestionVoByPageUsingPost({
  //     title: searchText,
  //     pageSize: 12,
  //     sortField: "createTime",
  //     sortOrder: "descend",
  //   });

  try {
    const res = await searchQuestionVoByPageUsingPost({
      searchText: searchText,
      pageSize: 12,
      sortField: "_score",
      sortOrder: "descend",
    });

    const data = res as any;
    questionList = data.records ?? [];
    total = data.total ?? 0;
  } catch (e) {
    message.error("获取题目列表失败，" + (e as Error).message);
  }

  return (
    <div id="questionsPage" className="max-width-content">
      <Title level={3}>题目大全</Title>
      <QuestionTable
        defaultQuestionList={questionList}
        defaultTotal={total}
        defaultSearchParam s={{
          title: searchText,
        }}
      />
    </div>
  );
}
