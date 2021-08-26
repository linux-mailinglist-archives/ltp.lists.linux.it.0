Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F90E3F8206
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 07:26:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10D9F3C2E4D
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 07:26:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E0A633C2E39
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 07:26:11 +0200 (CEST)
Received: from esa6.fujitsucc.c3s2.iphmx.com (esa6.fujitsucc.c3s2.iphmx.com
 [68.232.159.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5EC80600E56
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 07:26:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1629955571; x=1661491571; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=6Ib1m8WG2VDiWEGvdfZlEE4geHpNbMgrQuJ5R3UY+xg=;
 b=l5NI3JSyWPl6tFWgu6PN/ogOLVPI7QLWYSWH0vGk6EMy0bSxrAsEAzD3
 wY1cYEzoiWjaKcfBPtNUc27bEoxqiLn8kx0JdsOF72tKfDG/HQgsxBvkS
 WAtoswTuSoOApHUQrAxCheHkH6TVK4XfHsBXGM7SmaBmWcuKhPEWkB5ac
 7sDLE+f4geu81XugmpcbEl8ech57XsYy7itGo2dxjtVWfm56dj0mUnF/X
 RzGf455m5Y3BWcBPCMqViqQd3VnRFymkxSBggsBitOs1PbReV8cS9QkrL
 AHXL1eq/K/C3JAmCO5bCMJrE5UVyZXPDFAe7PTdVYIGEHVa4Uu4BuEhDe A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="37834546"
X-IronPort-AV: E=Sophos;i="5.84,352,1620658800"; d="scan'208";a="37834546"
Received: from mail-os2jpn01lp2051.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 14:26:08 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L43PKfhhLTk64bTau6TMjXx3NW9sUhHx8Bp1sapie4M8k4ADme7KMrKrGC8U2loqvKFYt13rTbEEIRS48prycinFYDCDPzcBfePGrRN5Omj5DO0t1UL/CQroGZ20VEkBSBT1a+sMU5angCLOJyUNwCPSvIzzUYdNaPwljQTj2kIR59ht7lvKUX1kxFgHOfUp4cXu0o3gjb+vQ6t2xg53WRWDc2k2TFUUVRWe0+6SK6YjZtGM9yZuPxwXdJ3xMwQWLWHEUJk7rkuNphtONBVeG3Pkau9OM2/k3oz92fh2CSp0FJalHnQPdkz5/gdU08a/qe2luzHAqImgUxJd1eG0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ib1m8WG2VDiWEGvdfZlEE4geHpNbMgrQuJ5R3UY+xg=;
 b=UoXZzgbL1rkSSleo/3bDH5s0aGBbQM3bCX4m9/drrI/FFLfjOl8t7BGvsKjL3eFTyWeWATI6MEQDY5m0Piq2lsvp55EYj5LxZxlSKh05vAmF9DgalhbtbhD16b+v7EJ1MTYy8EdrgRgtMIfn1uYip1HRZmaaktfwXIhBPVs7+2UXGNGCzpZex9MBHxQEIFHGTQCJMdueLhQhdpPVzQc+HUh5IW6QB22JDtcL1KZHTgsTI/9mPPdQPLRxI3j7pxjLiLSxBGb3DIbOFP2B/K01NC/AsMdsDIVo4EdQNCvgeGONHgPieJlRBSXKowZpPzCfMUeHj/7CKNBavEksiSLdZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ib1m8WG2VDiWEGvdfZlEE4geHpNbMgrQuJ5R3UY+xg=;
 b=pWXUq2tEfrzxn6bvp6VCccy5c+upi0dkPG75ONzeUGQVrTb3HITOTSga41IX1xDZUaBZzApjHq1t/decX3oSXXZQaPi4K80edSXqPF/dY6jAr+iZMMnPn1QSGa++XJXkcxFZL6Zkp1+TWanAev8FM+/D72Ph+3DWqS0VJTk98Q4=
Received: from TY2PR01MB2124.jpnprd01.prod.outlook.com (2603:1096:404:e::16)
 by TYCPR01MB6141.jpnprd01.prod.outlook.com (2603:1096:400:4f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Thu, 26 Aug
 2021 05:26:05 +0000
Received: from TY2PR01MB2124.jpnprd01.prod.outlook.com
 ([fe80::3072:a985:1d9a:3d9d]) by TY2PR01MB2124.jpnprd01.prod.outlook.com
 ([fe80::3072:a985:1d9a:3d9d%3]) with mapi id 15.20.4436.025; Thu, 26 Aug 2021
 05:26:05 +0000
From: "suy.fnst@fujitsu.com" <suy.fnst@fujitsu.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [LTP][PATCH] network/mpls: sleep 1 after setup in mpls02
Thread-Index: AQHXmjqoRPxRTkGhMUuSdnPBKziSUw==
Date: Thu, 26 Aug 2021 05:26:05 +0000
Message-ID: <TY2PR01MB212429263FC238F44A2C1D7D89C79@TY2PR01MB2124.jpnprd01.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none; lists.linux.it; dmarc=none action=none header.from=fujitsu.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d145226c-59e1-4f04-d17c-08d96852008e
x-ms-traffictypediagnostic: TYCPR01MB6141:
x-microsoft-antispam-prvs: <TYCPR01MB6141BA4621CF6AF8A3CDFEAC89C79@TYCPR01MB6141.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AKpQSYS0BpIg8gpfggxwoX+C52d2ynptzaLyFw3+lzFQFnRNOq8j8uLbUBb+BvQe8xa3grpK2ZjHw49KnSOzH5g1LToux9ZfJocid3msNFSOi5Mwkih7xyJHy992w90jmYxh4rcpHBYIVftTllqwYgnO2BmEFc3CePCNa+eBo5rss4cgOEhvp61Rhh2knG/P0b1gacjo5h5uPCLQqDz8qJVwyxAQCc/pmXtuYR06p2S6jqLRzZ8BqPTaZlqKsxbkWjjDLz+BbmooDfvUL/2JnrKtG0Rs4KebDxRYyX+rfzALmOGPcRUcnTzbjxX8KIKVmSWQIRNuzBg5iNGiINeDnRx+iHBJzcX3NlCm1JCju2HKbZJAn4FiPJmFDpKKDAyWGDh43FrROZuvglELBobsD6fDELPXgG1XiAIsrrKs1iy8FMjcoGhAPpBmiNOlnW83p/kpeu7fXxkZwAIA9HM0g4ztF42XYj9C8jNa424Bs1jNdVG1qyzAnk+3QWukfKQpLdKzbeVppgK+KBfCC2mzUdmFskssv+Puf0zgVK/CVGlPcvmwVaske0MJdzTF5a/jr1/CdHhnf7LTGm7ffK/RQzQr/6jItauFxNSIBzTmxBxvfJODjgS48QxOeJ8GyljE/yTHFFdJkyDxx0zjbCa3kLoP96pd8lH3neOp1M8+m6idHp8T1aFFStVD/T+gfynErG8lJsopWVz/XgvMBKb1pw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB2124.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(91956017)(86362001)(76116006)(66946007)(6916009)(316002)(8676002)(66476007)(66556008)(64756008)(66446008)(52536014)(38100700002)(2906002)(38070700005)(122000001)(26005)(9686003)(186003)(5660300002)(478600001)(7696005)(33656002)(6506007)(8936002)(71200400001)(55016002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?MWc1VjZzelZoQVAyRDJkODJ4RzVXc2RnUG0wTE9mbFpqMVdZQU1FT2tKUzNv?=
 =?gb2312?B?U2FwcFZ3RXl4K1dGNEc2a1RLQ1RYZ291b1p6eGsxb012Vy93TnNhODRJaXY5?=
 =?gb2312?B?VnJvR29GS3c3SnlGQVBqKy9MUjlYdTdDNXN3SG5ZQnlVcFIxNkdzNmJnMXpH?=
 =?gb2312?B?TWVRMHpuWVZDUERNVGJJZU9jYWY2OTlJRVlvL1orQlBpcE9jNzRUU3FFUnV5?=
 =?gb2312?B?VHA5MVpZR1pSZkxZRE5NWjJjaitYcE9UenAyNmViRGx3T0Fscko3bmRMRjZM?=
 =?gb2312?B?b3VHVXRjeEZCNy96cGJua3I4UUwrSEZtZ2N3ZW9SYzN5bWR4WjZCY1J2NTRp?=
 =?gb2312?B?NWM4SDNQbFR2MFhLMjdNMFJVV3lTTjVYUkFIdlNhdG5CRmpFanZ0ZW1FVUVY?=
 =?gb2312?B?VTRTS3pkaHY2N3dYZjQ1K0laMDg2eGlzWXlpb09obTBuZE1MbTMwQkJ4QjZI?=
 =?gb2312?B?anVZUERycGU2UHFsL2NkdzBtMjhrMnpDUW1JMk4rcFVtUERBOE0raEk4R25C?=
 =?gb2312?B?TUxBWmo4UW9tRWpUekQvQ3JPT2JUd0FneE9nVnN6eU1ONnZzbVE3TlNOdWZR?=
 =?gb2312?B?QkJHNXFLazJQWjd4YXFnMTNrNUNTTy9sL05ndGZJQUFNTEt6MjFrNUlJcWpv?=
 =?gb2312?B?ZWpHbXN2UzBDSFJKZXQrYXI4czVkWmRKczB6eFhwcnp2ei9mdHFoM2pUNGZG?=
 =?gb2312?B?bzRBbEdpMUNidnBBSUZZQ1dnY1ZYNGpVamk4WVRybjJWRTFzVUhRN3dGV2hx?=
 =?gb2312?B?UFI1ak12b0NWelRYTmhVYjYwUTJ3QW9pQTA4N21YT1QzNkNnL25lQlMvWmF6?=
 =?gb2312?B?L2o4SURKM2VCZlVKeFJPZENJdGRnNnlRNE9MOFNiMTBCOVZHM1J0bVUvVjBT?=
 =?gb2312?B?RDR4RjY1MTRzWThNSTRHdUlzeElWeWZ3bkVNcGE0dFhTbWI1NFByR2pIdjRq?=
 =?gb2312?B?dnI3SkQ5dGxaN253SVJIUXFWSEdDY0YrdHNPZ21DVXZwbjdhRkZJNVIxSUNQ?=
 =?gb2312?B?dXNvRWFEV0lIUVNZUm1RSmNidE0zc1RuTjhWbGhWNTFBdnBhdnhZN0wyRjlR?=
 =?gb2312?B?VVJ4aUtwYXZwa29CRVFCbU4zUC9ycldQTWV4eUlZMWh0OXpuWVpnaGF3bjZi?=
 =?gb2312?B?bmNock1iS2lKMFN3SlZBaGxzb0E1cWxGT3F6WGVscXJCa2V4aXYydWNWT05Q?=
 =?gb2312?B?UXhDd1NXY3YzemJtUzZJd0lBNGgxVk14Q0VZOXJYdFc5Ukwyc0FjZWt0Mk5R?=
 =?gb2312?B?amwvbE5tRjZrWGJhUW9jVlpVeGtZanVCa3pMQnI3OFdzVC84MWxQRkJiMFR4?=
 =?gb2312?B?REMrcER2TFQwZ3hQdmxJRGJ4d21ybFFSaHVqZkE2T2o1T2FPV0ZER2xFUk9E?=
 =?gb2312?B?ZUEvZ2VnejBEUmVZRldHVDYwampkN2hIQzZhdUxpWk96dVhEVitYS2pLQjh4?=
 =?gb2312?B?bVd0V21MQ29SQ3EvRlZPY3RnRHNnWDNBcmdZQ1BHbEhwOVB6cGdWeWFjcDVt?=
 =?gb2312?B?eHh6U1crY25FWTVrcWdxeHFTVUhWc2xrTGJLRzJqS3BWaGIyZVZVQXAzdmxC?=
 =?gb2312?B?SksxUU8zY0NoaHYvVjRybmxIaXVZZ05Mb0N2a0hsVlNKQWwrRlpDemUxVTVW?=
 =?gb2312?B?NzRLcUxwVUt5VnJPOTdyZjZrRFd0MjJ5UlI4NDd0MzRBUkh1em45M3JydUs5?=
 =?gb2312?B?Y0E0YnpLL25WdHd1akEyRkV5cG1qM0lJa1lnZTUvN3RxTUI1emJaVkdreVB0?=
 =?gb2312?Q?fPliRVvydMJ0pqa68HXpOBScbFmDVAayQVs0cut?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2124.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d145226c-59e1-4f04-d17c-08d96852008e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2021 05:26:05.4563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /SfpHGjRrUVjcPmriD+OMCq/U8KS6JrFceKpbkVWJrOVTsmqPmtLZSkyHQfxmT0nDEnuWb+ZXyr03dvDNKYc8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6141
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] network/mpls: sleep 1 after setup in mpls02
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

While running mpls02.sh -6 in our slow test box with kernel
version > v5.11, we found the test hangs at ping6 occasionally:

  + grep -q 'invalid option'
  + for size in ${msg_sizes:-"56"}
  + EXPECT_PASS ping6 -I fd00:23::2 -c 500 -s 10 -f fd00:23::1
  '>/dev/null'
  + _tst_expect_pass tst_res ping6 -I fd00:23::2 -c 500 -s 10 -f
  fd00:23::1 '>/dev/null'
  + local fnc=tst_res
  + shift
  + tst_rod ping6 -I fd00:23::2 -c 500 -s 10 -f fd00:23::1 '>/dev/null'

The weird part is that manual ping6 works in the meantime.

Then we found that adding `sleep 1` at end of mpls02.sh/setup() make
the test pass in 100%. Dig depper in the problem, ftrace catched during
the 1 second shows (The test started at [ 3979.485488]):

 3981.210701 |   2) kworker-24742  |               |  addrconf_dad_work() {
 3981.210712 |   2) kworker-24742  |               |    addrconf_dad_completed() {
 3981.210712 |   2) kworker-24742  |   0.417 us    |      addrconf_del_dad_work();
 3981.210713 |   2) kworker-24742  |               |      __ipv6_ifa_notify() {
 3981.210716 |   2) kworker-24742  |   1.097 us    |        inet6_fill_ifaddr();
 3981.210730 |   2) kworker-24742  |               |        ip6_ins_rt() {
 3981.210731 |   2) kworker-24742  |               |          fib6_add() {

In kernel, addrconf_dad_work() is delegated by inet6_addr_add() to do
route related jobs in a delayed workqueue . Hence, there is tiny period
we need to wait for it. Adding the `sleep 1` seems suffcient for now.

Signed-off-by: Su Yue <suy.fnst@fujitsu.com>
---
 testcases/network/mpls/mpls02.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/network/mpls/mpls02.sh b/testcases/network/mpls/mpls02.sh
index 2fd3ec5bf4ba..75f5fca32f9a 100755
--- a/testcases/network/mpls/mpls02.sh
+++ b/testcases/network/mpls/mpls02.sh
@@ -35,6 +35,8 @@ setup()
 	tst_rhost_run -s -c "ip addr add $ip_rmt/$mask dev lo"
 	tst_rhost_run -s -c "ip route add $ip_loc/$mask encap mpls 60 via inet$TST_IPV6 $(tst_ipaddr)"
 	tst_rhost_run -s -c "ip -f mpls route add 50 dev lo"
+
+	sleep 1
 }
 
 do_test()
-- 
2.30.1 (Apple Git-130)


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
