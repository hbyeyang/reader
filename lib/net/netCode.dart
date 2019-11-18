class NetCode {
  // 测试环境
  static String LT_URL = "http://www.alpha.letupower.cn";
  static String LT_URL2 = "http://kbookapp2.alpha.letupower.cn";

  // 线上环境
//  static String LT_URL = "https://kbookapp.letupower.cn";
//  static String LT_URL2 = "https://kbookapp2.letupower.cn";

  /**
   * 域名地址
   */
  static final String DEFAULT_BASE_URL = LT_URL + "/api/data";

  static String BASE_URL = DEFAULT_BASE_URL;

  /**
   * H5 抽奖页
   */
  static final String URL_LUCK = LT_URL + "/app2/welfare/choujiang?channel=";

  /**
   * H5 福利页
   */
  static final String URL_WELFARE = LT_URL + "/app/welfare?channel=";

  /**
   * H5书城URL
   */
  static final String URL_BOOK_CITY = LT_URL + "/app2";

  /**
   * H5排行URL
   */
  static final String URL_BOOK_RANK = LT_URL + "/app2/books/rank";

  /**
   * H5分类URL
   */
  static final String URL_BOOK_CLASS = LT_URL + "/app2/books/cate";

  /**
   * 热词接口
   */
  static final String URL_GET_HOTKEY = BASE_URL + "/getKeyword";

  /**
   * 搜索接口（新版废弃）
   */
  static final String URL_GET_SEARCH = BASE_URL + "/search";

  /**
   * 搜索接口
   */
  static final String URL_GET_SEARCH_BOOK_BY_KEYWORD =
      BASE_URL + "/searchBookByKeyword";

  /**
   * 书城接口
   */
  static String URL_BOOKCITY = BASE_URL + "/getHomePage";

  /**
   * 上报事件接口
   */

  static final String URL_UPLOAD_AD_EVENT = BASE_URL + "/webCount";

  /**
   * 列表页接口
   */
  static final String URL_GET_BOOKLIST = BASE_URL + "/getBookList";

  /**
   * 列表页接口
   */
  static final String URL_GET_BOOKLIST2 = BASE_URL + "/getBookListv2";

  /**
   * 使用兑换码接口
   */
  static final String URL_USER_DHM = BASE_URL + "/useRedeemCode";

  /**
   * 获取机器人消息
   */
  static final String URL_GET_ROBOT_MSG = BASE_URL + "/getRobot";

  /**
   * 上报阅读事件
   */
  static final String URL_SEND_OPEN_READ = BASE_URL + "/count";

  /**
   * 用户购买章节
   */
  static final String URL_BUY_CHAPTER = BASE_URL + "/buyChapters";

  /**
   * 用户加减金币,vip
   */
  static final String URL_SET_USER_COIN_AND_VIP = BASE_URL + "/saveUserAccount";

  /**
   * 修改订单接口
   */
  static final String URL_SAVE_ORDER = BASE_URL + "/saveOrderStatus";

  /**
   * 创建订单接口
   */
  static final String URL_CREATE_ORDER = BASE_URL + "/makeOrder";

  /**
   * 微信支付
   */
  static final String URL_WX_PAY = BASE_URL + "/pay";

  /**
   * 获取消费记录接口
   */
  static String URL_GET_COST_LOG = BASE_URL + "/getXfLog";

  /**
   * 获取充值记录接口
   */
  static String URL_GET_PAY_LOG = BASE_URL + "/getOrderLog";

  /**
   * 检查更新
   */
//static String URL_CHECK_UPDATE = BASE_URL + "/getVersion";

  /**
   * 新 检查更新
   */
  static String URL_CHECK_UPDATE = LT_URL2 + "/api/getversion";

  /**
   * 上传图片
   */
  static String URL_USER_UPLOAD_IMG = BASE_URL + "/upload";

  /**
   * 删除图片
   */
  static String URL_USER_DELETE_IMG = BASE_URL + "/delete_icon";

  /**
   * 更新用户信息
   */
  static String URL_USER_UPDATE_INFO = BASE_URL + "/setUser";

  /**
   * 初始化接口
   */
//     static String GET_OPENID = BASE_URL + "/getOpenId";

  static String GET_OPENID = LT_URL2 + "/api/getopenid";

  /**
   * 获取用户信息接口
   */
  static String GET_USER_INFO = BASE_URL + "/getUserInfo";

  /**
   * 获取单本图书
   * bookId
   */
  static String GET_BOOK_INFO = BASE_URL + "/getBooksInfo";

  /**
   * 获取单本图书v2 新接口
   * bookId
   */
  static String GET_BOOK_INFO_V2 = LT_URL2 + "/api/getbooksinfov2";

  /**
   * 获取首次推荐图书
   * bookId
   */
  static String GET_BOOK_INFO_LIST = BASE_URL + "/getBooksInfoList";

  /**
   * 获取单章内容
   * chapterId
   */
//     static String GET_BOOK_CONTENT = "/api/data/getChaptersInfo";

  /**
   * 获取单章内容 新接口
   * chapterId
   */
  static String GET_BOOK_CONTENT = LT_URL2 + "/api/getchaptersinfo";

  /**
   * 获取验证码接口
   */
//     static String URL_GET_CODE = BASE_URL + "/sendCode";

  /**
   * 新获取验证码接口
   */
  static String URL_GET_CODE = LT_URL2 + "/api/sendcode";

  /**
   * 提交验证接口
   */
//     static String URL_BIND_PHONENUM = BASE_URL + "/bindMobile";

  /**
   * 新提交验证接口
   */
  static String URL_BIND_PHONENUM = LT_URL2 + "/api/bindmobile";

  /**
   * 新解绑手机号接口
   */
  static String URL_UNBIND_PHONENUM = LT_URL2 + "/api/unbindphone";

  /**
   * 获取配置项接口
   */
  static String URL_GET_CONFIG = BASE_URL + "/getSetting";

  /**
   * 提交反馈建议接口
   */
  static String URL_SUBMIT_KF = BASE_URL + "/feedBack";

  /**
   * 获取首页BANNERLIST
   */
  static String URL_GET_BANNER_LIST = BASE_URL + "/getAd";

  /**
   * 选择性别
   */
  static String URL_SELECT_SEX = BASE_URL + "/submitProfile";

  /**
   * 关于我们页面
   */
  static String ABOUT_US_URL = LT_URL + "/app2/index/about_us_h5";

  /**
   * 书城频道
   */
  static final String URL_BOOK_CHANNEL = BASE_URL + "/categoryList";

  /**
   * 书城频道列表数据
   */
  static final String URL_CHANNEL_DATA = BASE_URL + "/categoryData";

  /**
   * 书城频道列表数据
   */
  static final String URL_CHANNEL_DATA_V2 = BASE_URL + "/categoryDatav2";

  /**
   * 根据推荐位唯一标识获取书籍列表
   */
  static final String URL_SID_DATA = BASE_URL + "/getBooksBySid";

  /**
   *  获取分类列表数据URL
   */
  static final String URL_CLASS_DATA = BASE_URL + "/getChannel";

  /**
   *  获取分类列表数据URL v2
   */
  static final String URL_CLASS_DATA2 = BASE_URL + "/getChannelv2";

  /**
   * 请求排行分类列表
   */
  static final String URL_RANK_CLOUMN_LIST = BASE_URL + "/getColumn";

  /**
   * 获取书籍详情页作者其他书籍
   */
  static final String URL_DETAILS_GET_AUTHOR_BOOKS =
      BASE_URL + "/getAuthorBooks";

  /**
   * 获取书籍详情页喜欢本书还喜欢
   */
  static final String URL_DETAILS_GET_LIKE_BOOKS = BASE_URL + "/getLikeBooks";

  /**
   * 添加或删除
   */
  static final String URL_ADD_DELETE_BOOK = BASE_URL + "/changeUserShelf";

  /**
   * 今日必读的图片
   */
  static final String URL_TODAY_READ_BOOK = BASE_URL + "/getBooksTodayPic";

  /**
   * 新绑定CLIENTID
   */
  static final String BINDING_CLIENTID = LT_URL2 + "/api/addclientuser";

  /**
   * 新 消息
   */
  static final String NEW_PUSH_MSG = LT_URL2 + "/api/getpushmsg";

  /**
   * 新 消息列表
   */
  static final String PUSH_MSG_LIST = LT_URL2 + "/api/getpushlist";

  /**
   * 新 用户书架
   */
  static final String USER_BOOK_SHELF = LT_URL2 + "/api/getusershelf";

  /**
   * 新    搜索接口
   */
  static final String POST_NEW_SEARCH = LT_URL2 + "/api/search";

  /**
   * 新   更新上报接口
   */
  static final String POST_UPDATE_MSG = LT_URL2 + "/api/getupdatehistory";

  /**
   * 账户信息接口   8
   */
  static final String POST_COINUSERINFO = LT_URL2 + "/api/coinuserinfo";

  /**
   * 获取配置接口   10
   */
  static final String POST_COINCONFIG = LT_URL2 + "/api/coinconfig";

  /**
   * 兑换记录接口   11
   */
  static final String POST_EXCHANGERECORD = LT_URL2 + "/api/exchangerecord";

  /**
   * VIP兑换接口  14
   */
  static final String POST_EXCHANGEVIP = LT_URL2 + "/api/exchangevip";

  /**
   *  【激励】视频开始    12
   */
  static final String POST_COINRIDEOSTART = LT_URL2 + "/api/coinrideostart";

  /**
   *  【激励】视频结束领取金币    13
   */
  static final String POST_COINRIDEOEND = LT_URL2 + "/api/coinrideoend";

  /**
   * 大转盘页面接口  15
   */
  static final String POST_TURNTABLEVIEW = LT_URL2 + "/api/turntableview";

  /**
   * 【激励】书籍阅读获取金币 9
   */
  static final String POST_COINREADGET = LT_URL2 + "/api/coinreadget";
}
