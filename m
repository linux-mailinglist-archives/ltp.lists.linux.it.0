Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 505423CCD96
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 07:45:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 202873C63FE
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 07:45:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D42B33C2931
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 07:45:40 +0200 (CEST)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com
 [68.232.159.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CB59B14010C9
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 07:45:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1626673540; x=1658209540;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1bl7ltT3EHQVeYft+Nld4m7tTZO/N7dxS3Z18Yb+pr0=;
 b=rHe/se87nGz3luNQDKRbL9v+q/pBGKYaHpPRzxNvmeJG/xzdhOtUMoy5
 vUKqtJS2HBykNGcwm50iv/Fdd+6o6rbA4SYn6izL8wh3ID53ae/17zNKx
 blJCQZR2WCc6Psdx1u9SqiYyOIS0AkH46NNa+rjeTtigayhCj7mQ7AqpP
 YJ8x6bgXKNX/6hQk6L/umks7tct8x65wjRiFW1wH8O7USBZ94icJolNJV
 PCAW4BOZzem99e8I5rNl5sMA3oHeeugoHvHOZoff0opeSsIyx2jGnJq7n
 lRr0HOy2HrqvzyZatymFW25X4YJJ1wQLjWBhatSxKzWJpxcHWMVDpFgQx Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="35126966"
X-IronPort-AV: E=Sophos;i="5.84,251,1620658800"; d="scan'208";a="35126966"
Received: from mail-pu1apc01lp2052.outbound.protection.outlook.com (HELO
 APC01-PU1-obe.outbound.protection.outlook.com) ([104.47.126.52])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 14:45:38 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fq8mHN8hNQTRWzzf7vAUdoDLeEK5iRAgfQpAuL7ymtNgF6/PQGI5pA5qfX0kR3O3rkd5wLnKwpqICxZBB5Dp8cx+4BU5A6coua3QOroudEjDCOzgsnIuxcnFZxC3x0ylacdXoW2JJ3BtRtR1TVcuEDN2Zlv6noGc+yULiLJmwIr6sU/XH3hKg4NuXOY7j+Tg8wwD6TUy5G+L4NcaVPKktunpL15DpxNQdzyjBQssbwDQKcRteBjLJ/n2AmfB0iUIe6MlTOL3LYi0PoBmqRc2TjdDzQINieKrvazJ42p4JLpJZw8eb/i/xezyp+P5SwYi5FdzNCA7+mGwpThkobnfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bl7ltT3EHQVeYft+Nld4m7tTZO/N7dxS3Z18Yb+pr0=;
 b=fW2+Ua2QfyRGhWEq3KqG43m9XvoZ0e0FijI+9ZFEUqFGpaKaJEEqj73Qp26AOUrTmIB6Ia/pA3q7bAe8i9FYL8BIfgtq9PQgMuIYyxC8guF0jSedGbaSnv9Gkg2Q0LzaNT/VygwYdftTxXLTwKuTfEUzCfHir+CkJSUnqa3WTeJOSZfsNGzREF0pl1oDxXgZ7cfe/ene5IliMxcZTiDScUbrpec9CjFTmlxOMSyXC+6zrDp0UFI0eqrEHcLb30u+oect6f5FSG7478NcY3/S+8CHvIjYvd9dDwR1iMBZRqB6tLQSE+1XwUtIZ7rkj0ZnbuOtRjalnroGF/7Azreilw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bl7ltT3EHQVeYft+Nld4m7tTZO/N7dxS3Z18Yb+pr0=;
 b=L5XS5lDGLxWYoghgjwoJhn7dr7P1xugbKIS0hPsp8x/PsdDb5UnalcmCpCIvfjBeqyxILBMmujyET1gX8nXvjTqvd03wyrI3Ada2LK8jevKKpExb4DPRK61F150ZyXzGcAVFqIdcPM0mQd67/hVKMvZZi4P+Vt+sr5cIQoyIk/A=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB3067.jpnprd01.prod.outlook.com (2603:1096:404:74::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Mon, 19 Jul
 2021 05:45:34 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 05:45:34 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: "aleksei.kodanev@bell-sw.com" <aleksei.kodanev@bell-sw.com>
Thread-Topic: [PATCH v4 1/2] network/tc01.sh: Add a regression test for tc
 qdisc command
Thread-Index: AQHXdv3F8hZlnT61yUiXln3ELQiEcqtJ1K8A
Date: Mon, 19 Jul 2021 05:45:34 +0000
Message-ID: <60F51190.4090906@fujitsu.com>
References: <ae2bc43c-1745-a0f1-67a7-b9d5a6691404@bell-sw.com>
 <1626081029-11258-1-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1626081029-11258-1-git-send-email-xuyang2018.jy@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bell-sw.com; dkim=none (message not signed)
 header.d=none;bell-sw.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14af2303-1a1b-4e17-bbcc-08d94a786dd5
x-ms-traffictypediagnostic: TY2PR01MB3067:
x-microsoft-antispam-prvs: <TY2PR01MB3067C2839D2DA310D519D148FDE19@TY2PR01MB3067.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:359;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PAdu3/xfROMuEOyhqSfzivjp5FW0edjHaE46MB0z97bLgjmqnUPHMut/efWdJd91sOJhwZOxCX0M0uX5vmukCqBIzBlcl6ZBvi6LV29vFHKXfaPGk+L8W4ORt49fBkNsrQKHHUgDqn4C5TRXNZbewYVOXysRjzV8m4drkN1rfZr6i3VKuuCD2PWdUNhFfRqQKNaBDya0SRhNIQsbneG2putcObv4RH9tgbEqkNKiMCruD81/nVb+cMtFp2E8Vl6Vv8ieV1jSDYT2rk/epNzDwsT+2OwgZ7GZhz9J5nre94nfSfqHWzvGYsYI7VFUdEGXiR44+jDPWaOkp6SbawBbijMaycrwRoHTs+OCSQjXGIabVrjQ72yMQZMUdAZ1cXwnvTgAfq6Cuqbzjf84nszdcAuweRJ25ndAHD09jsyqUl2dAltuNowSut4vaIYlRIu8jukC6UV+pH+E6bC2XuHVeolpe5qKSKxX71vmd+qI7zrgg8e/rk1UAq2KH+WaP7TxdIA9RQhMHFbCZHzIvNrDgBWHD+U0CB6NXZgECuV4yuBvrWwtFlAJXECKFFzp/K9HuETRuOZB3DEZH/sxG7CKi3bI4nYJ4aTgKY3X0RQJQEkFQb9XBfI6/Fg5nKyYeO0LjCtpHWo5CW8ITWgzdHaBIw94ZC312zOWgaU5YSO5bDZ6YYEP13anFHDWx2m6QWNDmab3aFNXGakBKJxTd60Qwg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(8676002)(4326008)(86362001)(6506007)(36756003)(8936002)(122000001)(478600001)(6512007)(85182001)(38100700002)(6916009)(2906002)(6486002)(76116006)(316002)(91956017)(71200400001)(66476007)(66556008)(5660300002)(2616005)(64756008)(66446008)(66946007)(26005)(87266011)(83380400001)(33656002)(186003)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?QTMwYXlXaFlabzU2Q0NjSGhrU1Yzd2dtL1p1cTFsY2E0SE5FdXhIYXA0eVAx?=
 =?gb2312?B?NjlndkUzdk80VjBrRzFSTEtPQU8yNzcyZ2pxdEp1Rk42eWlrRDA4RWpwRVRE?=
 =?gb2312?B?WTh6bmhoVy9vZTV1TXF0NXh6OVE2NGpHckV6OXRaMGw0K01MT3V5RWF2RVBE?=
 =?gb2312?B?a2RwK1pQQnFtZHY1M1hzS1dyNE1MT280cjU0SUxEUmY2b1ViSkdGc0s5ZFdL?=
 =?gb2312?B?NHhsbHc0NzJNQ0lNcWlQZi9oOTlSNkswVE5mb2J6c1BFdU5lRUREYllBaUps?=
 =?gb2312?B?TVZ5WWM3eXZ1N1Irbnp2YXFRcDlHaXZOOGZFTUF2M05qeVdWZGRhc0tLZ2pV?=
 =?gb2312?B?Y0xZSWx2QVR4bGRHZ25GenJXQVRQeUlLZlF4OE1Zb3lyeWNLdm5aeXQybEFS?=
 =?gb2312?B?cXBTK1hEZWxPRVNjeVU5aXhYaENCa00rTUV4Q1RxSkdqU1Evb05xdHRyRk1Z?=
 =?gb2312?B?b1VwTEJrMTh1S1Y1WHJONUZLYW1sVCtyYlBmcnlPRFI2QTR4VkovMWhoc1Nv?=
 =?gb2312?B?aXhuYVdDR2RMQVVyclVkR2NqMHRUbG9MSFd6eEVtYzFTZ2k3ZEJTT3QwZytH?=
 =?gb2312?B?Z3YyNzdvZ2VuOEdwdEgwdWFHNnFNNmtldTR5RVVMcWFrN0RPZFl1cXZqR2ZQ?=
 =?gb2312?B?RXVNeGFidGIwUjhVWlU0Y3J5OWJrUk00K1BodmRpU0Fva1p0eVZXVzByUmdt?=
 =?gb2312?B?Y1V2WklnS25XQU1SeDdBVmFOR0tvTDZRL3RrTnBGcVpIaVg3UlBqd3dzbzFJ?=
 =?gb2312?B?YlRNc1JZblRWQkFQUitNOXBFd2V5RHFFUHNVaW0ySzkvWVVQODJXRVNnSjQw?=
 =?gb2312?B?TlJsSXE5Yk9YeVdEalM0S2l4SXFCOUxqS1hDYVl3R1ZJSVV5a0liQ1l6ZEZV?=
 =?gb2312?B?cEhKeDg3ZG96UzFRbGg4VUdpeDduSmFkV0FJTC9URk4zMXdPQ2FaLzNOVGRK?=
 =?gb2312?B?OVVDV21iQlhITlczaHVsNEZ5UStOT3UycFdTRTBuZk5Ca1ExQ1A0dTZsUWc3?=
 =?gb2312?B?d0NhQlpDUng2VktlQm1LOGVmZnZkWURFSUlYODFMc0lBRW1qQ1VhWEtMcTlu?=
 =?gb2312?B?eSs3NWQvdjk4MUJkb0NsYWNIVC9DbUdCZ3hYYUt0QmkvM3ZQWldmVno5RXB2?=
 =?gb2312?B?clFNY2lLbnFDOE9ERmhEZzNxU2Z3RHJZTjlWZXdEL0N2TkczaWVmN0xFYTEz?=
 =?gb2312?B?MmFyMGEwZXZJcE1LS0pWdEdWWEVtK0lBM09XZHFPSjV2ZFFRSE9odkJlN3p1?=
 =?gb2312?B?RGk2WXR3aTR1Vk1lVWhIVGFyQnVoUFZSWGhrZnRUN0hoNkp3RnZ0QWFRWi9U?=
 =?gb2312?B?SUNwT2hnY1puWG5WZDlqZzNpZGhoQjNrYmhqMjlTbEZFa0F5cVlOb0EvUUds?=
 =?gb2312?B?ckZVT3E1dTcvNU1YMWc2dGhWVkN4WGpkV1UvbW5uU1Q0N3ZrTXBtbUJZR0U5?=
 =?gb2312?B?VU9mM0V4OXdDVlY0QytDMHZueDNLRS94MWdkbHdId2dmQTc3cXlUdHl6K0Nq?=
 =?gb2312?B?S1pQVC96MkM5ek9uWVR3eUg4QlFWMlZiT2ZoTmpqTUpnQjhuNENlU3JaOHdK?=
 =?gb2312?B?UU8vTnJobFJmcmw3MzRPTmJpemJROEJxb0FSUFM1aU9vdGprckRDRjEvOThC?=
 =?gb2312?B?aEx1WDUxMWtYK3dBc2xRVUxlQUVVV29DRktCeHNWRGw3ajZ5d1ZQQStTTnhR?=
 =?gb2312?B?RS9XUHQvRk5yQ2d3dzJXemFXRFpZQTYzNXBsRHBVMkVSYWRzenloSmpoK1Jy?=
 =?gb2312?B?V2lUYlRlVjJJMzFyUUNVbnluaXd2d21hZGo2eGhsMldXa0Q0VUdjSzBKMlZY?=
 =?gb2312?B?OTVDb2JsS0t1UUNHZnp1dz09?=
x-ms-exchange-transport-forked: True
Content-ID: <5A39D17A796D214BB231BEC1549A2A1C@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14af2303-1a1b-4e17-bbcc-08d94a786dd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 05:45:34.8074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zFoaygCsWn+QYpVtny8Uh+lIKQQvbnWEn73c1XoSOXfOmz9VhVXBtmfQzGQhK2eTB9XL8HHKAs8IY5p/j6M9zbVZLx0NrhVlve9/2geRCmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3067
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] network/tc01.sh: Add a regression test for
 tc qdisc command
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

Thanks for your review, I have merged this patch.

Best Regards
Yang Xu

> Reviewed-by: Alexey Kodanev<aleksei.kodanev@bell-sw.com>
> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
> ---
>   runtest/net.tcp_cmds                   |  1 +
>   testcases/network/tcp_cmds/tc/Makefile | 10 ++++++
>   testcases/network/tcp_cmds/tc/tc01.sh  | 47 ++++++++++++++++++++++++++
>   3 files changed, 58 insertions(+)
>   create mode 100644 testcases/network/tcp_cmds/tc/Makefile
>   create mode 100755 testcases/network/tcp_cmds/tc/tc01.sh
> 
> diff --git a/runtest/net.tcp_cmds b/runtest/net.tcp_cmds
> index db47dfd5b..7e142de11 100644
> --- a/runtest/net.tcp_cmds
> +++ b/runtest/net.tcp_cmds
> @@ -12,6 +12,7 @@ netstat netstat01.sh
>   ping01 ping01.sh
>   ping02 ping02.sh
>   sendfile sendfile01.sh
> +tc01 tc01.sh
>   tcpdump tcpdump01.sh
>   telnet telnet01.sh
>   iptables iptables01.sh
> diff --git a/testcases/network/tcp_cmds/tc/Makefile b/testcases/network/tcp_cmds/tc/Makefile
> new file mode 100644
> index 000000000..b4d8b86ee
> --- /dev/null
> +++ b/testcases/network/tcp_cmds/tc/Makefile
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/env_pre.mk
> +
> +INSTALL_TARGETS		:= tc01.sh
> +
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/network/tcp_cmds/tc/tc01.sh b/testcases/network/tcp_cmds/tc/tc01.sh
> new file mode 100755
> index 000000000..a9da45b41
> --- /dev/null
> +++ b/testcases/network/tcp_cmds/tc/tc01.sh
> @@ -0,0 +1,47 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
> +# Author: Yang Xu<xuyang2018.jy@fujitsu.com>
> +#
> +# When using "tc qdisc add dev teql0 root teql0 command", qdisc_create()
> +# calls teql_qdisc_init() it imediately fails after check "if (m->dev == dev)"
> +# because both devices are teql0, and it does not set qdisc_priv(sch)->m
> +# leaving it zero on error path, then qdisc_create() imediately calls
> +# teql_destroy() which does not expect zero master pointer and we get OOPS
> +# on unpatched kernel.
> +#
> +# If we enable panic_on_oops, this case may crash.
> +#
> +# This kernel bug was introduced by
> +# commit 87b60cfacf9f ("net_sched: fix error recovery at qdisc creation")
> +# and has been fixed by
> +# commit 1ffbc7ea9160 ("net: sched: sch_teql: fix null-pointer dereference")
> +#
> +
> +TST_SETUP="setup"
> +TST_TESTFUNC="do_test"
> +TST_NEEDS_ROOT=1
> +TST_NEEDS_DRIVERS="sch_teql"
> +TST_NEEDS_CMDS="tc modprobe dmesg grep"
> +
> +. tst_test.sh
> +
> +setup()
> +{
> +	ROD modprobe $TST_NEEDS_DRIVERS
> +}
> +
> +do_test()
> +{
> +	tst_res TINFO "Use tc qdisc command to trigger a null-pointer dereference"
> +
> +	EXPECT_FAIL tc qdisc add dev teql0 root teql0
> +
> +	if dmesg | grep -q 'RIP:.*sch_teql'; then
> +		tst_res TFAIL "This bug is reproduced."
> +	else
> +		tst_res TPASS "This bug is not reproduced."
> +	fi
> +}
> +
> +tst_run

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
