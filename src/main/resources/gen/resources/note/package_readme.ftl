所有 api 接口对前端的应答，均为统一的 json 格式：
{
    "success" : 1,
    "code" : 0,
    "message" : "xxxxx",
    "data" :
        {

        },
    "token" : "xxxxx.xxxxx.xxxxx"
}
其中：
success 表示业务请求是否成功，由 ${packageName}.common.enums.response.base.BussinessEnum 表示。
code 表示业务执行的结果代码，包括错误代码，正常的结果代码为正数，异常的结果代码为负数。
        code 可能为0，则表示一个临时的自定义信息。
message 表示业务执行的结果的提示信息。
data 表示业务执行结果的返回数据，数据内容必须是一个 Map(字典) 。
token 为颁发的用户 token ，如果为空，不必处理，
        否则，客户端必须存储这个 token ，并且在每次请求的时候，在 header 中加入 token ， header 名称为 USER-TOKEN 。

所有业务结果代码（code）均以枚举的方式体现：
在 ${packageName}.common.enums.response 包内
其中 ${packageName}.common.enums.response.base.CommonResponseEnum 表示通用的应答结果代码。

以下为各个业务块的代码范围，为避免重复，由架构师定好范围之后，开发人员再制定具体的代码枚举，并告知前端开发人员。
    正常码 1~1000          异常码 -1~-1000        base.CommonResponseEnum  通用的结果代码
