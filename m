Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9BE3C9A72
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 10:22:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0AAED3C8368
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 10:22:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B75A23C2E33
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 10:22:00 +0200 (CEST)
Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com
 [68.232.159.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B13881401207
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 10:21:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1626337318; x=1657873318;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=LVHd4ENqRlQNzip4na3KEl80f/pIwCG2DVhQqokzNzI=;
 b=R/FfaApufDRFNDWam3yGDvj5DwSDRxf3XBg+Xcs1cIKmlS7ma/vNA5oU
 mx9U1SCbVQwkM16KesysBvt1xl5OXnl5zWd8kyoX/+U3pyIRAhIQI8jyV
 TW7P9p4prdG1qmUELpxEGRR4l1zGQOXMoU8Boa32FxUMFSy4SxOxhbfkD
 M56/czetj9/EQjOQ5tXZCfvjLxOoqSeLDZPCMosAURcxAN0dhZUH+FVpB
 0ALtOXsVHTqxSJ3MJIV/LITzV1oVnUOE/gfcKfsY522DqWpezKdDbxC84
 cPYobPRKMZy1LTjZFPuhVIyw6jJuhhRCnToh5MuFrgqk1bRuW4CFNUDb5 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="35011350"
X-IronPort-AV: E=Sophos;i="5.84,240,1620658800"; d="scan'208";a="35011350"
Received: from mail-os2jpn01lp2057.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 17:21:55 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKc+ScxwR/czlmW2h/fsisSafStYwtVYPGc2Dp4PgR2vZ0IUBK4u77FPRjZzAi+UsiaJ+X7dgCsSLqAxvDmGCrVJNGtoPxF/Vwdjmp4N244MjL0s6VaFExcOoZWLU4Nu4H48WI/YacZVUQtaxg6ciOSgKfOcRGyThJmoLjVACrqWIUNFE9Sjs2SsdQw8tkTPYN2oDBHIn4AG2aJEMp9FeoZTBYUqe/HQOIhdyHxk/VGWaQNFbCEw/F1Bw02lBo22DIXvNWkQxaqtaQPd+qPO1skVavvA0A21qvxQ6DBp5sETJqBFpO3FZsdTijTRKF5m9jgx5nLeHGU+pDCzmpBLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVHd4ENqRlQNzip4na3KEl80f/pIwCG2DVhQqokzNzI=;
 b=mu3GQXKItDobk01/889DFYG5Af3vjuEx1mMDXomjqv2ozePy2zpblBHpnPa6QsFPNS9l0xtfsZndF/J1KPjCMu+VqYbX2XGuEejrpSz10+dpmRsxlC4J8qzryxuqOkXT1TUsNzEREUcVl1gHfKKfj5E1zyEvT/Pbv66E8azfWyYV2n7lES+rZhI+08SccAyL5rec6fnAa4SESkawO3QIoW47Pq4qWHQal44eScje9ktclrt9MLFs4gHhUWQgfnf3jPbW4sDAUci6LFNWBxIgYv60BaotpUhrJHlAXmv4+OflsaRrPFalUTVaTMKnoPwhl/p5DdnwaeczsIalbgIAOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVHd4ENqRlQNzip4na3KEl80f/pIwCG2DVhQqokzNzI=;
 b=h894Clp/s3QOwFLwwZuRpzIPyWbeA6SuNbUXf3558nJSwS2H6Mp0AX0CbsHCAYU0/Xv7sh3PMGOuYXPz6FKLNEr9eHpxDel9ZnJwKxGBaduU5EBYuKcAyKIaKnS+L5bJFPom5S6ulc0qIX3iRgZRip9P9OLRwUvArhTEKgXtDd0=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYYPR01MB6841.jpnprd01.prod.outlook.com (2603:1096:400:d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 08:21:53 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4331.022; Thu, 15 Jul 2021
 08:21:53 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Joerg Vehlow <lkml@jv-coder.de>
Thread-Topic: [LTP] [PATCH v3] squashfs: Add regression test for sanity check
 bug
Thread-Index: AQHXeTd2eVrpvNP+fkm5ugUF3JUhMatDspYA
Date: Thu, 15 Jul 2021 08:21:53 +0000
Message-ID: <60EFF034.6070800@fujitsu.com>
References: <20210715050812.1950884-1-lkml@jv-coder.de>
In-Reply-To: <20210715050812.1950884-1-lkml@jv-coder.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jv-coder.de; dkim=none (message not signed)
 header.d=none;jv-coder.de; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52cd3013-a37f-4628-1032-08d947699a3b
x-ms-traffictypediagnostic: TYYPR01MB6841:
x-microsoft-antispam-prvs: <TYYPR01MB684187B13D5EE50B9703DD33FD129@TYYPR01MB6841.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ngcFBmLfmF5LOksU9rM5Fyeh1N6848JIcjo23l4jbQ2jU7NneT3Y3orc/XWpyr6mTt4SCxztKQySBRRXcPCNz78EpeZjUQ32ZZl5bOa5yhzTzVQXVl8IbSck59rv13A7pUtgoLeir2AVKMwy8ls6X2RVgMzWOr14IwXrbOJ/jp8CiZ+ETnlyCa/LUwcK8IfuaLLkLHB1If6hh7nYBusVF9apcbVCkWrXR4wAYbnMEVuSmsG3aPBxCL0RJRu0gqemBodXUfSHaCD+WTNirRlIB4H7VLUX/6/hhEhVP1pCbiq4p8FygPlTLz1B0theOLWVqW+DBLu1TiyGAG961xTwRciO/JkDDQ9VHX1IfgRSiuQ4rwaM+vfMCxPXGDpmmOUgGnp17N8Z50ROIL6TfjEDKoyfoB2YKoYh5XGl9ej4N4Pt9zAcH8J7gGHtxw6qDqjScSb9uYtCg/mc5sTipe6RDV0zV5f6YSVbcI4oHpEGIUjeHZYRCxHL+uyRSEYNLAFUNJvqyIElGwYG4Cp0n6a+yQqp96nqGV5Bh6SX0rHoJpvMuDTimYw52Fqg+0RJzZyjmXJJZZjQYC1LA9U6NWlzWkSRKxH5FwIZtC+DZpyNsu2wyj4+qwrllXHyxzBWMoM5F5jKDaSUNptm008saQulSQF5ISBSHBK0U2S00uPlB7eOxGWcEEKFGOtIdvBor0YWF2CDHt1SE4fUzc4M3p/4Aw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(66476007)(66946007)(54906003)(8676002)(2616005)(186003)(66556008)(66446008)(8936002)(38100700002)(76116006)(316002)(83380400001)(64756008)(6512007)(85182001)(6506007)(122000001)(4326008)(5660300002)(91956017)(478600001)(2906002)(71200400001)(87266011)(6486002)(86362001)(36756003)(33656002)(26005)(6916009)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?TFZ3TGZxbjlDbHU0bmMreUhoR1RKOGZJTHcvaXhDdnJxZXdtbXo4eXp1MGRy?=
 =?gb2312?B?QlluT2FrVVJIdzVFQXpzOWJsK3hDVGxYamFrQS9pNHQ4M1BRTEQ0dlZ3aHhF?=
 =?gb2312?B?VlpLWXJkLzgvUnUwWCtaVlVWOVFoMTJwT28rYkpPeUptTTdGRHRHQ3JIQ2Y2?=
 =?gb2312?B?SkNRSW1LcEtGV08zbEJVcHpzdUMxSDBERExRTEJDb3ZLZjBSQUxVK1d6ZlJL?=
 =?gb2312?B?UGQ3dzgwWkRXei9YS0ErbDFiem56aWJCVkpxVDBleG5Cc3ZWNkpVSzdPcWlv?=
 =?gb2312?B?VVBsd3A2aWJuT3EyaU53d0JkMjdmK3dUWmZRVURZSUJpKy8xbXdhVjVreHdz?=
 =?gb2312?B?WHpWZU4rNVRoUmhDbkI4YnpRUGJkdG1rTm9kOTFIZjVneG02ay9ldjdsSUJK?=
 =?gb2312?B?ZG1sU210TVZCMHJCNFJyTW5vdmhZd1B0N3dsREh1UnBaRFhQUUI4cWVna3BJ?=
 =?gb2312?B?OGlhMlpyamxhMm9wTitBamtWRktzZ3NpN09CTE1rYjN6L3ptQlp1ajJuenlv?=
 =?gb2312?B?Q0QvbXdWRHp1WHNHWXYwSEpVRjJ2Rk9xM1h1ZUVobThKZnhHcHlIUlg3MUxh?=
 =?gb2312?B?UnFOVW42L2hiaUtrM25BVjJuSERENnQ5YUgzZGdJOGluUXltODIrNmRnOG5D?=
 =?gb2312?B?eUZVMXQzZ0kwS04yRHpST3VxY3JWbHBoVzFqaVZPazRNeEsxbERZSWRjbGxl?=
 =?gb2312?B?aGdyQjd6Tm1EcXdMZklLNEE4OTdRdG1xR3lDbzlvSCtSRGpqRkRJWUJhTWxh?=
 =?gb2312?B?NWFlY2UyNDBHdzBUeGd4KytWaXdFNXRqSGw5elV5bEFrV0RwZjkzYS9KTjND?=
 =?gb2312?B?SmI5WVd4VlFRQW9pa05CRDl0Z1FUc3F3QWN5d09TRDRITU11NCtGSXBIb1Jl?=
 =?gb2312?B?RXZocVQyS3NzTWx4czN6NUNEUmVUS3F3UEsvcHozU3ZRS2FiRWtrOWh1Z2RN?=
 =?gb2312?B?bEMxdWc4S3ZsMm9RcE5FcmtXTTBHdE5hOWp5UUcxR1RIYUMzSjJ5UzcwNzBD?=
 =?gb2312?B?dGE1V0NBRHhWQ0ErQk84dGFsZGVURVVEN0ZJcVRMTTlDcHRjTlI5TzAzNDA0?=
 =?gb2312?B?akxoRG4vbVpOUFZnai8rYWwyWjN4STIwM3A4RTVSN1lreU5BSFQwRVFYa3kv?=
 =?gb2312?B?amNtN2lNeTJIelU0TzZhemlaU3MxL1BqQzlxc3VDNkpvSC9xRCt0Y2xSUUx5?=
 =?gb2312?B?QWc4Y1JVcEVpK1ZjMmwvQkU4T2xhSy9vNDZGS1ZzY29QUEY4OHZ2M0J0VWpH?=
 =?gb2312?B?QlNZWXMzZVprVGVZK2lWZG9xOXBPNVdhUHdPYU9FL0RDVmMwUndxMEdIa0ZC?=
 =?gb2312?B?S3QyVENwOUNhM1gzRHFSRUE0Wm9PV2s2QjcrWSt4dUNQTUtIT1RnL25CK2Fv?=
 =?gb2312?B?allBTzBXbHlnZlVuZW12djdodlFoa0RLdE1pczUxQnNIM0dCZzk0cWk4LzFJ?=
 =?gb2312?B?VDNLQXZ2aVZBTFA3VkFYelVPcHBMMHdJWHpzQkhwRmR3TTh6L2J3Qjh6SGc3?=
 =?gb2312?B?eTMwbkF4U2ZyaWhmeVFrZlhSNDU5VktNTjBGeFN1L05Ud2MzV0luQktZOWk4?=
 =?gb2312?B?akJiR3NGVzNpSGF6NnNuQk1naUZEc1Bnc1lyV1hDZzd5MkNodGZiZTFjNzNj?=
 =?gb2312?B?ZlpKckI2amlqdGFFU3hTSEFITE9nOC91TjhJRy9uMkRQZWVyUmxGd3FMN09R?=
 =?gb2312?B?ckozcVIrc0I4VWFvWTFLQnU1R1FQWDlLU051eWZDRE16Yjlsc3IzdlZxUVNG?=
 =?gb2312?Q?XXpSa7k05rZ0s/41rCTL0vGxbf++qiBGyPsyJBF?=
x-ms-exchange-transport-forked: True
Content-ID: <FF64E99E8AACB94CB793A326E8F9D79B@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52cd3013-a37f-4628-1032-08d947699a3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2021 08:21:53.3868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mO8GvJrs3XEdwy0wEOu16BCe3Qj/ZdEJUhYK8CBFSGLpAGjT4g6to27DaI12ljIO7md9m2a2a+4ScXi7PNDzan88JIwnhYdp+BVnX68rGJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6841
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] squashfs: Add regression test for sanity check
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joery
> From: Joerg Vehlow<joerg.vehlow@aox-tech.de>
>
> Adds a regression test for the fixes
> c1b2028315 ("squashfs: fix inode lookup sanity checks")
> and
> 8b44ca2b62 ("squashfs: fix xattr id and id lookup sanity checks")
>
> Signed-off-by: Joerg Vehlow<joerg.vehlow@aox-tech.de>
> ---
>
> Changes to v2:
>   - Rename to squashfs01
>   - Add mksquashfs to needs_cmds
>   - Use needs_device and mount syscall instead of mount tool
>   - Moved test file creation to setup
>   - Use tst_cmd instead of tst_system
>   - Use flag to call umount conditionally in cleanup
>
> Changes to v1:
>   - Implement whole test in c
>   - Fixed whitespaces...
>
>   runtest/fs                                |   2 +
>   testcases/kernel/fs/squashfs/.gitignore   |   1 +
>   testcases/kernel/fs/squashfs/Makefile     |   9 ++
>   testcases/kernel/fs/squashfs/squashfs01.c | 121 ++++++++++++++++++++++
>   4 files changed, 133 insertions(+)
>   create mode 100644 testcases/kernel/fs/squashfs/.gitignore
>   create mode 100644 testcases/kernel/fs/squashfs/Makefile
>   create mode 100644 testcases/kernel/fs/squashfs/squashfs01.c
>
> diff --git a/runtest/fs b/runtest/fs
> index 17b1415eb..1d753e0dd 100644
> --- a/runtest/fs
> +++ b/runtest/fs
> @@ -85,3 +85,5 @@ fs_fill fs_fill
>
>   binfmt_misc01 binfmt_misc01.sh
>   binfmt_misc02 binfmt_misc02.sh
> +
> +squashfs01 squashfs01
> diff --git a/testcases/kernel/fs/squashfs/.gitignore b/testcases/kernel/fs/squashfs/.gitignore
> new file mode 100644
> index 000000000..d28920fe8
> --- /dev/null
> +++ b/testcases/kernel/fs/squashfs/.gitignore
> @@ -0,0 +1 @@
> +squashfs01
> diff --git a/testcases/kernel/fs/squashfs/Makefile b/testcases/kernel/fs/squashfs/Makefile
> new file mode 100644
> index 000000000..67021139c
> --- /dev/null
> +++ b/testcases/kernel/fs/squashfs/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (C) 2009, Cisco Systems Inc.
> +# Ngie Cooper, July 2009
> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/fs/squashfs/squashfs01.c b/testcases/kernel/fs/squashfs/squashfs01.c
> new file mode 100644
> index 000000000..f02c91f83
> --- /dev/null
> +++ b/testcases/kernel/fs/squashfs/squashfs01.c
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021 Joerg Vehlow<joerg.vehlow@aox-tech.de>
> + */
> +
> +/*\
> + * [Description]
> + *
> + * Kernel commits
> + *
> + * - f37aa4c7366 (squashfs: add more sanity checks in id lookup)
> + * - eabac19e40c (squashfs: add more sanity checks in inode lookup)
> + * - 506220d2ba2 (squashfs: add more sanity checks in xattr id lookup)
> + *
> + * added some sanity checks, that verify the size of
> + * inode lookup, id (uid/gid) and xattr blocks in the squashfs,
> + * but broke mounting filesystems with completely filled blocks.
> + * A block has a max size of 8192.
> + * An inode lookup entry has an uncompressed size of 8 bytes,
> + * an id block 4 bytes and an xattr block 16 bytes.
> + *
> + *
> + * To fill up at least one block for each of the three tables,
> + * 2048 files with unique uid/gid and xattr are created.
> + *
> + *
> + * The bugs are fixed in kernel commits
> + *
> + * - c1b2028315c (squashfs: fix inode lookup sanity checks)
> + * - 8b44ca2b634 (squashfs: fix xattr id and id lookup sanity checks)
> + */
> +
> +#include<stdio.h>
> +#include<sys/mount.h>
> +
> +#include "tst_test.h"
> +#include "tst_safe_macros.h"
> +
> +static const char *MOUNT_DIR = "mnt";
> +static const char *DATA_DIR = "data";
> +
> +static int mounted;
> +
> +static void cleanup(void)
> +{
> +	if (mounted)
> +		SAFE_UMOUNT("mnt");
> +}
> +
> +static void setup(void)
> +{
> +	int i;
> +
> +	SAFE_MKDIR(DATA_DIR, 0777);
> +
> +	for (i = 0; i<  2048; ++i) {
> +		int fd;
> +		char name[20];
> +
> +		sprintf(name, "%s/%d", DATA_DIR, i);
> +		fd = SAFE_OPEN(name, O_CREAT | O_EXCL, 0666);
> +		SAFE_FCHOWN(fd, i, i);
> +
> +		/* This must be either "security", "user" or "trusted" namespace,
> +		 * because squashfs cannot store other namespaces.
> +		 * Since the files are most likely created on a tmpfs,
> +		 * "user" namespace is not possible, because it is not allowed.
> +		 */
> +		SAFE_FSETXATTR(fd, "security.x",&i, sizeof(i), 0);
> +		close(fd);
> +	}
> +
> +	/* Create squashfs without any compression.
> +	 * This allows reasoning about block sizes.
> +	 * Redirect stdout, to get rid of undefined uid messages
> +	 */
> +	const char *argv[] = {
> +		"mksquashfs", DATA_DIR, tst_device->dev,
> +		"-noappend", "-noI", "-noD", "-noX", "-noF", NULL
> +	};
> +	tst_cmd(argv, "/dev/null", NULL, 0);
We have SAFE_CMD api.
> +
> +	SAFE_MKDIR(MOUNT_DIR, 0777);
> +}
> +
> +static void run(void)
> +{
> +	tst_res(TINFO, "Test squashfs sanity check regressions");
> +
> +	if (mount(tst_device->dev, MOUNT_DIR, "squashfs", 0, NULL) != 0)
> +		tst_brk(TFAIL | TERRNO, "Mount failed");
> +	mounted = 1;
> +
> +	SAFE_UMOUNT("mnt");
> +	mounted = 0;
> +
> +	tst_res(TPASS, "Test passed");
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.cleanup = cleanup,
> +	.setup = setup,
> +	.needs_root = 1,
> +	.needs_device = 1,
> +	.dev_min_size = 1,
> +	.needs_cmds = (const char *const []) {
> +		"mksquashfs",
> +		NULL
> +	},
> +	.needs_drivers = (const char *const []) {
> +		"squashfs",
> +		NULL
> +	},
> +	.tags = (const struct tst_tag[]) {
> +		{"linux-git", "c1b2028315c"},
> +		{"linux-git", "8b44ca2b634"},
> +		{}
> +	},
> +	.needs_tmpdir = 1,
needs_device has enabled needs_tmpdir in internal, so we don't need to 
set it here.
> +};

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
