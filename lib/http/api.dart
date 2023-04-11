/// 环境类型
enum ENV { dev, test, dev2, test2, release, zjk }

class Api {
  // dio请求前缀
  static Map<String, String> urlMap = {
    ENV.dev.toString(): 'dev.ailieyun.com',
    ENV.test.toString(): 'test.ailieyun.com',
    ENV.dev2.toString(): 'dev2.ailieyun.com',
    ENV.test2.toString(): 'test2.ailieyun.com',
    ENV.release.toString(): 'lyt.lieyuntong.cn',
  };

  /// 当前环境变量
  static String currentEnv = ENV.release.toString();

  /// 是否开启sdk上传
  static const bool uploadState = false;

  // Domain
  static String baseDomain = urlMap[currentEnv] ?? "dev.ailieyun.com";

  /// 基础路由
  static String baseUrl = "https://$baseDomain";

  ///
  static String getAllPoint = "/api/track/track/gpsInfos";

  ///
  static String uploadLocation = "/api/track/track/gpsInfo/";

  /// 发送验证码
  static String sendSms = "/api/auth/sms/send/";

  static String loginApp = "/api/auth/oauth/login/";

  static String getAllBusinessFreightPage =
      "/api/business/businessFreightSub/getHallPage";

  static String updateBusinessFreightRecord =
      "/api/business/businessFreightRecord/save";

  ///模版接单
  static String getTemplateReceipt =
      "/api/business/businessFreightReceipt/saveAndGet";

  static String initTenant = "/api/auth/sysTenant/getTenant";

  /// 手机号登录
  static String login = "/api/auth/oauth/login?grant_type=mobile";

  /// 账号密码登录
  static String loginAccount = "/api/auth/oauth/token?grant_type=password";

  static String getDriverByPhone = "/api/basis/basisDriver/getByPhone";

  ///添加车辆
  static String getBasisVehicleSaveAndGet = "/api/basis/basisVehicle/saveAndGet";

  /// 获取货源大厅新运单数据
  static String getPageOfWayBill = "/api/business/businessFreightSub/getPage";

  /// 获取运单列表新运单数据
  static String getHallPageOfWayBill = "/api/business/businessFreightSub/getPage";

  /// 获取运单列表
  static String getWayBillPage = "/api/business/businessFreightSub/getCPage";

  /// 立即接单
  static String grabFreight = "/api/business/businessFreightSub/grab";

  static String uploadFile = "/api/custom/file/upload";

  /// 校验车机是否开启
  static String checkVehicleExist = "/api/basis/basisVehicleCheck/checkVehicleExistV2";

  static String updateBusinessFreightSubById =
      "/api/business/businessFreightSub/updateById/";

  static String updateStatus = "/api/business/businessFreightSub/updateStatus";

  static String getWayBillById =
      "/api/business/businessFreightSub/getById";

  static String getBusinessFreightTemplate =
      "/api/business/businessFreightTemplate/paramFreightTemplate";

  ///认证批量保存
  static String getWalletCertificationSaveBatch =
      "/api/wallet/walletCertification/saveBatch";

  /// 认证保存
  static String getCertification =
      "/api/business/businessCustomCertification/save";

  /// 获取认证Url
  static String getCertificationById =
      "/api/business/businessCustomCertification/getById/";

  /// 认证保存或查询
  static String saveAndGetCertification =
      '/api/business/businessCustomCertification/saveAndGet';

  static String getBasisBasisDriverGetByPhone =
      "/api/basis/basisDriver/getByPhone";

  static String getBasisOcrIdentify = "/api/basis/basisOcr/identify";

  static String getBasisVehicleSave = "/api/basis/basisVehicle/save";

  static String getBasisDriverUpdateById = "/api/basis/basisDriver/updateById";

  static String getAllContractPage = "/api/business/businessContract/page";

  static String signContract = "/api/business/businessContract/sign";

  static String getBasisDictList = "/api/basis/basisDict/list";

  static String getBasisVehicleBrandList = "/api/basis/basisVehicleBrand/list";

  static String getWalletCertificationSave =
      "/api/wallet/walletCertification/save";

  static String addBankCard = "/api/wallet/walletBankcard/save";

  /// 查询用户认证列表
  static String getCertificationList = "/api/wallet/walletCertification/list";

  /// 查询认证状态
  static String getCertificationPage = "/api/wallet/walletCertification/page";

  /// SDK接口开关
  static String getSdkConfig = "/api/basis/basisConfig/getOne";

  /// 查询用户钱包
  static String getWallet = "/api/wallet/walletUser/getWallet";

  /// 获取银行卡列表
  static String getBankCardList = "/api/wallet/walletBankcard/getList";

  /// 解绑银行卡
  static String getBankCardDeleteById = "/api/wallet/walletBankcard/deleteById";

  /// 查询可提现记录
  static String walletPaymentRecords = "/api/wallet/walletPayment/records";

  /// 查询已通过支付记录
  static String walletPaymentPass = "/api/wallet/walletPayment/page";

  /// 查询可提现记录路线
  static String getLines = "/api/business/businessLine/getByIds";

  /// 司机提现接口
  static String withdrawalSaveBatch = '/api/wallet/walletWithdrawal/saveBatch';

  /// 提现记录接口
  static String withdrawalRecords = '/api/wallet/walletWithdrawal/page';

  /// 根据银行卡获取分支行
  static String bankBranchList = '/api/auth/basisTysjBank/list';

  /// 运单支付方案
  static String walletPlan = '/api/wallet/walletPayment/list';

  /// 注销
  static String clear = '/api/auth/oauth/clear';

  /// 查询app更新信息
  static String updateVersion = '/api/upms/sysConfig/getOne';
}
