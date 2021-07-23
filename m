Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDA53D377B
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 11:15:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA0623C6908
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 11:15:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7FDBE3C58FF
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 11:15:45 +0200 (CEST)
Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com
 [68.232.156.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CAFE2200FCE
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 11:15:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1627031746; x=1658567746;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rLrva8pXhUuOGIMgcmCJN8nbfmWe8psyf0+cTEF/8UY=;
 b=bYTmU935fM31mn/Nj8vPBE6os+uJY+QW5kqfHQjGz8aB1MJ81sD8F+I3
 3QM9equZlNnvxt1s33BZute7+DVCmkl9/DcVFB7UchsaNrQObpMgoqDj+
 xLy6fgwkPFQUQONx010Nz4WX0SSB7HzNI86C6Xkiy1BOQOVeBLSyeREvC
 hSnD7feUVWUwcexvUl/rj0n+jldqnt1m+pJCLcH6FTzvK05gwqD11Tyof
 ZNizEuAWgK9C+1jT3klIm7gARy+8M7/72Sc8oK+wLdoKeDbU76smZFtPe
 JqZBj+uxteoJBMgYDfI4oWlmz5VLhXhk6eRGrZl9SqSAgS6k/fvG2pRoi g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="35351300"
X-IronPort-AV: E=Sophos;i="5.84,263,1620658800"; d="scan'208";a="35351300"
Received: from mail-ty1jpn01lp2059.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.59])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 18:15:44 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TimJtpcLrGEEofT83sMDpy9PvJSlPZwnrmaJ/yk0NwObz2VAUf7UR2sKs7+mvb6vTeL5++UQToloB/9+Sm7JWCBY/T+W0gSQOrWIKaDP+oTyZj26lI1hTcazeFEUHzFjZ0rzqPU0VRgVKEypmOxJ/7CZeHm/FoOINpavIOGJKMlOs9+TJa+hiaeSkosMZbgkhODwIonbdfPAyoLuxMlselpnw1BkSBDnr5fJQJnrUvGbhjU+l/I6G/AqVoHm129J1cTIefSL+GrFv/zqXg1hNZH3vDPkk35t01CWfjkF8itszYmwK+fJmpxjbO6Ymn5HsdhXA05izqx908UoDJARqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLrva8pXhUuOGIMgcmCJN8nbfmWe8psyf0+cTEF/8UY=;
 b=UgfFPQP2LjDscymc6V3gahb9gkwhchZhBMsB2OCD43d/D8u6RG9dt0m+z/Hc7mGoPEowK/mZ8yyUjiPaOJ3TS2vOzKVbT/jbqjF6ZFbrBTpzHqs63SSUjcxVJf/Nk/AjJlu5C7gGonBUqi0pRS3OFvFPxC6C5lSUGoDC0H6rlFuVs7Nqg3kfowETuhpjnSJbMIurTSpzP/oCaT2othxa0jgicrYLt1z9KX36+Yv4rQKyK/dwNLw2gS5PzAvgzLkw/x9V/1mK8pTBCqsqgZ2X2RJIwnbMlHRiBaGWWFzZeWZ+Pm4RvBBQ4ZDh70FbtbFqhWBXxA4sYQf3CxsynAfnog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLrva8pXhUuOGIMgcmCJN8nbfmWe8psyf0+cTEF/8UY=;
 b=liKvjEk+gm53NbSm6bfWY450g1RYOEtPCkRJHJb5nQn3XIIRiEUqYhU+yHDYQiPAerBCX6v1LoRXiUR1DpCHwGPVNsGG9RLLXSrrXFbR8eYcySf8iQ5FGBLvQSIrzCP4oDcIhV2r+AMb4OCG4uEQSIuShgfXTxWtfN7EYmfdtB4=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB4094.jpnprd01.prod.outlook.com (2603:1096:404:c0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Fri, 23 Jul
 2021 09:15:40 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 09:15:40 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH v1 4/4] syscalls/shmget06: Add test when the id of
 shm_next_id has existed
