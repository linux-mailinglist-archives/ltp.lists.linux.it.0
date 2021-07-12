Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E271D3C413E
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 04:37:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE36F3C78DD
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 04:37:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7B7BA3C29D3
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 04:37:13 +0200 (CEST)
Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com
 [68.232.156.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F3F3A200990
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 04:37:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1626057433; x=1657593433;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=w8a5nJNAtFJRgfTLbIajS3cdm7GM4nN8LSbnhwb+bRg=;
 b=iaWiHGidQ4wYvYJPxWk6rLRTVZrfYj4UcCMqyDj9D6wIHdk9LPg7Aogc
 4SSQqo0UAiC4H95G3hD9eMciCM+v4ETmSdFBXuVtXms1bPxON2nZ/sYg3
 z53N61fRCcE6WROOJuI68re7IyMuTmrMpYg9DYUF68+NPLp4TO2entdNf
 u8BGk4aiH8rMwH02Cmq3OXOEs1Jk/NvutPyu4+6KvZNNi+sWxCGnKynlE
 qgPQ2Xk9qFN4/sJTUu7ppbtWN+XkyNWO+8Dc7GBSDsmv7/5IchJgzSXkP
 C6dlvOvsQUojxLh1miusRtR6bovtQdh0M/0QN1PNKZhg9agEFi9Ti7+ec A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="34634016"
X-IronPort-AV: E=Sophos;i="5.84,232,1620658800"; d="scan'208";a="34634016"
Received: from mail-sg2apc01lp2052.outbound.protection.outlook.com (HELO
 APC01-SG2-obe.outbound.protection.outlook.com) ([104.47.125.52])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 11:37:10 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhBhefTxst58qt8nCsGC6bTPACDDatfAjZB3GLn0AgyC2kHrf6o8SXblm2yuHJGc3tF3yzUEjZ6ozFUTSRE1XKhMwRTpvTWsnGeagnOVVl4CYAaWnW22tVeR2tHR0KCKRvrJl5nFgmlofvEnQIq3YdoxfTNhFYOW2oDKOEDbM8o/XTQ/PasnlhuQCf4j+fhkF9PQH0rcKC9ccRu6VI6W1aNA8g2hIQPC8wQi99Csxj/sIzRtZ0bx9/iU3uWlHc743iuSrVT22WzcdnA45KyuYVqtIW5sA7FbeKQYWtwSCiL4dJWl/g2b8SafD3SzCIQWzc50aZWTKjvKuWntS6prKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8a5nJNAtFJRgfTLbIajS3cdm7GM4nN8LSbnhwb+bRg=;
 b=hWMcM6os62b0szuZnr0anx3FNN25LeIaC+pB/OUEW3sHGbruVuoTyB0UjWYddccC1/9OquJiBigDPtHjnhUZEIwkalI98liX6lDPYu1zAqRkzEkBcub+aP6R9beMyuYpsbKk1OAKaEZ9Tht7Otnl9i+wcjylZQo9Pboa1YQN56tIFmLqICaqW1nMVYbS9QPFJXouB44iDc7lHlqu6LPZYFvOaa0XaiUdxxneGZAOPLgOW16eriUQbcvMVXKtUBVEGC2VnFO6Nlh7OgfxnAL68zRGFL/ujm+XFeQNe+JSWymkqLuIaPQQvUolpba24OYtDyy38ZP+TgHN5VM9XtGeKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8a5nJNAtFJRgfTLbIajS3cdm7GM4nN8LSbnhwb+bRg=;
 b=AEOK8TAujJHI8IAEmh/Qg0t/+xtlkyoQWlqhwIs77GWh114kA9vzwvYv8bkxtGXm6tK9odAQqpab6QkpGnn+4LHdJ/LcNhQbwf9YE/2f0yar+3Beqm9RWuyTxZtDhCLM+reOSnWJroNoeyPs8W+bdg2735O0v50ha+m7Uqmm5SU=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB2188.jpnprd01.prod.outlook.com (2603:1096:404:b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.24; Mon, 12 Jul
 2021 02:37:04 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 02:37:04 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [PATCH v1 3/4] syscalls/shmget05: Add test for
 /proc/sys/kernel/shm_next_id
Thread-Index: AQHXRwwqjBuInok3lUGSaO72afR8T6sqnwWAgBRgsAA=
Date: Mon, 12 Jul 2021 02:37:04 +0000
Message-ID: <60EBAAFC.30205@fujitsu.com>
References: <1620809541-6891-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1620809541-6891-3-git-send-email-xuyang2018.jy@fujitsu.com>
 <60DA92E9.40103@fujitsu.com>
In-Reply-To: <60DA92E9.40103@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ba09234-d56f-4eaf-0ab3-08d944ddef86
x-ms-traffictypediagnostic: TY2PR01MB2188:
x-microsoft-antispam-prvs: <TY2PR01MB21886B0ABE04248BC429B942FD159@TY2PR01MB2188.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yNYA5P5Eixjm2LJTrhOHedYd0RSMYTQkpxYf3B43syYsJz5aTSHUKyY41IDLS11aJFS0wnuUZaaG9b3ZxRtbo5xBtXc1V3aL4Mo9OCTdnouYTeQ1IkCerdd6DeIr2PvSyowQjrrNsvZ5PmD5ZFkLwq9+JZiAZi2D+wPUU+SFEsZPGPvZYhJ9QWTe13/yCPFiFu+Sn1hN0phY8SeG6F5m5IwLX2PXgSSwJn5BJLLZckLp68+43762bnxbJNjLi10tCEn7WQoyxRuhR2O6/xUfYqjkAuoD0LXBVOVdavXWkoF82zsJOHO0iP2q3XmExkhfwO9BHYOUVRQD8KZwPc+RLOOBcM8VWD1oOzf+Ywc0pdE0rSuYnBqu6EHBSRUFCE5k9AFbOpKzMIB9uELe8ZNaTbe78ZgmMu8Nm0yOXkAC1hF+oRMIjuAjduQM6FJrbVVwhv5G0fS5RsPDn4fFerK8q0pStTkXIGTyjCvehvNmz+64ovSqp/FtnN9palqAGPIr6M16RF/BmayJZc4J/0fcteN34Ge/h3TQ94Fh4UNzOlKYyWCbIcyngAxaeyIsvlczKi/RBG20Wk7vRQVfMtrPPC0EmJBRHQkYLp4QItueMj/YLAVHeJKpFyMaOZx4/Zfh93vsKCfmTKqRMUduSBgi0A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(64756008)(2616005)(86362001)(316002)(6916009)(83380400001)(71200400001)(85182001)(122000001)(38100700002)(26005)(76116006)(66556008)(478600001)(66446008)(36756003)(66476007)(5660300002)(6486002)(8936002)(6512007)(8676002)(186003)(6506007)(66946007)(91956017)(2906002)(4326008)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?ZE55aDVIWWlTUmNGcm9UTEp6SkVUYXRGa0lES3RTcjBMclV1S2YybFdSMUo2?=
 =?gb2312?B?eGFWMUxEMlQ0azVPMmZsRWFlTy85YnFSN1RPdDJrcjh5WlpxWGVCaGRsdjZZ?=
 =?gb2312?B?OVNpY2tFRm9Vdm9NVFF5WmtySkU0emluMnU2N1NSSGdhTThjU29oNnk3Nk9h?=
 =?gb2312?B?QnJzSVBqSkl0bFdYZmFlUVIyN3VDZVlXTm9PejZyWmY2RVgreFlQcUJ1MEtp?=
 =?gb2312?B?RFFKamhvdWtXMUh4WFZTaVJaZlByaTk5R09FSDl4YnlUZnVkaFY4VnhTeVEx?=
 =?gb2312?B?aE0zUWsxcGxwNFErZnRORHJMZlRhN0dVb1VMNDdIczAwTnFJOEZXS2lLcWU0?=
 =?gb2312?B?eHJvMFhpL01MRG1TbHdueW54T3hrdUxpajNxMlVRaFd1cXJ0QVhsQ1F0ekc0?=
 =?gb2312?B?VlNrMTFqdjJJMmJYYk11UHhoanQ4Z3J2RlFWaWNibEtNSEJqNjdzR1RjWWhX?=
 =?gb2312?B?Y1l0T2d2TElGUVZYVnVHbk9ON2lMVGx1MUZvdlpGa01POUk4SE52M3FvLzlU?=
 =?gb2312?B?Z1BqaEV1anpMVnpxQUF1MWljSmU5UjMwR05Ob3pTa1FlQ2htOVJHaWlHcEVM?=
 =?gb2312?B?Q2E3YVdvY3gwN3NFaFhlbHExUXN6R2tTT2x6VmZyMFZMdnNQWmRCTnB0ZTlZ?=
 =?gb2312?B?MVMwTXE0aCsvVGFZbC9NSXduaEgyblFVWXhGb096dXFEM3dPZmpqYnJNUkVY?=
 =?gb2312?B?VHFXclZoN3FwanF6dmxHbElhOTdWWDJWaVF2dGxjZzF0MlE0bmt6V0xxeGNz?=
 =?gb2312?B?UU4wWmFuQ1hVU2tvaktJU1RYNFZrRDA2UHV6bm9oMVZkQ3d1eWlTaXQvN29x?=
 =?gb2312?B?Wnc5N2RGT2NRLzVPSGJpaDFWZHEzQkZmam8veE1ydWtzK0hSUllySUxNdFlq?=
 =?gb2312?B?M2ZyTmdrYWJheEhDRFh4OXJNeHdtcTd2NkJHNnRFSW1BU0RwVEg5Y05SOGtv?=
 =?gb2312?B?enAzVzFoZlVHdThBTWRKQ1ZBRmRUN2RtV0ZJR2ppY0xzOVVsSlliYWlkV0FZ?=
 =?gb2312?B?T3loTDd0OHlBRUFoUzlIRDhheENLMzRQa2xjNEE4Sks1YkY5c2FxWjFNaXk2?=
 =?gb2312?B?Z3BBSUFHM0IxWkhFZTJpZUVFRXlzQ1QwT2xkTS9yeG05RmtwSDRFK0VRSUlH?=
 =?gb2312?B?c1MvUDg1Q0cvaTgyRVZ5b256dU56TjlPWnJ2bGZoelR6Q0J1NmxCdW9kQUxO?=
 =?gb2312?B?bndXOHRXeFZya21yZkw3djA3YUp1T0FKYy9DSHpTcGlDN3V0ellWalA2VFVi?=
 =?gb2312?B?R1k5VWw3My9iM3J6SThLRTFONEU2aWt2UUwycmpJMnI0Vmw1WmJuc0ZxZXBu?=
 =?gb2312?B?T3p0dlZFOUNmLzBVTTJoWGY1blkzNDBXaU9xc0I2RCtaWGRLT2xVcUczazJx?=
 =?gb2312?B?VkpZbXluR3pjM3BjaFdlTTJZN1J6a2dPcnlTU3VCRWtWYzgxV3B0YVNrcHlW?=
 =?gb2312?B?V0JyVkt2czNhbVA4Qmx6T0g4QjNwZDVzMU13NGdRTmtBK2c2ZEk0OEh4M013?=
 =?gb2312?B?aTZVZUE1Z1dlUExZR3FKZldTMDRINlJEbERTRmdYOGI5dUh1ZUtxQ0J4VTda?=
 =?gb2312?B?N2kwangvanlyNzdJTUE5M3dkckYrS2V0Qk43bDdLbHhkNVJvYUd3UlVNb1Ar?=
 =?gb2312?B?aThET0xmWmlOMm5ZdjdTU2xLNzNlamZMQkdFc0tPQWZ4T253QlFrUkZlMjhn?=
 =?gb2312?B?TGc3NlQxeW5FYjBZcDZyY20xbXB1V08rRFMrTE8rVXB3aFEwR2loYlBEaTdV?=
 =?gb2312?Q?gWTF6n+Q0CABB/3kGmIxKGJz6K1whu7Ru5Z1SQ3?=
x-ms-exchange-transport-forked: True
Content-ID: <F493809BDD323343B1D0CA49F820292B@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba09234-d56f-4eaf-0ab3-08d944ddef86
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2021 02:37:04.6078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sa6tzuOF1Kq1xlSXvQENycwVYuHt9V+SUky+pyJVJHXkZdwgD/AJWIQyRPovnCyrrv+Lzd1uf0QL+EOtWCmgya55RgxDM6CsmA3+ZzYV5Yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2188
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 3/4] syscalls/shmget05: Add test for
 /proc/sys/kernel/shm_next_id
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

Hi
Ping.

ps:On lastest ltp, this patch still can be merged without rebase.

Best Regards
Yang Xu
> Hi Cyril
> 
> Since the previous patches have been merged, this patch can be continued.
> 
> Best Regards
> Yang Xu
>> This case is similar to msgget04.c.
>>
>> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
>> ---
>>    runtest/syscalls                              |  1 +
>>    runtest/syscalls-ipc                          |  1 +
>>    .../kernel/syscalls/ipc/shmget/.gitignore     |  1 +
>>    .../kernel/syscalls/ipc/shmget/shmget05.c     | 69 +++++++++++++++++++
>>    4 files changed, 72 insertions(+)
>>    create mode 100644 testcases/kernel/syscalls/ipc/shmget/shmget05.c
>>
>> diff --git a/runtest/syscalls b/runtest/syscalls
>> index 2dff25984..63d821e53 100644
>> --- a/runtest/syscalls
>> +++ b/runtest/syscalls
>> @@ -1402,6 +1402,7 @@ shmdt02 shmdt02
>>    shmget02 shmget02
>>    shmget03 shmget03
>>    shmget04 shmget04
>> +shmget05 shmget05
>>
>>    sigaction01 sigaction01
>>    sigaction02 sigaction02
>> diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
>> index b3bd37923..ff0364704 100644
>> --- a/runtest/syscalls-ipc
>> +++ b/runtest/syscalls-ipc
>> @@ -67,3 +67,4 @@ shmdt02 shmdt02
>>    shmget02 shmget02
>>    shmget03 shmget03
>>    shmget04 shmget04
>> +shmget05 shmget05
>> diff --git a/testcases/kernel/syscalls/ipc/shmget/.gitignore b/testcases/kernel/syscalls/ipc/shmget/.gitignore
>> index c57df68f5..6f08529f8 100644
>> --- a/testcases/kernel/syscalls/ipc/shmget/.gitignore
>> +++ b/testcases/kernel/syscalls/ipc/shmget/.gitignore
>> @@ -1,3 +1,4 @@
>>    /shmget02
>>    /shmget03
>>    /shmget04
>> +/shmget05
>> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget05.c b/testcases/kernel/syscalls/ipc/shmget/shmget05.c
>> new file mode 100644
>> index 000000000..601609648
>> --- /dev/null
>> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget05.c
>> @@ -0,0 +1,69 @@
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
>> + *
>> + * shm_next_id specifies desired id for next allocated IPC shared memory. By
>> + * default they are equal to -1, which means generic allocation logic.
>> + * Possible values to set are in range {0..INT_MAX}.
>> + * Toggle with non-default value will be set back to -1 by kernel after
>> + * successful IPC object allocation.
>> + */
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
>> +static int shm_id, pid;
>> +static key_t shmkey;
>> +
>> +static void verify_shmget(void)
>> +{
>> +	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", pid);
>> +
>> +	shm_id = SAFE_SHMGET(shmkey, SHM_SIZE, SHM_RW | IPC_CREAT);
>> +	if (shm_id == pid)
>> +		tst_res(TPASS, "shm_next_id succeeded, shm id %d", pid);
>> +	else
>> +		tst_res(TFAIL, "shm_next_id failed, expected id %d, but got %d", pid, shm_id);
>> +
>> +	TST_ASSERT_INT(NEXT_ID_PATH, -1);
>> +	SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
>> +	pid++;
>> +}
>> +
>> +static void setup(void)
>> +{
>> +	shmkey = GETIPCKEY();
>> +	pid = getpid();
>> +}
>> +
>> +static void cleanup(void)
>> +{
>> +	if (shm_id != -1)
>> +		SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
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

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
