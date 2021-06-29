Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DA83B6CF6
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 05:25:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 11BB23C6E5B
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 05:25:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BC1933C19D7
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 05:25:54 +0200 (CEST)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com
 [68.232.151.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 004AF1A00A57
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 05:25:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1624937152; x=1656473152;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uV+w+fLhh7h7ruRDq/jX280Bf7iutbfuLSMBwftd7cc=;
 b=aCyvlvzjk3erX8gm4pFXcT4Pj51SOytufUAdFH/3Mi3j87XloC9He3r7
 kHNpAKjuJVs2LzYbVXk23bPTa0KQdQ0CWB9DXZxc35lo2ZhCXcfv/o1fT
 M83wYyOoFBMw/WygOJ3t1kXKYJINUP68yPJVm3qclDvRbdzWxjAq7eCO+
 XE/1WTU1G2Prn3sVnVMI+yiE9Jyl4WELRZg1Tizgf5XNt9JoVxIhE4pkU
 UmSkP33fJGhmci58s8CziS2xjk/7ebhPxQrcrfg2jOMzScIYkQ4mUYBRB
 Dl3Ew84UqinR76BawQyhs7p10Kzn8Kp98nGLqFIYeah0jgM/nUPF6Obz7 g==;
IronPort-SDR: 7x/8vzHv/VsWBzEUNjBGDpH/Yp9lBkRPVIjGVTvx5KpIeR+pBs3kVeXXEC/EfSJO3OlQG9eoPE
 AYxokX/RzgrMJY5UX2/D/4gr6jfmizA6uRRiYd5l7Ln57SJFSf3MsIrgoaKk5bLX+2LyHe5Md3
 XrrngD9qz4O4rxO4a0uB3e7yQIzGVXKjoAjfLbUwpOFXkcTWaEvJJ72t8yFpB1qqFmlhv7Jf9v
 +r3wVxy1bIFIxTRKgyYVQjrYUes8ce4lc1UoGe+YSa0J2AvzV/LIM5Hg9C6N/EYKtNMIDqAawS
 K/g=
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="42058771"
X-IronPort-AV: E=Sophos;i="5.83,307,1616425200"; d="scan'208";a="42058771"
Received: from mail-ty1jpn01lp2056.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 12:25:49 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIE05iO/9EQOzGoEBZenbgd5JzIAAtmkh6Z+jAl2aaHFAi8ghsFo9peMMbT0LaGMuaVJFaUCNleasZOALIX2JjxxoKeT0eUJdrEOimcTwUaJEkTWMDgOWKfKbbElrt3IiZN7f4JPleaULyV7TPBsc+cfnaVB4fEK/rmaB9mAaphasm3n9R3H1vvXIMc0SDKRHw05FAzKstZ2dSURFqK2/ZUMXxeZrhz6GYqHOaiOq0R2VXaInOWfeUE2+usaDsa5n0t6EbuWKTjlC1fDGkaq3AM9gtY8gBusNip6qYMPV7MqqvA9aWUoqJIdtLkd8dfGN/SFH3K0u5oPTZwLQUV6YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV+w+fLhh7h7ruRDq/jX280Bf7iutbfuLSMBwftd7cc=;
 b=f+b8oYx/CNw1tNHTCsNysfkdbXQEFsTyINF17ijoF6zlv8rfmxOjHinWyYdSlqVxB13ELfZIMQW/TLuwPI0xtxIHag/xfC6mG2lpNO31QjXSVvsKUrHUSqebqdqsi+5UWABrAz5S70WFCEA7kOrXEaB69ySctvRBPvsIo6GLzhiaokYtyRKIbJzXTS2tdE00Kc++8c5zzHd68vzH9rkHX5KMHQbPpvSdN3oTT9KvDgFQIvQs7+kiItn9BvsPO+PewJLpCBsKTnCVW2ZBfUPVjyZri4nB9gfH3qQ180AMxedQGxfVmYX3h0YB+9eZA+JpNiPOFIYGcOi83TOxja3glg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV+w+fLhh7h7ruRDq/jX280Bf7iutbfuLSMBwftd7cc=;
 b=c+TM+0tdwDuWfL2Ux7Azs6IaKP9Pj+2nrAsJbwId401emvwAFWVLVoxJ4WbVzLLCTih1FfrIA5OLT3FLXGO4zH7LW5oMCdK+CoAuzRLsmFp2gAoiaUIIJDKomffrPuE7y17nB+ieNWeC4sDa8OzY74caqNxt3iHT0OW8Vm/Qeto=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYCPR01MB6835.jpnprd01.prod.outlook.com (2603:1096:400:b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Tue, 29 Jun
 2021 03:25:47 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4%9]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 03:25:47 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [PATCH v1 3/4] syscalls/shmget05: Add test for
 /proc/sys/kernel/shm_next_id
Thread-Index: AQHXRwwqjBuInok3lUGSaO72afR8T6sqnwWA
Date: Tue, 29 Jun 2021 03:25:47 +0000
Message-ID: <60DA92E9.40103@fujitsu.com>
References: <1620809541-6891-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1620809541-6891-3-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1620809541-6891-3-git-send-email-xuyang2018.jy@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae33d978-0fb3-4b93-6570-08d93aad966f
x-ms-traffictypediagnostic: TYCPR01MB6835:
x-microsoft-antispam-prvs: <TYCPR01MB6835FE0D3A7B6FE9BFF89EA9FD029@TYCPR01MB6835.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K+ki5d4BoLJOHyy+Z5gHLqXzIBaUH0nVZeYeVLaHsM96iqZF3p6r7Xy1ZpKzQ9L3VPbF9H2BBEsHAUutw+XQ3TUtDdPc4TU/HJ6Ca0dyr5KEI/4No75IkdR4q68FwDVGZK49ft1Y4Fv8q+GoJCGDKAafIKnIS59a2/hPMYJ5uXaZ3D0asCtYvdDiwIE3jagNgN9oWXi3qLWqdeDJim2UlrSUlpVQkAkFM67jA8YFUWYZVuV62dQmbWKTDAPCnxM3SMbex+r/xMm0HNGudDlJj5vY+BZWrYcejVQdmWUKct8bGd8L+yjoQE6vxaWt1UfnVow2QJDSiipE6lyes7qlKYrRYV8wKUvcbmi4vO+088GZG/x+17GS746BWJ6wfxM3jCb7cNlPg7nzKK9OLtTGqLV9Qr1ZYNh01Koq5j0HADVWWJ584/zqF/dgfgWugkPf/H6LEBBbsZY3qS3kGg2eNQ4EBkZEuKfd+54nKPG1DgltSRVrlNFbhlGHxS5Y+DSheqhmMw8gnz8Y/VLi8jHjJNItsKV/g21zHhYGgTKsjqKUpZg9MnjY0w2LkoYSjQuUtPt3UsxeXNYGHN0vyB8xqJT0DJE8NCRWPdzg/3l4chlOi0OmiRci1oGaTzCM5gmkMr3T1xh+b1Mfz4e5Mt4ukQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(6486002)(2616005)(478600001)(5660300002)(38100700002)(71200400001)(2906002)(316002)(85182001)(6512007)(26005)(36756003)(33656002)(76116006)(8676002)(91956017)(66476007)(66556008)(64756008)(6916009)(66446008)(186003)(6506007)(4326008)(86362001)(8936002)(66946007)(83380400001)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?a3pNYkFTOThlVWlIckMyT1E3dHhGR0tieEEvWVE5MWdidGNCQmhXdkM0MjFW?=
 =?gb2312?B?L1ZZa0FBdG1sWUJIUW9PdHhoeG5BWFlaYVYxUjdibnk5aThDVHNQdHRXZ0FV?=
 =?gb2312?B?ZTlFdEdmYm9paGNzbGNzeVBwcXJaRE5hYlkzZitQY0Q1RUdIbHJWUTlvcDY5?=
 =?gb2312?B?andpekMrT0hOVEFlMHFUMmFyM3AvSVBJUjYwRmRuK1pQVHowOVFpcyttMlZy?=
 =?gb2312?B?anVpY0orcmV0cEJNUVAwTnFTRU52ZTdlM0RUTFYyYWc2dGVsMzZEZFVKc05I?=
 =?gb2312?B?M2taL3dzaEJIOU8xK2NZODF3QlJUekJ4UTEvdjZ6TWU1c2ZiS29yZUNvb0FP?=
 =?gb2312?B?RlVsV3ZjdHNVN2RTU21nOXlOSHR0ZlVHS2l0U1F6LzV0Yks1cWFmNHVQUGQ1?=
 =?gb2312?B?OUNZNS9GMXRlVEhCWTAxR1NRa0dGbnJ0Y1R4eEhGM2duczVvQlZ3VzR5UmZO?=
 =?gb2312?B?L0kxTjhQb1RzK1ZRM1g1L0Zrekh5Z21penVGYU5JcXVpNkpUWHJVZzNicVc3?=
 =?gb2312?B?dWN2WWNYL1A5Rlk5K0RCdXA2Vi9wL005Qng3czNFc2pjTGI2UU9hODV5K2E0?=
 =?gb2312?B?NE9ud1o3SzlQVDJNdWV2WXd4Y3ZHV05MTVZaK0tPR1BXZmVhVHRaVktUN1Ja?=
 =?gb2312?B?VzFTUFJVNlljcmlUWW5NbU1GVjlpUW5lS3ZkMkR5T05aYjlMcGlTMWFRV0xS?=
 =?gb2312?B?QitsQ3IyWVJIZ0lTa2t0d3ZWUS96MHhlM25IOXgzbXV6dzFhcmU1Mk02UWt1?=
 =?gb2312?B?aHh4Z0M2b3hxUjdLUnZ6ZGh3VjRmNHVOL0w0YXg3MVdkZDVSVWxTV21RQkth?=
 =?gb2312?B?UjRmTVg0emJKaWg2VGVCaEY0Zkc0U0F5RjJzZGxFbEpwUkp5VllaeURsVmFQ?=
 =?gb2312?B?ckhrQmR5VHB3dkJIN3F3T2EvNTg5U244OGlqSGhPQmNBUENNV0RNVWJCeTNY?=
 =?gb2312?B?QjJQZUg3OXdrQzRkRXFOM0xIOStNdkxlN2d5QnM0TDZYMmswd3NZdGEwWW5a?=
 =?gb2312?B?Z3FJNnRzZXA5ZmN0dHFqVFJpZHFRbnRXaEtKSkRxQXh1cTNoVWFvUGhGQlph?=
 =?gb2312?B?dGVmSDEyaU83WnhGQ29GSk91dkIxVGliWEdxclB6a0pNS2dNNmV1bDBBRGhN?=
 =?gb2312?B?OGt0SkdrYjNGMlUrNFo4Uk91SzJjZWttVVNXWDNmR2F3T2haajRkTStSNnFs?=
 =?gb2312?B?c0pVaTVqL3Q1K2VkUFZ6LzF5cU05TVlralY1VU5KUG4xcysrbGt3KzY0OGNW?=
 =?gb2312?B?amJIbEVZUUsxRzdBQXM5L0JaVmltYkxXWW1aRnhBb3QzbGo4akEwQ1F1VFZw?=
 =?gb2312?B?WnlCWW1abUlnckVjTGlLWUxkNStRQ3FINEdDQm9qazRBQ0tNa29PcWtBd3JZ?=
 =?gb2312?B?UHdxM1BFNFRwbHdMa294U1dJT3dkZ3lQOHhZVWdaa0YweEc0TVFxVkFxdXFZ?=
 =?gb2312?B?bVB2MDNKdWE1UVBLRnFKYTMyanFPczZUR0dBZXhLNE1WRnNZUGZGZVk1aWFG?=
 =?gb2312?B?N000WURjaHhSUllKby92dXZoTStIeGxhQ3dqUnQrT3kvYXh0TkdPS3hxcTh2?=
 =?gb2312?B?Nmgvc0lPWVgzbEF3U01oZ1BmL0h4VFpweGUvb0xpSDcwZmd2NVJEblhkZHU2?=
 =?gb2312?B?OFF6aktXR05rc1NyOUJ2OUcrdGFCWS9oTUNYc2lIclJncjlwTlNmOStMMDBy?=
 =?gb2312?B?aDZIVUxGNHJQVFluaEhWL2pkcjBacGh0L2ZSNFFTdmF2ZFNJR1d1T3hRTE9V?=
 =?gb2312?Q?3FfYG+w7JeaEeu5fADQogRNMmJx/xpUKvVWby5f?=
x-ms-exchange-transport-forked: True
Content-ID: <C1CDA81C7E304B4D83F571506BB1CCFC@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae33d978-0fb3-4b93-6570-08d93aad966f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2021 03:25:47.6415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 20EA/RhMehwBbiLpKLZTpx+dogNfvTu/NCtinhmcT9WFe7JvgpZro4GqJ9xKTfXIe9sO54AoS+ibKA/7H4cYpEBuxs17y0GrXLPsxHbCpX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6835
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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

Hi Cyril

Since the previous patches have been merged, this patch can be continued.

Best Regards
Yang Xu
> This case is similar to msgget04.c.
> 
> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
> ---
>   runtest/syscalls                              |  1 +
>   runtest/syscalls-ipc                          |  1 +
>   .../kernel/syscalls/ipc/shmget/.gitignore     |  1 +
>   .../kernel/syscalls/ipc/shmget/shmget05.c     | 69 +++++++++++++++++++
>   4 files changed, 72 insertions(+)
>   create mode 100644 testcases/kernel/syscalls/ipc/shmget/shmget05.c
> 
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 2dff25984..63d821e53 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -1402,6 +1402,7 @@ shmdt02 shmdt02
>   shmget02 shmget02
>   shmget03 shmget03
>   shmget04 shmget04
> +shmget05 shmget05
> 
>   sigaction01 sigaction01
>   sigaction02 sigaction02
> diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
> index b3bd37923..ff0364704 100644
> --- a/runtest/syscalls-ipc
> +++ b/runtest/syscalls-ipc
> @@ -67,3 +67,4 @@ shmdt02 shmdt02
>   shmget02 shmget02
>   shmget03 shmget03
>   shmget04 shmget04
> +shmget05 shmget05
> diff --git a/testcases/kernel/syscalls/ipc/shmget/.gitignore b/testcases/kernel/syscalls/ipc/shmget/.gitignore
> index c57df68f5..6f08529f8 100644
> --- a/testcases/kernel/syscalls/ipc/shmget/.gitignore
> +++ b/testcases/kernel/syscalls/ipc/shmget/.gitignore
> @@ -1,3 +1,4 @@
>   /shmget02
>   /shmget03
>   /shmget04
> +/shmget05
> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget05.c b/testcases/kernel/syscalls/ipc/shmget/shmget05.c
> new file mode 100644
> index 000000000..601609648
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget05.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu<xuyang2018.jy@fujitsu.com>
> + */
> +
> +/*\
> + * [Description]
> + *
> + * It is a basic test about shm_next_id.
> + *
> + * shm_next_id specifies desired id for next allocated IPC shared memory. By
> + * default they are equal to -1, which means generic allocation logic.
> + * Possible values to set are in range {0..INT_MAX}.
> + * Toggle with non-default value will be set back to -1 by kernel after
> + * successful IPC object allocation.
> + */
> +
> +#include<errno.h>
> +#include<string.h>
> +#include<sys/types.h>
> +#include<sys/ipc.h>
> +#include<sys/shm.h>
> +#include "tst_test.h"
> +#include "tst_safe_sysv_ipc.h"
> +#include "libnewipc.h"
> +
> +#define NEXT_ID_PATH "/proc/sys/kernel/shm_next_id"
> +static int shm_id, pid;
> +static key_t shmkey;
> +
> +static void verify_shmget(void)
> +{
> +	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", pid);
> +
> +	shm_id = SAFE_SHMGET(shmkey, SHM_SIZE, SHM_RW | IPC_CREAT);
> +	if (shm_id == pid)
> +		tst_res(TPASS, "shm_next_id succeeded, shm id %d", pid);
> +	else
> +		tst_res(TFAIL, "shm_next_id failed, expected id %d, but got %d", pid, shm_id);
> +
> +	TST_ASSERT_INT(NEXT_ID_PATH, -1);
> +	SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
> +	pid++;
> +}
> +
> +static void setup(void)
> +{
> +	shmkey = GETIPCKEY();
> +	pid = getpid();
> +}
> +
> +static void cleanup(void)
> +{
> +	if (shm_id != -1)
> +		SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
> +}
> +
> +static struct tst_test test = {
> +	.needs_tmpdir = 1,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = verify_shmget,
> +	.needs_kconfigs = (const char *[]) {
> +		"CONFIG_CHECKPOINT_RESTORE=y",
> +		NULL
> +	},
> +	.needs_root = 1,
> +};

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
