class DashboardData {
  int? allSubscribersCount;
  int? onlineSubscribersCount;
  int? activeSubscribersCount;
  int? disabledSubscribersCount;
  int? expiredSubscribersCount;
  int? expiringTodaySubscribersCount;
  int? expiringNext4DaysSubscribersCount;
  int? expiringLast4DaysSubscribersCount;
  int? registeredToday;
  List<RegisteredThisMonth>? registeredThisMonth;
  List<RegisteredLastMonth>? registeredLastMonth;
  int? renewedInAdvance;
  int? packagesSoldToday;
  int? packagesSoldYesterday;
  int? packagesSoldThisMonth;
  int? packagesSoldLastMonth;
  bool? reseller;
  int? activeInvoicesCount;
  String? activeInvoicesAmount;
  int? activePaymentsCount;
  String? activePaymentsAmount;
  String? activeBalanceAmountDue;
  String? totalBalanceAmountDue;

  DashboardData(
      {this.allSubscribersCount,
      this.onlineSubscribersCount,
      this.activeSubscribersCount,
      this.disabledSubscribersCount,
      this.expiredSubscribersCount,
      this.expiringTodaySubscribersCount,
      this.expiringNext4DaysSubscribersCount,
      this.expiringLast4DaysSubscribersCount,
      this.registeredToday,
      this.registeredThisMonth,
      this.registeredLastMonth,
      this.renewedInAdvance,
      this.packagesSoldToday,
      this.packagesSoldYesterday,
      this.packagesSoldThisMonth,
      this.packagesSoldLastMonth,
      this.reseller,
      this.activeInvoicesCount,
      this.activeInvoicesAmount,
      this.activePaymentsCount,
      this.activePaymentsAmount,
      this.activeBalanceAmountDue,
      this.totalBalanceAmountDue});

  DashboardData.fromJson(Map<String, dynamic> json) {
    allSubscribersCount = json['all_subscribers_count'];
    onlineSubscribersCount = json['online_subscribers_count'];
    activeSubscribersCount = json['active_subscribers_count'];
    disabledSubscribersCount = json['disabled_subscribers_count'];
    expiredSubscribersCount = json['expired_subscribers_count'];
    expiringTodaySubscribersCount = json['expiring_today_subscribers_count'];
    expiringNext4DaysSubscribersCount =
        json['expiring_next_4_days_subscribers_count'];
    expiringLast4DaysSubscribersCount =
        json['expiring_last_4_days_subscribers_count'];
    registeredToday = json['registered_today'];
    if (json['registered_this_month'] != null) {
      registeredThisMonth = <RegisteredThisMonth>[];
      json['registered_this_month'].forEach((v) {
        registeredThisMonth!.add(new RegisteredThisMonth.fromJson(v));
      });
    }
    if (json['registered_last_month'] != null) {
      registeredLastMonth = <RegisteredLastMonth>[];
      json['registered_last_month'].forEach((v) {
        registeredLastMonth!.add(new RegisteredLastMonth.fromJson(v));
      });
    }
    renewedInAdvance = json['renewed_in_advance'];
    packagesSoldToday = json['packages_sold_today'];
    packagesSoldYesterday = json['packages_sold_yesterday'];
    packagesSoldThisMonth = json['packages_sold_this_month'];
    packagesSoldLastMonth = json['packages_sold_last_month'];
    reseller = json['reseller'];
    activeInvoicesCount = json['active_invoices_count'];
    activeInvoicesAmount = json['active_invoices_amount'];
    activePaymentsCount = json['active_payments_count'];
    activePaymentsAmount = json['active_payments_amount'];
    activeBalanceAmountDue = json['active_balance_amount_due'];
    totalBalanceAmountDue = json['total_balance_amount_due'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all_subscribers_count'] = this.allSubscribersCount;
    data['online_subscribers_count'] = this.onlineSubscribersCount;
    data['active_subscribers_count'] = this.activeSubscribersCount;
    data['disabled_subscribers_count'] = this.disabledSubscribersCount;
    data['expired_subscribers_count'] = this.expiredSubscribersCount;
    data['expiring_today_subscribers_count'] =
        this.expiringTodaySubscribersCount;
    data['expiring_next_4_days_subscribers_count'] =
        this.expiringNext4DaysSubscribersCount;
    data['expiring_last_4_days_subscribers_count'] =
        this.expiringLast4DaysSubscribersCount;
    data['registered_today'] = this.registeredToday;
    if (this.registeredThisMonth != null) {
      data['registered_this_month'] =
          this.registeredThisMonth!.map((v) => v.toJson()).toList();
    }
    if (this.registeredLastMonth != null) {
      data['registered_last_month'] =
          this.registeredLastMonth!.map((v) => v.toJson()).toList();
    }
    data['renewed_in_advance'] = this.renewedInAdvance;
    data['packages_sold_today'] = this.packagesSoldToday;
    data['packages_sold_yesterday'] = this.packagesSoldYesterday;
    data['packages_sold_this_month'] = this.packagesSoldThisMonth;
    data['packages_sold_last_month'] = this.packagesSoldLastMonth;
    data['reseller'] = this.reseller;
    data['active_invoices_count'] = this.activeInvoicesCount;
    data['active_invoices_amount'] = this.activeInvoicesAmount;
    data['active_payments_count'] = this.activePaymentsCount;
    data['active_payments_amount'] = this.activePaymentsAmount;
    data['active_balance_amount_due'] = this.activeBalanceAmountDue;
    data['total_balance_amount_due'] = this.totalBalanceAmountDue;
    return data;
  }
}

class RegisteredLastMonth {
  int? id;
  int? locationId;
  int? subscriberid;
  String? accountNo;
  String? username;
  String? password;
  String? encryptedPassword;
  bool? stickyPassword;
  Null? resetPasswordToken;
  String? name;
  String? subscriberType;
  bool? hotspotSubscriber;
  Null? hotspotSignUpMethod;
  Null? mobileUsedForHotspotSignUp;
  CustomSignUpValues? customSignUpValues;
  bool? leasedLineSubscriber;
  String? previousStatus;
  String? status;
  bool? blocked;
  Null? reasonForStatus;
  Null? locationPackageId;
  Null? currentLocationPackageSaleId;
  bool? overridePackageBandwidth;
  Null? overriddenBandwidthUpload;
  Null? overriddenBandwidthUploadUnit;
  Null? overriddenBandwidthDownload;
  Null? overriddenBandwidthDownloadUnit;
  int? radUploadOverridenRateLimit;
  int? radDownloadOverridenRateLimit;
  Null? mikrotikOverriddenRateLimit;
  bool? autoRenew;
  int? autoRenewFor;
  Null? locationZoneId;
  Null? locationNodeId;
  Null? distanceFromNode;
  Null? locationIpPoolId;
  bool? fixIp;
  String? disabledIpAssigned;
  bool? bindMacAddress;
  bool? resetMacAddress;
  Null? macAddress;
  String? subscriberSince;
  int? previousBalanceAmountCents;
  String? previousBalanceAmountCurrency;
  int? balanceAmountCents;
  String? balanceAmountCurrency;
  Null? renewedAt;
  Null? expiresAt;
  bool? advanceRenewal;
  Null? advanceRenewalPackageId;
  Null? advanceRenewalPackageSaleId;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? country;
  String? zip;
  String? phone1;
  String? phone2;
  String? mobile1;
  String? mobile2;
  String? email;
  String? gstNo;
  Null? lastLoginAt;
  bool? online;
  Null? mikrotikUsername;
  Null? authenticatedByRadiusServerId;
  bool? recalculateUsage;
  Null? lastAcctupdatetime;
  int? acctInterimInterval;
  int? bytesUploadedTotal;
  int? bytesDownloadedTotal;
  int? bytesUploadedTotalDuringTimeSlot;
  int? bytesDownloadedTotalDuringTimeSlot;
  int? bytesUploadedIn24Hours;
  int? bytesDownloadedIn24Hours;
  int? bytesUploadedIn24HoursDuringTimeSlot;
  int? bytesDownloadedIn24HoursDuringTimeSlot;
  int? bytesUploadedMonthly;
  int? bytesDownloadedMonthly;
  int? bytesUploadedMonthlyDuringTimeSlot;
  int? bytesDownloadedMonthlyDuringTimeSlot;
  int? bytesUploadedDuringFup;
  int? bytesDownloadedDuringFup;
  int? secondsUsedTotal;
  int? secondsUsedTotalDuringTimeSlot;
  int? secondsUsedIn24Hours;
  int? secondsUsedIn24HoursDuringTimeSlot;
  int? secondsUsedMonthly;
  int? secondsUsedMonthlyDuringTimeSlot;
  int? dataToppedUpBy;
  String? dataToppedUpByUnit;
  int? dataToppedUpByInBytes;
  String? note;
  Null? sidebarCollapse;
  Null? attackLogs;
  String? discount;
  Null? facebookToken;
  Null? facebookTokenExpiresAt;
  Null? facebookImageUrl;
  Null? facebookUid;
  String? apiKey;
  CustomSignUpValues? preferences;
  String? updatedFromIp;
  int? createdById;
  int? updatedById;
  String? createdAt;
  String? updatedAt;