Thread-Index: AQHXRwwwTBPLpF/oyE6D/Dssfe4yZatPVm0AgAFiNIA=
Date: Fri, 23 Jul 2021 09:15:40 +0000
Message-ID: <60FA88D5.7050308@fujitsu.com>
References: <1620809541-6891-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1620809541-6891-4-git-send-email-xuyang2018.jy@fujitsu.com>
 <YPlftOtF7QxjjDnX@yuki>
In-Reply-To: <YPlftOtF7QxjjDnX@yuki>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 710e8afb-d70f-41b7-b848-08d94dba70ca
x-ms-traffictypediagnostic: TYAPR01MB4094:
x-microsoft-antispam-prvs: <TYAPR01MB409435883C12102EA5B1F77AFDE59@TYAPR01MB4094.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 37c1IzsV4T3mijntZ6V46bgpT2UHyIpT72+kcyXj50qxS3JWfskZuBw5eh1OdusdKPEF5lkhMMbNUOf05x+06D/rDF2cXOT9GIKon5dxkDwaa/V3IlnohyXtnygsfXehr/wMAASChtobA2vsQp/WB9XxEXIjV+YJAyxnGd9YkrIfB/+eBYPqANkr/j+6GUpMaBe8GLojZB6X971AY/iYxlemLzkQyKVoquBnz1N4J/YfDjQDGa8aqj18OIYdZnXOcbUX3CeKlMP1NqOAwhiqcfNaYbV4Q4FWHUFMfPi9kQZe79PvelzUfrF1xsc6waVupBcgARw0KsVbQItSCB9lF8B18EzDPbTV8aqGHS0sEdkBE+iNer/eOgsrU5RiA9WPzTaGXXEbcse8GMecggV11g1J+WwSmuK1SVSZZU+DTo5tjqaAIgRg9AVfjSgvTQSbbO4eZ9kRqrQMfV8FR0/WL5oOFPkm6DAlex2Zs1DpklhqRNG3sR3FFQJqgWoEpTPfx+SUUBfYaCNutmYlOqBSAqtnwDto7tzHA7CDcMBDhoTO2bC4lmv4IYb0fU+d4AuKuDO3lcVZQSR6XxGoJvEBrCdqDYAu18FlWUMkwqYdd612FCEuOpgwPrFllh+qc9j+vh9g40grTWV4RSWFrkkWVtMStT/qHtpHWjQxIOD+BDbEQzmYylnYy1kxYhzyffamffZuiFdftUJMZXlPVMsc8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(33656002)(36756003)(2906002)(6506007)(83380400001)(8676002)(4326008)(76116006)(91956017)(122000001)(86362001)(2616005)(6512007)(26005)(64756008)(5660300002)(38100700002)(66446008)(316002)(186003)(66556008)(478600001)(85182001)(66946007)(6916009)(8936002)(6486002)(71200400001)(87266011)(66476007)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?bWYvYVYzZFprV1JMSzVKdHlXaEIvS1NINWVCNGF0N00xOTFGSVlIbXNXdUNX?=
 =?gb2312?B?NkVEalJ3RGFxK0UxclJyQ3lGWUw2dVE0LzhOc3djSFlTbGJCSXBreGtjb1Vy?=
 =?gb2312?B?eXVodTJnbHJDbXVzdU1jZlpWYTRjQmtXYk1OaFJFRmxsYmZDWjZhb1N5Ym1n?=
 =?gb2312?B?aFhUYVUvTEc0ZE50T3ZNT21qZU1nYlZySnorSzdmNDA1OXZjQnEyNUlSb2hN?=
 =?gb2312?B?M1BDeFlvUyszSmVLVnJqUzRqYk9WMkZPKzNNWGhxQ2xVd3AxdVdnODhzdHRD?=
 =?gb2312?B?U1BwM3ZPRWJJMXVyZHNNNjc1cHpFUEpYMnN5ZFZtU3pES2JOTWo3YnM2ZEpx?=
 =?gb2312?B?cnVzRW9jMnhjTmdIZ2VqMjhaNnd3K1kxbXVpbEVXM1pYTnBOSlZJWEdEYkU1?=
 =?gb2312?B?d3hCSWxGZ25MeEhRT2IyY2pHcG45b1hiMzV2a1lFclVRTlprOEJkZW1XYmVk?=
 =?gb2312?B?Nm1HMFI0SlIvSEhObnV3cDk4THlOSzJuN1prRmpxc25pZ3V3djMvVmkyQkRZ?=
 =?gb2312?B?ZXdqWVNvMWN4eVVwRU5kU2RpLzlraE5SRG5ScWdHRkttbWtXcjdtd1FyL1Nw?=
 =?gb2312?B?cS9Nb2JHdlRaSTU2NmsxTlV1Vk1PM3paYUJNSjJEdUhXZlFEcEFlMUpxTmdW?=
 =?gb2312?B?N3hHR0oxQU9Jc244QXhFMHZYY2FOMTZLT296VHFZRVQzMmlEZ29taWZFU0tH?=
 =?gb2312?B?ZFR6K0FyanRYQ3M4TXhON3c3UWQ0UkUrL29NYVNBcGxIeDBON1IzNDFvUSto?=
 =?gb2312?B?UXhydjJGZ09jdGhZT1NxeWNoQS83QXM3RzVEdXF5ZjZxNG1wSGh2b1JTdlpv?=
 =?gb2312?B?YjdaWWRVZFFQWG56eFozaENuQmk1aDRmNnNBUFJsZk4rb2NPOFBkRjBxMHR0?=
 =?gb2312?B?aEltbUJ4bms4dzZzM0xwZXVQckFZSWU5cjgvM0dhQmpWS0VPUUp5Zy9LME1p?=
 =?gb2312?B?Wi94OVdxM09qYSt5aDd5dFRvYmd0eXFSWWJDWU1KZU1WcXRaRkZjV2Uycnh1?=
 =?gb2312?B?S1I0Ym16NjYzV1ZycTBWbGE5ZTJnNG81K3ZLYnFCSnZremVIdzRJUjJIcXh0?=
 =?gb2312?B?QSs4VDBSSXc1RUdCeWZmYVl6azVlc1IzWjFxcWNNd1QyYTB2T21RKzgrcVpv?=
 =?gb2312?B?M3YrU2g2dFM3VWtWQ0FwQi9KL1luc0tSLzY4RkROUnZIbzNxak9yTWpyZUtt?=
 =?gb2312?B?bE4rc0FtWSt4WTRGL1lTL05zbUlXTFJ1dEpvMHdaUnkyeE9oYUEzZE15QUta?=
 =?gb2312?B?RXVaZDhyem9OZFhhb3dKWmtzVnd3aE45WDF4WkxEN0g3K1FhdmZBbG9YRmFB?=
 =?gb2312?B?ZFJ3cTRjZlljNlVKL29RV2x6bks1VTZuNnVObGFPSFJIMkFMTStEcWtHckNW?=
 =?gb2312?B?cGJJTHFOOEpFL0pBak0zS1lmRkp5OS9LNVNuaFN0SGRuNW9BL3BBVWNEY3pR?=
 =?gb2312?B?dXBJaEowcmtWTDYwUWo2QUZYOGJqS0xiL2g1SUI2VnBidXRheit4TFRBMTN1?=
 =?gb2312?B?NzI3QUhvK1B6WlZoSVk5ZER3aU1BSlA4UTIvM0xGdVFzVHRhMkZPSWlGYXUy?=
 =?gb2312?B?VkRzWUxQT1FLZTJleVA3ckJtN2U0a3k0RUZiNFM2ejJpYTlJaVdXQ1B5czNL?=
 =?gb2312?B?STVzQllZc2NQMkFwVGQ2QjdpWEg2L1pselU1bktQNDJ2a3diaXYwN2xvMmo3?=
 =?gb2312?B?TDJIL0sxejlNekFTYnVuclorTmxvRjZUWGNJWC9ySkcvYytidW4xSHJMekRL?=
 =?gb2312?B?RVU4eXJqOC8zSjZqRmxFcS82ZXEvd3Z3Nk9aeS8ydXNXc3R6M1Z6L09XQWE4?=
 =?gb2312?B?ZXpVUGE5aEJZNU9oNUJiQT09?=
