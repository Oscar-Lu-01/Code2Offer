import React from "react";
import "./index.css";

/**
 * 全局底部栏组件
 * @constructor
 */
export default function GlobalFooter() {
  const currentYear = new Date().getFullYear();

  return (
    <div className="global-footer">
      <div>© {currentYear} Code2Offer</div>
      <div>
        <a href="https://github.com/Oscar-Lu-01" target="_blank">
          作者：抱璞
        </a>
      </div>
    </div>
  );
}