  RegisteredLastMonth(
      {this.id,
      this.locationId,
      this.subscriberid,
      this.accountNo,
      this.username,
      this.password,
      this.encryptedPassword,
      this.stickyPassword,
      this.resetPasswordToken,
      this.name,
      this.subscriberType,
      this.hotspotSubscriber,
      this.hotspotSignUpMethod,
      this.mobileUsedForHotspotSignUp,
      this.customSignUpValues,
      this.leasedLineSubscriber,
      this.previousStatus,
      this.status,
      this.blocked,
      this.reasonForStatus,
      this.locationPackageId,
      this.currentLocationPackageSaleId,
      this.overridePackageBandwidth,
      this.overriddenBandwidthUpload,
      this.overriddenBandwidthUploadUnit,
      this.overriddenBandwidthDownload,
      this.overriddenBandwidthDownloadUnit,
      this.radUploadOverridenRateLimit,
      this.radDownloadOverridenRateLimit,
      this.mikrotikOverriddenRateLimit,
      this.autoRenew,
      this.autoRenewFor,
      this.locationZoneId,
      this.locationNodeId,
      this.distanceFromNode,
      this.locationIpPoolId,
      this.fixIp,
      this.disabledIpAssigned,
      this.bindMacAddress,
      this.resetMacAddress,
      this.macAddress,
      this.subscriberSince,
      this.previousBalanceAmountCents,
      this.previousBalanceAmountCurrency,
      this.balanceAmountCents,
      this.balanceAmountCurrency,
      this.renewedAt,
      this.expiresAt,
      this.advanceRenewal,
      this.advanceRenewalPackageId,
      this.advanceRenewalPackageSaleId,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.country,
      this.zip,
      this.phone1,
      this.phone2,
      this.mobile1,
      this.mobile2,
      this.email,
      this.gstNo,
      this.lastLoginAt,
      this.online,
      this.mikrotikUsername,
      this.authenticatedByRadiusServerId,
      this.recalculateUsage,
      this.lastAcctupdatetime,
      this.acctInterimInterval,
      this.bytesUploadedTotal,
      this.bytesDownloadedTotal,
      this.bytesUploadedTotalDuringTimeSlot,
      this.bytesDownloadedTotalDuringTimeSlot,
      this.bytesUploadedIn24Hours,
      this.bytesDownloadedIn24Hours,
      this.bytesUploadedIn24HoursDuringTimeSlot,
      this.bytesDownloadedIn24HoursDuringTimeSlot,
      this.bytesUploadedMonthly,
      this.bytesDownloadedMonthly,
      this.bytesUploadedMonthlyDuringTimeSlot,
      this.bytesDownloadedMonthlyDuringTimeSlot,
      this.bytesUploadedDuringFup,
      this.bytesDownloadedDuringFup,
      this.secondsUsedTotal,
      this.secondsUsedTotalDuringTimeSlot,
      this.secondsUsedIn24Hours,
      this.secondsUsedIn24HoursDuringTimeSlot,
      this.secondsUsedMonthly,
      this.secondsUsedMonthlyDuringTimeSlot,
      this.dataToppedUpBy,
      this.dataToppedUpByUnit,
      this.dataToppedUpByInBytes,
      this.note,
      this.sidebarCollapse,
      this.attackLogs,
      this.discount,
      this.facebookToken,
      this.facebookTokenExpiresAt,
      this.facebookImageUrl,
      this.facebookUid,
      this.apiKey,
      this.preferences,
      this.updatedFromIp,
      this.createdById,
      this.updatedById,
      this.createdAt,
      this.updatedAt});

