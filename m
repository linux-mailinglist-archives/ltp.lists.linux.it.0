Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AA6399D0E
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 10:49:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 796B13C7FFA
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 10:49:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 749AC3C288E
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 10:49:25 +0200 (CEST)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com
 [68.232.151.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0198D600435
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 10:49:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1622710160; x=1654246160;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Bi6KAIOXafYcwJS//2LQKtaOIL5nMgw6mCyx3vmNXAY=;
 b=vLcOeEJKyQ0H31TpsTJWHWxjj7x5ZzxewpahWHNG74va+nTGSx6S9jIr
 SzmEr1psfPyaE48qgfjgeiOEwuCjvqhJHyVNpcCrNTKGgYfYIqdcYpIGX
 ZXxBwj0k8jrKeYvlOGpdml318lfH2CzWlUkPsmneVXsKDOGaPWbDvi3+b
 1UJmw3Te6Kf2HtZe4VPmsAgtjGsZV2JUyAi9GZVUscjSVNLzxG98wfUIO
 GQ28KCUXM9bRiUdcPm8XmbgDeJw2+0CX3xyUg/DjDhdkU1tmVOU7YM4ty
 Q/evdJ1FDwckdc5AtZRunU26RIFdjhOHSjiJqNbFhTJHR2IfZLqqn7r9u g==;
IronPort-SDR: xxubInr65bldaiB0HRFmGd/HDYZVX0Dnw9Kg/xfhvDHt6yXUBSDCyFFxUrCcwOS0rGYTHKqvL8
 I7fhFeolZUgEc5xRd/P7MPepq+xRii6X3qS2C9iMfeQtczDkKIM7cLRcKwGSBnUrqoBkcg/Avr
 BEx9s46I55sUN3gnDqzlW+p+YjL+Zp36vrjlEvcS8FPu13R+eGOzcnIRC42UmSN+LemEoHALh3
 2HK+BAROphMQnTnSjpCiPKLqg5zWEAvlLQexg1e9vV/9Ys9TlcsOuj5c5RogJNK4vhgl5bwHJU
 tZg=
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="40546064"
X-IronPort-AV: E=Sophos;i="5.83,244,1616425200"; d="scan'208";a="40546064"
Received: from mail-ty1jpn01lp2056.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 17:49:17 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JF63bqNNdWmqyRf+AVt9e5PBqz3a4x5WHsnXiYwkimdZYkCHiV2G7VumWnlGdLS7kLgCFtj9XQT9ljBCdYqpD4i1u433xNovFpvIcBQFqHQ4aPXJuLA2Zzy2ssqFl0nD6YtK00oFwGdZ+HgW/v8pqL3ADzbKA/xrOz+oI95ODMz9248dkNwdR/kfVBurrtTkjWSYpXqQXB9mehqiDl2RpnXdADpOSeYMC6iHROmCkhTZVfbM+uQMjb3Mb1zZNCM2u3xgmGqy9WXR6sCPOn+lnatVjZNBIIk8hAyXi8/7kXbBgOKPDy2BSs6P9wWsYUv3s+gDYreBLvYcOKwnnBvWgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bi6KAIOXafYcwJS//2LQKtaOIL5nMgw6mCyx3vmNXAY=;
 b=fw1z60tFvWicuwduLfMHLLfJbejkOT6l+AhdCJzddkTBWPPeeq43We9+oheOr7LI6dHFaAnDU3izbcQ4E1I0ShahkY2RDoNu33fev961HAWwk7pxquozPLp+3ClHVKTpSFKx9ziAiVyRzNKRfqqqbyLExR66/75wot6aqy/CWYOqmgJsbYTYgGMcCto+6MN7Wcy6d/TfNcg5rj0kwpWma3ME0BklKV4MUJkF7MUZ9RwzYrVk2afyjE5AxO3iQAMdlGlUa4ep8v+70w3bNuS2hukP2ArEr8iUV5qm4Qluam1CIyejcil6THVcj5MpFOYKHNTrvx4RYHjR1cJfXDqX/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bi6KAIOXafYcwJS//2LQKtaOIL5nMgw6mCyx3vmNXAY=;
 b=XJma3G2GQ6iDuAonrQMHFUNku9Rzs5OLnGXoA4MZdz4XtNf4VX1gim/DKHj2PqI8FsMufb8AmtuS8VCbfP8Xw4Y5NJL7KEBSLJd/ikqDsP8bQUDj6CwNF0j8FBC/konv3x2BfkyNxsO1MDF5pTXT++tXx/JLNGahv0JYB7Jnux0=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYCPR01MB6077.jpnprd01.prod.outlook.com (2603:1096:400:61::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 3 Jun
 2021 08:49:14 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531%6]) with mapi id 15.20.4195.022; Thu, 3 Jun 2021
 08:49:14 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH] syscalls/mallinfo201: Add a basic test for
 mallinfo2 when setting 2G size
