Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB52D3BF573
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 08:22:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B9A9D3C6819
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 08:22:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 115213C4DB0
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 08:22:11 +0200 (CEST)
Received: from esa16.fujitsucc.c3s2.iphmx.com (esa16.fujitsucc.c3s2.iphmx.com
 [216.71.158.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8CDBD1A010EF
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 08:22:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1625725330; x=1657261330;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=UJuXDJtgIQT2zK7QyxIeJa+BXxpsM0gVqqxUWWWa9fY=;
 b=pazjLyi5RzUwbO/YuO2NzR9eMHbM4MOu/1p1PpS7EDfjmPKSYnGDYW6V
 yXUzgfhepYhq0TMg9/gDU+ETihIUprkfG2f4oPPEo4fb17ZqBy44fSY1o
 WpPPaNBMDghtuOdB8spGqyM3HJhn+riBVPiwyaQNtMCNV+B0TC/mHsLKk
 2JCvRoFUnwf03MjQvFjM/Ajkh1Ip3er5zjiAJhZWKryBe+LE6GODwVfcZ
 kHtyiHGOART4oZuIv9gcTzr8KZcjJoNwdk3MBkY4P5eczIn7IFii2KObT
 o3FfKUtNSoKBEoDPBQdAzOFJcpK7z9lBSPP7UTKTwyBYMvF/Br/aGZn+L A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="34569332"
X-IronPort-AV: E=Sophos;i="5.84,222,1620658800"; d="scan'208";a="34569332"
Received: from mail-ty1jpn01lp2052.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.52])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 15:22:07 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECUGsT0iosm2S76nLZS8Figv7Rn4mb+jyhlAJEi+vo9IkIbPmUpwNzjwg993HyNJsat/t9SFiEq3nrklnghQmTh3mdgUebqZViaB+/Cr9StAdd3Z/Ny1M5Ftknzt6BX4H6VE0BE4aTzoOkpZV9DosmzwpOw2jTk9oVyEhlL4+cZh6PIwU2Xw0SCI6Jivho/WvosM0giWNglaxNjaN9vTkTp0Wbm7erJQtnIHPDf9RjxFFATydX6iezqelxKFgcunn2w7i8wxEzcWSSq5eZzrp0QIxioCnzqi1DsIpolgPzCjtPG3fr6aVebj0HU2mBE+KQgts7nMK0kTOoZMLP1hLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJuXDJtgIQT2zK7QyxIeJa+BXxpsM0gVqqxUWWWa9fY=;
 b=W7xt9satEvFemfCNZyeqAmON0PDrptbqHkS/SbPzXKuf8GIPd0jB2SPY27wjIrBdSOkXHDMyuklNobjYcJrvre3+SB28lJ5M0BCr2ATHipWD361HCN4w+5FLFOPPqoWu7t0IcYPTYauFRLU0u9vdinNZfz7rEaEvOJ0jfag4gyPss1Y5+eN1gaIt9hDCsIbAYO9LwcTqBYVy+b26hT7CCxRfLTIy1ALW+a7QivXTPYn41VPNVuEufhWYFyzbfnbXIAIZVy18BJ7Q+Uz/SEQpKmNfFTI1tcuSYiRuGcRMRD6V/2nrKIlxcKCsKVXbAUNReLGKcs7Gss3nIPHnBlcgkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJuXDJtgIQT2zK7QyxIeJa+BXxpsM0gVqqxUWWWa9fY=;
 b=YHFcsf76PCKdw/If8Igs/FGLGdE8GzGBihzaLEIdsijlqxoCh0YwrZFrpVAoIQEZ6h4pHlB5zw45RkItD9t2pXwtd/yblzsb8MA6nI4gPRNElm4+hQ42m84ONNqCKesG3tsGDvkGxU2k8etV0/0YGllIr0zV8WM/+RYLqmf/Bfc=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYYPR01MB6989.jpnprd01.prod.outlook.com (2603:1096:400:d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 06:22:02 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 06:22:02 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Thread-Topic: [LTP] [PATCH] network/tc01.sh: Add a regression test for tc
 qdisc command
Thread-Index: AQHXcxGdonxO/HgG2EuDXmopXcN28qs3i7WAgAERcwA=
Date: Thu, 8 Jul 2021 06:22:02 +0000
Message-ID: <60E699AE.30607@fujitsu.com>
References: <1625649746-11987-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <50bca7a2-41f5-3eba-d1da-e8e12c883d22@bell-sw.com>
In-Reply-To: <50bca7a2-41f5-3eba-d1da-e8e12c883d22@bell-sw.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bell-sw.com; dkim=none (message not signed)
 header.d=none;bell-sw.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d4ef5fc-c07d-48db-50c7-08d941d8b350
x-ms-traffictypediagnostic: TYYPR01MB6989:
x-microsoft-antispam-prvs: <TYYPR01MB69896C4283A66C4589D9E3AEFD199@TYYPR01MB6989.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C6rlFkJ2pN4VHaZkkU7wH6gDpi4HibtIfJ5WwPAM5RliWnuttITd0nZxC/KAngzf8h26bsKdZRmOMP7q9GNkfg3mtaEFOCVtE4da39otS3fvK/fZnnH5kI2GmhsYbmi/9MizZubp344S1ALDG9SfB+X8WtSu4fU1t3WvVeZiC2n5I0ZKv4SnQqy5hz2XyFvIDoniDgdY3zsqiXp8VZQdrc/vVLsO85XUSuM7Vibh0d0zwyoQAMd4zgG5yhX43XvgujBl7A7CFrmy1kzIzgW6tU+pCjOBlizRPgfDolFRaMxqZHPQ1Ob4ej0/hjy/qdM2vCNekVW6Qviz1bY9GevVdlLeYTJpartibHAqVIqpbBY7/q7lQ+IxSkv7BCVdineOvb/1Pive1Tk3+jtE1JwsxwyOgWncfsQDXzt1TtVYlJEQvShodNC8U6mTYI2+hBo1+8OrHeueRLbBQzrqwyE2M0GtvVbSZIqRxZP5qnqRv36cbYYN1P92HSOyXylSywQk16cOB4awn33dF4zn21pOL47K5+HkMrQBxag1X1bJf3E1JbsHJiwsCzF/lkdvwGYIjotGT53PiRHIegt3jg1TkEr8xde2QzX1zJIBcAwn1FyKmaKjyAvt94UgnquPt7fHT1HVr1/i7SUFlWqpBcMLqA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(366004)(376002)(396003)(4326008)(83380400001)(5660300002)(26005)(86362001)(91956017)(316002)(71200400001)(33656002)(36756003)(478600001)(6506007)(186003)(2906002)(66476007)(66946007)(64756008)(53546011)(6512007)(8676002)(6486002)(38100700002)(76116006)(85182001)(122000001)(66556008)(8936002)(66446008)(6916009)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cC82STNrbG15K3kzeVZXZXNZMjY4b3I2a29iOG9aRkFGeFBkMmkyYm9pVUMw?=
 =?utf-8?B?SU9jbXhJSTBUejNJWFlONHNtd09wMTRPY1BISmpkNDRvcWVlRWl6ZUhIOVVr?=
 =?utf-8?B?SStHSU1XWUsrMXZkK3ZBY1RDenlSU2dSeXRWVWtUZnVPcDMrWG5ieVNEQ0xU?=
 =?utf-8?B?L0hmNXZnellkN0ZBaWF1YzhCdENEY2RHMjlzeEUyTkgrNGcwRGZBaWgzbFVD?=
 =?utf-8?B?RG9DMFRhdVJnZ3FmeVdIN0w2VGxjVitqVllOaCsyVFlKV2c3aTNZN09nRFc1?=
 =?utf-8?B?TkFWZzI0eU95cUVMTm41a2JLTHhXenlMcldHMFZoMEx4elNwaC9pQUhDVnJB?=
 =?utf-8?B?OGpKUFNEeWo3RmtXaFBJNnNzZ3kraGVWVHFwMmhzamhnZFk4b1pWZFIwTjJq?=
 =?utf-8?B?NDN0dlZNUExYU1lORUtmN25Hanp6QXF0R2VZMWo2NUdFRWpPY3NROUZ2emxw?=
 =?utf-8?B?ekk4WVVJTGV3dnRwT25FVUhuc0lnSzNtaS9ud2krWDE3cFNHRTAyWlhhb0xy?=
 =?utf-8?B?bXVRaUs5VDFpY05pR3phUWxGTWluSjh1OVNzQS9FaXlPaHUwRU8xQUR3UE0v?=
 =?utf-8?B?UXdoZUVPV3lmekRKS0VyT003NXN4cDRCN2lWSEpzdC9UeG85RHZLVDIwcTM4?=
 =?utf-8?B?UVV5NlRjYWU1cHhhenllcHdCdis2NVlRRUxJY1l0SlI4WE00M2ZrZ0tYYlZ3?=
 =?utf-8?B?S1IzeGVEcEt5RTJaanlhcVJXYVoyMDc4ZUN4eUtyRGZIRW10RnREVDg3NG1W?=
 =?utf-8?B?K3kxR2I5WkRaUjM4Y3FGbVRONEwzUjNWQ1lkdXVEaHA0VzZzeTVNOUtxUU01?=
 =?utf-8?B?S1pRZUVYVjAyVHhld1RGd3lmeklJNHQwODAwN1cvenV6dUQ1S2FxRTVENU4y?=
 =?utf-8?B?N3JvQ29wMHhsMHlTT0VnejRiWHBMNGJxaXJLOUJUdDFvR1plaU94bEcxejI0?=
 =?utf-8?B?SWVhZWc5Y1E3YVFTbnNzVHVBV0ZBRUEwOXlyeTdRZk9KOE9hVHVVT2xDczlw?=
 =?utf-8?B?YThNWWQwRFhEOUlUYnhzalpjMHZZa3dlU1ZKQUFCZUZQM2xNdU1qY2hsNXFW?=
 =?utf-8?B?WWNpVWJJS3NLbXFyVjhhdURacXpjNUZsOW85WURhOXJXL2l0SzM0SXhiQk4w?=
 =?utf-8?B?VnBLb0doaUJRRHFRWmdyS0JLRlR1SkpKc0dueGdnenJUQ004Q0RyemdpSHlk?=
 =?utf-8?B?U2tDQTZDbHREZm9oREJsbmwzNldnN2grdUhFVGkyL3J5b3lKelorcUozUWJa?=
 =?utf-8?B?eVFQQXNNR0dMQkNnbm5RN2s4NkIvVTZ6bTYySXduOTVWc2J6VDMva3REQmFF?=
 =?utf-8?B?NzFuVkdmYXJOVUQ5OTBjYjl2SlVTcHRQSHU2M1loRlhaS1I1SDZHaFdTY0s2?=
 =?utf-8?B?ZldodmhFQzFvMjllUDVhNXpDbHZmUCtCeituME1QY2J4ZHdSSWNDVFJDZjhl?=
 =?utf-8?B?WEVCWjBkeHNWWTRlaTFKN1VFZUpYczMvcm8yMWx0alc3Q2cvN1U5Q3VNUG1p?=
 =?utf-8?B?cDUvNmZwSmJqbTJOZzRUY09GVDRuZkJBRFhXaGd0TGRqVnl4U3QvQ1BjbTBi?=
 =?utf-8?B?WGFpRkNJWklZMlFkbno3SHlZUEl0bEZTQThvQXJPNjUzZjM1bWhJT0pGTVBJ?=
 =?utf-8?B?NHhqNENzUHNyMVYzTVVkNjJzNS83Zm9UYm56TWJ3OUpQdG5XYzM0MGZBWXk5?=
 =?utf-8?B?aWVmdGVYWG9IYVZ6UG5Gem1yWU5sVWNoYnN4OUJCM0VZbHYzbVk0SEVqTDlJ?=
 =?utf-8?B?bXlQMmFZOWZ6b2FTMngwUlJuTGxiQ2ZWZ1E1Rk5maTRyY1l1dnpuY0tidjBu?=
 =?utf-8?B?U1NuaVRxQ3JtbFpialNLQT09?=
x-ms-exchange-transport-forked: True
Content-ID: <998B73DB1C8AD643B268810DA4F9EC6B@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4ef5fc-c07d-48db-50c7-08d941d8b350
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2021 06:22:02.6334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZCkVsd5XBJVeWNZlQticmE3Ehq5mpJ8UweYMVfq/Rppgn6AjLMsgYQnm6e9IcCKBSeu4CKBZIjh9lDtcsbIdEHaBOtyfeUZPyaLn0QNyuuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6989
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/tc01.sh: Add a regression test for tc
 qdisc command
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

Hi Alexey
> Hi!
> On 07.07.2021 12:22, Yang Xu wrote:
>> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
>> ---
>>   runtest/net.tcp_cmds                   |  1 +
>>   testcases/network/tcp_cmds/tc/Makefile | 13 +++++++
>>   testcases/network/tcp_cmds/tc/tc01.sh  | 51 ++++++++++++++++++++++++++
>>   3 files changed, 65 insertions(+)
>>   create mode 100644 testcases/network/tcp_cmds/tc/Makefile
>>   create mode 100755 testcases/network/tcp_cmds/tc/tc01.sh
>>
>> diff --git a/runtest/net.tcp_cmds b/runtest/net.tcp_cmds
>> index db47dfd5b..7e142de11 100644
>> --- a/runtest/net.tcp_cmds
>> +++ b/runtest/net.tcp_cmds
>> @@ -12,6 +12,7 @@ netstat netstat01.sh
>>   ping01 ping01.sh
>>   ping02 ping02.sh
>>   sendfile sendfile01.sh
>> +tc01 tc01.sh
>>   tcpdump tcpdump01.sh
>>   telnet telnet01.sh
>>   iptables iptables01.sh
>> diff --git a/testcases/network/tcp_cmds/tc/Makefile b/testcases/network/tcp_cmds/tc/Makefile
>> new file mode 100644
>> index 000000000..60150a1ce
>> --- /dev/null
>> +++ b/testcases/network/tcp_cmds/tc/Makefile
>> @@ -0,0 +1,13 @@
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +# Copyright (C) 2009, Cisco Systems Inc.
>> +# Ngie Cooper, July 2009
>> +
>> +top_srcdir		?= ../../../..
>> +
>> +include $(top_srcdir)/include/mk/env_pre.mk
>> +
>> +INSTALL_TARGETS		:= tc01.sh
>> +
>> +MAKE_TARGETS		:=
>> +
>> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
>> diff --git a/testcases/network/tcp_cmds/tc/tc01.sh b/testcases/network/tcp_cmds/tc/tc01.sh
>> new file mode 100755
>> index 000000000..0a241843b
>> --- /dev/null
>> +++ b/testcases/network/tcp_cmds/tc/tc01.sh
>> @@ -0,0 +1,51 @@
>> +#!/bin/sh
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +# Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
>> +# Author: Yang Xu<xuyang2018.jy@fujitsu.com>
>> +#
>> +# When using "tc qdisc add dev teql0 root teql0 command", qdisc_create()
>> +# calls teql_qdisc_init() it imediately fails after check "if (m->dev == dev)"
>> +# because both devices are teql0, and it does not set qdisc_priv(sch)->m
>> +# leaving it zero on error path, then qdisc_create() imediately calls
>> +# teql_destroy() which does not expect zero master pointer and we get OOPS
>> +# on unpatched kernel.
>> +#
>> +# If we enable panic_on_oops, this case may crash.
>> +#
>> +# This kernel bug was introduced by
>> +# commit 87b60cfacf9f ("net_sched: fix error recovery at qdisc creation")
>> +# and has been fixed by
>> +# commit 1ffbc7ea9160 ("net: sched: sch_teql: fix null-pointer dereference")
>> +#
>> +
>> +TST_TESTFUNC="do_test"
>> +TST_NEEDS_ROOT=1
>> +TST_NEEDS_DRIVERS="sch_teql"
>> +TST_NEEDS_CMDS="tc modprobe"
>> +sys_file="/proc/sys/kernel/panic_on_oops"
>> +. tst_test.sh
>> +
>> +do_test()
>> +{
>> +	[ ! -f "$sys_file" ]&&  tst_brk TCONF "$sys_file not enabled"
>
> Why this check is needed and also setting panic_on_oops to
> trigger the bug? If not, I would suggest to remove them from
> the test.
>
Yes, I will remove it.

>> +	orig_value=$(cat "$sys_file")
>> +	if [ $orig_value = "0" ]; then
>> +		echo 1>  $sys_file
>> +	fi
>> +
>> +	tst_res TINFO "Use tc qdisc command to trigger a null-pointer dereference"
>> +	modprobe $TST_NEEDS_DRIVERS
>
> setup()
> {
> 	ROD modprobe $TST_NEEDS_DRIVERS
> }
>
>> +
>> +	tc qdisc add dev teql0 root teql0 2>/dev/null
>
> TST_EXP_FAIL tc qdisc add dev teql0 root teql0
Will do these on v2.

Best Regards
Yang Xu
>
>> +	if [ $? -eq 0 ]; then
>> +		tst_res TFAIL "tc qdisc command succeeded unexpectedly"
>> +	else
>> +		tst_res TPASS "the bug was not reproduced"
>> +	fi
>> +
>> +	if [ $orig_value = "0" ]; then
>> +		 echo 0>  $sys_file
>> +	fi
>> +}
>> +
>> +tst_run
>>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
