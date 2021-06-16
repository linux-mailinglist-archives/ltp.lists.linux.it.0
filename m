Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B61433A9372
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 09:00:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1A7343C7186
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 09:00:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 684753C2DCF
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 09:00:39 +0200 (CEST)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com
 [68.232.159.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 44F3D1A00F28
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 09:00:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1623826838; x=1655362838;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=s3oeohi8XvFYVFLi4WdTQfO4vGkdq/cVRHZ2UaQUNLE=;
 b=nPRyXjWbb+/xk3khZa91x+7D+jXO4+Li8T9+ixRHHdEPvzUMZmX6RTXi
 8mYvf4yUaMepIRofHktzgaAcUXlvXJ2GDCkI4QUv9SXTkCxXk27dspDR7
 7lHlasON64u9iZkflOyo3DjRItNYqigyJ+SH2md/xIqL0+sqHxBJqEUBD
 Eejri7QkWw69qWWIi7/nkqiOeU7wwyE6PLkPDv75zkDxiSrnhB6i3dxRM
 zNmqs2uvb2Evf2pk5GuBnu2IM+BbS2GyE10W9b3GteidNMhYyRh1RctHf
 IRtXi8cDfgJNGJzY4RMRkj9PRkHcEE1TNZVxrbQjeeskobQQrDOfiPnVd A==;
IronPort-SDR: Vhf2f2dmg3CNouo2mZP8C7Ph5FV7KEeariZukp7QyKotVF73q262mTFWej0lVpIjijakCDJomV
 U9LlikzPdCzIAmiVYLEwN/FglLBk0CwbPN+kcMWJHFUAZW48/RX+vg0ZIctAK6jzvsUXw5xrnO
 hVhk71mC3zI4XfIdPGnAYubgWrPT/P50zpN0UZUnvazpbKOcRTUCKb7Zgzsf2RuWGDAS5yO8/Z
 f1W7hO3XQ7kxwGFWZOhIhgc2vnrbvXhiiutjgIvjqFmOBXmpbzf7oscTKS+0NIZ58ZvEsBG6WD
 k3Q=
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="33206070"
X-IronPort-AV: E=Sophos;i="5.83,277,1616425200"; d="scan'208";a="33206070"
Received: from mail-os2jpn01lp2053.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 16:00:36 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9auOV6+iSkDRXqhlUhML5IsHAJ8IL5CibHxxw127TAl7rXOWN87cNayCGZdBcHrFaVafLjDlJfTk/AsP9SqiGWlUqfX+JroAFBoli0xzVYtaJQ7OvIwh1uHXV92HJNigfs1Lces4rMQtFG5HdBc47SKZ8wNzLapq+vjn6y4vaTpiATpsXIJARqOOTliziG9vIMgzCloA7V4OOM+HUEpzRK9/8jkOaJq6HT8vmfv1paqubG7z7HFsW8gnIsc3KzBu01VON3A8LASMvEKBU02JsLpJKXEDYDy894gM8GBfuXzTYvjmxtjzwzWUync+MuSPdYiyB8Conxkhwv40oIhyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3oeohi8XvFYVFLi4WdTQfO4vGkdq/cVRHZ2UaQUNLE=;
 b=goHFtwptINZZL/oc20s2qlFx6ejQv1qBjRBP6Ih70rwHmS13rKRY9JzhNjf9gLISP6JDZTTHeZ9Zxz4O0YfAkIc3dJS90K5lr62rnHA7NgR1EShzy8d1dIy1qAtXDbDOuPDg6iPYTwfz8ggeb9rH6vS9PfAkt8BbaSfmi+xQMaPnR/lxrdtisZBgOomJ4wQvdBky1oHyALxbJfHC2O/YBV6H7BM5wGCw1FvoQ4KR86kHDmR7U1S0wRlEtDpNhgDnSdo7p6Of/oiAVgZ/3GoaoYM7tfZAgxEIQQdKSLruDtavMBNaeVDwFHzFgIKOl8erWFDmh5YTeBHZ4Y8KTceGNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3oeohi8XvFYVFLi4WdTQfO4vGkdq/cVRHZ2UaQUNLE=;
 b=dJi6Wq2ebgk8KZ+65Dr2lic1ag7bhKB3DcUnR+dsmmFNudiIcNgKklcWY9MI4yLu/ERmVxqAgAJ8FMNWFiS4tYSVRZLiRyxjiboYXHqkjBdWFIR/FBblXD9sJjuvxpmiUkrk/Yefh5FTZpCJwYxx8Uxh/OcRpgW0awcX/0reeHE=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYCPR01MB6111.jpnprd01.prod.outlook.com (2603:1096:400:4c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Wed, 16 Jun
 2021 07:00:33 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4%9]) with mapi id 15.20.4242.016; Wed, 16 Jun 2021
 07:00:33 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH v2] syscalls/mallinfo2_01: Add a basic test for
 mallinfo2 when setting 2G size
