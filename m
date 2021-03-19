Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF0034182A
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:26:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 671293C607F
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:26:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 487A53C5FB9
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:26:03 +0100 (CET)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com
 [68.232.152.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8C23110006BE
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:26:02 +0100 (CET)
IronPort-SDR: 2Oo08Bjug4Pxa0jvj96VvYGY9kPrV6D2kjipy2fDOoyjODlL/ZGCbRHt7V7FkldsegIpNusy6R
 wd4LKSoCWuu1NKlKIQUm7LO054p0/aAO245d+EqvRqQ5di+/McEwZ4TzqhNrXTELuCB/zEgQMV
 4DsJtKjVbNbUohE/9BcQsaEf+zvMYLM0aamb1nPeZ9HrbnR9csnYk8wt8+CJnsFrsvLD31t4ZA
 bUxkKRJH/VVmP6DqrQIVqS6gn/iWl5gzsVr7U5V/abfD/Y2cn8O/E18cjG91pj9kykEORZjC51
 lYw=
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="36359636"
X-IronPort-AV: E=Sophos;i="5.81,261,1610377200"; d="scan'208";a="36359636"
Received: from mail-os2jpn01lp2054.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.54])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 18:25:59 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3PGE2hPujZbcfJy/AP6VrKR6Jq3d3ojBOUimw9deBdqUjAzgIL+6R7TQv6bZ5pMtQplwb0sC7zUCMtQkqnX6iU9aWGmmCpBuHHGMXneyWNWG7ZPLxGKdfHhZxenDFxmKdw1Zr5lzFqnZaIQ/WBYFzCu01iZCicR9Ft0olY3l9UPqiV5TTogV4HGCX3urKWtfeswd1hSjHq4rHtktKnShjpOQIbuh6pmvH9dVuLkpgkuFf4Bi3WrhiAk+uh06blEakYuy/juIsEUhJFaquk5EqpQsCen8VE/I2RKbDpMFnFn+Ygc0gFZCnoxI/xZpqWY3zdx+y2DK/iwDrWHzi8MpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GwpqtlBXlf8Nqq+bDnbzvDEGkv1X6Rv1thWxHtcHbs=;
 b=Vy0F4YtA2jrq8iL4KMRT2EBQRJSC4a3fA4v2vezJ2xySQtWsphbiUle1LWRfcJFIkQvd7eYhcC26uZRijetD0wjqS1iRaVEGtkYSX1iYqgiAuD96qcqlCh4yIhJiKDhiJcto/PRCZSNOoVtqRIAVTNxpQQG77zaJsKTspgzY6gZbzVhSVf6QkbJuKdV6Ta3u94Aw5GOXF9JeZFGaYpyqxoRuojb5d91htlZ9ti8NShVinBNIqWdohCUUlzMKBVzS/UVsrFuYzeKxUF77siDBMa7ya1OyVBgpLDOZMgR4pcvynz+0pZ45YpcdwP2UcGqQMakTyRo768dIMBdm3zpuFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GwpqtlBXlf8Nqq+bDnbzvDEGkv1X6Rv1thWxHtcHbs=;
 b=MNKvIKQiE5Hw/xMkdt3S7JTzizNMkIwHWetIMTyCkOIny2/wFvSYCGtoBU0JVO9y0NxeiCFMm+Y2eLSluJEsaAJSOpk8SbojR8NT3Ka2eu18MxnXiwTJ8qcHIkW5L2DRKM2iXUC5TMJ5xf0p73OYhPlij43+O18m/lt7DP7phlg=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB6281.jpnprd01.prod.outlook.com (2603:1096:400:86::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 09:25:55 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 09:25:55 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [PATCH v2 2/2] doc: Add Maintainer Patch Review Checklist
Thread-Index: AQHXHCLm1DlmcDAWs0+t8mPw94bWqaqLC3QA
Date: Fri, 19 Mar 2021 09:25:55 +0000
Message-ID: <60546E24.9010601@fujitsu.com>
References: <20210318181641.2062-1-pvorel@suse.cz>
 <20210318181641.2062-3-pvorel@suse.cz>
In-Reply-To: <20210318181641.2062-3-pvorel@suse.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f008d270-c5fe-4336-f860-08d8eab8ff90
x-ms-traffictypediagnostic: TYAPR01MB6281:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB6281C8104B55DBEE636980D2FD689@TYAPR01MB6281.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AZZxV4yAMs9+sAb+lZKq/nA979ITl90UZANt3PAe1fCUJ6ibN0cGt0/NCWLTnVS51qWw/DreBgvxVGjI4sBqPgO4miEOXL2KnFoYWbCvDV6xKHy9CUqh5iAnAfLqhtI7+uooEA3ZQ141832i4tbReUwPkG6Ff65VFG0/UM5c3h4CkWISLWj8rfOCj5LA4T/Jzo4pkuIfgx33CYtroTqBMTVv72kq4FKyexMqrzAEm3XGsm1WZOVvAZ1SNUnkWmi2xRZXimFgnlQ09rYbHlfJfYTIU1GjbJaZ1bj824S3UYuB7VNaoC5C1qfEE1SyFHWkVOKjpxEMk+lFMOoI25LVnW2PBJ3G5r+i5vkTqewkrFRNG+pJPB2A3WuoMdXtnndubqZgn5RYf3ra1U4zFsfRwXjbpf49EQjxRvqwxTQNnVas+ZO+8vkwl5nV/hFRvUS+riL8/XI0CH3amap0bCjAv9HBVQE6YhOrjUJTZ9UCO534f4HqIKGxZ/WvGaMzBCEODORcjIPS9Fbcpj66MVRun3M/EXuIcjdLMTF6WlWOB5UKy8K2vQVouVt7qFmmlWfmLjhTiYjkrQ3+ry0Fjq13rMQCkqu5/724oe9xVj6p8iy/U5bDGsgswuUhJedmOC8i8MNw1e+zgyKBEjpx/AmxBwMFzXh8pknseaG24y81fxrGJbKuBYirKj/6a1mX8ddr7VmftHwVXco/QBg8SA2xeVjaMFdBGlceSP+H/cwhHMS8lOGo2h+e0AOtTAxS5ktr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(966005)(87266011)(6506007)(64756008)(8936002)(26005)(6486002)(66446008)(66556008)(107886003)(2616005)(71200400001)(8676002)(66946007)(33656002)(76116006)(6916009)(186003)(2906002)(66476007)(83380400001)(478600001)(6512007)(85182001)(4326008)(36756003)(5660300002)(91956017)(316002)(54906003)(86362001)(38100700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?bVRGNjBvSWJiUE5wWWZYY2xQUXl2RUdWOHZabEJKUHNmOTNnSzZVVUY3S0V4?=
 =?gb2312?B?WUZOWWVFRnF3QXdmM1FKdnk4cVRHaVBNamZJMGdYd3YydFhJUkxRUm8yWHZY?=
 =?gb2312?B?YTJ0SmJmbTI4bHAwRzIvVEU5ek43ckNSWDE2VmdHV1V1N3A2L2Z5cjNPRDRB?=
 =?gb2312?B?bDYwMU9RVnl5RXFseXFJSzI4SmdrWG4rTzcralVaeERMaG5oSTNqZVhtV1Fv?=
 =?gb2312?B?Z2szUVoyZ2xyRDRJdGsyMmV0YTlNam91U016cnhFRnZhVkgzdmZselBsMmtK?=
 =?gb2312?B?Z0FxbEFVblord0IwYW13bnZlbXlMWnIxblRnbi9FVkliQ09VSGUyMXB5ZkZa?=
 =?gb2312?B?VUhFMHdNdkJqemswQkFEd3MwdGhML1ZhODFvc0VVckMwbVRwbytueklacGNo?=
 =?gb2312?B?eStFcy9zRFA4V0drM2pTblo2NFFWOSt3U3JMVTUyTWVia2t6SkFqY293SlRm?=
 =?gb2312?B?b0RTMzF4cDJuZE9rMGZCZHRwZVJQeVM3SWdmcXBjUlI5TjVpNVUrTHBCZkhD?=
 =?gb2312?B?Z1FNMk85eHVZMUZSaThiUUFnYURSNHJoZklRT2hKZStOR04rU242TjhsVDdq?=
 =?gb2312?B?cStpc1VycytXQmVzdnV2eFdjalFJOS9pdDhxMW45OEVrYjM2Q29rM3lmbCs4?=
 =?gb2312?B?RUxhUmxrc0cydEh4TUxOQy9zNG1RbElHT2J0ZWE3b2VuQVo0Z1B6ZThXWkxx?=
 =?gb2312?B?M2c2QkQ3ZGFTTW5ZMFJleVBwQ2JyMGZ0ZmxjOE1BNW5SNHpwU044a01uTGFE?=
 =?gb2312?B?eSt0dzlHT2YwUTJCSkxiMnY5U1daelVYVGN0b3FGUHlDbUNYVTRlZnV5c1Y2?=
 =?gb2312?B?MUk5RXlvUllROVN4SlUwdCs0M0hOM2NTYVQraVEydXJQUFFPMU5KSWM0QXV0?=
 =?gb2312?B?NEVKbHBkbTBGSUlnc2FWZGZRcE9TSGRhNGNKaXU4UkpuQWN2QmNodkpsQ1o0?=
 =?gb2312?B?MlMxdkh1R3hoMlpGazBWanZ0b2lUSVJscjdxbjJ3QnRxb3RacC9uRHJlaWxj?=
 =?gb2312?B?dzdNampXcXNiUnBLRG0rc1Y3cWFuT25vaGFiZC9NVGt2NGM2ajIrUU1LRFNi?=
 =?gb2312?B?T0NwQmd0WmxTWFFuSnFUOWZ6Zkxvb2JHTS9lWkc2MnV4NkNoTER3MEk5aTls?=
 =?gb2312?B?WEFMMmxIOUNoZ0lsM1VpQTBQN3h0aTFrUDBuOUVPWGpsdVU1VDc0U3pwNXlZ?=
 =?gb2312?B?VTh6cm92Y1kyUE0yMVh5MlFoZklRb0d4REdKMUtVRzRqQkdEZFZ0TXo3MGU2?=
 =?gb2312?B?clcyT0FFN2ljN00zekVFN05wb0d3YkUyT2lMV2o0NEttK0Q2NmF2eGVTZ0p1?=
 =?gb2312?B?RTNKTHQwT2hvV0JYQ29PMWtsbnBrUjBRMFRkRUhoTnhPM3ZrUTJ2akJ3eTRE?=
 =?gb2312?B?UWY4bHp5WGxNL1JXVUJrYW4xb2hIRWtKK2VXMExMZjNOQzZYRDVPL2x0ajhm?=
 =?gb2312?B?YUNBMWxEQmRwSm0rL0xQWmtPanpPODkwMDh5MWlLUkc0cTlZcndVaU5td3h2?=
 =?gb2312?B?Y09MMUQrZFU5QUZ4Vms0cTl0cXNsUnhiWnkwMTJiNkVLTmJvWit0dW5aWTNE?=
 =?gb2312?B?MjJWbnh0NDNtZWJ1VE9ieWdFQU9weGtaYzJPMTBabnFyNzNpQ3BOSFZLam9O?=
 =?gb2312?B?VCtNRXBEMG13c2pCY2R0R3lXc0hBYUtheEhIRW9vMHdNbUNYVnF6cGU1dXZS?=
 =?gb2312?B?bDZGUlJMUjNoQTd3M3BGekxxYkl2cFV2QmNJUDA2LzZua2FyMWQ0akU4amRP?=
 =?gb2312?Q?GL3y2eZ+Ew51kN1GQ6ALmh2vG0lrCqvMbxAiWWq?=
Content-ID: <5766FBF364BBBA4B8A53FE54638BC5FF@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f008d270-c5fe-4336-f860-08d8eab8ff90
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 09:25:55.4766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b/aZyduE+HiLEJscNA3yjihL44c09Z50ah4j8bRsRgrG6QeghoDnbWF5kip8T78o+1W2Ar7lpaiotLq2WLrKvmEA5hBJaodhWmX8tmPmXDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6281
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] doc: Add Maintainer Patch Review Checklist
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
Cc: "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr
Should we add license or copyright check in this checklist? It maybe
removed when converting old case into new api.

Best Regards
Yang Xu

> Signed-off-by: Petr Vorel<pvorel@suse.cz>
> ---
>   doc/maintainer-patch-review-checklist.txt | 53 +++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
>   create mode 100644 doc/maintainer-patch-review-checklist.txt
> 
> diff --git a/doc/maintainer-patch-review-checklist.txt b/doc/maintainer-patch-review-checklist.txt
> new file mode 100644
> index 000000000..2587287aa
> --- /dev/null
> +++ b/doc/maintainer-patch-review-checklist.txt
> @@ -0,0 +1,53 @@
> +# Maintainer Patch Review Checklist
> +
> +Patchset should be tested locally and ideally also in maintainer's fork in
> +https://travis-ci.org/[Travis CI].
> +
> +NOTE: Travis does only build testing, passing the CI means only that the
> +      test compiles fine on variety of different distributions and
> +      releases.
> +
> +The test should be executed at least once locally and should PASS as well.
> +
> +Commit messages should have
> +
> +* Author's `Signed-off-by` tag
> +* Committer's `Reviewed-by` or `Signed-off-by` tag
> +* Check also mailing lists for other reviewers / testers
> +* `Fixes: hash` if it fixes particular commit
> +* `Fixes: #N` if it fixes N github issue, so it's automatically closed
> +
> +After patch is accepted or rejected, set correct state and archive in
> +https://patchwork.ozlabs.org/project/ltp/list/[LTP patchwork instance].
> +
> +Also update LTP WIKI (git URL https://github.com/linux-test-project/ltp.wiki.git)
> +if touch 'doc/*.txt'.
> +
> +## New tests
> +New test should
> +
> +* Have a record in runtest file
> +* Test should work fine with more than one iteration
> +  (e.g. run with `-i 100`)
> +* Have a brief description
> +
> +### C tests
> +* Use new https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#22-writing-a-test-in-c[C API]
> +* Test files are added into corresponding '.gitignore' files
> +* Check coding style with
> +  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/scripts/checkpatch.pl[checkpatch.pl]
> +  (more in https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#131-c-coding-style[C coding style])
> +* Docparse documentation
> +* If a test is a regression test it should include tags
> +  (more in https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#2238-test-tags[Test tags])
> +
> +### Shell tests
> +* Use new https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#23-writing-a-testcase-in-shell[shell API]
> +* Check coding style with
> +  https://salsa.debian.org/debian/devscripts/raw/master/scripts/checkbashisms.pl[checkbashism.pl]
> +  (more in https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#132-shell-coding-style[Shell coding style])
> +* If a test is a regression test it should include related kernel or glibc commits as a comment
> +
> +## LTP library
> +For patchset touching library please check also
> +https://github.com/linux-test-project/ltp/wiki/LTP-Library-API-Writing-Guidelines[LTP Library API Writing Guidelines].

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
