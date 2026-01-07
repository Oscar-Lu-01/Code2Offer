"use client";
import {
  // listQuestionVoByPageUsingPost,
  searchQuestionVoByPageUsingPost,
} from "@/api/questionController";
import {
  ProTable,
  type ProColumns,
  type ActionType,
} from "@ant-design/pro-components";
import React, { useRef, useState } from "react";
import TagList from "@/components/TagList";
import Link from "next/link";
import "./index.css";

interface Props {
  defaultQuestionList?: API.QuestionVO[];
  defaultTotal?: number;
  defaultSearchParams?: API.QuestionQueryRequest;
}

const QuestionTable: React.FC<Props> = (props) => {
  const { defaultQuestionList, defaultTotal, defaultSearchParams = {} } = props;
  const actionRef = useRef<ActionType>();

  // 🔹 状态只保留 init，不要再自己存 data 了，交给 ProTable
  const [init, setInit] = useState<boolean>(true);

  const columns: ProColumns<API.QuestionVO>[] = [
    {
      title: "搜索",
      dataIndex: "searchText",
      valueType: "text",
      hideInTable: true,
    },
    {
      title: "标题",
      dataIndex: "title",
      valueType: "text",
      hideInSearch: true,
      render: (_, record) => (
        <Link href={`/question/${record.id}`}>{record.title}</Link>
      ),
    },
    {
      title: "标签",
      dataIndex: "tagList",
      valueType: "select",
      fieldProps: { mode: "tags" },
      render: (_, record) => <TagList tagList={record.tagList} />,
    },
  ];

  return (
    <div className="question-table">
      <ProTable<API.QuestionVO>
        actionRef={actionRef}
        size="large"
        rowKey="id"
        // 🔍 这里的 search 配置控制顶部的查询表单
        search={{ labelWidth: "auto" }}
        form={{ initialValues: defaultSearchParams }}
        request={async (params, sort, filter) => {
          // SSR 首次加载逻辑
          if (init && defaultQuestionList && defaultTotal) {
            //console.log("🛑 [调试] 首次加载，直接使用 props 数据");
            setInit(false);
            return {
              data: defaultQuestionList,
              total: defaultTotal,
              success: true,
            };
          }

          const cleanParams = { ...params };

          if (cleanParams.tagList) {
            cleanParams.tags = cleanParams.tagList;
            delete cleanParams.tagList; // 删掉旧名，保持整洁
          }

          const sortField = Object.keys(sort)?.[0] || "createTime";
          const sortOrder = sort?.[sortField] || "descend";

          //console.log("[调试] 正在请求后端接口...");

          // const res = await listQuestionVoByPageUsingPost({
          //   ...cleanParams,
          //   sortField,
          //   sortOrder,
          //   ...filter,
          // } as API.QuestionQueryRequest);
          const res = await searchQuestionVoByPageUsingPost({
            ...cleanParams,
            sortField: "_score",
            sortOrder,
            ...filter,
          } as API.QuestionQueryRequest);

          // 🔥 日志位置 2：看清楚后端到底返回了什么结构
          console.log("[调试] 后端原始返回 res:", res);
          const finalData = (res as any).records || [];
          const finalTotal = (res as any).total || 0;

          //console.log("✅ [调试] 最终给表格的数据:", finalData);

          return {
            success: true,
            data: finalData,
            total: finalTotal,
          };
        }}
        columns={columns}
      />
    </div>
  );
};
export default QuestionTable;
