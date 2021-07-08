Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F993BF445
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 05:20:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 377213C9545
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 05:20:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CE7573C4DBA
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 05:20:07 +0200 (CEST)
Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com
 [68.232.159.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 697C77CEC88
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 05:20:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1625714406; x=1657250406;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HJDoNiXlxemYwx6sS0P5y4vyBXU8jiJtuYAa//fr2Oc=;
 b=gu0VfWjCY7yMX19fBC3fDPIfyptIGxTH57VMZnCkWfIRYf1pv+vPjPFi
 V1vvbcme5TSc4wD10vCyTyYfX3akALGNaC0c7oD024HYvNoTgWbMJgGee
 WHituoVH5Rnp/Ybpw8I+c545d0UjweHei/dny5bdryH7J8TRWW73dd+/P
 SzGjG1Io1u7Qv45GqBRsIb6/rGSjex8mIU1fIAmjFwfh7lSgEdomM4oTV
 0pd3bl+9qh4tDISuYF7slXUbqeeTDiAvBwLnJj5xZrF9PWGfOQIhKgmmn
 Yd8PmAwXCtZSVzxgGNharROgVz5u/HuBMPaWZVdvkmZ6NZVX+dS4OZnti Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="34558780"
X-IronPort-AV: E=Sophos;i="5.84,222,1620658800"; d="scan'208";a="34558780"
Received: from mail-ty1jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 12:20:03 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9wsixh5YW3Uent+e0QOa91F/6zh7yT2eRQDlHQ0vUE6dy65H+MqNHSqwo7eDtuYqV0zavacrverE5J4z9i/IM/WaaymceDxGKDoAb/5Rqgo/tMnqU9773p4XrBZ9pjT77kiL1viT+Rr/egMCfAl371+swxtLL1ImjYemXgohh6psdYKM10cgt9sTBuHGFGV0Mk7JhGS3XAYhLozPWEUlqY5ysAX3BsUnTB454bGSfUeZrQZ4G8sdkfCE4Wfz2PCzybYiwOX3lXt8vcY9kc7owJZsUKnVdQNdCR/TV3YqAowAyGcS/7XK/MXG+WVi9vHrA93bptexwRv0WH0EL6/JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJDoNiXlxemYwx6sS0P5y4vyBXU8jiJtuYAa//fr2Oc=;
 b=SXllhA/MUwnrwefqDhpQBf/V4fKm6q1uSK2gSLlO7+N8S9xq76jy7Uqy5xuQIZLI8ejyllFgXSy9FQw67xsniLp1ml1fJjfKqVHQLpteRgYK+oRFUNdyH28E+3ZvpZdlADzhN4AdUZx33RyzEjdOyaqSDS4HuN1c64ir8sucMco7HBqV8WxFGWoCT2dCl7Zt4B3ANpAncEog8GNNTEM+yvwE6k4uTJB+3YWpF6rDSmFuSizjkVo/l38RTdWix3d2UorjK9DJ8o8JaNqZMSrEdNNyCRThqM6GxR8XUoz5j48BDBHEVZZdMdxufsPeMrIu5Dj6ruiHZL2PqBkVv0iJLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJDoNiXlxemYwx6sS0P5y4vyBXU8jiJtuYAa//fr2Oc=;
 b=mPyv62QfwWnzM9P57DI3lzt1BnP0PR/wZj43UJTLvOvzSmD5W1xcEHGaGyUXHN7+vPo81/HIXiEImqSMJUGCnZi1vz7t+uo1Jw5TOsKG5jkKyLUdeqam9DtxekPKDowrA2kv8mVfAM2gMJStR1X2JSolPvu3PR+cYRrVoV6ZMrE=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB5755.jpnprd01.prod.outlook.com (2603:1096:404:8054::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 03:20:00 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 03:20:00 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Thread-Topic: [LTP] [PATCH] shmget02: fix EPERM test when RLIMIT_MEMLOCK is
 large enough
Thread-Index: AQHXcmnx9Xu6T6pyeUaT1Py5bi5Tq6s2zRKAgAGeiQA=
Date: Thu, 8 Jul 2021 03:20:00 +0000
Message-ID: <60E66F04.4090406@fujitsu.com>
References: <20210706132114.204443-1-cascardo@canonical.com>
 <60E51347.5000209@fujitsu.com>
In-Reply-To: <60E51347.5000209@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e775ef8e-a372-4dbc-6e8f-08d941bf4504
x-ms-traffictypediagnostic: TYAPR01MB5755:
x-microsoft-antispam-prvs: <TYAPR01MB57558ABC709102C9A43E7433FD199@TYAPR01MB5755.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C0r/BAI8qFR61VOEGZB6yuMeO2Q68IglB9KCmjYvxFXbRBAbucxbLPJ3DsA9fyPYkCuPU/xUUCvLZX3QPzw5ZljJfN4WCFjoeMFOYRVmK3vRfM/W73kdooI0fi6Vd8eHh+KAQzEb3kETs12J7bAncGVaX6wH3Oyl65jN3nLORJQIT4zLxF/wl65as7WqaCYMJOb97O3nqz/pa+HcUo9vHyU0qkgCtO2dyjm0hHhYUm2dH7u0stZ0S8sFMcTYk1Xi5yEgSsQe7aPK+LnWWxRegXEN245ZmjBMa5676EeusM+1r0VkwbGkWvEf1Dm0hjll8iwWeyB/0taz2F7WlxAGQy2/lt/eB881ViLsXsxtbZ2FaJ51yfLuL1kKXi+GVJkLuk00FzMCNcoaNCoAcsoyuMOCOecO5LjqY3D5+GyWHl7Xh9H06P6/h4URXYS8nRKYR0kWojSGMhoBGSCbxfi+qVTMxId7pUVRJ5IOS6XYE26nQOKl7LGFse0T9GTRntIwXW7JbE3PbPiCiX/5OwkdFY1XeeICb3JkkLMmNCfG2GFLNsvSLZpmmTJcoCHEVKsKqSykfSJTWclYsaSmutVHjobVelrIizzzrP/C5wry3Vays2CXA3aftS9JMdwcZD31UVkPN6BnxmkqRFCRk6RhRQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(76116006)(6486002)(186003)(91956017)(66446008)(66476007)(66946007)(64756008)(2906002)(33656002)(478600001)(38100700002)(26005)(36756003)(8936002)(66556008)(86362001)(122000001)(6506007)(6512007)(85182001)(83380400001)(6916009)(5660300002)(71200400001)(316002)(8676002)(4326008)(2616005)(87266011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?em5LNXB4RnhCZ2kxNGpwR2pxMU91MmhMZTAyYmt2cXFxYzdmSTVXdUxNRGNP?=
 =?gb2312?B?UXI0cWVDL2R2OTAxdXdZYXBTcC8zd2k0Q3R2WGQxUFlnYmJyTE5OU1pQYm9o?=
 =?gb2312?B?dTFhaks5bzF4eC9JWUN2cTFrK0d6VndsWUtwYUEzUUc3SVNxemVDQlpsZCth?=
 =?gb2312?B?eTlmeVRTM0lXNXhNaWc5cGRvaVNUbWhQVDd1V1ptOGdHanZFbDRDci81c045?=
 =?gb2312?B?cDBUbXJuS2hURmJyL3o0RWh3blU2eWdRdm5IdXZIRXFUcEt5M0h5RkNYZHAy?=
 =?gb2312?B?TXgzbmxTSEdsVWg2NTdkTDNKYWROTlB1K2dlUEdBdWJFOHhNWFJaR1ZFRjRV?=
 =?gb2312?B?THdnNk9CWUhpT2FnWkMrVXZCV0FwdWFWdlNxblZISTY2Zmo0NjBlR216bzQx?=
 =?gb2312?B?dlZGNWt4NjU5aTB0T1FFMzUza3YwNEhESHRGY2diUDhCdzNudHY2clVTamNa?=
 =?gb2312?B?a1B1RG9OelhseVhoeTFKTk1aMjhXTjRvSnZwZnNMckQ2NW05QVNEQTNTQjlu?=
 =?gb2312?B?UzdkSW13VGN6aGJ2aUhiQjcrNkNTdG44aDdDMllQWlJlSW94K2poTWg4Ylpi?=
 =?gb2312?B?Y0d0c3dnbDIzNVFlS2cyMXhmbGNtbjcrd3hRSWF6NkM5Ky9JRUk3azBsODRH?=
 =?gb2312?B?Y1dVc2FnZE9xdkdiWnBHdkJKNGhBQXViZlpDUXVFL2ZGVWZjODBZWHN4QVFC?=
 =?gb2312?B?dXhwQ0ozMWZGOFl4eVE1TkVBTnNKMzZvQkRvV1NwMVYxTW5IaUhhZ3ZBQ1Vr?=
 =?gb2312?B?QlhSWWRpQ2FkM0RuTmNTSXlIRmhMUXViSlN4RjNobXpxcU1OZjQwL0ptSWRt?=
 =?gb2312?B?b2hYVS9vaUEwUVFKNGI4Y203OGIrYnFjTERiU0JXbXlMVFMxbzRaTXZJdlZY?=
 =?gb2312?B?RDBmUmJaVWt4M0hlUFZNQ1hsZWx6ckthNXBya2pySlZ5RGJOa3ozbUVjTkda?=
 =?gb2312?B?NnU5OXlyVmZabTZESDZ4alhaYnBCUWtVWlQyNFl1c0ZIZlVBc0tFNFAzUFR0?=
 =?gb2312?B?dXFaVEpxOFVRcWplZnJWcng5Ykd1TEp6RlZVejNFMkN4SDFDdzV4dEcrTDhS?=
 =?gb2312?B?RmNrbkRHSVg0dEtTRGlpb0Q4MjBDU1FLU29iQ1p0cWJ1NWtZMjdsZHdtTUMz?=
 =?gb2312?B?dVk1djdTRU5SM1J4YVR2OE5wQzd3Y0xBd09UbVJxUGRoeFFIVWkyYTZTcm05?=
 =?gb2312?B?NTRHMldEK3JnaHB5Q25NZmllUXk4VmRZUS85cUpKZ2RYNWZ4V2s1NU9FSXhh?=
 =?gb2312?B?ZGE2KzRmZFNlS2ZDaHdSUEduck9wSytFVTRHMzA3bjVMbmdxMWFyWUYrRHBh?=
 =?gb2312?B?WHdRRFByZnJIYmJVSHVsUjdFQkF5WUJpZ1l0Z0U2aVo3R1VXdmJlWWZjVFJQ?=
 =?gb2312?B?clVRc2xZa2t3WDZmZnlHSXZBbDM4MVY0ZVExdGg5WWhVV1llK3ZjdXRRR2pD?=
 =?gb2312?B?Qk9iczVGcW84NzBFajJUKzVET0IxeElIUmUvSUw1MUl2RUQ4Sk1TVkVUK0o3?=
 =?gb2312?B?cnkyd2twWTV2N1JxWHlqcCtkMTA3ekJiNkt6UjZQMm9OeHZUWkl6TDJxYnpZ?=
 =?gb2312?B?cFRmbjNkV3FqS0JGdlRuTXlBRXB4SlZ2TC9MZXI1aldSRTdCTEF3b3Fucnhr?=
 =?gb2312?B?UVVSMlpxdC9nbXlRYW04bTRQYzZHNWw1SldIY0RtL1VOaDg1VG5FcytnZWpB?=
 =?gb2312?B?TnFjTDhlL0g2UjhuaG91OE5aM2Z4bE9YS1ZsbUVyUllKcmM5OEUyQytXNXND?=
 =?gb2312?Q?Ala1gS1TF59BG7duiymhFrPqXE+fIQ0XnXYsqQh?=
x-ms-exchange-transport-forked: True
Content-ID: <5328E1F5666C34419ABD2B52CA8EFC51@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e775ef8e-a372-4dbc-6e8f-08d941bf4504
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2021 03:20:00.1615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 27Y42Cm5xdJT1uUbwtEzBHFBmrMTXbIaTQjGmdG9Hb762VPVWbOhI+mLzpPfFtJXFG7wVxTkVeTEwgEJu/4K2igmuUQ7E7rg7URe/C+3RBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5755
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] shmget02: fix EPERM test when RLIMIT_MEMLOCK is
 large enough
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

Hi!
Pushed with moving this into setup, thanks.

Best Regards
Yang Xu
> Hi Thadeu
>> shmget(..., SHM_HUGETLB) will not fail with EPERM if there is enough
>> space
>> for RLIMIT_MEMLOCK. If the limit is 0, it will fail with EPERM as
>> expected
>> when a not enough privileged user calls it.
>>
>> Set RLIMIT_MEMLOCK to 0 for all calls, as this is the only one which will
>> fail because of that limit, unless we are talking about very old kernels
>> (before 2.6.9).
>>
>> Fixes: 4dc493b44a85 ("syscalls/shmget*: Convert into new api")
>> Signed-off-by: Thadeu Lima de Souza Cascardo<cascardo@canonical.com>
> Thanks for the fix!
> Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>
>
> just a small nit: Since a child process created via fork(2) inherits its
> parent's resource limits. I prefer to move it to setup function, so we
> don't need to set it in each sub case.
>
> Best Regards
> Yang Xu
>> ---
>> testcases/kernel/syscalls/ipc/shmget/shmget02.c | 2 ++
>> 1 file changed, 2 insertions(+)
>>
>> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget02.c
>> b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
>> index 6be8d8157999..8857207cfd3d 100644
>> --- a/testcases/kernel/syscalls/ipc/shmget/shmget02.c
>> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
>> @@ -64,6 +64,7 @@ static void do_test(unsigned int n)
>> {
>> struct tcase *tc =&tcases[n];
>> pid_t pid;
>> + struct rlimit rl = { 0, 0 };
>>
>> if (tc->exp_user == 0&& tc->exp_group == 0) {
>> TST_EXP_FAIL2(shmget(*tc->shmkey, tc->size, tc->flags), tc->exp_err,
>> @@ -78,6 +79,7 @@ static void do_test(unsigned int n)
>> SAFE_SETGID(pw->pw_gid);
>> }
>> SAFE_SETUID(pw->pw_uid);
>> + SAFE_SETRLIMIT(RLIMIT_MEMLOCK,&rl);
>> TST_EXP_FAIL2(shmget(*tc->shmkey, tc->size, tc->flags), tc->exp_err,
>> "shmget(%i, %lu, %i)", *tc->shmkey, tc->size, tc->flags);
>> exit(0);

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
