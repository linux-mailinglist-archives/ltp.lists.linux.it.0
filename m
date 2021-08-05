Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFE23E0CDC
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 05:43:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76F623C80C6
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 05:43:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AB3F13C2C99
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 05:43:40 +0200 (CEST)
Received: from esa4.fujitsucc.c3s2.iphmx.com (esa4.fujitsucc.c3s2.iphmx.com
 [68.232.151.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0E683200DB4
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 05:43:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1628135019; x=1659671019;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eGcbLr6Tc26tCTTC2b7GqOdYCxIpQAwVbu1yh/MFr+M=;
 b=tRn5owIap0GUnWLtgxvhwGvAUdu9wrEQP2+jZKqmPpaTIuO/DzekqpG0
 ZmfuXyFy9k6UnmgHD36dqoMjAz29GLtco6SV+h6yrbk5lNJJtGhwuVP4v
 bcvB67+Yy+itpYrwnUm0IgijLsNFURY6GHTRXXly0eoQnRM7rQFhmVD3/
 iKpKo+kHCVQC/iXy/YUYbcTYHxSi7EwTkfK7TqjAib3f6xD4WPTKV163I
 0qj4rzxkroSwuprr/rfwg/88k/GH1+xzUt0c01Ws8l7LMCaPHVytJtlpj
 1yIdj0sDwo4LweyyhzC1lhK9MY1S4NrbnW4ccPqMxZuLCFiaqtqBk9PEs w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="44089344"
X-IronPort-AV: E=Sophos;i="5.84,296,1620658800"; d="scan'208";a="44089344"
Received: from mail-os2jpn01lp2055.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.55])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2021 12:43:36 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ec1UHnUvylVm4HXkYEPueSgNF0QisBcO5PXNS7prkTHhhchYI+PQ/EnVP7l2SnoA79Ci8HX/ARKUn85sLts22/R1b6Sj3PQ0drtqaRiHOAMR9eKjF3h6mvu2+jFYIlHwjtGYrwzcK4ibj87oNTYsHtINWnbwVECxjlGgYO3xvQW9pOMk/bIb0vCC/s02YVjmQCnOH72Jf/+yGHBOIaKUoZ0q5JcjshhS9G+7lXeJ0fLRqGJBTRgnqTIwc06VsX5XHP99rTd/bbZN6pu9YRzOvnIzqwBFVHW05EJN8VoHxENQCKkLi21Gk4lRXRq1aN1Sts/z+WksmW3T7sGZLOofIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGcbLr6Tc26tCTTC2b7GqOdYCxIpQAwVbu1yh/MFr+M=;
 b=fE5TNcDkELA+3jggA2Br+oo5hkJhL+s5tq0SAJcRkdGSH2MKRfBiPhPAuKIBwQDq/ZZBybnSyV2xwKNJ15EFNM7RewlwLPuuYyJPaWtG2DA6pycatfn+eS9mhW2R5QIbepSf+En1YWbZ+dmMAX0r+41uegy6rbtg/9pNBwSg3TOlNrszscr2Mv8mj3gXLwspqANFcjG+ogNvpfkn7FfZIfBR4sQ6KASmq+VwXE+c2X1dBeRJJtgh4O0evtXIydR1jr/od68hhGGnFegWn00HSVxlOp/spAojWHlk70xflrbH8U3cmwLFsAuNPsMrGCEXgix3AxBEl+C8qGxmkgIftw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGcbLr6Tc26tCTTC2b7GqOdYCxIpQAwVbu1yh/MFr+M=;
 b=a0i00dC534EOqHAB9Bd1M0jskbxnXsPR/mnA/h+s3e+g5y3iViOyPE1F3lGiwqtK3xMWhDpZSI7kE7PoYdWYAGxmjNaygL8Nk4mmLVq9INKpCpfKcKYquJmBiFX1TiKClwSExuza2aCHulVXHtDt8Jg5sPGcvx787JAHn/TYFK0=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY1PR01MB1563.jpnprd01.prod.outlook.com (2603:1096:403:1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Thu, 5 Aug
 2021 03:43:33 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%4]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 03:43:32 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH v2 2/2] msgget03: don't depend on existed shared
 resources
