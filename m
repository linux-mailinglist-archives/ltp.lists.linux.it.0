Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B783B6E7E
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 09:01:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F8F03C6CFB
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 09:01:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D29413C194A
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 09:01:52 +0200 (CEST)
Received: from esa8.fujitsucc.c3s2.iphmx.com (esa8.fujitsucc.c3s2.iphmx.com
 [68.232.159.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C8F1D600923
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 09:01:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1624950112; x=1656486112;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZeWrvN2SwUdzRm59MPOQV1YZfqF3aR6SORnZkYLCL6o=;
 b=WrS1JVJrQg8RdUZnjMCpyMJYajgeg7eafl2+EC6UHQdLMbivJ5I3fU8n
 x4WmPycbV6fjm8qosz1W8IQWjZbQhI9w/geIq0t3AJJXpHLCkSXSTAMCK
 gXUxj9WxMsGRPJTYkOkJeyoirjAJLSDpefg6blzmLjB5lq15MWq+enVAI
 1WNzpO9bTRo13Z4syD98qlJHD6M5MSWRE0jv1cZUZe0C9GULIoR3YwSyr
 vuRFWgQj9F5YNlWLNeQLWO5w0J6LVsxhibTPLAyl7ytyKp8mbO/EGcN+b
 Ic5f3gRVWk7PhL7fb5rsbTrMfzszQCeq6ikIdozYgkPkYxGF2Mob9EZ96 g==;
IronPort-SDR: X+JELVETB8SkO8tChP+KIxRkCoYcNrNsEiLpR+clpHKGJqcaSiew7NUWhvYyNWgE3r2XpjhGMa
 V6PEpQZLHgK4bBBeXjVJHcxJKtgeQ8KE/KwBJVFUJ3EynrgN3YOIo234zw1P5Ojqd4hnYOEyrb
 HclO1RgrlP8LyGI2XvH8HuN8wTg9iM4ckN5jsptbA5Y+h0r+q9tjQHTxsT2OSdqnvUV3Et8eYW
 qaFMY0mMVsJe8Pqu8+TjHNpaWwzvoiBtCLi5yOkGE/eJXeDpwpSWE7ouDzYN/z1AoSBHF+leu7
 td4=
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="33975750"
X-IronPort-AV: E=Sophos;i="5.83,308,1616425200"; d="scan'208";a="33975750"
Received: from mail-ty1jpn01lp2053.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 16:01:49 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2BjE7rvqDT36h2TmDScoqYYGzpNjmpfv+EL4Q04cT7FcgwdeOoCvqB/+kVzX5YlDRHHbsM2wkcVjxJUaTGxDkvuugwb8IXrgitZ6qL+ndP5/txjMhtUHgcE2vQnB1BWktS0JnZTWnvdhd77W9TGcVNZRadPhllE/uT7UWpMDe5Ii4uwIDCtzMXRsxl7DnUFgkWo3nj1R1qhs0HAdx0ysvz9oz7B57MV8Uf2fE4upJSysh4MYdJMz7Eq26U2oySBt6wPlg9DuwTVQiDj4f/re/ZVEAtdlGFuIrSKBzVEUOcRI1+2lju7GoRxrhwK4Fy4/CLzwu/KHQkvX4AOKkbNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeWrvN2SwUdzRm59MPOQV1YZfqF3aR6SORnZkYLCL6o=;
 b=RZ8v3LzdktHtKihl/pI+eAs1Z2YAimGG4YzPs564eBOlmN8UDz44IqbtwLoziN3x0ZZK5FZNRCAiB4jkWHV9uZ7G/eqTUVTgzU98nMQ+pORBZaSx44jtIdViFc7EBi6LVLyIujJk+dxkWYj+EcHuQEyoatRilOaE+InVJhXbF5J+mEyiSfoMjLlvfVvcov59xBSyU4Dh1H7p7u6jFMbdKkdCy8/qdTTcAnX6uKAYK18JGvgpI3agHKRmxe6WSd/5koXdjVQTMcWDGUuw/Uiceh3sqhLCxaAQFjVYK1iPBYJhMyPN1WMb4FXm/I8WIWsrAl7u5GoTcYALQvksevIn/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeWrvN2SwUdzRm59MPOQV1YZfqF3aR6SORnZkYLCL6o=;
 b=S0FEcKWwQ/KSxUsWr+cyq3YiO3pwUCtYf7t/Ep0lGl7ERJSDKzrK0s1zCgXafbU+rBBTcYggji1EYkfbaetbt+/x7ZVfyjCGHT0m+pG+FrBmPsaJRybx5yyuFenWO7CAMXGvd60+ATMOWm2SwFD0Awq2fg+shOcyAMvZRCRnGjA=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYCPR01MB6288.jpnprd01.prod.outlook.com (2603:1096:400:7e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Tue, 29 Jun
 2021 07:01:43 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4%9]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 07:01:43 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Leo Liang <ycliang@andestech.com>
Thread-Topic: [LTP] [PATCH 1/1] cgroup/cgroup_regression_test: Fix umount
 failure
Thread-Index: AQHXa84B22xFiKlYW0CK3TkDJ6WjbKsqkdUA
Date: Tue, 29 Jun 2021 07:01:43 +0000
Message-ID: <60DAC584.7000500@fujitsu.com>
References: <20210628033002.GA1469@andestech.com>
In-Reply-To: <20210628033002.GA1469@andestech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: andestech.com; dkim=none (message not signed)
 header.d=none;andestech.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c396e3b9-b77b-47a6-16be-08d93acbc0cc
x-ms-traffictypediagnostic: TYCPR01MB6288:
x-microsoft-antispam-prvs: <TYCPR01MB6288D7C46263B23D90DCD158FD029@TYCPR01MB6288.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Lkf+OI97eicrtKztG/tTG4BwKNl2ZOyAZHljeXQX3oaqOydMvXiTqBuweWb25PRTfmtbR/sZcznZhW7yMfCyclMedkPfncaHe7Z9YeTFOOn+IQOwQzA58j7D4vpw/8OXUhDcRNbBnP0d5Srq+5SIJnm4MYHFBD/qgDJdcjG9s7j0wmfBsNSdP38ffzgd9W7P0Q2SchSBeQlqSkNYffOnXI3IrqAwpLhQuosq8eLuRXebqHJhFJxUISYtztTvLq8ubYx8FdlrdQxyZRWYApjuKofiq0rCT+e2BmVYAWPiYBhDH5zrQK1n5bbn/vgOKMUC4J7947sbJH8W3gw0rWIg1TVmDYkUxbt1uXbSAKlkkZFVbvWhzyRBYZ8943FcZn2Szasp5IvxnUSzDpxrVD8/82SC5XCXcVC+mtvTZo9e7EFq9o0i1SRGk0d6DH1sYsn0hBHaKqx/h5/hXfL3SJMD+0+Xg+4rlbrOKE1nZJAqbAQDyyYzY0lWLkrcCOwlzt4HS1shI7si/fvoBpZ1BOhWuYEpYaGXjwMB8iscVBYoYeVPHEbUroXrkfuk3gSJRVnNJ7N1VjLyxhzOQvjbtZCf3NMER8w0PNcESxIR5vsenoZACCWP2GLIFd6UEQT58oduZtFzNVSmqfJzmJH6VopvrM23AXQG3/P/J8iT/+eg/qy690RufK8pxo+5LejemVJvAA2Xis3Zf2LeB8PzCxixg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(8676002)(71200400001)(6486002)(53546011)(5660300002)(2906002)(6512007)(478600001)(86362001)(26005)(186003)(6506007)(85182001)(66446008)(64756008)(316002)(4326008)(91956017)(6916009)(66556008)(36756003)(76116006)(2616005)(54906003)(87266011)(8936002)(33656002)(66476007)(122000001)(83380400001)(66946007)(38100700002)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?cWppd1hWOGIycnlXYjBYTEs3TEFEcjZWUlVaRmJsUEFlMm5XLzlJZituTngy?=
 =?gb2312?B?L0lnY0dneVVBNUw5WXVFYmJBc3Z0eXFBMmNHNWV3bmNJbkFkazVvQ2tBcWls?=
 =?gb2312?B?VGFGM2FOUndYNzFOK3lvMEE0MTVzb01pcGNIRUVvanJUZ2tPdWFnTzZuTGRT?=
 =?gb2312?B?UlpacEg4bjhUSjc5RUYwTUdCamM2bjlDa1Bmc2NHWDVtc3RMQWFRSkN2Z0Fr?=
 =?gb2312?B?UUxENjdyaExCbzdVeUFnM2pzcGJ4SkpBaDhqeFpGeHFmd0VmckZRTkpCK3Vr?=
 =?gb2312?B?MWZ1a1ZoSUNTN0ZXdGdSeDNjVVY3TFRpNFR1TVZIWnpSdHJxZVh3Y3JtZkZL?=
 =?gb2312?B?K2tQNGx5RTl5UEJ3K2IwN2kvRjkxOWkrMFd6SE9RWnZhU3I2c2FReDdjK09D?=
 =?gb2312?B?WVpZM3lCMk9KdkpiSVJJek92MkdwZEY2M2xubDd6WE5oQlVmTUx6aW4yYlo1?=
 =?gb2312?B?VHZrWWtDRE8ydzVMam04WGhzb3c3ZDVTY1EvV09yektOeHNnV3RyNE1WWDNt?=
 =?gb2312?B?TEJPMjBLdU9LcVMxdjdmNUxwOEVCbXAzQkN0dUdLTnAvSWhJZ2hINTdad2hC?=
 =?gb2312?B?VEwwbTIvV2hZMmRFUEhTZ0JBcmVuWFE4aTM2Rk03RHNteDZFYmpJVHFhYzd5?=
 =?gb2312?B?MlhZK0FoOVYvUmJGc1NENkx2UWZsL0ZsVFlVV3d5SU1RRzg1RVRvNDYvTk50?=
 =?gb2312?B?K0cwelRpK3hxV3FFbkI3dTNzei9GMElvb1p6UXJPSkxYcWx1aUgwQ01NL25i?=
 =?gb2312?B?UW1NUTZpbWZFSFNlcHRkclBJaFMwdmgxTk5IaWwvTkQ5MWdVbHViQ3puTWNo?=
 =?gb2312?B?LzV3RGlLZzlwZDB1Sk10S2pIMUZESUdmM0pyZmlzTXVUcUU1YjdnZk5LZnJO?=
 =?gb2312?B?b2h0YnhRTFJCYzFWZHIwRHJRQVFvK1JXdi9hYUNKak5Wek9pYWNLUmh3M0lC?=
 =?gb2312?B?RHhZSWttUVlaSm01ZGVXa0lyK0NBQThlbnlVVXRQalMxb0FGK0FhQlNCdnZM?=
 =?gb2312?B?bVpSUlVJRStxdWxzZWVsS2UxYVdOYUxzOEp2VUIvTGdSWExrS09tRWpnTjl1?=
 =?gb2312?B?OVF2TndkTU1uM25IUlZBalZDZWVuTlNRb0E4K2ZBWG9nb0Q2ZmphZklTUTl5?=
 =?gb2312?B?NDdsQ01kNWdxeWYrTHo4QjRYdEIvR2pjYjBLdVh3a3UwbWxVWmVqMGk1VFFm?=
 =?gb2312?B?bW9TbjZrbkhOdUFQOHFSUFdsd0F3Nzl5VFR5eTg2NTRON1QyNyswZnJ0ZEd2?=
 =?gb2312?B?UUZ0TFZWdW9UZWphZ1pEcThYeGdnNEdUNUhxQ2ltcjU2MXJ0enhXOVlKUmVS?=
 =?gb2312?B?em5talpqSjA1NTB1QklCRWljaS9TNnAwVUNTMDBjV2dkc0Vxa0VVODBsZFN1?=
 =?gb2312?B?VlY5VlRHTXpaQVpnRDhHWEFnbTdpeDYvNXB2dUxKck1xUmNLVk1xL2dzQU5n?=
 =?gb2312?B?SU1IQW8vc1U0TDc4QzVwMW5LMXZiMUFoS3JFRGhjb0NxY29EbWhjd1kvOTJH?=
 =?gb2312?B?N25DWHZIVVYvT3JDekVlVDB2Wk5SRkhwMTVPM2lmclJ2MVBoaURiNGQyZUps?=
 =?gb2312?B?SkN0ejNpL0I2blFWcmpjeXpQT0U1dCtoVHRrd3hsU0xJemJuaU1keTRaaGlp?=
 =?gb2312?B?ZTNMMzEwQlBRMGlYYkR6QmVmSVp3N1dXdHB6cjRGVUM0bEhWaFcyZm9DV2xw?=
 =?gb2312?B?cThkMkxuemRRNFAxREZKNDlCYmwrd0VyQ0V2V2E3ZlhCZllrRk5aV2pKTkZM?=
 =?gb2312?B?VzVVWHVCRUFKOWRkTHFmMmZuSmRwUmxVWnZNb1NrWXZieVU3RzU3bjVXaytk?=
 =?gb2312?B?MHVEaDVJVi9IazloWGRldz09?=
x-ms-exchange-transport-forked: True
Content-ID: <9C9F30CF8CFCAC41B575D879994E6B09@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c396e3b9-b77b-47a6-16be-08d93acbc0cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2021 07:01:43.6719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: idUlgfxeAgcT1wfo6aEGkw0Dy9rGyZ5Hn3bDBYRIlXq/xgOwWH0rCFHG/ZdYTLUyfBS+cONVNuTLmMdH5VITdDFD4d+YkCcM0FaWqR3XxoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6288
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] cgroup/cgroup_regression_test: Fix umount
 failure
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
Cc: "richiejp@f-m.fm" <richiejp@f-m.fm>, "metan@ucw.cz" <metan@ucw.cz>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi

IMO, Even we call sync, this umount may fail because sync ensures 
nothing.  Why not use tst_umount?

Best Regards
Yang Xu

>  From a151d48235629a125d5db57dd76c96fd951d5293 Mon Sep 17 00:00:00 2001
> From: Leo Yu-Chi Liang<ycliang@andestech.com>
> Date: Mon, 28 Jun 2021 11:05:54 +0800
> Subject: [PATCH 1/1] cgroup/cgroup_regression_test: Fix umount failure
>
> The test sequence
> 	mount -t cgroup -o<controllers>  <path>
> 	mkdir<path>/<dir>
> 	rmdir<path>/<dir>
> 	umount<path>
> 	mount -t cgroup -o<controllers>  <path>
> would easily fail at the last mount with -EBUSY.
>
> The reason is that this test sequence have the chance of
> missing a release code path when doing rmdir and umount.
>
> Add sync between every "rmdir, umount" pair to fix the problem.
>
> Fixes: #839
>
> Signed-off-by: Leo Yu-Chi Liang<ycliang@andestech.com>
> ---
>   .../kernel/controllers/cgroup/cgroup_regression_test.sh    | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
> index 1f7f3820e..9a00df101 100755
> --- a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
> +++ b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
> @@ -145,6 +145,7 @@ test2()
>   	fi
>
>   	rmdir cgroup/0 cgroup/1
> +	sync
>   	umount cgroup/
>   }
>
> @@ -193,6 +194,7 @@ test3()
>   	wait $pid2 2>/dev/null
>
>   	rmdir $cpu_subsys_path/0 2>  /dev/null
> +	sync
>   	umount cgroup/ 2>  /dev/null
>   	check_kernel_bug
>   }
> @@ -222,6 +224,7 @@ test4()
>   	mount -t cgroup -o none,name=foo cgroup cgroup/
>   	mkdir cgroup/0
>   	rmdir cgroup/0
> +	sync
>   	umount cgroup/
>
>   	if dmesg | grep -q "MAX_LOCKDEP_SUBCLASSES too low"; then
> @@ -254,6 +257,7 @@ test5()
>   	mount -t cgroup none cgroup 2>  /dev/null
>   	mkdir cgroup/0
>   	rmdir cgroup/0
> +	sync
>   	umount cgroup/ 2>  /dev/null
>   	check_kernel_bug
>   }
> @@ -290,6 +294,7 @@ test6()
>
>   	mount -t cgroup -o ns xxx cgroup/>  /dev/null 2>&1
>   	rmdir cgroup/[1-9]*>  /dev/null 2>&1
> +	sync
>   	umount cgroup/
>   	check_kernel_bug
>   }
> @@ -324,6 +329,7 @@ test_7_1()
>   	mkdir $subsys_path/0
>   	sleep 100<  $subsys_path/0&	# add refcnt to this dir
>   	rmdir $subsys_path/0
> +	sync
>
>   	# remount with new subsystems added
>   	# since 2.6.28, this remount will fail
> @@ -349,6 +355,7 @@ test_7_2()
>   	mkdir cgroup/0
>   	sleep 100<  cgroup/0&	# add refcnt to this dir
>   	rmdir cgroup/0
> +	sync
>
>   	# remount with some subsystems removed
>   	# since 2.6.28, this remount will fail

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
