Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6AF6FBC7
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 11:07:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17EC53C1CFB
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 11:07:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 683683C104A
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 11:07:54 +0200 (CEST)
Received: from m4a0041g.houston.softwaregrp.com
 (m4a0041g.houston.softwaregrp.com [15.124.2.87])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C7427600674
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 11:07:52 +0200 (CEST)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 22 Jul 2019 09:07:44 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 22 Jul 2019 09:04:48 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 22 Jul 2019 09:04:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kptdlwApi0Oe6MkLiuz/u9Xg9PNLIZTeWy94yW4+k1hbxD9YG8/PGknD4delK5uVvqw7AdvkSbK9Qnyh9OwurKJNJPfIczHxBimntfcGU0gGtLue+NEOR1/OCW7k+4JFezYOzimq2k8p3CmiTxjOZ75QDFlaI+YA9Mw9xZIqFliKuqLOXyh1yET7m+2N1RiUSxid/D5EOJ/lWn3MK4nXIBmhoql64YThgbt7GqT0PBH1sIIHIt2T92FPgW0ctIycWiukYCStIfHnsUy3kk1jKVVNfjiCccNBuv8wjDAF1BXiP5CZIX0WdUXGh0+9RFFIM71OqW8rF9LSs6zyA4goiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJPuXbkY447js2Ypw9pJiQoGVgte1vlzRkyaAk6t6nU=;
 b=XLSvfEztb2K6fwMxm+KUeUJKfBj4L7s2hHyzNOJQwNX4ZG0SKm1X839opA9Y6rP5TAJb+gppFhA7lG2CioItXT+IT/tlcTLT3jiH2ECdZVXESIO0zroXxitoSee+RQE9htV5uVTvAAe4x1qqegqoqlT4dwksFCW3xPpvqxBRFjr9tt+1yRfVVbhtNZRRtbXBtqnfNHDgn5ZD3pPbbuMYLuk4cOo29KRs6Ns4lnzuGducqFrVj2/qXYP0DVcz66ZasLZygJKMED0ukQZC9lLgAojgRDWwsIJzl3vKGIAmWt0J3unS6kbQix2dISD5el3b+26BeLrxywdtTLmIetM3jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MW2PR18MB2234.namprd18.prod.outlook.com (52.132.183.31) by
 MW2PR18MB2236.namprd18.prod.outlook.com (52.132.183.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 22 Jul 2019 09:04:46 +0000
Received: from MW2PR18MB2234.namprd18.prod.outlook.com
 ([fe80::693b:dcc1:c2c4:33a4]) by MW2PR18MB2234.namprd18.prod.outlook.com
 ([fe80::693b:dcc1:c2c4:33a4%6]) with mapi id 15.20.2052.026; Mon, 22 Jul 2019
 09:04:46 +0000
From: Christian Amann <camann@suse.com>
To: Linus Walleij <linus.walleij@linaro.org>, "ltp@lists.linux.it"
 <ltp@lists.linux.it>
Thread-Topic: [LTP] [PATCH v2] syscalls/ioprio: Add test cases for I/O priority
Thread-Index: AQHVPTxbFuDGIHsqAkeWOlMj9xBwH6bWXoOA
Date: Mon, 22 Jul 2019 09:04:46 +0000
Message-ID: <41d6e9d0-2779-0252-c901-b0de500b2b3f@suse.com>
References: <20190718073941.13153-1-linus.walleij@linaro.org>
In-Reply-To: <20190718073941.13153-1-linus.walleij@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0404.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::32) To MW2PR18MB2234.namprd18.prod.outlook.com
 (2603:10b6:907:e::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=camann@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:113:80c0:5::2222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7265e84e-445f-4015-0f25-08d70e83a483
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MW2PR18MB2236; 
x-ms-traffictypediagnostic: MW2PR18MB2236:
x-microsoft-antispam-prvs: <MW2PR18MB2236D456ECF65C425CE33E7AABC40@MW2PR18MB2236.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(199004)(189003)(186003)(6506007)(76176011)(102836004)(386003)(52116002)(53546011)(5660300002)(446003)(11346002)(2616005)(86362001)(305945005)(46003)(110136005)(486006)(6436002)(71190400001)(316002)(8936002)(229853002)(7736002)(256004)(99286004)(81156014)(81166006)(476003)(36756003)(6486002)(6512007)(478600001)(6116002)(6246003)(66946007)(66446008)(25786009)(64756008)(66556008)(68736007)(53936002)(66476007)(2501003)(31686004)(8676002)(31696002)(71200400001)(14454004)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW2PR18MB2236;
 H:MW2PR18MB2234.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lZz3IfJxbv5ZLAzqPzcZly/KeCJGg98Sr50xu+GBQ7M6y+HJdoI74jTHjUvkDO4CPNyHzCTaHmlJk7JJGhrDJaq55Z2Dvam5/zHuOXcpxemTDdxpBWjapmZ49uI4v4hweYeAe4sqset0fwsfxQVb5MRLPJEWQmVJ2v/GAUhvztlcWwGm3kMNoAqrhDSKTcYv05JmWLo7oStrzEHLST+PRbPHLQwrrssvpfOQtXXj9M2cf5BNqILNBzdY6Mtq5nQ5awNCIrxwqLbJ7nBrRd48BAMExWlL5qMVE4NjycpnPcI8udkJ7nQrDZoBDXk11zKgjOlL6tyO7I3v0xJpUCb6pi1B1JYgZi6SAaJ8c5Fzh5S+mkWlqIkjhYpx7iBhrw0edqStilZU5NIydltAqNg+LS7743V7+2vaRAtLxPD+ie4=
Content-ID: <14F414E97F197641B6147BFB38FC70AF@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7265e84e-445f-4015-0f25-08d70e83a483
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 09:04:46.3689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: camann@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2236
X-OriginatorOrg: suse.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/ioprio: Add test cases for I/O
 priority
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

generally these tests look fine. I'd just like to add something to the
things the others have already pointed out:

On 18/07/2019 09:39, Linus Walleij wrote:
> diff --git a/testcases/kernel/syscalls/ioprio/ioprio_get01.c b/testcases/kernel/syscalls/ioprio/ioprio_get01.c
> new file mode 100644
> index 000000000000..79807763a5f3
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ioprio/ioprio_get01.c
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 Linaro Limited
> + */
> +#include <sys/types.h>
> +#include <fcntl.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <signal.h>
> +#include <unistd.h>
> +#include <sys/syscall.h>

Please double check if all of those includes are really necessary. It
compiled fine for me using only the types.h and syscalls.h (+ the two
below).

> +
> +#include "tst_test.h"
> +#include "ioprio.h"
> +
> +static int ioprio_get(int which, int who)
> +{
> +	return syscall(SYS_ioprio_get, which, who);

In LTP there is a dedicated syscall function which handles the error if
the syscall-number is absent. This line should be replaced with:

"return tst_syscall(__NR_ioprio_get, which, who);"

If done like this, you don't even have to check the kernel version in
the tst_test structure at the end of every test case.

> +}
> +
> +static void run(void)
> +{
> +	int prio, class;
> +
> +	/* Get the I/O priority for the current process */
> +	TEST(ioprio_get(IOPRIO_WHO_PROCESS, 0));
> +
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TTERRNO, "ioprio_get failed");
> +		return;
> +	}
> +
> +	class = IOPRIO_PRIO_CLASS(TST_RET);
> +	prio = IOPRIO_PRIO_LEVEL(TST_RET);
> +
> +	if (!prio_in_range(prio)) {
> +		tst_res(TFAIL, "ioprio out of range (%d)", prio);
> +		return;
> +	}
> +
> +	tst_res(TPASS, "ioprio_get returned class %s prio %d",
> +		to_class_str[class], prio);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.min_kver = "2.6.13",
line can be removed, see comment above
> +};

There are also checkpatch errors/warnings for ioprio_set02. Please check
that for yourself.

Other than that, the tests look good!



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
