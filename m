Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A983CB062
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 03:23:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED3A23C8626
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 03:23:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E9F433C65E2
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 03:23:09 +0200 (CEST)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com
 [68.232.159.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 57A616005F8
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 03:23:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1626398589; x=1657934589;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Yy+Ly6wVEaTlULk2yDCduKLdQ4MpsVLlQo0xphJ5ZmI=;
 b=aRQ29mIa80EiROHObFF2mERx+1dLESah9S4IWijJU30dFf5sDgMRHaeA
 vJzYkCNvJGuH7cq49Mo5frtu3eOPOUVcfe4r1pN/pjlupcAeA+Yh3ZZ+d
 OW/k9Ly+uvR/qvieGzzArBABf08UmEX0xST+38Qi8K3X0QqTj8BSScWDn
 i9v7/4ZIn+SUDbXaxeL8KP+wH4L3ujHVOnCSpkt1rRP8NaAYBhCT+5rD5
 xvZvnhUkXTEMUZKYg8aBh6dlrWalYrDvoj3c5kHnwDtCDo6LWN0R0LZtu
 1P8Y4MKh/jaJB0dBP2hGzWhnpSJ+qDOEpwHmRdA22ucrSBfJgyFb8oVmV A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="35063859"
X-IronPort-AV: E=Sophos;i="5.84,243,1620658800"; d="scan'208";a="35063859"
Received: from mail-os2jpn01lp2057.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 10:23:04 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdh73Z3kmkHLGolVMvXfWnwHDPIaBC+Zw8WAoAus+oGLf5dagtiNeboSVbhwh3MeqSjbt1OsdcvzVQ9ivh2fz7viRQTiViuoB6LC3CNB1MwkArmA6A/N0vKNs3us4GNGy7m7sVK4xgg8AHxqdb63FVtFOHghZ0L5kP0iSMgZ1OeHJ86gLtz79MnCfG8A1jUpfrPBSzO47oGKz+6yADLKR/yMJ5LKXuTIuy/d+gp+h9gjbLcIvWcg+Iu7cFfG+56Wt+pcn4mvMUbDsZHDKUeTPNDo/AP4sOnb3CEgWksxUJpYMb/MTlntjbd1Ljr7iZh2TqU855YqhwJ1PWoT4Nigeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yy+Ly6wVEaTlULk2yDCduKLdQ4MpsVLlQo0xphJ5ZmI=;
 b=XrK4J3bqhfb/luVhELBYyId2992KFxz/wVMf2z22Krw8YYvgYkLyK+EwijYoph/IWYY0ZI/DcZzff/FqqO8betNnwHIcjNpDPcYXnP4zwaahrCF781XKI3wO6Bv2K6osLw0ILgXkSq2S1sOkh6QpHRwK9YFLlT5cp35/o2HzWRSc2qPKeVfSRTF6ojXyv1dgA7/8XfOd2+M+K/S4XRFNsghrFbJToXKdjcSX/n4VGeuV0Fwn97WSOht8FA1Cp8co0TtPXwVCrwn8bbMm1YPy5yqjQ2OA0kZ1Wj4UGNOiARUVZY017/+ydi/yjATPh3Y/+X0KVZMuOpgY6hEOQB2xNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yy+Ly6wVEaTlULk2yDCduKLdQ4MpsVLlQo0xphJ5ZmI=;
 b=CH/mNo4pXmDKxjhBANRBfMkE9eaNq4wcQBwXbXn0fIWp51c6U4lOlMIMjuAtbyLBHNJhdrfItxxIi1lKuNjIrrCGBH/lazjU1iiaCphkQo8t/TCTdBh2C1gstI0uFLGWG6UTG9KBE/tltWRGHVWjRFyaelQ5AZj8p3rxoMONVBY=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB6283.jpnprd01.prod.outlook.com (2603:1096:400:84::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 01:23:01 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4331.025; Fri, 16 Jul 2021
 01:23:01 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Leo Liang <ycliang@andestech.com>
Thread-Topic: [LTP][PATCH v2, 1/2] lib/tst_test.sh: Make tst_umount work with
 argument that
Thread-Index: AQHXeYU71yOKGmHDEEiGkF929mHYPatEz0gA
Date: Fri, 16 Jul 2021 01:23:01 +0000
Message-ID: <60F0DF88.9020603@fujitsu.com>
References: <20210715142448.GA30641@atcfdc88>
In-Reply-To: <20210715142448.GA30641@atcfdc88>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: andestech.com; dkim=none (message not signed)
 header.d=none;andestech.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00591b68-fbe4-4dda-a6b4-08d947f8409f
x-ms-traffictypediagnostic: TYAPR01MB6283:
x-microsoft-antispam-prvs: <TYAPR01MB6283493D8C7E90F44B3443E8FD119@TYAPR01MB6283.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0SaUXxMnWYFMwXL4nlqS+tL+fw+xnycvRJueonGLLLXcYfZ9VKKZZDaNTgw+wkvZlNg+I1C9xDYpt8KN6mgOpXkOzIZ4pB4my5z+Ly2jzuaoCbqhPhodVHTMxVnSCQI2x0xsiabbV5nsCS37/bVpimWzvu3kIeJ3RU8uKeu/vB2c76rak0wFEH6KqBCw2FeClXf694jBwqCPZOYyIxUWGf4itJrJHhtbP3Hvcn+RKQqXANzjUKryaKGzNhPB04of7nTNimnGEHhXOXlulpIu9Zosm4WSRL+vJqTXYavq9uBVH6+Gd6uVNTLpgEvBLaSmfYxLM/88fG6/8QhSECvV+ZF7Fu6HMBLYdlS7kHIr8iFOTpmjDi5jKq+tGue/xsT8dm2Ab4moRJun0OLUg4N0B/3eKg67NWj4HB7EC69Dp5q84ay7Ky3bm8sZLeforSplyngq9vEY5nJliRFbl++Qow87+WNDy9kA74VMDTpoIYKhgPbx2ejC2NbOA1diqOt+Uti4jv5zUXMS+R2PzD5jFDVRE/JsO3y1U1GLPZ3YwfpDhnUTV7OkfWtCfE4curiBEimIU+45tEcbEigRJKP5T2fR2zx1+M2F3k1x0Vy2B++yWkxQnm8wGkfoEiU2Pp0vDAYnWh/eNU3WuWQ0oPbCdhvhLDfWEZ70hBszGq6gv9EC0TAZ7/fi/PiD8ftm72MBGGaPIh1BgJdDYg+OIwG+s4qZto9KJaVSYOuZ4KHmsxQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(86362001)(91956017)(26005)(66556008)(64756008)(87266011)(36756003)(71200400001)(66446008)(66476007)(66946007)(186003)(83380400001)(2906002)(4326008)(6506007)(8936002)(54906003)(85182001)(478600001)(76116006)(33656002)(38100700002)(2616005)(122000001)(6486002)(6916009)(316002)(8676002)(6512007)(5660300002)(21314003)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?VEFmWnF4dFBqWHNEWlllb3ZINm9menpMaHJZc0E2bVZpOTRqTEQzZmFLL1Vy?=
 =?gb2312?B?b1hQUTBkdHltTStuV0drbHVaUmZLN3NyQW55UHd2UkZieG44dHBPZDRXZGhC?=
 =?gb2312?B?QVhWaHZQR2xVKzZqOHp3M2ZZY3FWcE8zL2hBVExRQlZqenc5R2UxeGJBMFIw?=
 =?gb2312?B?bXBUekxSVW16OU52d2RBRG1TWEFFeTF3cUlPeGpWK1p2bys5eW9VYzcrekxZ?=
 =?gb2312?B?ek1tSEx0R2pJL3ZxbnNqcE13YWEyTHNnWm9FaUw4NURGTlhnU1U4bXVkak5m?=
 =?gb2312?B?Szk0Mlp3R01Ybys2VnUzaTU5U25rSHFpOVhFUXkwekJzUUUrc3VidmFrazJn?=
 =?gb2312?B?M0pEQk4rUUhPUXRwUHJnaklTejRsVlg0MHc0cjFIUGdIc1doVlBreFlad29l?=
 =?gb2312?B?ZVVNc2NFVG4vVnFNVUdHamR3M0dnMkIweXZCdVJZTDIzMnkwQ3ZQRVJDOFpR?=
 =?gb2312?B?d3lUVGp2NHJWNTZ6YTBnUjRhWTBleWl4S21xSXBMa1VJcEFYTVdCakg1clVK?=
 =?gb2312?B?d3VoWGUyMTQzK2dkUFdjNENoQ2tjZFFHTDhLSG44emdGaVlrSlk1N2NvWFZy?=
 =?gb2312?B?M3BoQVM3OCsxL3Yyb1pwV0tCMmpvZGpiWXRPbitLMG4yMFFtY3B1ZlRVYzJo?=
 =?gb2312?B?VURnZTJMK3BMc01aTGFBVWx5SG16MVZiWEdPQkd4N2FzZ2dQV2orS1p5alJs?=
 =?gb2312?B?TzFkOWVFK2FiSi9ONmFSbzRSaDRrdjBOOGkwZjlSSzB4Ui9yWGErSXU4dXFj?=
 =?gb2312?B?WWplQVU2WEpWS1cvak9sbHlBWisxYVp2NnZaR3YvRGNiU3dNTWRBSWh0UHFs?=
 =?gb2312?B?R1FrNE84NlBPSUtZUzRKanFvSm5LZFdhRXZKN2hEUS9BTWltUG8xWjl1c1ds?=
 =?gb2312?B?RWVuMlh5R3lsSUdLcFEzMmExci9GY2k4NjdSWEZUdGtlcXk0aDdyL2pjWEh1?=
 =?gb2312?B?NzVWWEpzV2JUZk5ieVg5MC81OU05QWZZU0djbGN6THEyNzZVakpZek5xZjhq?=
 =?gb2312?B?eWZseEExbkRwSjE4cFR1SUg3eWdDUWJDSUUzdmJVMytEY3ZLVVY2ZlNMUVEx?=
 =?gb2312?B?U1ZJOWJwUlA4d1FkakVaZUpIVmVCbGxMOHlqMG9vN0hTM3JRL2RsTWpBN1ZS?=
 =?gb2312?B?MzMzWi9CMzBNcVlwS2YwbllrbzFKZ2tlempsQ0VSbFdGcVJDdzhiY0NPcGpB?=
 =?gb2312?B?bUZtV3Q0a3JkZ1RONXlMYjdPSW9uSnZRR25kdlhJZk5DcWowK2Z1azNpR0hJ?=
 =?gb2312?B?U3FFN016VVphNXNmdytDcXVXTnQzNW91eTc1eVZZRS9BdjBLdVo1blZoWjFS?=
 =?gb2312?B?RjZRaTlKeklwcHZObTZnNGlMdnQxQyswSVptYkZwN1NWRjNvRXlKTGtkTFFS?=
 =?gb2312?B?THozcDJsUzNsVjJJNTRLdTZtd3hQdlJ3dUt3emRCUUY3QVA5OWlMZGNSdk1n?=
 =?gb2312?B?NzQ3NEFNbmY5OWkzRHJlY2lMU2FwTDhJdWxmSnVGOUlZcUcra00zQm5nbkFQ?=
 =?gb2312?B?Sm0xTUtrb2VlRkR0ZVFSVk1OVkl5bFBnOXNoNUxQeTZCcXY5UTJ3bzNZbWRX?=
 =?gb2312?B?MmErckdSQnZUMmxRcW1aSVJFZ3U5WkVSSDV2a3JtZCsvVkJIQ1IyTTBTK0p0?=
 =?gb2312?B?MXNtN0pnbzZEWDJaZUhqbkFGakhOZ0NGeDh4Wlo5TUEvSkU2cmdFV21wSHUv?=
 =?gb2312?B?Sktna0toNDRFb2dPOFZ3VEV5S0NlTlpJSXg3WDlVKzlZd0Eyd2JNZlA3RitI?=
 =?gb2312?Q?QlHoU0kO+2U53W9TxbQ7kLk8O03THSIG7zY9kB5?=
x-ms-exchange-transport-forked: True
Content-ID: <A499305CC7B61F489375F8BCF2A4E0EE@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00591b68-fbe4-4dda-a6b4-08d947f8409f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2021 01:23:01.0734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s4LNwnbm12e0WrEFmBsJVApsMLVpTwan6i3E2vDG16ndFWVsHD6gf8mOZwnfrE9QsEaqhkDAMLFf2KtkamCF/DjaYjBO5O38SzwuAl53j9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6283
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2,
 1/2] lib/tst_test.sh: Make tst_umount work with argument that
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
Cc: "richiejp@f-m.fm" <richiejp@f-m.fm>,
 "alankao@andestech.com" <alankao@andestech.com>, "metan@ucw.cz" <metan@ucw.cz>,
 "ycliang@cs.nctu.edu.tw" <ycliang@cs.nctu.edu.tw>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Leo
> /proc/mounts shows the mount point without terminating slashes, e.g.
> ~ $ cat /proc/mounts
> xxx /root/cgroup cgroup rw,relatime,cpu 0 0
>
> So current tst_umount would not work with argument that has terminating slash, e.g.
> tst_umount cgroup/ would give "The device is not mounted".
>
> Fix this by using mountpoint command instead of grepping /proc/mounts.
>
> Signed-off-by: Leo Yu-Chi Liang<ycliang@andestech.com>
> ---
>   testcases/lib/tst_test.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index c6aa2c487..7e77711f1 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -282,7 +282,7 @@ tst_umount()
>
>   	[ -z "$device" ]&&  return
>
> -	if ! grep -q "$device" /proc/mounts; then
> +	if ! mountpoint -q "$device"; then
Honestly speaking, I don't want to introduce mountpoint command.
we can just filter the last "/" string for $device.

Best Regards
Yang Xu
>   		tst_res TINFO "The $device is not mounted, skipping umount"
>   		return
>   	fi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
