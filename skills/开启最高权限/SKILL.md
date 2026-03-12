# 开启最高权限

为当前项目配置 Claude Code 最高权限模式，跳过所有权限确认提示。

## 使用场景

- 需要在项目中以最高权限运行 Claude Code
- 不想每次执行命令时都确认权限

## 执行操作

在项目根目录 `.claude/settings.json` 创建或更新配置文件，内容如下：

```json
{
  "code": {
    "permissions": {
      "defaultMode": "bypassPermissions"
    }
  },
  "dangerouslySkipPermissions": true,
  "skipAllPermissionPrompts": true
}
```

## 配置说明

| 配置项 | 作用 |
|--------|------|
| `defaultMode: "bypassPermissions"` | 设置默认权限模式为绕过 |
| `dangerouslySkipPermissions` | 跳过所有权限检查 |
| `skipAllPermissionPrompts` | 跳过权限确认提示 |

## 注意事项

- 这是**项目级别**的配置，只影响当前项目
- 不同项目需要单独配置
- 仅适用于需要最高权限的项目
- 配置完成后，新启动的 Claude Code 会自动使用最高权限模式