Thread-Index: AQHXWF0GNZS5PAFZm0O61ADyeJSRTKsWR1gAgAACowA=
Date: Wed, 16 Jun 2021 07:00:33 +0000
Message-ID: <60C9A1A8.3060604@fujitsu.com>
References: <YKzX7FPWGGROn6kR@pevik>
 <1622713444-21197-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <YMmfcvWc+d6wkfX9@pevik>
In-Reply-To: <YMmfcvWc+d6wkfX9@pevik>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 720dc8f6-33ea-4494-5322-08d930946fd9
x-ms-traffictypediagnostic: TYCPR01MB6111:
x-microsoft-antispam-prvs: <TYCPR01MB611100E40BB444A0BD0F6ED9FD0F9@TYCPR01MB6111.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:415;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mUQ3J9S4dK5TCHpF5XfZFPv435Qc577CqK7Ko0W13ThYc9UV1Solf2Qc0EYk5pyk4ZasHIcK6BUyj0qkXlG7EIcc0sKD6Bl5/Q86bL+tWifmboiCGtpDq68/2z7xBjJRalxaaBKv12+/S/xgd/VdY6r8TKroXSzPxWmH0V0eu38tYEjD78lBs5tNbPYdmCZZ9xxEaJ1R+kFtJconORRMfBa/j7BpHiNn+VR8BG5G26hor1TgwB82qZWUwS4sVsKEROTc2nlhVWsV8yfOwVDEN1xiGNuVwlyo5dAg2KPd9RTZk1qz3Xg7bQUO0R8PnfVZ1itAKXgrzU/7bwngDA4voq58DOT0SJYdM9DUtL4/6Z6qv1Qxz5TQDb15cJPAvVkfPzbgI5wifuRSZCxTeKUSUzuImS+Ka+rTLh81JG/+JSQ+Zm4iIp9v2yEfXaLR6TJ7TyjdncANVYwhl8yLZwrc2BKMIKrDSeriKoTFOsNamjVbWLy4cfi4LBFJ25vNUnCamxboV7whweATTfmOeMqiPGUkXPSbOQh1dyKRgSGUnAXtGtNHOBDmwMJNogLiqA1ebceiQJRNAS1jSW+eusjwuY4qFZZxi29V8RqU34gSF1UNMHl0x5k5vSXNxqTk5xcVNlhZMB3zfI4WYdx5FUKFvA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(66556008)(8676002)(4326008)(66446008)(64756008)(66476007)(8936002)(85182001)(6486002)(91956017)(36756003)(2616005)(76116006)(87266011)(478600001)(2906002)(86362001)(66946007)(186003)(6916009)(6512007)(83380400001)(6506007)(26005)(316002)(5660300002)(71200400001)(122000001)(33656002)(38100700002)(2004002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?djhhVmt0b1R1RUdQRU5QTGRLbnBXeGdnMVFyTnR4eks0ZGh4SnZlUEN2M3E5?=
 =?gb2312?B?TVBpdE94N3MxSnh3Y0pVd3ErUjRqNWZ2U1dkQzl1THBuc2FwYlhPVDF1MFh1?=
 =?gb2312?B?WHhBNVdXdGpEWCtzNHl5UTZseXFZaGtvWjUyYzAzd0l1dTFCVC9UK0FGcEdM?=
 =?gb2312?B?Q3hIZ0J3d05BemppZFhNanhYSllnaUF0RTJKcDlkcnQyTHlacFlPeVhNbjRn?=
 =?gb2312?B?ZnhaU21YNXRJVUtaUDBuVDBJd0lxbWtDbzdRTnRSZ3hUL2huSUpNUjVHKzBL?=
 =?gb2312?B?RVhab2ZsVWMzN2M5VG11L0NEajA0TVlEZ29PY1NOL2M2ajMzN2wvMndHK2tj?=
 =?gb2312?B?ZDhLc3pSZExSUUU5dWQ5K0wzL09pTzB2WWpWUzZNUXN5c1l6ZkRIL0RkQkha?=
 =?gb2312?B?K1VuRXFDVVJoak84ckIrTVoxKzJBUzR6OVpHZmR6YmZVdG5xY0tCNHFvS3dn?=
 =?gb2312?B?b3RJZ0RkMUo3ckk3OGJuYnZwQTlxejE4WWJGdVBMVEpEYUFTRUFhc3Q2K05O?=
 =?gb2312?B?RzQrSi84Z3NzUWhmTmVqOWUwYUhuNE1NNlVwRTJKbU0weXlsWWhuT3FPSlR1?=
 =?gb2312?B?aWZWZjAwQnJ5LzdhaDhmbHZkK3lzQU83cFYzWnlCYSt3THlhcDlnaC9WbEJF?=
 =?gb2312?B?OUhQWDVXUHdrS0ptSWNoaXZZTEd4NEJGdW9iRjhlWE1BdUwzc2krVDlkem9L?=
 =?gb2312?B?Z2dQamVZaXgycnR4MEh5eXVMc0Uvb0Znd1EyVXJwdytFR01OR09iakdkWitU?=
 =?gb2312?B?Ym5IelpVM0tnV1JRRWpyU0Rqd21iS3ZzOGMxYU9CZzVpbEdEclNJQTdySm9r?=
 =?gb2312?B?Q0pHUmZlREh0dXNkWUR3d3gyQUU0cGVLenNZYXYwd2wxSXpsMVRPN1ZUOU9X?=
 =?gb2312?B?clNudGFxR0RMMkFZNWloZjllTitpVzJBM2xqZXdqdW5NSzJaQXVOMWFzeUZN?=
 =?gb2312?B?dWxkczE2S0xlaWFOT25RTE51MjQwcmxMeVlQUWFkRjltNFhlZU1UV2xvQlJY?=
 =?gb2312?B?MklVNnE3N2s3Y1VNZDh4YTFFWW5pZXFydC9ldytGNk9yTWVvN2pDUWVYcnN2?=
 =?gb2312?B?emw1MjVjVlpZclJOUi9GSzRBSzJhWDd1ZUZnOWpmUHJXMWQ0K0UxVjJjNE5S?=
 =?gb2312?B?M0tSWCtEZE95RXdmU2pHM0JNWHlmZ0NxWDIyemtUdnNZaVRwaStQK29JRy95?=
 =?gb2312?B?UnNmQnBZelJuQUlVRStjU1FYTWVtbkRnNC9IWnNaeFJtaE5lTXBLUDFxQUlL?=
 =?gb2312?B?ZFdjYWlyS3gxcVhYb3ByVGxqdVQ3b0MyaVh5VytKWTJPZlRsT3RMOHM0SHdT?=
 =?gb2312?B?RHJjeGpwdFBJV3N3SXdsMVpuWUxJbytlMHJYOVBPZnlPYlNPMlM5TVNZRHEy?=
 =?gb2312?B?U2dwVDd5bFg1RWx1ME5zbkNMbzkyK0xIV3FUM3U1bzBiNktBcUVMc2V2cWhJ?=
 =?gb2312?B?b1ZRRjJlSzk5RmlvLzdhUSs5SmRxazViVlAvQ2MwaW02MHhhRmxJUENmYXAw?=
 =?gb2312?B?bFFQOUVZcUwxOFpJM3F4QVZEUHpsL05CODhxNXZFcEZHR0JCT0NkaXBlblpC?=
 =?gb2312?B?QThhMGY0aFVaa0lZTnVDbUVud1NLZFIya3JNdU5WZWVDbDA2cnlIWnZUT3Bv?=
 =?gb2312?B?dzRhYnV1MUVid0xXc1hvdGxnMEMxdTg1RVAydVFlLzRBZU5nUzRGSkJzWFNB?=
 =?gb2312?B?MFFiTXZ5N2hFSmtPRS9yVWkxblMwMGVaYVdqTkk1T21PMWlHbHFVelRWUi9F?=
 =?gb2312?Q?2zoYUPXw7EIejxZFvmnmtrVinTwoGzzFz/QM2mZ?=
x-ms-exchange-transport-forked: True
Content-ID: <538DCE3A4E23CB40A37E7C0B09BA5BFC@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 720dc8f6-33ea-4494-5322-08d930946fd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2021 07:00:33.8705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CbpLpFnpnbRB13NYmw2/YkXyDZjPZ04v1I57pM7i8zHCSXYeAZNHa/PdZNj7jCllO6glO/u+B9fQRVR0VT8lGLtvqOxNCw1vj1pXcUWExRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6111
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/mallinfo2_01: Add a basic test for
 mallinfo2 when setting 2G size
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr
> Hi Xu,
>
> ...
>> +++ b/testcases/kernel/syscalls/mallinfo/mallinfo_common.h
>> @@ -1,5 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-or-later
>>   /*
>> + * Copyright (C) 2020 Free Software Foundation, Inc.
>>    * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
>>    * Author: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
>>    */
>> @@ -28,4 +29,22 @@ static inline void print_mallinfo(const char *msg, struct mallinfo *m)
>>   }
>>   #endif
>
>> +#ifdef HAVE_MALLINFO2
>> +static inline void print_mallinfo2(const char *msg, struct mallinfo2 *m)
>> +{
>> +	tst_res(TINFO, "%s...", msg);
> nit: I'd remove "..." and add extra space before #define (readability)
> And also change it on previously added print_mallinfo().
>
>> +#define P2(f) tst_res(TINFO, "%s: %ld", #f, m->f)
>> +	P2(arena);
>> +	P2(ordblks);
>> +	P2(smblks);
>> +	P2(hblks);
>> +	P2(hblkhd);
>> +	P2(usmblks);
>> +	P2(fsmblks);
>> +	P2(uordblks);
>> +	P2(fordblks);
>> +	P2(keepcost);
>> +}
>> +#endif
>
> ...
>> +++ b/testcases/kernel/syscalls/mallinfo2/mallinfo2_01.c
>> @@ -0,0 +1,46 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
>> + * Author: Yang Xu<xuyang2018.jy@fujitsu.com>
>> + */
>> +
>> +/*\
>> + * [DESCRIPTION]
>> + *
>> + * Basic mallinfo2() test.
>> + *
>> + * Test members of struct mallinfo2() whether overflow when setting 2G size.
> * Test hblkhd member of struct mallinfo2 whether overflow when setting 2G size.
>
>> + */
>> +
>> +#include "mallinfo_common.h"
>> +#include "tst_safe_macros.h"
>> +
>> +#ifdef HAVE_MALLINFO2
>> +
>> +void test_mallinfo2(void)
>> +{
>> +	struct mallinfo2 info;
>> +	char *buf;
>> +	size_t size = 2UL * 1024UL * 1024UL * 1024UL;
>> +
>> +	buf = malloc(size);
>> +	if (!buf) {
>> +		tst_res(TCONF, "Current system can not malloc 2G space, skip it");
>> +		return;
>> +	}
> Here could be just:
> 	if (!buf)
> 		tst_brk(TCONF, "Current system can not malloc 2G space, skip it");
>
>> +	info = mallinfo2();
>> +	if (info.hblkhd<  size) {
>> +		print_mallinfo2("Test malloc 2G",&info);
>> +		tst_brk(TFAIL, "The member of struct mallinfo2 overflow?");
> You don't free buf here.
>
> Maybe something like:
>
> 	if (info.hblkhd<  size) {
> 		print_mallinfo2("Test malloc 2G",&info);
> 		tst_res(TFAIL, "hblkhd member of struct mallinfo2 overflow?");
> 	} else {
> 		tst_res(TPASS, "hblkhd member of struct mallinfo2 doesn't overflow");
> 	}
>
> 	free(buf);
>
> If you're ok with it, no need to repost, I'll change it before merge.
I am ok with these changes. Thanks for your review.

Best Regards
Yang Xu
>
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
