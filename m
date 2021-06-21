Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B091B3AE679
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 11:49:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 138893C96EB
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 11:49:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D1DC63C1A9C
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 11:49:03 +0200 (CEST)
Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com
 [68.232.156.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3798D200910
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 11:49:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1624268943; x=1655804943;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Rb38tdYW9HtXTVDc27qEBTyeViYdWDK1Rgjt9928VOs=;
 b=XTn9La5iUFe+Z3H4818OQsfbdvBi/d+M46tXe1DFRFVGZ83FtxMhG3cD
 49DZd68GmjvVoohENbjhg08R29TL+/932wgxZvA+e+UGJi9L6z+8rdJ74
 X+K0B5DkHM9QERVhY9cZVR36c8I9rYmcHncvf7v0orCF2ofizwUYhqrNc
 OT1RiKL6u92dnVJ8siuPh5Jv/Q1y3C08Ong22VML9BBl+/vwRhuYBRqRh
 MBMdxzS7crce1KSMl96nSeHhiMROIdb8H1teJab/cHNb52tSBKOxDzqQz
 +/FNjA1ZJ6/xaxIOIrhsPXn1Sa6dJIZXnxF3TtvxY3TZnmDIe6okAF655 Q==;
IronPort-SDR: BiITcn/F98oYwTN570xZk0MNiy7VhTyILvBt+4qlyYAD4v8BpwPwtO1708fF6OSoTHTQxrwPvA
 Rqy5eflYthjsa6KPwGySFQucYTJoaoCA5Tw/bf1aZ2P/xmMCGMtBslHeigA0TLsRRJIoWhKDym
 9XZkW4vzJvleHVLdtggA9QYSc0toT+0WvqJ02JfHDRucDvbGngFVSpC2Ae99zpv4NiqyvjQwTq
 FpesMLFlSTo0BAkDh6nS0Ll2RgSZvGxHd9ywbt0fI0V9jXoRRB4q6oCpK5EMHmsVUqi01HzCEm
 MVs=
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="33384491"
X-IronPort-AV: E=Sophos;i="5.83,289,1616425200"; d="scan'208";a="33384491"
Received: from mail-sg2apc01lp2054.outbound.protection.outlook.com (HELO
 APC01-SG2-obe.outbound.protection.outlook.com) ([104.47.125.54])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 18:49:00 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZxSxNqcE7sO5i5y27cGhHu/VgzUlyY3w1/9+vAe/VuY9/PIJUMvBw55kLT4thcrTDyMFvjLogu3rLF3KKsxr6bdeMUiBhnmWuozQzbSTAgdtMnTXUkT/rAOa8nNyn7PSiEHUwvKItRK41KBEKm9rW5oBGmaVD52KSO88RB1oTb4SZEGl3eI7ZkhYdh/QdN7ki1p6Vgte9JuNyB6q/jBspw3QrdNYPve5W8gP+0zmDbwJRBVqcX+Sz+DAaI4fXnc2WtAfDTwlpWvdeVkhNM1w4gaf9nK7nXMoN5jGSM5SdDni9B1MC0N95rwAi/3fH4GtczJQqxaOrArp830ltePBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rb38tdYW9HtXTVDc27qEBTyeViYdWDK1Rgjt9928VOs=;
 b=bt5V76hHCl1I2hbbYPJ9uVUa/zPIWjEQmfAq2tZeJayDtN/OrRpfHG9W5ySB3vTS7YqHQqacchtUsP6R2gKC19ol+wvZXvwh0hO3gvj4EInn2inTQCNyB6VShBAcxk26z1mIm5V4DXF6/UJ/OneHsXX98nm2hKS8ZQR5cEfMEqn0Vdq3tkLKlc2dnwQ2ARtE2O/3TBDGdefC9j3Q/uwXZVSJ02pEidXqCHWFj5se4h906gQhgAMhuqdpPSGbhdyesl2J1vKj3vr2uW8oi4U6BntLNAm7w9fPcna+z6/EhFSvN6O71+GPdiYtfi+mmQHPXXJuPPGDGt3ct7Q0tnxriA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rb38tdYW9HtXTVDc27qEBTyeViYdWDK1Rgjt9928VOs=;
 b=N7X61L4fpJtTNLtNfEuQYTqzyj+oFvoKlj5sUotzK1NledwTDRfBoxmpw885oCl9BQQ7mePa+G9g/f8Dge4PkEFpsgNUerKyjWUFilzGrqZIuZxVoBk6K8ZGnuYN2uWLODBys7wcLVu0YhBk6ztB4PfrOp1YmQf7iFOKP9bMKpY=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB4571.jpnprd01.prod.outlook.com (2603:1096:404:114::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 09:48:57 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4%9]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 09:48:57 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH v1 2/4] syscalls/shmget*: Convert into new api
