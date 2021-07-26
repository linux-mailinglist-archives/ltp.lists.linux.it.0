Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E14B3D52C5
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 07:15:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8436A3C6D05
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 07:15:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CC0743C0682
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 07:15:13 +0200 (CEST)
Received: from esa9.fujitsucc.c3s2.iphmx.com (esa9.fujitsucc.c3s2.iphmx.com
 [68.232.159.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9146B600734
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 07:15:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1627276512; x=1658812512;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TzaU3unfRVrt07UllmJj9gUPAPsfsj7q0zI4qqzWUo4=;
 b=aEgzyO+7+xN5z3yNbQ8NDE+XWh3UNA563vNh3eltn778nIkQZPbjTSO7
 NY7M9JrB5IPp0sud0j9iZNuIjAk+XfnR3MOA3lkPgz5uSMl5+Wf+hn/S7
 742lUx0Q0E87o0W8SbZLu6bAulX1LHVLk1JphNSkt896lxdM4NfXGVNkX
 saZx9XkesRrylUm/xCh9s/iz8u1HkWy+JbYwbVSmyHqC9MenzbjVCB76R
 ZYKt5tB6TiGlISIk1H024541arBMbIPpu63Tq/5LwM+WEoKw8GV5IrisV
 wUgjGU0IJ/Ah+w3AVG0O1IF7Qt9E10vBBN8JL2T7qEHJT7UFGXQ+wmOPK A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="35570490"
X-IronPort-AV: E=Sophos;i="5.84,270,1620658800"; d="scan'208";a="35570490"
Received: from mail-ty1jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 14:15:10 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZk++ECdvXMjvJfa/4347kWIskaBUrzVzTlaxvvIHhY96osb87WhIPVZZQuokTjUO2McCRcjMb56HAqN9RYKRNkdizzMaGTIWAWcxBZuA3oAAxdy0yQZExaD5RwWlOBaDFXvhQw5E/drhrbEK6RfnWpDZrUuTkvFG4jp9lu4QocI/wXkK3zIpqyZt5a2q4NiA4HkD4mdb2KDThuQqOnHSfgry8oO8hZMFlzLo2kCUgSQCVkeVTPecHfftVSEsNUmFQfdfalzp3pR5C5wPNH5hKrRPx71IlTIu58rjOyQ7JQj0wmYa1coh1br/gGOd+ox3/V8JN4Ebr8zrrMKYw5GUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzaU3unfRVrt07UllmJj9gUPAPsfsj7q0zI4qqzWUo4=;
 b=ceg9z5Rj5rg/NWjvNPGiB3+3jWyrd60oqZkIZeAiCtmj4K0MD9U26YHjNujCnT5TPmMtSWf+MiKq2mrMwUX44afBXXjrLsS1mS4ORfsXd6Kv07HdiKJd7+zaBc4g82u0IJS8iZxK/DpMZxKJzyfo3UKbDdNT5I7dzUtHxavanQYKB/z+y3iOe2+iqkxGpu2YviJvqC7zAw3KQ03YnmEUDjXtvLBTPYngqTCR3yZ64ncxjEaA0V7m3tvbHqmdLX2fdSstzZ9KGfiiQO+4h4MYU3sOrk7sdC+Qr0Bh+7QU33xT3CzIvezb+Y8GQMdwEh4iGnLEWer25zJ7MM32Iu2SCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzaU3unfRVrt07UllmJj9gUPAPsfsj7q0zI4qqzWUo4=;
 b=o1jbtldYmRTN7vgb8CmNHhpFU32zpN3AVLn/9k85UWrWyb04xX25sf/oHsys+giCzFCmCBHNT9YZNUxZkr1U9jaBCg6io8n9S7E4tlWh3V4aL4kADn/lhUdhfBPAiYw7vXWEzgMOos+ZYj3yaZlHOlUSAAjgVyuiK2mCp6d981w=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYXPR01MB1517.jpnprd01.prod.outlook.com (2603:1096:403:e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Mon, 26 Jul
 2021 05:15:06 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 05:15:06 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [PATCH 1/2] lib/tst_hugepage: Fix .request_hugepages = 0 bug
Thread-Index: AQHXf4JaL/BfBAoGK02D/Wfh/7I7tqtQp+eAgAQTnYA=
Date: Mon, 26 Jul 2021 05:15:06 +0000
Message-ID: <60FE44F9.3080404@fujitsu.com>
References: <1627017584-30405-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <YPrZhzFng/7nHywg@yuki>
In-Reply-To: <YPrZhzFng/7nHywg@yuki>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e52bc03b-82c2-4279-f739-08d94ff45523
x-ms-traffictypediagnostic: TYXPR01MB1517:
x-microsoft-antispam-prvs: <TYXPR01MB1517F1A1F5607E4F4AD0B3FCFDE89@TYXPR01MB1517.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WVxvovGEdPv8P3Adbonjbs1G+z+1kyP61mcpHsqeHBolfjWjaN4ih8iRG3V27qYu/1Mhv+AIdhfzWHJx39TEYLankWWXQg0kcho4t4zqK0Cgi7LZavNgHVwgS8ut0kyHCqydLcwJF3WPEMNspK5fITnUPADvq+sDpPaz28q1xFlpjJeU4LJoXFhz6HE+txKZl+cDH8zZoDZUI3lfONxb9UXMWIbIlZlkYykL8L4vybqOPI6xGp5V8688UZ4eXDMFE/3WvkhNKSlzjLRv5Gi6lP4w0kTas9/2MS6D8e1oaIfrv7dKGKqfgipau+xA1Y9V7XJphY+qSbjqRlhRkvq5XhlhYOfvwvTh/ZiNeXJehV5SefLgSK6ESNtu1ucTZAC+Vbbf9srgG5WO5f1uc17RVpbbZnqVTNvfdVvAV6eRaP2xkovXnQpH9S6pusjE5ueLHC6AMd2+M42OgJXHRHjRG8k0kXmvDPbfi0p6t4CvDNAf5R98PVVVjrPLJm82FCV7LyteSgkuwzexYm/CnyQmYGsQHmSP+Tlaqt5XOVpMZsq4P/rw/XiglBll8Zo72+pSdk1hXj39/S+GYNHcEeyX7BOYbclPgbGYoGQXJBV5BdU/2MTxjXR4iJrvkollYe9z3bml8hKoPgJY6LwiMrwEcvTgABLFmlkeWRGbg7KHtBv/3LY+hNzwq23x8si4sg2tG+DzM2kMs6M91NhZSkEQ3yhHdGXLg1sNuq1nOvhykc4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(2616005)(186003)(8676002)(91956017)(508600001)(26005)(316002)(6916009)(6486002)(76116006)(87266011)(71200400001)(122000001)(38100700002)(8936002)(36756003)(2906002)(4326008)(66476007)(64756008)(66556008)(66446008)(6512007)(66946007)(6506007)(33656002)(85182001)(83380400001)(86362001)(142923001)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?ZC82RVF2VXJ1UW1kZFBBdmdMWEJmTytmTXFNeXpQSE4rSlhRT1FsWkxNSHB0?=
 =?gb2312?B?UVFOd2IySG91dWJZNzUvWjVBYVAwS3VIeUR6YTVYNnB5UHBxclV6cG5ES1Jr?=
 =?gb2312?B?UWVqdml4dTRpdFBMbVJOTGI3RkVPT1RSc0lNMjBFVzU4Qm0rQ0cySHRZOUlo?=
 =?gb2312?B?aHdjeW9uQkJ2aS9MNkl4Tm1Tdy81VWZlRmIxQ3Bkd2lsZVZydjg0cUZub05a?=
 =?gb2312?B?Q290c3hISzcwYjdvS3llSUl5YjYxZGwvTWRpalFPakN5S1NiMXdRZjVmNlZR?=
 =?gb2312?B?Z1R3cTZibkRrQUJDUGJDc1cyQXN6Szl5YlBSUG0xUzJQU1M0SGpkNnNhdlJM?=
 =?gb2312?B?ZEZpZlBZdlI2eGhVWlY1aHpiSWxpTkZkeWROUmI4emZvVEZpQmJpYmdrYk1F?=
 =?gb2312?B?ZjU4NGc1WGZ3WFNMSDVUY3diRWp3aU1jRkFCNHdoaWsySFVlcW03WTRpcUZM?=
 =?gb2312?B?a1NYdUZNbkNreUpXZEF6a0I0bjI4NUNNc0g0QVVWSUxFN2tBSmcvKzM0NlIw?=
 =?gb2312?B?VGkrdENidlN4dVZoVDB4ampHN1hKZUg4M0hZdTh2Sk1pbVdMM3ZtMTkrb3Ev?=
 =?gb2312?B?bkt6Nk9HYTJGRWR5OElmK281K1MzaVd6eU5WM0lZWEdoT2V2WlZiNmJRYVZt?=
 =?gb2312?B?MG9aOWcxbnNvK1I4MGU0VCtHSENHY2hnQWNNRnQ1ODN4cU9HbTlJcllNV05M?=
 =?gb2312?B?a05UaVpZS3R5WlhXMDFWbytxZ3pvcGxNK1ptamFPQnJDaFV0czRCcWdNTHd4?=
 =?gb2312?B?SWYxNmZIdnlJaVNDdkM2YUYyYUhMOTFFSXZ3bVEyZTk3MlQrOGU4Wmp1SmtG?=
 =?gb2312?B?OFIydDg0Z2s3Q1JmMDM3YlU2NWtBbjgvTVYrc1U3dzJXc0dLdERjK0Y4MGdF?=
 =?gb2312?B?UU1LMGlmajdTQnNtVldZbWcyRlMwd1VGQlVyVVlpRVN0TFpEcmtJcTNsdXFG?=
 =?gb2312?B?bTl1c1NuallsVDdhaWZHdnBrdFRVbWY1Z20rai9PQmJ4ZElsQUYvT3hXWTIz?=
 =?gb2312?B?ZS8zM1B6Njd0L2FVcWlFZnRMS21tTEQ5blVGNXZVaVUwR0VHSk5RQ1FuZTZl?=
 =?gb2312?B?ZW1XdGNKSkx5MGFKRUlQekVsY2EzS0hra3B2c1JtbWJiTE5FWk1GcHBiVTJZ?=
 =?gb2312?B?eEExMHRMZEZ1YTBJcjQ3cTNPQ3lvQUxxaHJCbm85ei9IdElUdzhvNHdSUkpZ?=
 =?gb2312?B?NVhvRmZBVGRuTkFDR3VpQnBQdXNGYnoxQ2l1czNPUmdlY09rMHNyUG54WHNt?=
 =?gb2312?B?eHdvOTc4U0tsclFYRmtHZlh2ZTd6UHZUZERIcDRta1dLcWMvc3I3NW84bnFr?=
 =?gb2312?B?U2RxNHhjYzZPQTdGVUVqaGFvUk9QNVVYTU1BRHBHTVd4Q1NiOVVCc1dhOWhV?=
 =?gb2312?B?dStsR0FQK2FhVUdKTFdLbHZrTklTYnVsUm1XTkF6UVFOM2U4aHY0Qjg5V1dT?=
 =?gb2312?B?WklEbnR6ZnlrUnhoMlhwSms5d2crOVkyUVBTYklHM3BCd3BOMEsxTTkvNGNO?=
 =?gb2312?B?RWE1bjZBYk92NXFIRHB3aURCcHBoMCtyMzZFc0Z5Rm10UmFQZmd3Q2tpTExx?=
 =?gb2312?B?YzMrUjFKQXFxNVZ3NGhHN0M4M0FCZExHZFBSNm80TTFNL2JCOVUwZk0vbWpE?=
 =?gb2312?B?blp6aVdoU3dmeG96TTVZUTR1cVczcmpRRFNleGEwNjkzTERZRHY2ZVFQaGIr?=
 =?gb2312?B?bnZwRFFqSUphR3dSNnFvdXVrbnRRVXVaTzJFcTRLQklxOGdEckcrZU9nRm1m?=
 =?gb2312?Q?GJoreudA5RiO/IxgV7+2KQhMSYs8Nz/J46guEMs?=
x-ms-exchange-transport-forked: True
Content-ID: <2C9D444BAA0F8544A10F093B43B9C8AB@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e52bc03b-82c2-4279-f739-08d94ff45523
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 05:15:06.8093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TPxklu7rWVLGLkOwh6D72LuIcsH9KOVllhNFnHI5W5iQZWFwa+9hUAwEKYxqxKM7NAJQ6iQA0E07XW6fQY68WCqL7iXHXj43kzrDUJX21FE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1517
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib/tst_hugepage: Fix .request_hugepages = 0
 bug
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

Hi Cyril
> Hi!
>> +'tst_hugepages' will be set to 0. If need zero hugepage on supported hugetlb
>                                        ^
> 				      If the hugepage size needs to be
> 				      set to 0 on ...
>> +system, please use '.request_hugepages = TST_NO_HUGEPAGES'.
I use number instead of size and then push this patchset.
Thanks for your review.

Best Regards
Yang Xu
>>
>>   Also, we do cleanup and restore work for the hpages resetting automatically.
>>
>> diff --git a/include/tst_test.h b/include/tst_test.h
>> index c7d77eb09..40c725995 100644
>> --- a/include/tst_test.h
>> +++ b/include/tst_test.h
>> @@ -125,6 +125,8 @@ struct tst_tag {
>>
>>   extern unsigned int tst_variant;
>>
>> +#define TST_NO_HUGEPAGES ((unsigned long)-1)
>> +
>>   struct tst_test {
>>   	/* number of tests available in test() function */
>>   	unsigned int tcnt;
>> @@ -175,7 +177,8 @@ struct tst_test {
>>   	 * have enough hpage for using, it will try the best to reserve 80% available
>>   	 * number of hpages. With success test stores the reserved hugepage number in
>>   	 * 'tst_hugepages. For the system without hugetlb supporting, variable
>> -	 * 'tst_hugepages' will be set to 0.
>> +	 * 'tst_hugepages' will be set to 0. If need zero hugepage on supported hugetlb
>> +	 * system, please use '.request_hugepages = TST_NO_HUGEPAGES'.
>
> Here as well.
>
>
> Other than that it looks good.
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