x-ms-exchange-transport-forked: True
Content-ID: <7A460F7FAB78BD4E8B3288ECAC35F142@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 710e8afb-d70f-41b7-b848-08d94dba70ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 09:15:40.0627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yq+AeZk3zBdhkm/mk7xE8HFQjjm1DWVIQ+zIBKbnnGsmyUpoexA4yKQikbIN4KaeRiagBwpMtsBCd06cS4edTHvLcENpKY39g/ROMXNTzmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4094
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 4/4] syscalls/shmget06: Add test when the id of
 shm_next_id has existed
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
>> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget06.c b/testcases/kernel/syscalls/ipc/shmget/shmget06.c
>> new file mode 100644
>> index 000000000..3138d4482
>> --- /dev/null
>> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget06.c
>> @@ -0,0 +1,77 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
>> + * Author: Yang Xu<xuyang2018.jy@fujitsu.com>
>> + */
>> +
>> +/*\
>> + * [Description]
>> + *
>> + * It is a basic test about shm_next_id.
>                            ^
> 			  for
>> + *
>> + * When the shared memory segment identifier that shm_next_id stored has
>> + * existed, call shmget with different key just use another unused value in range
>        ^                                      ^
>        'does exist' instead of 'has existed'  |
>        or even better 'is allready in use'    |
>                                              will
>> + * [0,INT_MAX]. kernel doesn't guarantee the desired id.
>                     ^
> 		   Capital letter at the start of the sentence.
>> + */\
Will do.
>> +
>> +#include<errno.h>
>> +#include<string.h>
>> +#include<sys/types.h>
>> +#include<sys/ipc.h>
>> +#include<sys/shm.h>
>> +#include "tst_test.h"
>> +#include "tst_safe_sysv_ipc.h"
>> +#include "libnewipc.h"
>> +
>> +#define NEXT_ID_PATH "/proc/sys/kernel/shm_next_id"
>> +
>> +static int shm_id[2], pid;
>> +static key_t shmkey[2];
>> +
>> +static void verify_shmget(void)
>> +{
>> +	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", shm_id[0]);
>> +
>> +	shm_id[1] = SAFE_SHMGET(shmkey[1], SHM_SIZE, IPC_CREAT | SHM_RW);
>> +	if (shm_id[1] == shm_id[0])
>> +		tst_res(TFAIL, "shm id %d has existed, shmget() returns the"
>> +			" same shm id unexpectedly", shm_id[0]);
>> +	else
>> +		tst_res(TPASS, "shm id %d has existed, shmget() returns the"
>> +			" new shm id %d", shm_id[0], shm_id[1]);
>> +
>> +	SAFE_SHMCTL(shm_id[1], IPC_RMID, NULL);
>> +}
>> +
>> +static void setup(void)
>> +{
>> +	shmkey[0] = GETIPCKEY();
>> +	shmkey[1] = GETIPCKEY();
>> +	pid = getpid();
>> +	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", pid);
>
> So we are using this to "randomize" the id here right?
Yes.
>
>> +	shm_id[0] = SAFE_SHMGET(shmkey[0], SHM_SIZE, IPC_CREAT | SHM_RW);
>> +	tst_res(TINFO, "Test shm_next_id effects on shmget(different key) "
>> +		"when this identifier of shared memory segment has existed");
>
> I do not think that printing test description is useful, especially
> since we have nicely formatted test description in the test source which
> gets exported into the metadata.
Will remove it on v2.
>
>> +}
>> +
>> +static void cleanup(void)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i<  2; i++) {
>> +		if (shm_id[i] != -1)
>> +			SAFE_SHMCTL(shm_id[i], IPC_RMID, NULL);
>> +	}
>> +}
>> +
>> +static struct tst_test test = {
>> +	.needs_tmpdir = 1,
>> +	.setup = setup,
>> +	.cleanup = cleanup,
>> +	.test_all = verify_shmget,
>> +	.needs_kconfigs = (const char *[]) {
>> +		"CONFIG_CHECKPOINT_RESTORE=y",
>> +		NULL
>> +	},
>> +	.needs_root = 1,
>> +};
>
> With the minor adjustements in description:
>
> Reivewed-by: Cyril Hrubis<chrubis@suse.cz>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