Thread-Index: AQHXRwwpzyqY+A1+/kSsod3vd4wLYKsaDlcAgARpBYA=
Date: Mon, 21 Jun 2021 09:48:57 +0000
Message-ID: <60D060A9.6080905@fujitsu.com>
References: <1620809541-6891-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1620809541-6891-2-git-send-email-xuyang2018.jy@fujitsu.com>
 <YMytkmBZb5zDBLGi@yuki>
In-Reply-To: <YMytkmBZb5zDBLGi@yuki>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30a5a88e-2fdc-4717-92a1-08d93499ca01
x-ms-traffictypediagnostic: TY2PR01MB4571:
x-microsoft-antispam-prvs: <TY2PR01MB45716CE5699D4F64A6A0E72BFD0A9@TY2PR01MB4571.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rgZ+uKBwZaevkfb6IZkuHjeiCDnF6nF+VoECkY0PFG6sNrXBRPlDfOfsc0GqF7j28GarAt5t0wWjA9CZelQ6m2xWFuS5+oIln2rrV7KmYEz9YUlMSjyGNrq/99bUz8clgu9xw3/uQOL5IaVlrohH1YfHqLIDE0qnjYkdgdfpvH1dP5TgcxA8M/Sn2dN2EIxOOxFqjI/4GBR3OgXVYYMpB/FLMcVtXzm4uwe3xEofb+QhfycKSjIrPYue+EapULlrfb6st9Zf//ZKxZuSZaU2HAaBKKXs+WwfiohnqhZ7KLCRYOZrHhsTXekTPpJxr70vIZNdRapkM2QP2c4H5aTofjXFki47iHzJchMFUlPCJpdVJY9xC0cNIfV77w4tAefPIk9UlU/KfFXmn+7DL8yHm2XC4wtv88vPjeYbvzRMKl87iTP6CpUd4W41SO9t+W8sJERqglikR0+vwzPV7ZfpgtpXzz4SlBVEjOL3UZzdnxsJoMa4M9zp2ljJYV4GzuupdfWgN0U6P5wUK/LgTG2ec3TucVNCbOYkOsIm76K1iIMHxYKBJn2naaRJcTYDqNkgUfDnDv8z8+6D050N1rErd4PLGM6vrul0Rh+xZRISBvKEkvKvUYiWMnBgeGeVE14aecebSxlV8yEit4c6PICBpw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(2616005)(91956017)(186003)(30864003)(2906002)(66556008)(478600001)(8676002)(8936002)(86362001)(76116006)(66476007)(6916009)(33656002)(83380400001)(122000001)(66946007)(64756008)(66446008)(5660300002)(36756003)(6486002)(4326008)(6512007)(85182001)(316002)(87266011)(71200400001)(38100700002)(26005)(6506007)(2004002)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?M09Qcm5xazFBcDRLcktaVUl1MEZhMWVqU0xWdTNlNS8wWEpWcDA3L29oZTdv?=
 =?gb2312?B?WjhXeWF1Zk9mRlFnZ1VxOXNvcGlzNlI0SStaMWUyc3A5d0FoYlgrdHJPL3Ay?=
 =?gb2312?B?WGNrd21zUytQbFJVazVXMmxsUWdNbEJYOFMrV2FRYlFSK25KOGFWVjZlQjJ5?=
 =?gb2312?B?b3NJSllzSjRqUVN1S2xkSURmUW1XWWNBT1lYanYvd3daYU5BR0VQNzRNSGJN?=
 =?gb2312?B?Tys1YTRMMW1WOHJNSENzc0Z3TDZKU2F2TWcwZjduNkthWXZ5OFg5L0dYRUFl?=
 =?gb2312?B?Tk1XMk5tQkpUck93M1FPZUVZcENyWSsyMUkwOFd5SVVVdUpFQzA2U1JlNHBl?=
 =?gb2312?B?QkM4UmxVa1VXK2twK09wMFJEbW5LakZNWFZQR1hoRFNsdXFCZFZJRWxzSXk5?=
 =?gb2312?B?U3VwS09Lamx4V1pKNGs0NklRdEJ2My95Wndmd3RRVWVPSDMyOHVWa3pvQXN4?=
 =?gb2312?B?ZDBrVHVJRHRPT0VnTzAwLzl1dXp1REpJV1pOU3RzenEvYktQV0VmS3B2VnNN?=
 =?gb2312?B?Q2owUmNqS2RLL2FmMFVRVGhKUUh3ZDB6WmdCeDhhTmxtSkZ3b0cxTDlmQUND?=
 =?gb2312?B?SGREMW90RFNkMnVqbmlRMkpMWGpxN2ROYTd3eFBUQjVBVFk2eVZha2ZtekE0?=
 =?gb2312?B?dFlpeUloZjVXT2h2S01BSVNjdWFKMGpseEx4V09yaXFGQUFFQVlZZTFZTmJi?=
 =?gb2312?B?QzN0SXJTRnNhb0REUUpVT2MzZUp3WVpPNFgzK0tMTmErWjUxRk1Jb2tZR3Ni?=
 =?gb2312?B?eXZMbTJ6R25ZV2pzUG14K1hzYmNtVDAwUTRrZWg3OUdqV2cxa1cvVHdvMCtn?=
 =?gb2312?B?L3RiWm5xc0hIMy80L3FTdk1pVytodmVOVmp1WkI0S0xXdmI0dHFuSGRhZVU4?=
 =?gb2312?B?QjZNbmgwdVZqVndOSTlUeUJvNG5hRllETmpEalgyTWZkbDNrdzEvWWsvZkNi?=
 =?gb2312?B?SnozWDZsc3FqYldEd3NnMGt0VW9Ec2d2WFV2cU9LTDZsMnNGQ0hsUGtWYTBY?=
 =?gb2312?B?NjcrS3I5ODVVOTlDRkc5dU9lUng5SzlXWm5ROHhaWXd4Sk4yVzE5L0R5a0pK?=
 =?gb2312?B?SVlLemVGa0VZVFVSdnRDd2E4UmVNMElNcEpVdWxJMkxjZGh1NGJ3OHJNU3ZZ?=
 =?gb2312?B?UDBHZmtHbkhxY0M3TU9DTXNicU5adkgyditLRjZXQnZmT1NyVnErKzJnSWJi?=
 =?gb2312?B?bDZ5TVhST3d6MHM3aEE1UWw1SFU5VStlZHRQd0M5cG1Edzg5QVQ2SlBwcjB3?=
 =?gb2312?B?YkYwNTY3a3JQYy9OT2tsMmxmelIzaTBhdVhtcmpaSFJtTk9ORXpUQytIZ1g1?=
 =?gb2312?B?ZjA5WURYQkFTaDZzc0l5RDh3RkZGTCt1MFl0bkRGcXp2Q0N0RndZWW5pcGFJ?=
 =?gb2312?B?TTJKWnl2QjZGSS9YNFU0d2s2YWNXYmRjSjFNb0hVVXRVdEFCZWJqc3JrZzht?=
 =?gb2312?B?R3Z0dy9JendicUpuNSt4VmdWeG5kZGlrZnFPZnl2eHgyOGpoZkUwdExGZXc4?=
 =?gb2312?B?cHEzUkNvVzJDOENVN2NWcUNJU3ArbjQyV1dSckg3SisrOEV4b1NkdlRXd1ht?=
 =?gb2312?B?UENVY0lPUGV2LzhXTXhjSFJaTC9OTUVqQnVKanhRblZLSGluclhqcCs2a3R0?=
 =?gb2312?B?MVJGNzJnbkgxdFZWR0YxWGtsQ08xV3VqYnYvQ2VHckpxM3lERk5CYjI0bkNt?=
 =?gb2312?B?VWM4dW1wQTlYaWZQOFNEK2Q0RDFDNlVUWU9wUDFzUENZRFV3T0RaOENJTUEr?=
 =?gb2312?B?Uk8xUSttN3pGU1BuZXRMWHNsZkdjRFNsbjlmb0RPQnA0WVJkbzdWcktWWlRw?=
 =?gb2312?B?U1ppS2F1elpFbUNMYktSdz09?=