Thread-Index: AQHXQxLYuwYu75fLsEurYtw0zu2Ei6r0IyYAgA4Bi4A=
Date: Thu, 3 Jun 2021 08:49:14 +0000
Message-ID: <60B897B1.6050800@fujitsu.com>
References: <1620372638-25690-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <YKzX7FPWGGROn6kR@pevik>
In-Reply-To: <YKzX7FPWGGROn6kR@pevik>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b490a5da-d601-4d19-c7e3-08d9266c773b
x-ms-traffictypediagnostic: TYCPR01MB6077:
x-microsoft-antispam-prvs: <TYCPR01MB6077F215D94A64E09038F891FD3C9@TYCPR01MB6077.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rDe2N/OzqYh84FEcF3kJGQiRbRE+zu4d1X7IGdPEal9H/VhfEhwxfE3jvuFtRhYBr0n3nGxZJerL+OyqM3Fy+o32ROwAjSh5V/4HwxTflOXc5JKknBJKdtAT3pIIF/qxdcP7DWzK6Y8qdy4z8W+va/HxF6D/3tTOH79VbDxh9Bfo8K6Umu2kt0lR9xOHbGBe5X1CjklfXU2K+RlfygqBpOqL7ceU/HupgyE/P4pTCGRuCgB1IOol+TuFx4WFgaRwebM+l2Yq2JqdgeeRu/+isiZ9da3W8OrQOWFwGruWfAvSkwbnDiFuehq78eIH5tE7pQGOjRPlTyrrqRdvdcDh7PcmIpSDZ7TAUG7dMiiIqAfW6oAM+KBtkk05pb64quyLqy4AcN9nAazmzc/8nh9bK5Ulc/CU/qMagkBePNTT1oPlZjIl92AC4qiMvvH+G5sthmuZn3zoHPkhpt3IXd/Boh2+/ywg6Nx8E1nflAkGxvwxYWcOm0wHu4GuNcjW+D2Jw5Sps1ANc8gmaxpYCx8lkLzjIA/SKnP0degQiMswVWiVtH2mtVf6iO6KDv3ttpJ1Z9FYiQXvedElVdEP6AWHZ0D/A+/Mo+3P7HJ2fPnRYThdR6OFMVAg7wRZC+t3P2r+4ok7f2VUl4b8IO3WBnmaFg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(76116006)(91956017)(6512007)(5660300002)(6916009)(2906002)(71200400001)(64756008)(66446008)(66556008)(66946007)(6486002)(85182001)(66476007)(33656002)(86362001)(83380400001)(186003)(478600001)(26005)(4326008)(316002)(87266011)(36756003)(6506007)(2616005)(8676002)(8936002)(38100700002)(122000001)(2004002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?SlVMNzJ5MXNZMjg1REJZODhFaW9uWDl2WTN5NHFVL1d6bWJNcy9XMlJMT21J?=
 =?gb2312?B?NHczMkNWNWNtUVRPb01oWFpNVzI4bXppTmFmcXMxY2xKL3dCbHQvNFBIM2hy?=
 =?gb2312?B?dExmdkgzeCtMRFU1RWFRUXVmWU95Q0FGcTRHM3JoN084MDdFeFgzMnBZN0Z2?=
 =?gb2312?B?WnJjR1pOb2ZEQzRJbW9xbWNkdjgxOVJPKzk4M0ZqUHdWVnFDbTdRNGcxdXZm?=
 =?gb2312?B?U2JmbXg2bkFBZDI3NnRjcmpBS2syd1VDaUxXbE9sQTRiYkZZUDFuaGQ0akpt?=
 =?gb2312?B?V2hndmMrRzVmMC9QMGRncEVKczRTYlRCT1BaYW9zWFgxblM4TjI2VXAxT1k1?=
 =?gb2312?B?VVRlS3FBaEd1MDZidThjRVNJUTJJaG94Z3FvYzcrVCtKOWpwbnNSWUROTFVj?=
 =?gb2312?B?alp2WG9NWjc3b2ZkUVJ6RDh0UlYxTkYraithRmpJeDZ6dVEyakhSVEpHSVV6?=
 =?gb2312?B?TlMzK2I3UWFrSHpzeUlHeUV3Nm9HV0FlSGsySzJpYUZacjFnUFZFZ2dBWEQw?=
 =?gb2312?B?dkZYRGRFc2tRSFlxQTJkamRpSXNRWFFPanQwbWxMWnFLK0FXT0xnRmlyMmhG?=
 =?gb2312?B?Zm1aS05SMW9ZN28zRmFQNFFuSS9zSW16b1BTc3k2ZWlvMENFSEIvRGtEQ25O?=
 =?gb2312?B?VVFzbVJOczNHVmxQNnpDOHdlQW1ySHBvTkNrOHNoYWF3RVZvN3hTOXgwdXR6?=
 =?gb2312?B?M1EwQ3RqdHJmbzhzRzlYWVMzNmU5MCtGSVFvU2VYU3hEQWVmNjNKbmI4R2Jk?=
 =?gb2312?B?RGVxeVhOSHN6Vk1XNkVQRmcwUXNwSmRxbDBReEUwN2xxUTBFalcxM0sxWjlY?=
 =?gb2312?B?Z3AzOW8xV2hrN1R4aFYwRmVlZWt6dUJ6THREVzZxN1JQbk4zTkNMNWVNN1dG?=
 =?gb2312?B?enE0dU9Sa2NMRDl2eXBPRGcyOTdMSndnRVhmZ0Z3L2F4SnlhTVgzbGtRbXNU?=
 =?gb2312?B?Z0RiMHM0UDNGUVdWZGtlZGczam1qdDV4Q3pOc1NyZXFOdFJCZUVGbkRHM0ZH?=
 =?gb2312?B?Wm5YWHlJMXMyZGxBZGZaR3pTZ0wxVnhRTkVwMDhpdE5FMUhkc0QvTWtYWVo4?=
 =?gb2312?B?b2VLb2pBRXp2OEROYmJWdDZlZnI4VU4zZHluL0xieHVKTEkyUU9RQzZWMUFo?=
 =?gb2312?B?TkJObm5NbVJOTHZUYzhFbkU2aloxK0wrYzBLcCtqMGt6WjM4VFZIaHpwc1lv?=
 =?gb2312?B?cWVoZEhBalduQTNsUmlsMVJhdlg0eWdFa2s0RVdodjVzQkF1aHBQRE9YNTJ1?=
 =?gb2312?B?azltcU9nWGZEM3lqUmlGRnlKdHp6a1o4VEk5Nys3Rnk2cllKK2VzRDFZN3RR?=
 =?gb2312?B?Wk9CK1Bjc0YxdjlUd0JXeW9nVFNhendNVnNhQXU4ajNhRDRPT25kOVl1UFZX?=
 =?gb2312?B?Ym5UTUtjTjRYdXlFeldzL1diYnA2K0pHcXA0cUh5YU5lYTFsenNqS0hKbC84?=
 =?gb2312?B?SGk0WHB6dk9kYkdHMnFpUHlCdFVkaFdPWkJldlFydWRuUUk3MUlvY1JnbXlt?=
 =?gb2312?B?VGpQOVBmZTdSQWJZWXpISGlvTCtoMkZCN1huc2gxcEE1eUxGWGpjaG01a3VV?=
 =?gb2312?B?emZPWXk4eDE0YzlzRG1KZHdNRE5WdkxIMkgxNWQ1a2N1ZjJJeURSdXVLSXZk?=
 =?gb2312?B?Z0RyL2pLV0ZFOTcrYWNoOVRJMUhJN3ZsTFFNR1ozcng1Z2JabTdHaFBFeHcv?=
 =?gb2312?B?MjIyQmJnNlFXcHVjOVRDVDBrTEhmNTdKdmkxcmdHZzJMbldtKzMrWTBqenk0?=
 =?gb2312?B?ZmVzTmdKVnc1YTRFRFZ0cXl4OGhyK2JEQU56ZkxIb0ZyUlBJRWhDTjFPZ1JW?=
 =?gb2312?B?MzBHTTRSWWM0OG9yVXZXQT09?=
x-ms-exchange-transport-forked: True
Content-ID: <7CE95D9F8EFCDE4E9F4B823E551761E5@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b490a5da-d601-4d19-c7e3-08d9266c773b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 08:49:14.7295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xCaPMiQEBZU0i7bwS+RrcUHOyN5FuZLevzt+HZYRzyDfoUAA+ji/iBmLu/AT4AltSAm5b4XYrk5KxrIRJ4EWi+A79UsDKzc/A4rp/1Q1lAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6077
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/mallinfo201: Add a basic test for
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
Sorry for late reply. I am busy recently.
> Hi Xu,
>
>> Since these members of mallinfo struct use int data type, it will overflow
>> when allocating 2G size. mallinfo() is deprecated and we should use mallinfo2()
>> in the future. So we test mallinfo2 whether works well.
>
>> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
>> ---
>>   configure.ac                                  |  1 +
>>   runtest/syscalls                              |  2 +
>>   .../syscalls/mallinfo/mallinfo_common.h       | 18 +++++++
>>   .../kernel/syscalls/mallinfo2/.gitignore      |  1 +
>>   testcases/kernel/syscalls/mallinfo2/Makefile  |  8 ++++
>>   .../kernel/syscalls/mallinfo2/mallinfo201.c   | 47 +++++++++++++++++++
> nit: Maybe rename test: mallinfo201.c =>  mallinfo2_01.c ?
> Now it looks like mallinfo() 201st test.
Agree.

>>   6 files changed, 77 insertions(+)
>>   create mode 100644 testcases/kernel/syscalls/mallinfo2/.gitignore
>>   create mode 100644 testcases/kernel/syscalls/mallinfo2/Makefile
>>   create mode 100644 testcases/kernel/syscalls/mallinfo2/mallinfo201.c
>
> ...
>> diff --git a/testcases/kernel/syscalls/mallinfo/mallinfo_common.h b/testcases/kernel/syscalls/mallinfo/mallinfo_common.h
>> index a00cc7a64..e7737b270 100644
>> --- a/testcases/kernel/syscalls/mallinfo/mallinfo_common.h
>> +++ b/testcases/kernel/syscalls/mallinfo/mallinfo_common.h
>> @@ -28,4 +28,22 @@ static inline void print_mallinfo(const char *msg, struct mallinfo *m)
>>   }
>>   #endif
>
>> +#ifdef HAVE_MALLINFO2
>> +static inline void print_mallinfo2(const char *msg, struct mallinfo2 *m)
>> +{
>> +	tst_res(TINFO, "%s...", msg);
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
> BTW did you copy this from glibc? (and previously in 7eb7a97a1)?
Yes.

> Code is similar as that one in malloc/tst-mallinfo2.c in glibc,
> which you modified.
>
> I guess we should also add glibc copyright to mallinfo_common.h
> Copyright (C) 2020 Free Software Foundation, Inc.
> (+ probably keep our)
I will add glibc copyright.
>
> ...
>> diff --git a/testcases/kernel/syscalls/mallinfo2/Makefile b/testcases/kernel/syscalls/mallinfo2/Makefile
>> new file mode 100644
>> index 000000000..044619fb8
>> --- /dev/null
>> +++ b/testcases/kernel/syscalls/mallinfo2/Makefile
>> @@ -0,0 +1,8 @@
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +# Copyright (c) International Business Machines  Corp., 2001
> Here should be your or LTP copyright with 2021.
>
OK.
>> +
>> +top_srcdir		?= ../../../..
>> +
>> +include $(top_srcdir)/include/mk/testcases.mk
> CFLAGS += -I../mallinfo
> (see description below)
>
>> +
>> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> ...
>> --- /dev/null
>> +++ b/testcases/kernel/syscalls/mallinfo2/mallinfo201.c
>> @@ -0,0 +1,47 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
>> + * Author: Yang Xu<xuyang2018.jy@fujitsu.com>
>> + */
>> +
>> +/*\
>> + * [DESCRIPTION]
>> + *
>> + * Basic mallinfo2() test. Test the member of struct mallinfo2
>> + * whether overflow when setting 2G size. mallinfo() is deprecated
>> + * since the type used for the fields is too small. We should use
>> + * mallinfo2() and it was added since glibc 2.33.
>> + */
>
> I'd format it a bit and remove info which is not related to the test and people
> can find in man page.
>
> /*\
>   * [DESCRIPTION]
>   *
>   * Basic mallinfo2() test.
>   *
>   * Test members of struct mallinfo2() whether overflow when setting 2G size.
>   */
>
Looks well.
>> +#include "../mallinfo/mallinfo_common.h"
> Please use
> #include "mallinfo_common.h"
>
> and add include path to to Makefile
> CFLAGS += -I../mallinfo
>
OK.
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
> BTW sometimes I wonder if we should have something like SAFE_*() functions which
> would result with TCONF, not with TBROK.
IMO, I don't want to add a flag in SAFE_* functions to control return 
TCONF or TBORK because it is clear enough now. Other maintainers may 
have different option. But Now, I want to keep it.
>
>> +	info = mallinfo2();
>> +	if (info.hblkhd<  size) {
>> +		print_mallinfo2("Test malloc 2G",&info);
>> +		tst_brk(TFAIL, "The member of struct mallinfo2 overflow?");
>> +	}
>> +	tst_res(TPASS, "The member of struct mallinfo2 doesn't overflow");
>> +	free(buf);
>> +}
>> +
>> +static struct tst_test test = {
>> +	.test_all = test_mallinfo2,
>> +};
>> +
>> +#else
>> +TST_TEST_TCONF("system doesn't implement non-POSIX mallinfo2()");
>> +#endif
>
> The rest LGTM.
Thanks for your review. I will send a v2 patch soon.
>
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
