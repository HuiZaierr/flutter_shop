const serviceUrl = "http://label.shangjinac.cn/app/v7/";
// const serviceUrl = "http://label.shangjinac.cn/app/v6/";

const servicePath = {
  'rhomepage': serviceUrl + "rhomepage", //获取首页数据
  'allCategory': serviceUrl + "allCategory", //获取分类顶部数据
  'cateDetail': serviceUrl + "cateDetail", //获取分类列表数据
  'captcha': serviceUrl + "captcha", //获取验证码
  'login': serviceUrl + "login", //验证码登录
  'userIntegral': serviceUrl + "userIntegral", //获取我的积分情况
  'userReadInfo': serviceUrl + "userReadInfo", //获取我的用户阅读情况
  'rhistory': serviceUrl + "rhistory",         //获取历史列表
  'rfavorites': serviceUrl + "rfavorites",     //获取收藏列表
};