x-ms-exchange-transport-forked: True
Content-ID: <73A6E736ED5EEA4CA717243E0E0ED1E2@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a5a88e-2fdc-4717-92a1-08d93499ca01
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 09:48:57.2391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W94HnmrJ3k84FRAMrqP1lxjVQj/nARPTqriqca8Afb6L7ugVeSEo3SgbOc1A6T82nVGNbN38b6/TwexM/GZAS9BS5aVJYg7CN5BdcAQcjlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4571
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/4] syscalls/shmget*: Convert into new api
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
Thanks for your review, will fix these comments on v2.
> Hi!
>> 1) merge shmget05.c into shmget02.c
>> 2) Use SHMMIN -1 and SHMMAX + 1 to trigger EINVAL error
>> 3) Use SHM_RD, SHM_WR, SHM_RW to trigger EACCES error under unpriviledged user
>>
>> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
>> ---
>>   include/lapi/shm.h                            |  14 +
>>   runtest/syscalls                              |   1 -
>>   runtest/syscalls-ipc                          |   1 -
>>   .../kernel/syscalls/ipc/shmget/.gitignore     |   1 -
>>   testcases/kernel/syscalls/ipc/shmget/Makefile |   4 +-
>>   .../kernel/syscalls/ipc/shmget/shmget02.c     | 243 +++++++-----------
>>   .../kernel/syscalls/ipc/shmget/shmget03.c     | 199 ++++----------
>>   .../kernel/syscalls/ipc/shmget/shmget04.c     | 193 +++++---------
>>   .../kernel/syscalls/ipc/shmget/shmget05.c     | 185 -------------
>>   9 files changed, 209 insertions(+), 632 deletions(-)
>>   delete mode 100644 testcases/kernel/syscalls/ipc/shmget/shmget05.c
>>
>> diff --git a/include/lapi/shm.h b/include/lapi/shm.h
>> index 61c4e37bf..bb280fc44 100644
>> --- a/include/lapi/shm.h
>> +++ b/include/lapi/shm.h
>> @@ -6,8 +6,22 @@
>>   #ifndef LAPI_SHM_H__
>>   #define LAPI_SHM_H__
>>
>> +#include<limits.h>
>> +
>>   #ifndef SHM_STAT_ANY
>>   # define SHM_STAT_ANY 15
>>   #endif
>>
>> +#ifndef SHMMIN
>> +# define SHMMIN 1
>> +#endif
>> +
>> +#ifndef SHMMAX
>> +# define SHMMAX (ULONG_MAX - (1UL<<  24))
>> +#endif
>> +
>> +#ifndef SHMMNI
>> +# define SHMMNI 4096
>> +#endif
>> +
>>   #endif /* LAPI_SHM_H__ */
>> diff --git a/runtest/syscalls b/runtest/syscalls
>> index 63d821e53..2dff25984 100644
>> --- a/runtest/syscalls
>> +++ b/runtest/syscalls
>> @@ -1402,7 +1402,6 @@ shmdt02 shmdt02
>>   shmget02 shmget02
>>   shmget03 shmget03
>>   shmget04 shmget04
>> -shmget05 shmget05
>>
>>   sigaction01 sigaction01
>>   sigaction02 sigaction02
>> diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
>> index ff0364704..b3bd37923 100644
>> --- a/runtest/syscalls-ipc
>> +++ b/runtest/syscalls-ipc
>> @@ -67,4 +67,3 @@ shmdt02 shmdt02
>>   shmget02 shmget02
>>   shmget03 shmget03
>>   shmget04 shmget04
>> -shmget05 shmget05
>> diff --git a/testcases/kernel/syscalls/ipc/shmget/.gitignore b/testcases/kernel/syscalls/ipc/shmget/.gitignore
>> index 6f08529f8..c57df68f5 100644
>> --- a/testcases/kernel/syscalls/ipc/shmget/.gitignore
>> +++ b/testcases/kernel/syscalls/ipc/shmget/.gitignore
>> @@ -1,4 +1,3 @@
>>   /shmget02
>>   /shmget03
>>   /shmget04
>> -/shmget05
>> diff --git a/testcases/kernel/syscalls/ipc/shmget/Makefile b/testcases/kernel/syscalls/ipc/shmget/Makefile
>> index 26b9f264d..b1201281d 100644
>> --- a/testcases/kernel/syscalls/ipc/shmget/Makefile
>> +++ b/testcases/kernel/syscalls/ipc/shmget/Makefile
>> @@ -3,10 +3,10 @@
>>
>>   top_srcdir              ?= ../../../../..
>>
>> -LTPLIBS = ltpipc
>> +LTPLIBS = ltpnewipc
>>
>>   include $(top_srcdir)/include/mk/testcases.mk
>>
>> -LTPLDLIBS  = -lltpipc
>> +LTPLDLIBS = -lltpnewipc
>>
>>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
>> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget02.c b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
>> index 4436ca7f8..a57904ce9 100644
>> --- a/testcases/kernel/syscalls/ipc/shmget/shmget02.c
>> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
>> @@ -1,184 +1,113 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>   /*
>> + * Copyright (c) International Business Machines  Corp., 2001
>> + *  03/2001 - Written by Wayne Boyer
>>    *
>> - *   Copyright (c) International Business Machines  Corp., 2001
>> - *
>> - *   This program is free software;  you can redistribute it and/or modify
>> - *   it under the terms of the GNU General Public License as published by
>> - *   the Free Software Foundation; either version 2 of the License, or
>> - *   (at your option) any later version.
>> - *
>> - *   This program is distributed in the hope that it will be useful,
>> - *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
>> - *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>> - *   the GNU General Public License for more details.
>> - *
>> - *   You should have received a copy of the GNU General Public License
>> - *   along with this program;  if not, write to the Free Software
>> - *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>> + * Copyright (c) 2008 Renaud Lottiaux (Renaud.Lottiaux@kerlabs.com)
>>    */
>>
>> -/*
>> - * NAME
>> - *	shmget02.c
>> - *
>> - * DESCRIPTION
>> - *	shmget02 - check for ENOENT, EEXIST and EINVAL errors
>> +/*\
>> + * [Description]
>>    *
>> - * ALGORITHM
>> - *	create a shared memory segment with read&  write permissions
>> - *	loop if that option was specified
>> - *	  call shmget() using five different invalid cases
>> - *	  check the errno value
>> - *	    issue a PASS message if we get ENOENT, EEXIST or EINVAL
>> - *	  otherwise, the tests fails
>> - *	    issue a FAIL message
>> - *	call cleanup
>> + * Test for ENOENT, EEXIST, EINVAL, EACCES errors.
>>    *
>> - * USAGE:<for command-line>
>> - *  shmget02 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
>> - *     where,  -c n : Run n copies concurrently.
>> - *             -e   : Turn on errno logging.
>> - *	       -i n : Execute test n times.
>> - *	       -I x : Execute test for x seconds.
>> - *	       -P x : Pause for x seconds between iterations.
>> - *	       -t   : Turn on syscall timing.
>> - *
>> - * HISTORY
>> - *	03/2001 - Written by Wayne Boyer
>> - *
>> - *      06/03/2008 Renaud Lottiaux (Renaud.Lottiaux@kerlabs.com)
>> - *      - Fix concurrency issue. The second key used for this test could
>> - *        conflict with the key from another task.
>> - *
>> - * RESTRICTIONS
>> - *	none
>> + * ENOENT - No segment exists for the given key and IPC_CREAT was not specified.
>> + * EEXIST - the segment exists and IPC_CREAT | IPC_EXCL is given.
>> + * EINVAL - A new segment was to be created and size is less than SHMMIN or
>> + * greater than SHMMAX. Or a segment for the given key exists, but size is
>> + * greater than the size of that segment.
>> + * EACCES - The user does not have permission to access the shared memory segment.
>>    */
>> -
>> -#include "ipcshm.h"
>> -
>> -char *TCID = "shmget02";
>> -int TST_TOTAL = 4;
>> -
>> -int shm_id_1 = -1;
>> -int shm_nonexisting_key = -1;
>> -key_t shmkey2;
>> -
>> -struct test_case_t {
>> -	int *skey;
>> -	int size;
>> +#include<errno.h>
>> +#include<sys/types.h>
>> +#include<sys/ipc.h>
>> +#include<stdlib.h>
>> +#include<pwd.h>
>> +#include<sys/shm.h>
>> +#include "tst_safe_sysv_ipc.h"
>> +#include "tst_test.h"
>> +#include "libnewipc.h"
>> +#include "lapi/shm.h"
>> +
>> +static int shm_id = -1;
>> +static key_t shmkey, shmkey1;
>> +static struct passwd *pw;
>> +
>> +static struct tcase {
>> +	int *shmkey;
>> +	size_t size;
>>   	int flags;
>> -	int error;
>> -} TC[] = {
>> -	/* EINVAL - size is 0 */
>> -	{
>> -	&shmkey2, 0, IPC_CREAT | IPC_EXCL | SHM_RW, EINVAL},
>> -	    /* EINVAL - size is negative */
>> -//      {&shmkey2, -1, IPC_CREAT | IPC_EXCL | SHM_RW, EINVAL},
>> -	    /* EINVAL - size is larger than created segment */
>> -	{
>> -	&shmkey, SHM_SIZE * 2, SHM_RW, EINVAL},
>> -	    /* EEXIST - the segment exists and IPC_CREAT | IPC_EXCL is given */
>> -	{
>> -	&shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW, EEXIST},
>> -	    /* ENOENT - no segment exists for the key and IPC_CREAT is not given */
>> -	    /* use shm_id_2 (-1) as the key */
>> -	{
>> -	&shm_nonexisting_key, SHM_SIZE, SHM_RW, ENOENT}
>> +	/*1: nobody expected  0: root expected */
>> +	int exp_user;
>> +	int exp_err;
>> +} tcases[] = {
>> +	{&shmkey1, SHM_SIZE, IPC_EXCL, 0, ENOENT},
>> +	{&shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL, 0, EEXIST},
>> +	{&shmkey1, SHMMIN - 1, IPC_CREAT | IPC_EXCL, 0, EINVAL},
>> +	{&shmkey1, SHMMAX + 1, IPC_CREAT | IPC_EXCL, 0, EINVAL},
>
> Can we please add the zero size EINVAL test as well?
SHMMIN is equal to 1, so we have tested zero size EINVAL test.
>
>> +	{&shmkey, SHM_SIZE * 2, IPC_EXCL, 0, EINVAL},
>> +	{&shmkey, SHM_SIZE, SHM_RD, 1, EACCES},
>>   };
>
> ...
>
>> +static void do_test(unsigned int n)
>>   {
>> +	struct tcase *tc =&tcases[n];
>> +	pid_t pid;
>>
>> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
>> -
>> -	TEST_PAUSE;
>> -
>> -	/*
>> -	 * Create a temporary directory and cd into it.
>> -	 * This helps to ensure that a unique msgkey is created.
>> -	 * See libs/libltpipc/libipc.c for more information.
>> -	 */
>> -	tst_tmpdir();
>> -
>> -	/* get an IPC resource key */
>> -	shmkey = getipckey();
>> -
>> -	/* Get an new IPC resource key. */
>> -	shmkey2 = getipckey();
>> -
>> -	if ((shm_id_1 = shmget(shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL |
>> -			       SHM_RW)) == -1) {
>> -		tst_brkm(TBROK, cleanup, "couldn't create shared memory "
>> -			 "segment in setup()");
>> +	if (tc->exp_user == 0) {
>> +		verify_shmget(tc);
>
> Just use the TST_EXP_FAIL() macro here instead, no need to reinvent the
> wheel.
Yes, use TST_EXP_FAIL(shmget(*tc->shmkey, tc->size, tc->flags), 
tc->exp_err, "shmget(%i, %lu, %i)",*tc->shmkey, tc->size, tc->flags) to 
replace.
>
>> +		return;
>>   	}
>>
>> -	/* Make sure shm_nonexisting_key is a nonexisting key */
>> -	while (1) {
>> -		while (-1 != shmget(shm_nonexisting_key, 1, SHM_RD)) {
>> -			shm_nonexisting_key--;
>> -		}
>> -		if (errno == ENOENT)
>> -			break;
>> +	pid = SAFE_FORK();
>> +	if (pid == 0) {
>> +		SAFE_SETUID(pw->pw_uid);
>> +		verify_shmget(tc);
>
> And here as well.
OK.
>
>> +		exit(0);
>>   	}
>> +	tst_reap_children();
>>   }
>>
>> -/*
>> - * cleanup() - performs all the ONE TIME cleanup for this test at completion
>> - * 	       or premature exit.
>> - */
>> -void cleanup(void)
>> +static void setup(void)
>>   {
>> -	/* if it exists, remove the shared memory resource */
>> -	rm_shm(shm_id_1);
>> +	shmkey = GETIPCKEY();
>> +	shmkey1 = GETIPCKEY();
>>
>> -	tst_rmdir();
>> +	shm_id = SAFE_SHMGET(shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL);
>> +	pw = SAFE_GETPWNAM("nobody");
>> +	tst_res(TINFO, "%d %d", shmkey, shmkey1);
>
> I'm not sure if this message is useful.
It is debug message, will remove it.
>
>> +}
>>
>> +static void cleanup(void)
>> +{
>> +	if (shm_id>= 0)
>> +		SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
>>   }
>> +
>> +static struct tst_test test = {
>> +	.needs_tmpdir = 1,
>> +	.needs_root = 1,
>> +	.forks_child = 1,
>> +	.setup = setup,
>> +	.cleanup = cleanup,
>> +	.test = do_test,
>> +	.tcnt = ARRAY_SIZE(tcases),
>> +};
>> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget03.c b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
>> index 96ebf3608..c74fe241d 100644
>> --- a/testcases/kernel/syscalls/ipc/shmget/shmget03.c
>> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
>> @@ -1,171 +1,68 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>
> ...
>
>> +static int shm_id_arr[SHMMNI] = {-1};
>
> The SHMMNI is just default value, it could be adjusted at runtime by
> setting /proc/sys/kernel/shmmni
>
> So we should ideally fix the test to read that value in the test setup
> and allocate the array based on the value.
Agree.
>
>> +static void verify_shmget(void)
>>   {
>> -	int lc;
>> -
>> -	tst_parse_opts(ac, av, NULL, NULL);
>> -
>> -	setup();		/* global setup */
>> -
>> -	/* The following loop checks looping state if -i option given */
>> -
>> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
>> -		/* reset tst_count in case we are looping */
>> -		tst_count = 0;
>> -
>> -		/*
>> -		 * use the TEST() macro to make the call
>> -		 */
>> -
>> -		TEST(shmget(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | IPC_EXCL
>> -			    | SHM_RW));
>> -
>> -		if (TEST_RETURN != -1) {
>> -			tst_resm(TFAIL, "call succeeded when error expected");
>> -			continue;
>> -		}
>> -
>> -		switch (TEST_ERRNO) {
>> -		case ENOSPC:
>> -			tst_resm(TPASS, "expected failure - errno = "
>> -				 "%d : %s", TEST_ERRNO, strerror(TEST_ERRNO));
>> -			break;
>> -		default:
>> -			tst_resm(TFAIL, "call failed with an "
>> -				 "unexpected error - %d : %s",
>> -				 TEST_ERRNO, strerror(TEST_ERRNO));
>> -			break;
>> -		}
>> +	TEST(shmget(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW));
>> +	if (TST_RET != -1) {
>> +		tst_res(TFAIL, "shmget() returned %li", TST_RET);
>> +		return;
>>   	}
>> -
>> -	cleanup();
>> -
>> -	tst_exit();
>> +	if (TST_ERR == ENOSPC)
>> +		tst_res(TPASS | TTERRNO, "shmget() failed as expected");
>> +	else
>> +		tst_res(TFAIL | TTERRNO, "shmget() failed unexpectedly, expected ENOSPC, bug got");
>
> This should be TST_EXP_FAIL() as well.
Will do it.
>
>>   }
>>
>> -/*
>> - * setup() - performs all the ONE TIME setup for this test.
>> - */
>> -void setup(void)
>> +static void setup(void)
>>   {
>> +	int res, num;
>>
>> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
>> -
>> -	TEST_PAUSE;
>> -
>> -	/*
>> -	 * Create a temporary directory and cd into it.
>> -	 * This helps to ensure that a unique msgkey is created.
>> -	 * See libs/libltpipc/libipc.c for more information.
>> -	 */
>> -	tst_tmpdir();
>> -
>> -	/* get an IPC resource key */
>> -	shmkey = getipckey();
>> -
>> -	/*
>> -	 * Use a while loop to create the maximum number of memory segments.
>> -	 * If the loop exceeds MAXIDS, then break the test and cleanup.
>> -	 */
>> -	while ((shm_id_1 = shmget(IPC_PRIVATE, SHM_SIZE, IPC_CREAT |
>> -				  IPC_EXCL | SHM_RW)) != -1) {
>> -		shm_id_arr[num_shms++] = shm_id_1;
>> -		if (num_shms == MAXIDS) {
>> -			tst_brkm(TBROK, cleanup, "The maximum number of shared "
>> -				 "memory ID's has been\n\t reached.  Please "
>> -				 "increase the MAXIDS value in the test.");
>> -		}
>> -	}
>> -
>> -	/*
>> -	 * If the errno is other than ENOSPC, then something else is wrong.
>> -	 */
>> -	if (errno != ENOSPC) {
>> -		tst_resm(TINFO, "errno = %d : %s", errno, strerror(errno));
>> -		tst_brkm(TBROK, cleanup, "Didn't get ENOSPC in test setup");
>> +	for (num = 0; num<  SHMMNI; num++) {
>> +		res = shmget(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW);
>> +		if (res != -1)
>> +			shm_id_arr[num] = res;
>>   	}
>
> So we attempt to allocate SHMMNI shared memory segemnts and the last
> call will fail.
>
> I guess that we can as well attempt to allocate SHMMNI-1 segemnts and
> expect them to all pass. I do not like ignore any failures that may
> happen here and cary on with the test. It would be better to TBROK here
> instead.
>
Sounds reansonable. Will do it.
>> +	tst_res(TINFO, "The maximum number(%d) of memory ID's has been reached",
>> +		SHMMNI);
>>   }
>>
>> -/*
>> - * cleanup() - performs all the ONE TIME cleanup for this test at completion
>> - * 	       or premature exit.
>> - */
>> -void cleanup(void)
>> +
>> +static void cleanup(void)
>>   {
>>   	int i;
>>
>> -	/* remove the shared memory resources that were created */
>> -	for (i = 0; i<  num_shms; i++) {
>> -		rm_shm(shm_id_arr[i]);
>> +	for (i = 0; i<  SHMMNI; i++) {
>> +		if (shm_id_arr[i]>= 0)
>
> This is actually not correct, since there are possibly zeros in the
> array (just because it's global variable and only first position is
> intialized wiht -1) and we could incorrectly attempt to remove sement
> with id 0.
>
> I guess that the cleanest way how to handle this would be having global
> counter for the number of created semgents:
>
>
> static key_t *keys;
> static unsigned int max_key;
>
> setup()
> {
> 	...
> 	keys = SAFE_MALLOC(sizeof(key_t) * shmmni);
> 	...
>
> 	for (;;) {
> 		if (max_key>= shmni)
> 			break;
>
>
> 		keys[max_key] = shmget(...);
>
> 		if (keys[max_key]<  0)
> 			tst_brk(TBROK, ...);
>
> 		max_key++;
> 	}
> }
>
> cleanup()
> {
> 	key_t key;
>
> 	for (key = 0; key<  max_key; key++)
> 		SAFE_SHMCTL(keys[key], IPC_RMID, NULL);
> }
>
>
>
Yes, Will do it in v2.
>> +			SAFE_SHMCTL(shm_id_arr[i], IPC_RMID, NULL);
>>   	}
>> -
>> -	tst_rmdir();
>> -
>>   }
>> +
>> +static struct tst_test test = {
>> +	.setup = setup,
>> +	.cleanup = cleanup,
>> +	.test_all = verify_shmget,
>> +};
>> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget04.c b/testcases/kernel/syscalls/ipc/shmget/shmget04.c
>> index 60a263c77..fe611b306 100644
>
> ...
>
>> +	tst_res(TINFO, "%s", tc->message);
>> +	TEST(shmget(shmkey, SHM_SIZE, tc->flag));
>> +	if (TST_RET != -1) {
>> +		tst_res(TFAIL, "shmget() returned %li", TST_RET);
>> +		return;
>>   	}
>> -
>> -	cleanup();
>> -
>> -	tst_exit();
>> +	if (TST_ERR == EACCES)
>> +		tst_res(TPASS | TTERRNO, "shmget() failed as expected");
>> +	else
>> +		tst_res(TFAIL | TTERRNO, "shmget() failed unexpectedly, expected EACCES, bug got");
>
> TST_EXP_FAIL() here as well.
Will do it.

Best Regards
Yang Xu
>
>>   }
>>
>> -/*
>> - * setup() - performs all the ONE TIME setup for this test.
>> - */
>> -void setup(void)
>> +static void setup(void)
>>   {
>> -	tst_require_root();
>> -
>> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
>> +	struct passwd *pw;
>>
>> -	TEST_PAUSE;
>> -
>> -	/* Switch to nobody user for correct error code collection */
>> -	ltpuser = getpwnam(nobody_uid);
>> -	if (setuid(ltpuser->pw_uid) == -1) {
>> -		tst_resm(TINFO, "setuid failed to "
>> -			 "to set the effective uid to %d", ltpuser->pw_uid);
>> -		perror("setuid");
>> -	}
>> +	pw = SAFE_GETPWNAM("nobody");
>> +	SAFE_SETUID(pw->pw_uid);
>> +	shmkey = GETIPCKEY();
>>
>> -	/*
>> -	 * Create a temporary directory and cd into it.
>> -	 * This helps to ensure that a unique msgkey is created.
>> -	 * See libs/libltpipc/libipc.c for more information.
>> -	 */
>> -	tst_tmpdir();
>> -
>> -	/* get an IPC resource key */
>> -	shmkey = getipckey();
>> -
>> -	/* create a shared memory segment without read or access permissions */
>> -	if ((shm_id_1 = shmget(shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL)) == -1) {
>> -		tst_brkm(TBROK, cleanup, "Failed to create shared memory "
>> -			 "segment in setup");
>> -	}
>> +	shm_id = SAFE_SHMGET(shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL);
>>   }
>>
>> -/*
>> - * cleanup() - performs all the ONE TIME cleanup for this test at completion
>> - * 	       or premature exit.
>> - */
>> -void cleanup(void)
>> +static void cleanup(void)
>>   {
>> -	/* if it exists, remove the shared memory resource */
>> -	rm_shm(shm_id_1);
>> -
>> -	tst_rmdir();
>> -
>> +	if (shm_id>= 0)
>> +		SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
>>   }
>> +
>> +static struct tst_test test = {
>> +	.needs_tmpdir = 1,
>> +	.needs_root = 1,
>> +	.setup = setup,
>> +	.cleanup = cleanup,
>> +	.test = verify_shmget,
>> +	.tcnt = ARRAY_SIZE(tcases),
>> +};
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