Thread-Index: AQHXdvMY8HjeAIx+30uV0khJgLWyVqtOr+6AgABId4CAAA0WgIAAADEAgAFK4QCAADzZgIAF27UAgA0ogYCAANi6gA==
Date: Thu, 5 Aug 2021 03:43:32 +0000
Message-ID: <610B5E7D.1070104@fujitsu.com>
References: <20210712075223.10682-1-aleksei.kodanev@bell-sw.com>
 <20210712075223.10682-2-aleksei.kodanev@bell-sw.com> <YPkkZ0Zq9DyHKBaT@pevik>
 <YPlhMeRRsNnemT05@yuki> <YPlsK8fsMI8T+H7c@pevik> <YPlsVD2gbIiX8JJk@yuki>
 <60FA81E4.3060709@fujitsu.com> <YPq0749ZnnGsAV2q@pevik>
 <60FF9EFA.308@fujitsu.com> <YQqor4LiNK4/Xrbe@yuki>
In-Reply-To: <YQqor4LiNK4/Xrbe@yuki>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dff9035d-71af-4a1b-8c49-08d957c332ab
x-ms-traffictypediagnostic: TY1PR01MB1563:
x-microsoft-antispam-prvs: <TY1PR01MB15630533E4392228A97D14BAFDF29@TY1PR01MB1563.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /s5nofVoTKkOjM51PAoYkBw4aNvLzGyvRNwmNGrhV0ASyfsxMRKa2M0MzEuSWvyVP484UYfGgmYRfAm1lfG4CWR1XJg7Tkx5eWwrmBr/FK4AGSn9sjrq0KYbO6o8V/fWrHsrVgAb+S4VG0Rbk0ObKp6A0IfQJgEzlndNdXw3tHPhYWIwEuW7O/6KOcBV92glkl1vh5CofBZjzgi7SHlApSMkONKZ6mGq5GRWJ/0zaqzkkN0nQGe5Hd2zFksmbSW3kG+OVbPKYDxrmjET4nuyVMyQgPWUnozfi4eoItbfpsm619HESJ7s8ENTmStadOGfE8Moe6eA1RkVZsFn/JKLkyzWi4n3RzPVF43ZhdarZSU4lgg7lzhI+Sge3e+6NPKTSpHUBPUGBfoc9tsNI1vC8z1TU6J5h0xGNkasStta11ayfM8xWPMRz1sHG/Ol8KG+oZdhJljRiMyKQARK1qlUWja0t3CvLpxZ9+GqV1GBBDDmVO8e6X4Zo9pY5wRz6rR3sXqOnubHx/iqbq7I8DsS/IFDuF2v0VvaSIuoMe0LOl7plKdkg3lGYisnvhaqhZs/MAw7JDuTF0klBQQ3uhAxNFwKQQa7B2bHqBfh4xMz/NlaGXktHaOoUf8Umqh2AqU8I5R9G0YQZF7+YlT8Hzn/3dWA46oyrrWszYVJOvlcSQIUmcU84zPtFyXl0NF/vwnsmXpOyw/vSEU5CLZPW3JFrg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(478600001)(110136005)(8676002)(87266011)(6486002)(2906002)(186003)(86362001)(66476007)(4326008)(71200400001)(64756008)(66556008)(66946007)(66446008)(36756003)(2616005)(316002)(83380400001)(6506007)(53546011)(26005)(76116006)(91956017)(6512007)(38100700002)(85182001)(122000001)(5660300002)(38070700005)(8936002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?N1lVOHNsRUdldkE4UlVacmY5K1U0TjBhb2dSblZ1aHoyT2tKL210M3NIZ3dW?=
 =?gb2312?B?T25PTUlySkU3VW5UaExvdFNKMFRpSW5YWGdZVkZLM1ZWM3dxL0VjUFdmekhl?=
 =?gb2312?B?U3NBUndTdGxLWk1NSmw1blFZaUdJVXZDLytWRXhFYVVHVFY3NWx4SUN1WXk5?=
 =?gb2312?B?RzVZeWRmZi9EWHVTaGttQlBrY1BhejEvY1NJZ3hycXpGSTNCTmQ1cUhvK0lJ?=
 =?gb2312?B?MW1RT01GVEVjT1FmTUQ1SnJuOEl3WWQyUFZIbnFJc1JsejZhVWNMeExYV1hK?=
 =?gb2312?B?TUlCU0pWL1lqb2tsQ3RPQ2k4c0JVM1BEMGkxbS96cEtJbk1jdjRQelJzallO?=
 =?gb2312?B?a3l4NDducXlSc3JleThIMXBraHJ4MkIxQ3YwQW45dElPdTY3VzBZTUdLbHFC?=
 =?gb2312?B?R2lrMElXVVBicUNUOTZGa1F4NlVjY3E0V1FVWVpPa2g4bWN1U3N1NGVRek9w?=
 =?gb2312?B?NlFMcW40VnBneFdIazgyWDdrSkxBckk5bmxHSDN5STVLemVsWFdBVmlVOGdV?=
 =?gb2312?B?UXgwQVJuWmZIRVlSK0g0ekNxQkRQZzk2TkVEbnVoZHpxVVBZS2JjSGRLV2Qy?=
 =?gb2312?B?b2dtYmRJUllvT2c0YjNMNElBa0xxcTV3cndJNEQxSlUrdmZBYUExTXlvYnJa?=
 =?gb2312?B?a2lzNFQ3Q2s0RWxaelhoOUVGcld3RUZ1bW5wZUxUaFpQeWRGSkdSYjZ3ajJZ?=
 =?gb2312?B?S0w0Z2RtUmRmeC9PR3g4MXJvb2U0VU5NcnR4NjUwRW01S1Qrd2lDcUVnS0Y1?=
 =?gb2312?B?NmNJNFgrQVJ1S2FtV2VDNGU3OFdUUTkrN2wrbnMzY3REb0FjbG1kUVZpNkVn?=
 =?gb2312?B?V3lINGNuMHJDU2VsYWxPYUYxVTlWK0lCdWFENzEzUXBucFA2b3FpTGJWSTEz?=
 =?gb2312?B?S1ozSXRBcHRjVGc4MU1ZeUQ4WVBZYUVmaEh3cTg1WHNuQ0dHcVlSaFNlN1dO?=
 =?gb2312?B?a2MxNGFrUWdFV1FPQW5NWEFZSWtLUG1DS1RTeldidHdTVVVJMmUzMjh0RlJR?=
 =?gb2312?B?STZjVkxJQTl2aHBMOHRsNnh2a29KUWxsSjRxQnhxVHlZbGVJU2xBZWM2Vjhu?=
 =?gb2312?B?R0h4L0MrNldyeDY2bGY0SFNQWEl3L1lJTFZHVGNBUVFXWFJkRXFWTm0zVG1m?=
 =?gb2312?B?RkZ2TURQQjVYalpCNFhXMEZ5enZPQjZNYkJzMS9zMlBCWVQ2a3hSSmFHRXRj?=
 =?gb2312?B?cllmbEFTZzUyUjNJdUxNemdad01pbk1LL2tSSTV3QkRzUHFaMUFaWnVqOWF4?=
 =?gb2312?B?UnpVaWtIYmRsd1RWVTRpT3cwWEhtMlJEMVhMOFRkUi9CeDhENSthWjErUkpC?=
 =?gb2312?B?WXdYRTg3SXhQK2UrRTZHNzV2T1hXNHVsQTlkamxicWV0TEIzNTRBK0UyUTBH?=
 =?gb2312?B?OGI2L3orUHhKUnhndk05a3JlOWVRR3ZBcFBEU2lDM2VxUUNBdk82dDFlNEw3?=
 =?gb2312?B?NVBHYjV4aTZ5SDdmd3BxZDd5MUo0Q2YwT3pEQnpyTG9pWUlaZHd2amRwVUQ0?=
 =?gb2312?B?czdpeVV1dmZzcHRGeXoxVnhQeVhRUnE5NGFzcmlGRlVrSkFMWW1QUXpzQzNz?=
 =?gb2312?B?QlVQMDBtVStwTml0QW1NRXpTTTVWRkpiMFkwekR4L2pNY3FrZkZYYTNUMVdt?=
 =?gb2312?B?WFB6QlRrVzNwRXNtM0p3Nk13Z2xIUm4wTHhxWEtYRnMzY1V1T2REazN2TDkz?=
 =?gb2312?B?NnQ1YUYwQ2pRMmdXQWhZUXJlejRTN3NOYitqNHp1bFRCL0kwbFNMMjZxblpq?=
 =?gb2312?B?aEsvQ2diWXZaWEZLOEw0SUR2dHE3ZEhHYm16S3R1ZXpETUU5NTFhbGJCOGpo?=
 =?gb2312?B?NktqdnF2MURPaVlsdEdnZz09?=
x-ms-exchange-transport-forked: True
Content-ID: <98648C9389AA41449066EBB4AA30C775@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff9035d-71af-4a1b-8c49-08d957c332ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 03:43:32.9620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XTXjH+qpGAUh+9DV1EnYMgKBr3YhSRWjc2ze6Ag1b9xegVnyg+HlfU6LsHNpW/UHnWGbFa6Y9/PQfeFqDSalUbf2T3UhgszfoG+V3lrjZNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1563
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] msgget03: don't depend on existed shared
 resources
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