  RegisteredLastMonth.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locationId = json['location_id'];
    subscriberid = json['subscriberid'];
    accountNo = json['account_no'];
    username = json['username'];
    password = json['password'];
    encryptedPassword = json['encrypted_password'];
    stickyPassword = json['sticky_password'];
    resetPasswordToken = json['reset_password_token'];
    name = json['name'];
    subscriberType = json['subscriber_type'];
    hotspotSubscriber = json['hotspot_subscriber'];
    hotspotSignUpMethod = json['hotspot_sign_up_method'];
    mobileUsedForHotspotSignUp = json['mobile_used_for_hotspot_sign_up'];
    customSignUpValues = json['custom_sign_up_values'] != null
        ? new CustomSignUpValues.fromJson(json['custom_sign_up_values'])
        : null;
    leasedLineSubscriber = json['leased_line_subscriber'];
    previousStatus = json['previous_status'];
    status = json['status'];
    blocked = json['blocked'];
    reasonForStatus = json['reason_for_status'];
    locationPackageId = json['location_package_id'];
    currentLocationPackageSaleId = json['current_location_package_sale_id'];
    overridePackageBandwidth = json['override_package_bandwidth'];
    overriddenBandwidthUpload = json['overridden_bandwidth_upload'];
    overriddenBandwidthUploadUnit = json['overridden_bandwidth_upload_unit'];
    overriddenBandwidthDownload = json['overridden_bandwidth_download'];
    overriddenBandwidthDownloadUnit =
        json['overridden_bandwidth_download_unit'];
    radUploadOverridenRateLimit = json['rad_upload_overriden_rate_limit'];
    radDownloadOverridenRateLimit = json['rad_download_overriden_rate_limit'];
    mikrotikOverriddenRateLimit = json['mikrotik_overridden_rate_limit'];
    autoRenew = json['auto_renew'];
    autoRenewFor = json['auto_renew_for'];
    locationZoneId = json['location_zone_id'];
    locationNodeId = json['location_node_id'];
    distanceFromNode = json['distance_from_node'];
    locationIpPoolId = json['location_ip_pool_id'];
    fixIp = json['fix_ip'];
    disabledIpAssigned = json['disabled_ip_assigned'];
    bindMacAddress = json['bind_mac_address'];
    resetMacAddress = json['reset_mac_address'];
    macAddress = json['mac_address'];
    subscriberSince = json['subscriber_since'];
    previousBalanceAmountCents = json['previous_balance_amount_cents'];
    previousBalanceAmountCurrency = json['previous_balance_amount_currency'];
    balanceAmountCents = json['balance_amount_cents'];
    balanceAmountCurrency = json['balance_amount_currency'];
    renewedAt = json['renewed_at'];
    expiresAt = json['expires_at'];
    advanceRenewal = json['advance_renewal'];
    advanceRenewalPackageId = json['advance_renewal_package_id'];
    advanceRenewalPackageSaleId = json['advance_renewal_package_sale_id'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zip = json['zip'];
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    mobile1 = json['mobile1'];
    mobile2 = json['mobile2'];
    email = json['email'];
    gstNo = json['gst_no'];
    lastLoginAt = json['last_login_at'];
    online = json['online'];
    mikrotikUsername = json['mikrotik_username'];
    authenticatedByRadiusServerId = json['authenticated_by_radius_server_id'];
    recalculateUsage = json['recalculate_usage'];
    lastAcctupdatetime = json['last_acctupdatetime'];
    acctInterimInterval = json['acct_interim_interval'];
    bytesUploadedTotal = json['bytes_uploaded_total'];
    bytesDownloadedTotal = json['bytes_downloaded_total'];
    bytesUploadedTotalDuringTimeSlot =
        json['bytes_uploaded_total_during_time_slot'];
    bytesDownloadedTotalDuringTimeSlot =
        json['bytes_downloaded_total_during_time_slot'];
    bytesUploadedIn24Hours = json['bytes_uploaded_in_24_hours'];
    bytesDownloadedIn24Hours = json['bytes_downloaded_in_24_hours'];
    bytesUploadedIn24HoursDuringTimeSlot =
        json['bytes_uploaded_in_24_hours_during_time_slot'];
    bytesDownloadedIn24HoursDuringTimeSlot =
        json['bytes_downloaded_in_24_hours_during_time_slot'];
    bytesUploadedMonthly = json['bytes_uploaded_monthly'];
    bytesDownloadedMonthly = json['bytes_downloaded_monthly'];
    bytesUploadedMonthlyDuringTimeSlot =
        json['bytes_uploaded_monthly_during_time_slot'];
    bytesDownloadedMonthlyDuringTimeSlot =
        json['bytes_downloaded_monthly_during_time_slot'];
    bytesUploadedDuringFup = json['bytes_uploaded_during_fup'];
    bytesDownloadedDuringFup = json['bytes_downloaded_during_fup'];
    secondsUsedTotal = json['seconds_used_total'];
    secondsUsedTotalDuringTimeSlot =
        json['seconds_used_total_during_time_slot'];
    secondsUsedIn24Hours = json['seconds_used_in_24_hours'];
    secondsUsedIn24HoursDuringTimeSlot =
        json['seconds_used_in_24_hours_during_time_slot'];
    secondsUsedMonthly = json['seconds_used_monthly'];
    secondsUsedMonthlyDuringTimeSlot =
        json['seconds_used_monthly_during_time_slot'];
    dataToppedUpBy = json['data_topped_up_by'];
    dataToppedUpByUnit = json['data_topped_up_by_unit'];
    dataToppedUpByInBytes = json['data_topped_up_by_in_bytes'];
    note = json['note'];
    sidebarCollapse = json['sidebar_collapse'];
    attackLogs = json['attack_logs'];
    discount = json['discount'];
    facebookToken = json['facebook_token'];
    facebookTokenExpiresAt = json['facebook_token_expires_at'];
    facebookImageUrl = json['facebook_image_url'];
    facebookUid = json['facebook_uid'];
    apiKey = json['api_key'];
    preferences = json['preferences'] != null
        ? new CustomSignUpValues.fromJson(json['preferences'])
        : null;
    updatedFromIp = json['updated_from_ip'];
    createdById = json['created_by_id'];
    updatedById = json['updated_by_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['location_id'] = this.locationId;
    data['subscriberid'] = this.subscriberid;
    data['account_no'] = this.accountNo;
    data['username'] = this.username;
    data['password'] = this.password;
    data['encrypted_password'] = this.encryptedPassword;
    data['sticky_password'] = this.stickyPassword;
    data['reset_password_token'] = this.resetPasswordToken;
    data['name'] = this.name;
    data['subscriber_type'] = this.subscriberType;
    data['hotspot_subscriber'] = this.hotspotSubscriber;
    data['hotspot_sign_up_method'] = this.hotspotSignUpMethod;
    data['mobile_used_for_hotspot_sign_up'] = this.mobileUsedForHotspotSignUp;
    if (this.customSignUpValues != null) {
      data['custom_sign_up_values'] = this.customSignUpValues!.toJson();
    }
    data['leased_line_subscriber'] = this.leasedLineSubscriber;
    data['previous_status'] = this.previousStatus;
    data['status'] = this.status;
    data['blocked'] = this.blocked;
    data['reason_for_status'] = this.reasonForStatus;
    data['location_package_id'] = this.locationPackageId;
    data['current_location_package_sale_id'] =
        this.currentLocationPackageSaleId;
    data['override_package_bandwidth'] = this.overridePackageBandwidth;
    data['overridden_bandwidth_upload'] = this.overriddenBandwidthUpload;
    data['overridden_bandwidth_upload_unit'] =
        this.overriddenBandwidthUploadUnit;
    data['overridden_bandwidth_download'] = this.overriddenBandwidthDownload;
    data['overridden_bandwidth_download_unit'] =
        this.overriddenBandwidthDownloadUnit;
    data['rad_upload_overriden_rate_limit'] = this.radUploadOverridenRateLimit;
    data['rad_download_overriden_rate_limit'] =
        this.radDownloadOverridenRateLimit;
    data['mikrotik_overridden_rate_limit'] = this.mikrotikOverriddenRateLimit;
    data['auto_renew'] = this.autoRenew;
    data['auto_renew_for'] = this.autoRenewFor;
    data['location_zone_id'] = this.locationZoneId;
    data['location_node_id'] = this.locationNodeId;
    data['distance_from_node'] = this.distanceFromNode;
    data['location_ip_pool_id'] = this.locationIpPoolId;
    data['fix_ip'] = this.fixIp;
    data['disabled_ip_assigned'] = this.disabledIpAssigned;
    data['bind_mac_address'] = this.bindMacAddress;
    data['reset_mac_address'] = this.resetMacAddress;
    data['mac_address'] = this.macAddress;
    data['subscriber_since'] = this.subscriberSince;
    data['previous_balance_amount_cents'] = this.previousBalanceAmountCents;
    data['previous_balance_amount_currency'] =
        this.previousBalanceAmountCurrency;
    data['balance_amount_cents'] = this.balanceAmountCents;
    data['balance_amount_currency'] = this.balanceAmountCurrency;
    data['renewed_at'] = this.renewedAt;
    data['expires_at'] = this.expiresAt;
    data['advance_renewal'] = this.advanceRenewal;
    data['advance_renewal_package_id'] = this.advanceRenewalPackageId;
    data['advance_renewal_package_sale_id'] = this.advanceRenewalPackageSaleId;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zip'] = this.zip;
    data['phone1'] = this.phone1;
    data['phone2'] = this.phone2;
    data['mobile1'] = this.mobile1;
    data['mobile2'] = this.mobile2;
    data['email'] = this.email;
    data['gst_no'] = this.gstNo;
    data['last_login_at'] = this.lastLoginAt;
    data['online'] = this.online;
    data['mikrotik_username'] = this.mikrotikUsername;
    data['authenticated_by_radius_server_id'] =
        this.authenticatedByRadiusServerId;
    data['recalculate_usage'] = this.recalculateUsage;
    data['last_acctupdatetime'] = this.lastAcctupdatetime;
    data['acct_interim_interval'] = this.acctInterimInterval;
    data['bytes_uploaded_total'] = this.bytesUploadedTotal;
    data['bytes_downloaded_total'] = this.bytesDownloadedTotal;
    data['bytes_uploaded_total_during_time_slot'] =
        this.bytesUploadedTotalDuringTimeSlot;
    data['bytes_downloaded_total_during_time_slot'] =
        this.bytesDownloadedTotalDuringTimeSlot;
    data['bytes_uploaded_in_24_hours'] = this.bytesUploadedIn24Hours;
    data['bytes_downloaded_in_24_hours'] = this.bytesDownloadedIn24Hours;
    data['bytes_uploaded_in_24_hours_during_time_slot'] =
        this.bytesUploadedIn24HoursDuringTimeSlot;
    data['bytes_downloaded_in_24_hours_during_time_slot'] =
        this.bytesDownloadedIn24HoursDuringTimeSlot;
    data['bytes_uploaded_monthly'] = this.bytesUploadedMonthly;
    data['bytes_downloaded_monthly'] = this.bytesDownloadedMonthly;
    data['bytes_uploaded_monthly_during_time_slot'] =
        this.bytesUploadedMonthlyDuringTimeSlot;
    data['bytes_downloaded_monthly_during_time_slot'] =
        this.bytesDownloadedMonthlyDuringTimeSlot;
    data['bytes_uploaded_during_fup'] = this.bytesUploadedDuringFup;
    data['bytes_downloaded_during_fup'] = this.bytesDownloadedDuringFup;
    data['seconds_used_total'] = this.secondsUsedTotal;
    data['seconds_used_total_during_time_slot'] =
        this.secondsUsedTotalDuringTimeSlot;
    data['seconds_used_in_24_hours'] = this.secondsUsedIn24Hours;
    data['seconds_used_in_24_hours_during_time_slot'] =
        this.secondsUsedIn24HoursDuringTimeSlot;
    data['seconds_used_monthly'] = this.secondsUsedMonthly;
    data['seconds_used_monthly_during_time_slot'] =
        this.secondsUsedMonthlyDuringTimeSlot;
    data['data_topped_up_by'] = this.dataToppedUpBy;
    data['data_topped_up_by_unit'] = this.dataToppedUpByUnit;
    data['data_topped_up_by_in_bytes'] = this.dataToppedUpByInBytes;
    data['note'] = this.note;
    data['sidebar_collapse'] = this.sidebarCollapse;
    data['attack_logs'] = this.attackLogs;
    data['discount'] = this.discount;
    data['facebook_token'] = this.facebookToken;
    data['facebook_token_expires_at'] = this.facebookTokenExpiresAt;
    data['facebook_image_url'] = this.facebookImageUrl;
    data['facebook_uid'] = this.facebookUid;
    data['api_key'] = this.apiKey;
    if (this.preferences != null) {
      data['preferences'] = this.preferences!.toJson();
    }
    data['updated_from_ip'] = this.updatedFromIp;
    data['created_by_id'] = this.createdById;
    data['updated_by_id'] = this.updatedById;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class RegisteredThisMonth {
  int? id;
  int? locationId;
  int? subscriberid;
  String? accountNo;
  String? username;
  String? password;
  String? encryptedPassword;
  bool? stickyPassword;
  Null? resetPasswordToken;
  String? name;
  String? subscriberType;
  bool? hotspotSubscriber;
  Null? hotspotSignUpMethod;
  Null? mobileUsedForHotspotSignUp;
  CustomSignUpValues? customSignUpValues;
  bool? leasedLineSubscriber;
  String? previousStatus;
  String? status;
  bool? blocked;
  Null? reasonForStatus;
  Null? locationPackageId;
  Null? currentLocationPackageSaleId;
  bool? overridePackageBandwidth;
  Null? overriddenBandwidthUpload;
  Null? overriddenBandwidthUploadUnit;
  Null? overriddenBandwidthDownload;
  Null? overriddenBandwidthDownloadUnit;
  int? radUploadOverridenRateLimit;
  int? radDownloadOverridenRateLimit;
  Null? mikrotikOverriddenRateLimit;
  bool? autoRenew;
  int? autoRenewFor;
  Null? locationZoneId;
  Null? locationNodeId;
  Null? distanceFromNode;
  Null? locationIpPoolId;
  bool? fixIp;
  String? disabledIpAssigned;
  bool? bindMacAddress;
  bool? resetMacAddress;
  Null? macAddress;
  String? subscriberSince;
  int? previousBalanceAmountCents;
  String? previousBalanceAmountCurrency;
  int? balanceAmountCents;
  String? balanceAmountCurrency;
  Null? renewedAt;
  Null? expiresAt;
  bool? advanceRenewal;
  Null? advanceRenewalPackageId;
  Null? advanceRenewalPackageSaleId;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? country;
  String? zip;
  String? phone1;
  String? phone2;
  String? mobile1;
  String? mobile2;
  String? email;
  String? gstNo;
  Null? lastLoginAt;
  bool? online;
  Null? mikrotikUsername;
  Null? authenticatedByRadiusServerId;
  bool? recalculateUsage;
  Null? lastAcctupdatetime;
  int? acctInterimInterval;
  int? bytesUploadedTotal;
  int? bytesDownloadedTotal;
  int? bytesUploadedTotalDuringTimeSlot;
  int? bytesDownloadedTotalDuringTimeSlot;
  int? bytesUploadedIn24Hours;
  int? bytesDownloadedIn24Hours;
  int? bytesUploadedIn24HoursDuringTimeSlot;
  int? bytesDownloadedIn24HoursDuringTimeSlot;
  int? bytesUploadedMonthly;
  int? bytesDownloadedMonthly;
  int? bytesUploadedMonthlyDuringTimeSlot;
  int? bytesDownloadedMonthlyDuringTimeSlot;
  int? bytesUploadedDuringFup;
  int? bytesDownloadedDuringFup;
  int? secondsUsedTotal;
  int? secondsUsedTotalDuringTimeSlot;
  int? secondsUsedIn24Hours;
  int? secondsUsedIn24HoursDuringTimeSlot;
  int? secondsUsedMonthly;
  int? secondsUsedMonthlyDuringTimeSlot;
  int? dataToppedUpBy;
  String? dataToppedUpByUnit;
  int? dataToppedUpByInBytes;
  String? note;
  Null? sidebarCollapse;
  Null? attackLogs;
  String? discount;
  Null? facebookToken;
  Null? facebookTokenExpiresAt;
  Null? facebookImageUrl;
  Null? facebookUid;
  String? apiKey;
  CustomSignUpValues? preferences;
  String? updatedFromIp;
  int? createdById;
  int? updatedById;
  String? createdAt;
  String? updatedAt;

  RegisteredThisMonth(
      {this.id,
      this.locationId,
      this.subscriberid,
      this.accountNo,
      this.username,
      this.password,
      this.encryptedPassword,
      this.stickyPassword,
      this.resetPasswordToken,
      this.name,
      this.subscriberType,
      this.hotspotSubscriber,
      this.hotspotSignUpMethod,
      this.mobileUsedForHotspotSignUp,
      this.customSignUpValues,
      this.leasedLineSubscriber,
      this.previousStatus,
      this.status,
      this.blocked,
      this.reasonForStatus,
      this.locationPackageId,
      this.currentLocationPackageSaleId,
      this.overridePackageBandwidth,
      this.overriddenBandwidthUpload,
      this.overriddenBandwidthUploadUnit,
      this.overriddenBandwidthDownload,
      this.overriddenBandwidthDownloadUnit,
      this.radUploadOverridenRateLimit,
      this.radDownloadOverridenRateLimit,
      this.mikrotikOverriddenRateLimit,
      this.autoRenew,
      this.autoRenewFor,
      this.locationZoneId,
      this.locationNodeId,
      this.distanceFromNode,
      this.locationIpPoolId,
      this.fixIp,
      this.disabledIpAssigned,
      this.bindMacAddress,
      this.resetMacAddress,
      this.macAddress,
      this.subscriberSince,
      this.previousBalanceAmountCents,
      this.previousBalanceAmountCurrency,
      this.balanceAmountCents,
      this.balanceAmountCurrency,
      this.renewedAt,
      this.expiresAt,
      this.advanceRenewal,
      this.advanceRenewalPackageId,
      this.advanceRenewalPackageSaleId,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.country,
      this.zip,
      this.phone1,
      this.phone2,
      this.mobile1,
      this.mobile2,
      this.email,
      this.gstNo,
      this.lastLoginAt,
      this.online,
      this.mikrotikUsername,
      this.authenticatedByRadiusServerId,
      this.recalculateUsage,
      this.lastAcctupdatetime,
      this.acctInterimInterval,
      this.bytesUploadedTotal,
      this.bytesDownloadedTotal,
      this.bytesUploadedTotalDuringTimeSlot,
      this.bytesDownloadedTotalDuringTimeSlot,
      this.bytesUploadedIn24Hours,
      this.bytesDownloadedIn24Hours,
      this.bytesUploadedIn24HoursDuringTimeSlot,
      this.bytesDownloadedIn24HoursDuringTimeSlot,
      this.bytesUploadedMonthly,
      this.bytesDownloadedMonthly,
      this.bytesUploadedMonthlyDuringTimeSlot,
      this.bytesDownloadedMonthlyDuringTimeSlot,
      this.bytesUploadedDuringFup,
      this.bytesDownloadedDuringFup,
      this.secondsUsedTotal,
      this.secondsUsedTotalDuringTimeSlot,
      this.secondsUsedIn24Hours,
      this.secondsUsedIn24HoursDuringTimeSlot,
      this.secondsUsedMonthly,
      this.secondsUsedMonthlyDuringTimeSlot,
      this.dataToppedUpBy,
      this.dataToppedUpByUnit,
      this.dataToppedUpByInBytes,
      this.note,
      this.sidebarCollapse,
      this.attackLogs,
      this.discount,
      this.facebookToken,
      this.facebookTokenExpiresAt,
      this.facebookImageUrl,
      this.facebookUid,
      this.apiKey,
      this.preferences,
      this.updatedFromIp,
      this.createdById,
      this.updatedById,
      this.createdAt,
      this.updatedAt});

  RegisteredThisMonth.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locationId = json['location_id'];
    subscriberid = json['subscriberid'];
    accountNo = json['account_no'];
    username = json['username'];
    password = json['password'];
    encryptedPassword = json['encrypted_password'];
    stickyPassword = json['sticky_password'];
    resetPasswordToken = json['reset_password_token'];
    name = json['name'];
    subscriberType = json['subscriber_type'];
    hotspotSubscriber = json['hotspot_subscriber'];
    hotspotSignUpMethod = json['hotspot_sign_up_method'];
    mobileUsedForHotspotSignUp = json['mobile_used_for_hotspot_sign_up'];
    customSignUpValues = json['custom_sign_up_values'] != null
        ? new CustomSignUpValues.fromJson(json['custom_sign_up_values'])
        : null;
    leasedLineSubscriber = json['leased_line_subscriber'];
    previousStatus = json['previous_status'];
    status = json['status'];
    blocked = json['blocked'];
    reasonForStatus = json['reason_for_status'];
    locationPackageId = json['location_package_id'];
    currentLocationPackageSaleId = json['current_location_package_sale_id'];
    overridePackageBandwidth = json['override_package_bandwidth'];
    overriddenBandwidthUpload = json['overridden_bandwidth_upload'];
    overriddenBandwidthUploadUnit = json['overridden_bandwidth_upload_unit'];
    overriddenBandwidthDownload = json['overridden_bandwidth_download'];
    overriddenBandwidthDownloadUnit =
        json['overridden_bandwidth_download_unit'];
    radUploadOverridenRateLimit = json['rad_upload_overriden_rate_limit'];
    radDownloadOverridenRateLimit = json['rad_download_overriden_rate_limit'];
    mikrotikOverriddenRateLimit = json['mikrotik_overridden_rate_limit'];
    autoRenew = json['auto_renew'];
    autoRenewFor = json['auto_renew_for'];
    locationZoneId = json['location_zone_id'];
    locationNodeId = json['location_node_id'];
    distanceFromNode = json['distance_from_node'];
    locationIpPoolId = json['location_ip_pool_id'];
    fixIp = json['fix_ip'];
    disabledIpAssigned = json['disabled_ip_assigned'];
    bindMacAddress = json['bind_mac_address'];
    resetMacAddress = json['reset_mac_address'];
    macAddress = json['mac_address'];
    subscriberSince = json['subscriber_since'];
    previousBalanceAmountCents = json['previous_balance_amount_cents'];
    previousBalanceAmountCurrency = json['previous_balance_amount_currency'];
    balanceAmountCents = json['balance_amount_cents'];
    balanceAmountCurrency = json['balance_amount_currency'];
    renewedAt = json['renewed_at'];
    expiresAt = json['expires_at'];
    advanceRenewal = json['advance_renewal'];
    advanceRenewalPackageId = json['advance_renewal_package_id'];
    advanceRenewalPackageSaleId = json['advance_renewal_package_sale_id'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zip = json['zip'];
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    mobile1 = json['mobile1'];
    mobile2 = json['mobile2'];
    email = json['email'];
    gstNo = json['gst_no'];
    lastLoginAt = json['last_login_at'];
    online = json['online'];
    mikrotikUsername = json['mikrotik_username'];
    authenticatedByRadiusServerId = json['authenticated_by_radius_server_id'];
    recalculateUsage = json['recalculate_usage'];
    lastAcctupdatetime = json['last_acctupdatetime'];
    acctInterimInterval = json['acct_interim_interval'];
    bytesUploadedTotal = json['bytes_uploaded_total'];
    bytesDownloadedTotal = json['bytes_downloaded_total'];
    bytesUploadedTotalDuringTimeSlot =
        json['bytes_uploaded_total_during_time_slot'];
    bytesDownloadedTotalDuringTimeSlot =
        json['bytes_downloaded_total_during_time_slot'];
    bytesUploadedIn24Hours = json['bytes_uploaded_in_24_hours'];
    bytesDownloadedIn24Hours = json['bytes_downloaded_in_24_hours'];
    bytesUploadedIn24HoursDuringTimeSlot =
        json['bytes_uploaded_in_24_hours_during_time_slot'];
    bytesDownloadedIn24HoursDuringTimeSlot =
        json['bytes_downloaded_in_24_hours_during_time_slot'];
    bytesUploadedMonthly = json['bytes_uploaded_monthly'];
    bytesDownloadedMonthly = json['bytes_downloaded_monthly'];
    bytesUploadedMonthlyDuringTimeSlot =
        json['bytes_uploaded_monthly_during_time_slot'];
    bytesDownloadedMonthlyDuringTimeSlot =
        json['bytes_downloaded_monthly_during_time_slot'];
    bytesUploadedDuringFup = json['bytes_uploaded_during_fup'];
    bytesDownloadedDuringFup = json['bytes_downloaded_during_fup'];
    secondsUsedTotal = json['seconds_used_total'];
    secondsUsedTotalDuringTimeSlot =
        json['seconds_used_total_during_time_slot'];
    secondsUsedIn24Hours = json['seconds_used_in_24_hours'];
    secondsUsedIn24HoursDuringTimeSlot =
        json['seconds_used_in_24_hours_during_time_slot'];
    secondsUsedMonthly = json['seconds_used_monthly'];
    secondsUsedMonthlyDuringTimeSlot =
        json['seconds_used_monthly_during_time_slot'];
    dataToppedUpBy = json['data_topped_up_by'];
    dataToppedUpByUnit = json['data_topped_up_by_unit'];
    dataToppedUpByInBytes = json['data_topped_up_by_in_bytes'];
    note = json['note'];
    sidebarCollapse = json['sidebar_collapse'];
    attackLogs = json['attack_logs'];
    discount = json['discount'];
    facebookToken = json['facebook_token'];
    facebookTokenExpiresAt = json['facebook_token_expires_at'];
    facebookImageUrl = json['facebook_image_url'];
    facebookUid = json['facebook_uid'];
    apiKey = json['api_key'];
    preferences = json['preferences'] != null
        ? new CustomSignUpValues.fromJson(json['preferences'])
        : null;
    updatedFromIp = json['updated_from_ip'];
    createdById = json['created_by_id'];
    updatedById = json['updated_by_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['location_id'] = this.locationId;
    data['subscriberid'] = this.subscriberid;
    data['account_no'] = this.accountNo;
    data['username'] = this.username;
    data['password'] = this.password;
    data['encrypted_password'] = this.encryptedPassword;
    data['sticky_password'] = this.stickyPassword;
    data['reset_password_token'] = this.resetPasswordToken;
    data['name'] = this.name;
    data['subscriber_type'] = this.subscriberType;
    data['hotspot_subscriber'] = this.hotspotSubscriber;
    data['hotspot_sign_up_method'] = this.hotspotSignUpMethod;
    data['mobile_used_for_hotspot_sign_up'] = this.mobileUsedForHotspotSignUp;
    if (this.customSignUpValues != null) {
      data['custom_sign_up_values'] = this.customSignUpValues!.toJson();
    }
    data['leased_line_subscriber'] = this.leasedLineSubscriber;
    data['previous_status'] = this.previousStatus;
    data['status'] = this.status;
    data['blocked'] = this.blocked;
    data['reason_for_status'] = this.reasonForStatus;
    data['location_package_id'] = this.locationPackageId;
    data['current_location_package_sale_id'] =
        this.currentLocationPackageSaleId;
    data['override_package_bandwidth'] = this.overridePackageBandwidth;
    data['overridden_bandwidth_upload'] = this.overriddenBandwidthUpload;
    data['overridden_bandwidth_upload_unit'] =
        this.overriddenBandwidthUploadUnit;
    data['overridden_bandwidth_download'] = this.overriddenBandwidthDownload;
    data['overridden_bandwidth_download_unit'] =
        this.overriddenBandwidthDownloadUnit;
    data['rad_upload_overriden_rate_limit'] = this.radUploadOverridenRateLimit;
    data['rad_download_overriden_rate_limit'] =
        this.radDownloadOverridenRateLimit;
    data['mikrotik_overridden_rate_limit'] = this.mikrotikOverriddenRateLimit;
    data['auto_renew'] = this.autoRenew;
    data['auto_renew_for'] = this.autoRenewFor;
    data['location_zone_id'] = this.locationZoneId;
    data['location_node_id'] = this.locationNodeId;
    data['distance_from_node'] = this.distanceFromNode;
    data['location_ip_pool_id'] = this.locationIpPoolId;
    data['fix_ip'] = this.fixIp;
    data['disabled_ip_assigned'] = this.disabledIpAssigned;
    data['bind_mac_address'] = this.bindMacAddress;
    data['reset_mac_address'] = this.resetMacAddress;
    data['mac_address'] = this.macAddress;
    data['subscriber_since'] = this.subscriberSince;
    data['previous_balance_amount_cents'] = this.previousBalanceAmountCents;
    data['previous_balance_amount_currency'] =
        this.previousBalanceAmountCurrency;
    data['balance_amount_cents'] = this.balanceAmountCents;
    data['balance_amount_currency'] = this.balanceAmountCurrency;
    data['renewed_at'] = this.renewedAt;
    data['expires_at'] = this.expiresAt;
    data['advance_renewal'] = this.advanceRenewal;
    data['advance_renewal_package_id'] = this.advanceRenewalPackageId;
    data['advance_renewal_package_sale_id'] = this.advanceRenewalPackageSaleId;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zip'] = this.zip;
    data['phone1'] = this.phone1;
    data['phone2'] = this.phone2;
    data['mobile1'] = this.mobile1;
    data['mobile2'] = this.mobile2;
    data['email'] = this.email;
    data['gst_no'] = this.gstNo;
    data['last_login_at'] = this.lastLoginAt;
    data['online'] = this.online;
    data['mikrotik_username'] = this.mikrotikUsername;
    data['authenticated_by_radius_server_id'] =
        this.authenticatedByRadiusServerId;
    data['recalculate_usage'] = this.recalculateUsage;
    data['last_acctupdatetime'] = this.lastAcctupdatetime;
    data['acct_interim_interval'] = this.acctInterimInterval;
    data['bytes_uploaded_total'] = this.bytesUploadedTotal;
    data['bytes_downloaded_total'] = this.bytesDownloadedTotal;
    data['bytes_uploaded_total_during_time_slot'] =
        this.bytesUploadedTotalDuringTimeSlot;
    data['bytes_downloaded_total_during_time_slot'] =
        this.bytesDownloadedTotalDuringTimeSlot;
    data['bytes_uploaded_in_24_hours'] = this.bytesUploadedIn24Hours;
    data['bytes_downloaded_in_24_hours'] = this.bytesDownloadedIn24Hours;
    data['bytes_uploaded_in_24_hours_during_time_slot'] =
        this.bytesUploadedIn24HoursDuringTimeSlot;
    data['bytes_downloaded_in_24_hours_during_time_slot'] =
        this.bytesDownloadedIn24HoursDuringTimeSlot;
    data['bytes_uploaded_monthly'] = this.bytesUploadedMonthly;
    data['bytes_downloaded_monthly'] = this.bytesDownloadedMonthly;
    data['bytes_uploaded_monthly_during_time_slot'] =
        this.bytesUploadedMonthlyDuringTimeSlot;
    data['bytes_downloaded_monthly_during_time_slot'] =
        this.bytesDownloadedMonthlyDuringTimeSlot;
    data['bytes_uploaded_during_fup'] = this.bytesUploadedDuringFup;
    data['bytes_downloaded_during_fup'] = this.bytesDownloadedDuringFup;
    data['seconds_used_total'] = this.secondsUsedTotal;
    data['seconds_used_total_during_time_slot'] =
        this.secondsUsedTotalDuringTimeSlot;
    data['seconds_used_in_24_hours'] = this.secondsUsedIn24Hours;
    data['seconds_used_in_24_hours_during_time_slot'] =
        this.secondsUsedIn24HoursDuringTimeSlot;
    data['seconds_used_monthly'] = this.secondsUsedMonthly;
    data['seconds_used_monthly_during_time_slot'] =
        this.secondsUsedMonthlyDuringTimeSlot;
    data['data_topped_up_by'] = this.dataToppedUpBy;
    data['data_topped_up_by_unit'] = this.dataToppedUpByUnit;
    data['data_topped_up_by_in_bytes'] = this.dataToppedUpByInBytes;
    data['note'] = this.note;
    data['sidebar_collapse'] = this.sidebarCollapse;
    data['attack_logs'] = this.attackLogs;
    data['discount'] = this.discount;
    data['facebook_token'] = this.facebookToken;
    data['facebook_token_expires_at'] = this.facebookTokenExpiresAt;
    data['facebook_image_url'] = this.facebookImageUrl;
    data['facebook_uid'] = this.facebookUid;
    data['api_key'] = this.apiKey;
    if (this.preferences != null) {
      data['preferences'] = this.preferences!.toJson();
    }
    data['updated_from_ip'] = this.updatedFromIp;
    data['created_by_id'] = this.createdById;
    data['updated_by_id'] = this.updatedById;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CustomSignUpValues {
  CustomSignUpValues();

  CustomSignUpValues.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
