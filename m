Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE22B3AE562
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 10:56:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 352963C70C4
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 10:56:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2E84D3C7037
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 10:56:38 +0200 (CEST)
Received: from esa4.fujitsucc.c3s2.iphmx.com (esa4.fujitsucc.c3s2.iphmx.com
 [68.232.151.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 658B410009AF
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 10:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1624265796; x=1655801796;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+psfLZHbgYyKVioUQ1zmBlTeFZimk8eDmPd3ZYOTDEE=;
 b=pX4OWsz87g+SSReRQzJWu8IaaLpmDCNX4pT9nzXmPkz/bRljxS8oak8n
 eBoEokLK+Yfzb7GRgxchRPA1seK1BfrEJFeNnorRKI8X5ic+7uuqb7xgr
 rQFVWZMwmKDzbHvO6Slti6763/Ht0p3u9g+VSZ7xIqr3UXSiuU0C5Y3FL
 bzOziTB6ynugCCM7AsTIuhLrB1GMO+KqkA+SnvI9bC7i+PDYmP5PXVum6
 euSN6/Wt+tP01IJdMT8KSQl5FvdTKlnOjg/8WQgm2WHNQK78Euf0nhMmm
 8kZ0nakOUzhL0f4nbaA3UE40LcE+/AnfYAH1BBZC9mPzCxjk0LcrGs2Yv A==;
IronPort-SDR: v8coIy1ktPlmb3dJ37ETGFktLgMKNfp5AXOsx3giafqwnIFEqKsraoCg6Ymsp/vVyDzoxP1GTy
 RHMQGGZxi7jbM3Ynewk+HP3BbnDQuEfIS7M+MqTT0YaJS7L5CL6OOu8JfAiybg+zoSFDLMQTqK
 JH7cMH+b3IfSVtMM2afalmleDbb2a/+Bk8dUpV1EwTKddui4Xor2Ngj9zqWvyM6HXSFIP3afqh
 vndOpxyhJ4bFd8xGtIChqtUiydYAez57XIQe8ML2BaDPqXw7iowZKhXEwXmm55lxl2DxqugLIE
 0rM=
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="41402675"
X-IronPort-AV: E=Sophos;i="5.83,289,1616425200"; d="scan'208";a="41402675"
Received: from mail-pu1apc01lp2051.outbound.protection.outlook.com (HELO
 APC01-PU1-obe.outbound.protection.outlook.com) ([104.47.126.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 17:56:34 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EICtdDxrdEJ0uzCvBDry8N/VzBE8bYDWX+isShjAoXBQ1yj3tnO0CLwo/A3gBaItAGmL/IhV+7taeNrSV0KPIXvqmKKPQ3mvq6Z0ljAFbZ7v43EQxHtYHo1YQwtgggf20OHiYKrioqsNlUiO4ijvFreXxOFS9fR3iBlxNgRuMuaHN1qjjCdnxPu+zNCKhvmTPxcrBFE1u9nfeSfM7BK4VJo1LqxN0xmvUKsRwFx1ZtU/m8W6AXKbVs0FlOthF5wGzLjFbtNKdzKvlKCsvHXBhJJnw3WZBQuc3TV2o9hcbCzlIsknBnrAyErC9LsZogObYypttbgz0b1OoBvtcjxlAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+psfLZHbgYyKVioUQ1zmBlTeFZimk8eDmPd3ZYOTDEE=;
 b=aeTZGYC59QiSsk+xmxzq4OW5qn+c+W76BFHVjjIcn0hE5qSgyxuUA+cT6HkDihhZZKoU70Echzo2MGy425XZ3Hsiel6Y9oWqM+XYKpLeZVzWgFZ27JaBpFOZFuI2eC7zwlC5YEznWO2Q1yIAM+23JQTLSDz3Wl3QMqcDeVnfD+EOykRCTqVk+Ah3DAVPcrUhGhSAoD6XJShj9BbYv17mpM13dnwIJ3mcxE53ipYoL/H29g91N6CHi1IQsRPA6pk92NksHrEluEiq3TMIIis9e/JDVOs8Q8bHqLcdRWsfNxP/rbl6EKxqh/sO3WSWS4bKrIYahUoNcZfz/iES5eCJgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+psfLZHbgYyKVioUQ1zmBlTeFZimk8eDmPd3ZYOTDEE=;
 b=IBlkO3rQAiIdZLwqxWtachXKX3nfEfs6QVxj43usOBXEdZ/QxWWREc9OlBZy9X1rFRKTbL/d7u5ngYN9lxiK6Im9+0yecKxjBzhUGhKSJOKHEfAUGuAI+nAENwPW/e5MEiYV1ht38wVEAm6pUoqDnvPD0JcfknN92HUYdvTFWk8=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB4362.jpnprd01.prod.outlook.com (2603:1096:404:110::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 08:56:32 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4%9]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 08:56:32 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: "zou_wei@huawei.com" <zou_wei@huawei.com>
Thread-Topic: [LTP] [PATCH] cpuset_hotplug_test/cpuset_hotplug: Fix bug for
 obtaining task_cpus value in root_cpu_hotplug_test
Thread-Index: AQHXKsS1AK42sgBV30i3Y9nkmdkef6rHtZSAgFDG1wCABiTbAA==
Date: Mon, 21 Jun 2021 08:56:32 +0000
Message-ID: <60D05460.5060903@fujitsu.com>
References: <1617701249-62196-1-git-send-email-zou_wei@huawei.com>
 <437bb60b-4f97-4884-8713-c7b619dab211@huawei.com>
 <60CB2CF8.6090108@fujitsu.com>
In-Reply-To: <60CB2CF8.6090108@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66870f72-8a81-40b3-05af-08d93492779c
x-ms-traffictypediagnostic: TY2PR01MB4362:
x-microsoft-antispam-prvs: <TY2PR01MB436278C87F0A3800AF12BF6DFD0A9@TY2PR01MB4362.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5oUIo428Rw/hkcTyk9tS+Se/Vp3k6FVMeGtMbLJ/c+YFDMLlUPhTFwfEP3qX+RzBAbjrJ9vPouViBZI15kCW2lfx9rCNNHz4RipuO3l4tWDFQj1z764Fb++gVg7+mV6dUuvbZNPRxY49tIcrPL1+SEFZtqNisjgSaY6iylIlY4GvxDu6KC1H+GlPIrW8Od6g5v5hZ5QOLP+8RNL9KK8WzgK39jJ1KzOkc2nsj8lcVMH5WkxyXCnZyFDQBRrXJkYkIvbOr1B+qFaCTMvB9zxEv/9jTuX9b326rq+RyioRe74cFE/R3oB3TNf/pCwd1YpEehqHbPiwg0xKDc/CrQqWDSUo4vnGQNuYoc5S4raRKcWn5Ni2rPMAYlqg4GYop0XV26Zlbkg1r9xP9JXx16bSpwfjqGdpEM24s+jPsUkWlMdXwSvF5WRPMbZxmzR3jNmvWiNVqu1sYgeB+xyycN1gxKzx+oQUyjHu0B9xUZGmm11fc4zEkeBjr7JcCmT/VRWpI/uxvcMvJxi5KHbH79I9tPpqIYyEJELgSNRzYB4BRZZmwHeJBi0+gy4MLYv9w995X13t2ah5gJ+FYVKz1AgS8cAyDlaFovAi7aV6xMQl/uebotWLs4XkFxi1I9Q6RTHWJ8/mCGENxdGA8lmDYi2OJzkLe3/YfmfN5yy5lTCVBwj2m73ZHgnluSJFZfqNV0CxthnwsNpxNJtkkFmuwbtOMDeVnxCSJkXZ+We48yqxlwbNSCm9xgnQpqgHjBth40bY4Q/X2NlA4rfvJshxRCXv3Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(966005)(26005)(85182001)(6916009)(53546011)(6506007)(8676002)(83380400001)(186003)(86362001)(4326008)(122000001)(6512007)(36756003)(38100700002)(87266011)(66946007)(66476007)(66556008)(64756008)(66446008)(2616005)(71200400001)(8936002)(6486002)(316002)(33656002)(2906002)(91956017)(478600001)(76116006)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?V01qdEtoNzk5WGIyU1h5ZnR0QXppMnBjdXlqMTgzNUxZMGVaei9XYkZ6c2Jx?=
 =?gb2312?B?em9xNWdqYmlFbnEyZFQyK1NoRzl1QlAwcHI2UUlLMXRpK0FMQTE3YkdqSnRo?=
 =?gb2312?B?YTRrRmZNVWo0SVZRYlptWlhBRFVNTXJCTGZOb3R0aVJadmk0T3hSY0RQaWFu?=
 =?gb2312?B?emgvYjl1NitVV0hQaWFmWWVwOGFwTjhjTlVpWWNzY1ZNK1llcTNJcG9aWGhP?=
 =?gb2312?B?Z2g1MHphaGlJNndLUHo1Y2dLd0dqd0t3Z1ZUVmRDaGVoWXNBYitNUGt4c05u?=
 =?gb2312?B?K2FPdThzSjMyWEovdUlKSis5eEEwNXVPcWdwanYya3FqOVFvbkxKaVAvMHpW?=
 =?gb2312?B?Z29uVFJSNVo1ZjVGLytrejRzNGVEZ3J0OTZ2bVp6YThYdzJaekFrWnI1UGtF?=
 =?gb2312?B?eTBVanpkbFRzdzZYTjNhZHEzbXZqcHVsWjFVVnZFbk56aGVEWXArNGQwWW1Z?=
 =?gb2312?B?RHV6MjFyczVlcHN3VnkwUUtHT2F0U200UFN1aCtJdnR6cmdHWkJ0OFI3Qkd6?=
 =?gb2312?B?VHJvanBpRTZFc3J2UU9adGYyd05PV2JqdWY0VlRSNFI3YXQvZDRhN21EMnkv?=
 =?gb2312?B?RG9ROWhQN2RnQXdQczFFVjlVREwwdUhEVVdLSVVaTUhKQjBIVFNtN0JCaW10?=
 =?gb2312?B?U3Y1bmpqVXgrYnRXU2tIeXpPZ2pDYWZ2QUNTQStFN1VCTmRUTFhwL3AvNXk3?=
 =?gb2312?B?L3c2M0lJV1AxOGdHYnB6cWZoUGNCN1NieDVmWmovaUN4RzYxWGV3bVB6NjI1?=
 =?gb2312?B?L0Vlc2hrR3Btbi9jOXZhVStIaGlIM05ETHVsYjBXcmIwaTd6MkM4OGh0c2Na?=
 =?gb2312?B?SjhWR1ErMUtXQmFFRXcwQVFwSktVdi8zSTliR0lDNlMrZUE3YXk5d0xDOVVV?=
 =?gb2312?B?K0h6eGp0NDM4clprdlFWcDhwWVhxWGtBMUFqNzFYNG9LK1ZubnVzYW9yUEQ4?=
 =?gb2312?B?eCtrU202TmFpclk5emhEOHE3VlZSYlBXTG9VZXV3Zml4S0pYUVFQa1VLKzRQ?=
 =?gb2312?B?Z0FGY3R3enFLYUtaQXlISVVBTnZLeTdQdlVvVkxKM0w1WUJvdkI5QzJSbVVH?=
 =?gb2312?B?OHJDc3lEZExORllDRDVVVGcxQ0d2WmpQRC9ZaDlOMElXbjArazF3bWN6a1FZ?=
 =?gb2312?B?cEFZOU83Z1NTNVVsTXF4anFrdGNLc204N0FmK2xEOFdSSks4dlFYRmNqMXVY?=
 =?gb2312?B?bUh3TUFrTHB2d1pvc2VQSjVXVWR2a2xxS1ZINHhPZ0tPZC9RNFI3elVpVk0z?=
 =?gb2312?B?UEFZR2NkMmwxL0xWWU5kNEM0ZGVEbzdNczdKZTZlM2I4c1ZnOFlHRkdSQjgz?=
 =?gb2312?B?V0pxZWhZOFd5QmRLZWQ3MFUzMmRlUkRMVkZjb0JXOUxMZEFDS2ZqMWJxZitR?=
 =?gb2312?B?eDgxcVpRUU1hZjUzbVhIWUM2UGV0RzZJVEZWcU96YTU5Qmc3d3JVL0l4d0lV?=
 =?gb2312?B?Nlo0dkFqQ0FCMFpkTW5qSzZUcmNTZ2JtMFl6WFhuQitOMnhjMklMdS9Ka09I?=
 =?gb2312?B?SC9HSWFmRnRoblVMbWd4SllYQnVpV0VpVnRNbEpRREpWZjdrMEZxZmVXVWJp?=
 =?gb2312?B?UDc5N3Zta08zL1FGcU5lVmpaNU5UTy91UnE3cGcvT29iSE5iZUdBSVgvZWQy?=
 =?gb2312?B?YXU3aW1kS3pSLzVPOHdoc3BaaEFHWTUxV2NOalZtNUdoaTJJSEM5d0psSlVi?=
 =?gb2312?B?cFhLWUV1U2s4TEdxTFR6aS9FNjFIdklJVEt5NnM0bW1WaVA3S2s2WVVPeFE2?=
 =?gb2312?B?aWhTcDVkcTNSZ0JpLzFvVS8xTlVySU8zNHpQbnpQRmxpZ1VrMVRCTlowNjM2?=
 =?gb2312?B?N2VqOXp3VU56c1Mya1Budz09?=
x-ms-exchange-transport-forked: True
Content-ID: <076759926F9ED94C9A5615F0A4D10D36@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66870f72-8a81-40b3-05af-08d93492779c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 08:56:32.5572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jo9tfM+4dpHqdmjvwh+ZPYV03rRxxK7ab966sxvA3uy6iWjijDP+2vddHkGJQ2A0DZp+p3hs8MXdZdCSuybv9VcFZe+u1E2MxpFI6EqKp0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4362
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpuset_hotplug_test/cpuset_hotplug: Fix bug for
 obtaining task_cpus value in root_cpu_hotplug_test
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

Hi Zou

It looks like this patch also miss to get task_cpus value 
intgeneric_cpu_hotplug_test when expect cpu value is EMPTY.

I can reproduce this easily by increasing the possible_cpus value in 
cmdline. Merge your patch, this case still fails as below:
cpuset_hotplug 1 TINFO: CPUs are numbered continuously starting at 0 (0-3)
cpuset_hotplug 1 TINFO: Nodes are numbered continuously starting at 0 (0-3)
/opt/ltp/testcases/bin/cpuset_funcs.sh: line 179:  5676 Killed 
         /bin/cat /dev/zero > /dev/null 2>&1
cpuset_hotplug 1 TPASS: Cpuset vs CPU hotplug test succeeded.
/opt/ltp/testcases/bin/cpuset_funcs.sh: line 179:  5714 Killed 
         /bin/cat /dev/zero > /dev/null 2>&1
cpuset_hotplug 3 TPASS: Cpuset vs CPU hotplug test succeeded.
/opt/ltp/testcases/bin/cpuset_funcs.sh: line 179:  5750 Killed 
         /bin/cat /dev/zero > /dev/null 2>&1
cpuset_hotplug 5 TPASS: Cpuset vs CPU hotplug test succeeded.
cpuset_hotplug 7 TFAIL: task's cpu present list isn't expected(Result: 
0-7, Expect: 0-3).
/opt/ltp/testcases/bin/cpuset_funcs.sh: line 179:  5795 Killed 
         /bin/cat /dev/zero > /dev/null 2>&1
/opt/ltp/testcases/bin/cpuset_funcs.sh: line 179:  5846 Killed 
         /bin/cat /dev/zero > /dev/null 2>&1
cpuset_hotplug 9 TPASS: Cpuset vs CPU hotplug test succeeded.
/opt/ltp/testcases/bin/cpuset_funcs.sh: line 179:  5894 Killed 
         /bin/cat /dev/zero > /dev/null 2>&1
cpuset_hotplug 11 TPASS: Cpuset vs CPU hotplug test succeeded.


Also since we have use present value, we shoud adjust output to match 
it. I modify this patch as below, What do you think about it?

--- 
a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
+++ 
b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
@@ -93,9 +93,7 @@ root_cpu_hotplug_test()

         root_cpus="`cat $CPUSET/cpuset.cpus`"

-       task_cpus="`cat /proc/$tst_pid/status | grep Cpus_allowed_list`"
-       task_cpus="`echo $task_cpus | sed -e 's/Cpus_allowed_list: //'`"
-
+       task_cpus="`cat /sys/devices/system/cpu/present`"
         check_result "$root_cpus" "$expect_cpus"
         ret=$?
         if [ $ret -eq 0 ]
@@ -103,7 +101,7 @@ root_cpu_hotplug_test()
                 check_result "$task_cpus" "$expect_task_cpus"
                 ret=$?
                 if [ $ret -ne 0 ]; then
-                       tst_resm TFAIL "task's allowed list isn't 
expected.(Result: $task_cpus, Expect: $expect_task_cpus)"
+                       tst_resm TFAIL "task's present list isn't 
expected.(Result: $task_cpus, Expect: $expect_task_cpus)"
                 fi
         else
                 tst_resm TFAIL "root group's cpus isn't 
expected(Result: $root_cpus, Expect: $expect_cpus)."
@@ -166,7 +164,6 @@ general_cpu_hotplug_test()
         sleep 1

         cpus="`cat $path/cpuset.cpus`"
-
         task_cpus="`cat /proc/$tst_pid/status | grep Cpus_allowed_list`"
         task_cpus="`echo $task_cpus | sed -e 's/Cpus_allowed_list: //'`"

@@ -186,6 +183,7 @@ general_cpu_hotplug_test()
                         /bin/kill -s SIGKILL $tst_pid
                         return 1
                 fi
+               task_cpus="`cat /sys/devices/system/cpu/present`"
         fi

         check_result "$cpus" "$expect_cpus"
@@ -194,7 +192,7 @@ general_cpu_hotplug_test()
                 check_result $task_cpus $expect_task_cpus
                 ret=$?
                 if [ $ret -ne 0 ]; then
-                       tst_resm TFAIL "task's cpu allowed list isn't 
expected(Result: $task_cpus, Expect: $expect_task_cpus)."
+                       tst_resm TFAIL "task's cpu present list isn't 
expected(Result: $task_cpus, Expect: $expect_task_cpus)."
                 fi
         else
                 if [ "$cpus" = "" ]; then


Best Regards
Yang XU
> Hi Samuel, Zou
>> Hi,
>>
>> A friendly reminder for the two patchs in:
>>
>> https://patchwork.ozlabs.org/project/ltp/patch/1617707717-63693-1-git-send-email-zou_wei@huawei.com/
>>
>>
>>
>> https://patchwork.ozlabs.org/project/ltp/patch/1617701249-62196-1-git-send-email-zou_wei@huawei.com/
>>
>>
>>
>> Can someone please review the patchs, comment, and if appropriate commit
>> them?
>>
>> Regards,
>> Zou Wei
>>
>> On 2021/4/6 17:27, Zou Wei wrote:
>>> --------------------------
>>>
>>> 1. The method of obtaining $task_cpus from root_cpu_hotplug_test is
>>> incorrect, because the value of Cpus_allowed_list is related
>>> to /sys/devices/system/cpu/possible and
>>> /sys/devices/system/cpu/isolated.
>>>
>>> 2. If isolcpus is configured in cmdline, the value of
>>> Cpus_allowed_list is equal to /sys/devices/system/cpu/possible minus
>>> /sys/devices/system/cpu/isolated. In this case, $task_cpus is
>>> inconsistent
>>> with $expect_task_cpus, test will be failed.
>>>
>>> 3. Need to change the method of obtaining $task_cpu
>>> from /sys/devices/system/cpu/present.
> Thanks for your patch, I also met the same problem when
> /sys/devices/system/cpu/possible is not equal
> to/sys/devices/system/cpu/possible/present .
> Cpus_allowed_list: 0-511
> but my present cpu is 0-103
>
> Then I use possible_cpus==104 in /etc/defaut/grub, cpu_hotplug case then
> pass.
>
> According to kernel documentation[1] and kernel fs/proc/array code[2](It
> just print cpu mask instead of present cpu), So using
> /sys/devices/system/cpu/present is right instead of getting cpu_allow_list.
>
> possible: cpus that have been allocated resources and can be
> brought online if they are present.
>
> present: cpus that have been identified as being present in
> the system.
>
>
> Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>
>
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu
>
> [2]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/proc/array.c#n418
>
>
> ps:
> Also find a kernel documentation problem and have sent a patch to remove
> non-existed cpu-hotplug.txt in admin-guide/cputopology.rst.
>
>
> Best Regards
> Yang Xu
>>>
>>> 4. The description of cpu_present_mask:
>>> Bitmap of CPUs currently present in the system.
>>> Not all of them may be online. When physical hotplug is processed
>>> by the relevant subsystem (e.g ACPI) can change and new bit either be
>>> added or removed from the map depending on the event is
>>> hot-add/hot-remove. There are currently no locking rules as of now.
>>> Typical usage is to init topology during boot,
>>> at which time hotplug is disabled.
>>>
>>> Signed-off-by: Zou Wei <zou_wei@huawei.com>
>>> ---
>>> .../controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh | 3
>>> +--
>>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git
>>> a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>>
>>> b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>>
>>>
>>> index 155e536..2c6993a 100755
>>> ---
>>> a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>>
>>>
>>> +++
>>> b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>>
>>>
>>> @@ -93,8 +93,7 @@ root_cpu_hotplug_test()
>>> root_cpus="`cat $CPUSET/cpuset.cpus`"
>>> - task_cpus="`cat /proc/$tst_pid/status | grep Cpus_allowed_list`"
>>> - task_cpus="`echo $task_cpus | sed -e 's/Cpus_allowed_list: //'`"
>>> + task_cpus="`cat /sys/devices/system/cpu/present`"
>>> check_result "$root_cpus" "$expect_cpus"
>>> ret=$?
>>>
>>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