Hi Cyril, Petr
> Hi!
>>  From 2772f8f0bbc1526389cb2090895dded41e2c43dc Mon Sep 17 00:00:00 2001
>> From: Yang Xu<xuyang2018.jy@fujitsu.com>
>> Date: Tue, 27 Jul 2021 16:22:42 +0800
>> Subject: [PATCH] libs/libnewipc:Rename get_used_queues as get_used_sysvipc_cnt
>>
>> Rename get_used_queues as get_used_sysvipc_cnt, so we can use GET_USED_QUEQUES()
>> and GET_USED_SEGMENTS() to get the corresponding used sysvipc resource total.
>>
>> Then we can use them in shmget03/msgget03, so we can trigger the ENOSPC error correctly
>> even current environment has consume some sysvipc resource.
>>
>> I don't use this api in verify function since we don't support run cases in parallel and
>> we should assume this situation that this case is the only case to use(free or alloc) sysv
>> ipc resource at that time.
>>
>> Fixes: #842
>> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
>> ---
>>   include/libnewipc.h                             |  6 ++++--
>>   libs/libltpnewipc/libnewipc.c                   | 16 ++++++++--------
>>   testcases/kernel/syscalls/ipc/msgget/msgget03.c | 10 +++++++---
>>   testcases/kernel/syscalls/ipc/shmget/shmget03.c | 10 ++++++----
>>   4 files changed, 25 insertions(+), 17 deletions(-)
>>
>> diff --git a/include/libnewipc.h b/include/libnewipc.h
>> index 075364f85..b0448841a 100644
>> --- a/include/libnewipc.h
>> +++ b/include/libnewipc.h
>> @@ -49,9 +49,11 @@ key_t getipckey(const char *file, const int lineno);
>>   #define GETIPCKEY() \
>>   	getipckey(__FILE__, __LINE__)
>>
>> -int get_used_queues(const char *file, const int lineno);
>> +int get_used_sysvipc_cnt(const char *file, const int lineno, const char *sysvipc_file);
>>   #define GET_USED_QUEUES() \
>> -	get_used_queues(__FILE__, __LINE__)
>> +	get_used_sysvipc_cnt(__FILE__, __LINE__, "/proc/sysvipc/msg")
>> +#define GET_USED_SEGMENTS() \
>> +	get_used_sysvipc_cnt(__FILE__, __LINE__, "/proc/sysvipc/shm")
>
> I would just call it get_used_sysvipc()
OK.
>
>>   void *probe_free_addr(const char *file, const int lineno);
>>   #define PROBE_FREE_ADDR() \
>> diff --git a/libs/libltpnewipc/libnewipc.c b/libs/libltpnewipc/libnewipc.c
>> index d0974bbe0..687a907e7 100644
>> --- a/libs/libltpnewipc/libnewipc.c
>> +++ b/libs/libltpnewipc/libnewipc.c
>> @@ -48,25 +48,25 @@ key_t getipckey(const char *file, const int lineno)
>>   	return key;
>>   }
>>
>> -int get_used_queues(const char *file, const int lineno)
>> +int get_used_sysvipc_cnt(const char *file, const int lineno, const char *sysvipc_file)
>>   {
>>   	FILE *fp;
>> -	int used_queues = -1;
>> +	int used_cnt = -1;
>
> And here as well the _cnt is not adding any value over I would say.
OK.
>
>>   	char buf[BUFSIZE];
>>
>> -	fp = safe_fopen(file, lineno, NULL, "/proc/sysvipc/msg", "r");
>> +	fp = safe_fopen(file, lineno, NULL, sysvipc_file, "r");
>>
>>   	while (fgets(buf, BUFSIZE, fp) != NULL)
>> -		used_queues++;
>> +		used_cnt++;
>>
>>   	fclose(fp);
>>
>> -	if (used_queues<  0) {
>> -		tst_brk(TBROK, "can't read /proc/sysvipc/msg to get "
>> -			"used message queues at %s:%d", file, lineno);
>> +	if (used_cnt<  0) {
>> +		tst_brk(TBROK, "can't read %s to get used message queues "
>> +			"at %s:%d", sysvipc_file, file, lineno);
>>   	}
I also modify this info.
message queues => sysvipc resource total
>>
>> -	return used_queues;
>> +	return used_cnt;
>>   }
>>
>>   void *probe_free_addr(const char *file, const int lineno)
>> diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget03.c b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
>> index ab5714cdc..8ccffc547 100644
>> --- a/testcases/kernel/syscalls/ipc/msgget/msgget03.c
>> +++ b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
>> @@ -21,7 +21,7 @@
>>   #include "tst_safe_sysv_ipc.h"
>>   #include "libnewipc.h"
>>
>> -static int maxmsgs, queue_cnt;
>> +static int maxmsgs, queue_cnt, existed_cnt;
>                                    ^
> 				  Why not 'used_cnt' ?
Yes.
>>   static int *queues;
>>   static key_t msgkey;
>>
>> @@ -37,11 +37,15 @@ static void setup(void)
>>
>>   	msgkey = GETIPCKEY();
>>
>> +	existed_cnt = GET_USED_QUEUES();
>> +	tst_res(TINFO, "Current environment %d message queues are already in use",
>> +		existed_cnt);
>> +
>>   	SAFE_FILE_SCANF("/proc/sys/kernel/msgmni", "%i",&maxmsgs);
>>
>> -	queues = SAFE_MALLOC(maxmsgs * sizeof(int));
>> +	queues = SAFE_MALLOC((maxmsgs - existed_cnt) * sizeof(int));
>>
>> -	for (num = 0; num<  maxmsgs; num++) {
>> +	for (num = 0; num<  maxmsgs - existed_cnt; num++) {
>>   		res = msgget(msgkey + num, IPC_CREAT | IPC_EXCL);
>>   		if (res == -1)
>>   			tst_brk(TBROK | TERRNO, "msgget failed unexpectedly");
>> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget03.c b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
>> index efbc465e1..acd352796 100644
>> --- a/testcases/kernel/syscalls/ipc/shmget/shmget03.c
>> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
>> @@ -22,7 +22,7 @@
>>   #include "libnewipc.h"
>>
>>   static int *queues;
>> -static int maxshms, queue_cnt;
>> +static int maxshms, queue_cnt, existed_cnt;
>                                     ^
> 				   Here as well.
OK.
>>   static key_t shmkey;
>>
>>   static void verify_shmget(void)
>> @@ -36,11 +36,13 @@ static void setup(void)
>>   	int res, num;
>>
>>   	shmkey = GETIPCKEY();
>> -
>> +	existed_cnt = GET_USED_SEGMENTS();
>> +	tst_res(TINFO, "Current environment %d shared memory segments are already in use",
>> +		existed_cnt);
>>   	SAFE_FILE_SCANF("/proc/sys/kernel/shmmni", "%i",&maxshms);
>>
>> -	queues = SAFE_MALLOC(maxshms * sizeof(int));
>> -	for (num = 0; num<  maxshms; num++) {
>> +	queues = SAFE_MALLOC((maxshms - existed_cnt) * sizeof(int));
>> +	for (num = 0; num<  maxshms - existed_cnt; num++) {
>>   		res = shmget(shmkey + num, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW);
>>   		if (res == -1)
>>   			tst_brk(TBROK | TERRNO, "shmget failed unexpectedly");
>
> Other than the very minor differencies I would do in naming the
> variables and function this looks good to me.
>
> Reviewed-by: Cyril Hrubis<chrubis@suse.cz>
Thanks for your review. I spilt this patch into a patchset because it is 
more friendly for user or tester.

Best Regards
Yang Xu
>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
