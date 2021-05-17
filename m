Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E478C3823D3
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 07:49:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 65EE93C30FC
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 07:49:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 24EC43C1984
 for <ltp@lists.linux.it>; Mon, 17 May 2021 07:49:41 +0200 (CEST)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com
 [68.232.152.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 33F2C60070E
 for <ltp@lists.linux.it>; Mon, 17 May 2021 07:49:39 +0200 (CEST)
IronPort-SDR: hIYFMjApH0MrD8CKwWHtkyqZMtSJzIOx/Y7IARX1WrB8JcQGXVwfY5IwEayV/kbk5dHQVR/CqZ
 /WxUXR+NAzyMIM8xBHGWvsbmwJ2M23+V6TPP+KdrVbtJberwgPSwqahmSyMaRAl1arDjjAIi5b
 38CQ5h4g9OV7yrHxKIQjgtc3URuam9Rfe1JJFLuJW6O7jgjov/enXszWg4nV8JxeDYDxLcXj17
 mBqKOq3WEFk7F4mOlGthu4jH48yRXpDOJIZe47zHsySdibNBHL38uDyexIjGt+2flSE5V+ayeA
 OPA=
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="39565503"
X-IronPort-AV: E=Sophos;i="5.82,306,1613401200"; d="scan'208";a="39565503"
Received: from mail-ty1jpn01lp2057.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 14:49:37 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g35TV884xGAGpuGWBBlysqThygQqURuWgP36x5C+s5W5MGEMAlBu9enuFgsQfTXGv/L4EohLI4Cu9ttEUORn6UcdkwIPtle3OKvkbed5E+zsXNVO8iK4y63/eRGpUfF2h2MwaERkH4qqdC7NHI7ooY67pb2Bq54TqF2FWIZr2r5HlTtphvMAq9Myk8rxjYOFGU+YQrJhXD2X6aCdfQaK1e4E2r28uGmxL8jy4lnYKCGzwztdWuHwSeKOzbiz6yAk4jQisIhZTn6p5e+EzmFMCiT6mxeleT5Ln4ig/KhQ5rs3+cDuMUQbDKcwu0LWWXJ2vhHmgBfBjrUezQg4PtbHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1i/wPLdJEu0Bt4EEADokW4Mz//KIY02ks3fieVdNE8=;
 b=W4ERxSXe6BFy5eUW+6JPF6gJPwQRi6PZZLDYQ0CJebapEcNJvzq46hF6yLHtr8rqlC56w9pArI7OkvY5CaDXNfNropCHq9Q0i1ZprShJOVBSDp4UYy8vssVM1SrV2ayu+tHF9k+UFl7ZT5CxjPwAveHWyoy155kmjS+CH35OnVBenA42MDCf5IeVMYIqelt6KXC5Yt2c+28+ETDMj5Y3INPU3AqMv58y5gi/TzQGn93tal5o82XS3U1cNbegKV4apEVN2TMn14oSFB56kpP9Ikq3GdTd9QzVrM+mH2zLRPFjnvNkeYxbl5ovYJH1cqDqnoMQ4citKvbBNuHnk4qx+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1i/wPLdJEu0Bt4EEADokW4Mz//KIY02ks3fieVdNE8=;
 b=DbDW53wKjXFnOeb9rf3Fm/tJQwBMpvUqDFTYpdPGeKjDIHLDAaP6+hNBTu47ZN8k5HP/Lr0LuTnJxXjx0yvQjZGVukWbONoyXKVUFFEu3c25Ie98Tcqad5DfSrDesrJkY43CdiA3haxNzconFAWH9YwEVXNq0ZvUrOwISoTKjTQ=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB5449.jpnprd01.prod.outlook.com (2603:1096:404:8038::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Mon, 17 May
 2021 05:49:34 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531%6]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 05:49:34 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [RFC PATCH 1/1] doc: Add supported kernel, libc versions
Thread-Index: AQHXSMTSApP2f/dY+kOAmjBoRk46VqrnL2sA
Date: Mon, 17 May 2021 05:49:34 +0000
Message-ID: <60A2040A.4080002@fujitsu.com>
References: <20210514132639.4181-1-pvorel@suse.cz>
In-Reply-To: <20210514132639.4181-1-pvorel@suse.cz>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c88a51b4-8fef-454b-274a-08d918f78c87
x-ms-traffictypediagnostic: TYAPR01MB5449:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB5449B1B117340AE8E140675FFD2D9@TYAPR01MB5449.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mc5Vt+chiRpFrCvOk36mg+fWjKLEwnpclmxP9FA9O1G1QQssJcib9z5Y92aprVGrEtrehI18/0iyFSs7AjebnBQg45ooLaIYpNaYaHw+PYCvcLfFaBdh0wnbGNvIhSFF5cc75oOCNXtDXN6lazJC6ycyx2K839p6UmRGoFnDPMOl5TDnreIymUSaFxXH9RszMr9DwiK1/BvVdciy5l/UXz9ihp93Q6HqWlclQyrOvifJNg/5g7JGtuEKNJUXosgfSsUrkn/mY7Lr19ivpTW0nU0QqL2WVAnkA7Q7QXhB9Slk9RXdmDfREBR6ve+TjB9lkp9gr0VpWSxAR0NDpTCNKsa1f614WqwooFN86iPEbw+uhk2/4AdO1yeDPkKpuT1evd5XTYXbkUFBq1jy+C5/Knl/E1YpCtca+u99qsWNINFqjs4GmV9SMe/xnOkmkQyA5tQ0quFPzvb5u/eRYLrWFhtTgSskl9RssI40oEdrvKEynepoxgn1CumJk/e1kmcvCz33Oy+vPnfmzzJlq3rCmkgV8y/1dyaBDaKkr48isWgvcDYY5oypLSW0h520fH8ekh4ra7Xjnxb2qoX7ei9EJRFijgFlI89iZIpA6nXiqM+lOp7CCM3jbCy4QrlkA3W/e4RRX7pRZgASMPnfVQ+cYr5rklBEN6hD//lNOMbZ0byTjK1ksCaf908dDa9XDdsfAvae8ZayUVhb7BxYOi7niA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(6916009)(6506007)(71200400001)(4326008)(6512007)(85182001)(316002)(76116006)(33656002)(107886003)(478600001)(66476007)(2906002)(54906003)(26005)(64756008)(186003)(86362001)(66946007)(8676002)(5660300002)(91956017)(2616005)(36756003)(8936002)(38100700002)(6486002)(87266011)(966005)(83380400001)(122000001)(66446008)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?MCtPMlVCV25mL0JwUHFKbllDOWNyU0V2VU9YVEZzZHRLaHJGM2tBS2FuUVZw?=
 =?gb2312?B?ajVuQnpoNWRCeG5xeFF0OWROalNvNnhQNEdFSlBhb0FmUEFYdXo4dWRqTDls?=
 =?gb2312?B?RkRVWmZzY0pxZ3hYUzUzaEhXTmhvY0hHc1NoZ29JNVAxVThBVFI4eVg4THRa?=
 =?gb2312?B?NzBCVnF5Q2tVN3RISktQaDVXeVZSbU9WR2RaV0FtbHVwdEp3Nm10U2NyYzRY?=
 =?gb2312?B?U3FsSDRRQlZENWpKNHB2cDFxbVEyYlVLR2lON0Vrc3J5QXhoVXBnaFd6S0wy?=
 =?gb2312?B?NnhYL3ZiVnNFTzFaeTNCOTJZZVpzYXdVaEd4aHJrbHFtVWd2L2toQW4zMDMz?=
 =?gb2312?B?eEJxZ3NMQU1sd2M1czVzQjVqUWtZT3E0YnB5ZXJpMnJiMmw0L1Bxb1NTb2VE?=
 =?gb2312?B?a3J6azRER2F2QmJMV1hvbnY3OGRrNWY1UVR0ZCsyaVNRV0JpdDRWTmNwc1Jm?=
 =?gb2312?B?Zy9va1orVmRoWi9FN1RlejZnbmNoYjdaWjgxQ2l4NjNJUGpBazQ3S3FqTlRj?=
 =?gb2312?B?alFSR3djWGVTZWNYM2ZEdmVza3I1bDVzYkNTSHJKdFNHdHB6bmZSOGlWQWIx?=
 =?gb2312?B?V3VMSmpkVFc4RmlZbDh4bVU2SzRMaWZnczNtUTgxTzJrTEdoUDhRL05KbUpB?=
 =?gb2312?B?OE4wVDR0d3N5dmx1QnkyaU9TYnE3TFk5WXUwMVRTc3d3OUtYMHpWKzNBL0dX?=
 =?gb2312?B?QTE4cmtkNWlGS3lsN3JwNXA3VGROS0NwbnpZVm5KMnhUZ01KOW9yMzE4bFl5?=
 =?gb2312?B?VUVPSWJ1b2FXTmZGanY0VGcwWEZuVzRaem9xVFFWRUNuakZ3MnEwc0U5cVNY?=
 =?gb2312?B?ZHlJcmxZb1d6UjlLR3BFbTF6dXN0T0NROGJNVy9nNkNCRmo3Y0dRcDlMNk5L?=
 =?gb2312?B?TVZvR1oyc1Vqand0ait1UHVUVkZsT2xQNnd1TUxsaDB0ZVZnenozRXdDVzAz?=
 =?gb2312?B?WGRrTHVYckFOQ0t1aXo1VGFRK094ZERzYS8zVk1xRWtZcVFlUTdNeERsT3hH?=
 =?gb2312?B?NHE4TU5IRERVTXFkSFlQOEFMdVBqYjNSV2V2V1J5cThCZ3d1eERiVzM5OEVZ?=
 =?gb2312?B?dEticU9XZU93MW0waENsdGZWWjN2ZmxPa2hMN0hUVDI2Y1UvNnVieWdhMWN0?=
 =?gb2312?B?OVFHcktLQ1djYjhRVTMxbng1NXBOTnorbzZUY2pwM2E4cXBSYTcvRGpwb0VI?=
 =?gb2312?B?bmlJYS91K2xaYXZpQlFQbFpkVS9xZURPTVhJeUdjdDJsK3dCTkxXakJCNlI4?=
 =?gb2312?B?TVk1aVpCQ29aOHFMOXdUeFc5RGg1NmNhY1JMa2pCRm9QZHNydHpmYk5KNUhT?=
 =?gb2312?B?Z2o0aitORXZIR3FaR3Y5Z2ZrRGZlUWF4MmtxdWR4TE9FQmMwb1BhUVU4eGps?=
 =?gb2312?B?aXJxaUxWMXZuMGx5UnVoVnpPZEU3bW5QZnlENVEzTnZ4c2lrUXZZYjRDa2Iy?=
 =?gb2312?B?d2pLT09hK0tBVTh2QzF4U0xMV1owSVpaektYOFdqQ0hhdFpBY3lCL29iRHd3?=
 =?gb2312?B?Qy8yazlMeFRUbmVFY0Fkb3hpRWNqZEM0MjBnbytjSjJ1RndablpLOEswcUV0?=
 =?gb2312?B?KzhnM09YNU51ak8wTmpMOGZyMFlwRm1WcGQ1L1FoUGQ4d1llL1RJYmplNkUv?=
 =?gb2312?B?SjBtSTJWNFJnQjlSZVM3RUlTdVRsbXlxS0I3VGU3bzdjUnBidWN4QzVsamdT?=
 =?gb2312?B?RS9INXJsc1NTakJadUJZUmRMek80SjZwOTFlVm9DTGJCTWFKeW84Z1pPU1FG?=
 =?gb2312?B?ZGpNbTRJTFF6WjFaQlB3bHU2bHIvcWwrS0V0UnBZSTk4SXd2R0M3cWN5ODdS?=
 =?gb2312?B?SEdHSmZOZEYvZHNTblU2UT09?=
Content-ID: <C1D82C7E2889524AB321D74BA4D57A8F@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c88a51b4-8fef-454b-274a-08d918f78c87
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2021 05:49:34.2625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G4X1j9WgyEvwXIH98CZiJ4rnoTkGta7ghBAyDTr/PiCcf7fokDvhCU9lDG27/LFQrOFN4UmYxAyuYfjKFBXmYadSYfAj49Rh7gEwXOthvVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5449
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] doc: Add supported kernel, libc versions
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
Cc: "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr
> Signed-off-by: Petr Vorel<pvorel@suse.cz>
> ---
>   doc/supported-kernel-libc-versions.txt | 57 ++++++++++++++++++++++++++
>   1 file changed, 57 insertions(+)
>   create mode 100644 doc/supported-kernel-libc-versions.txt
>
> diff --git a/doc/supported-kernel-libc-versions.txt b/doc/supported-kernel-libc-versions.txt
> new file mode 100644
> index 000000000..b7ae01f11
> --- /dev/null
> +++ b/doc/supported-kernel-libc-versions.txt
> @@ -0,0 +1,57 @@
> +Supported kernel, libc, toolchain versions
> +==========================================
> +
> +1. Build testing with Travis CI
> +-------------------------------
> +
> +We test master branch in https://travis-ci.org/github/linux-test-project/ltp/builds[travis CI]
> +to ensure LTP builds on various distributions including old, current and bleeding edge.
> +We test both gcc and clang toolchains, various arch with cross-compilation.
> +
> +For list of tested distros see
> +https://github.com/linux-test-project/ltp/blob/master/.travis.yml[.travis.yml].
> +
> +
> +NOTE: Travis does only build testing, passing the CI means only that the
> +      test compiles fine on variety of different distributions and releases.
AFAIK, travis uses lastest distribution image to build. So it may exist 
the situation that it build pass on lastest centos7 and build failed on 
older centos7. I think we should add a note in here.
> +
> +1.1 Oldest tested distributions
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +[align="center",options="header"]
> +|==============================================================
> +| Distro                       | kernel | glibc | gcc   | clang
> +| CentOS 7                     | 3.10   | 2.17  | 4.8.5 | -
> +| Ubuntu 16.04 LTS xenial      | 4.4    | 2.23  | 5.3.1 | -
> +| Debian 9 stretch (oldstable) | 4.9.30 | 2.24  | 6.3.0 | 3.8
> +|==============================================================
> +
> +For older versions please use https://github.com/linux-test-project/ltp/releases[older LTP releases].
> +
> +1.2 Supported architectures
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +[align="center",options="header"]
> +|==================================
> +| arch          | build
> +| x86_64        | native
> +| x86 emulation | native
> +| aarch64       | cross compilation
> +| ppc64le       | cross compilation
> +| s390x         | cross compilation
> +|==================================
> +
> +1.3 Supported libc
> +~~~~~~~~~~~~~~~~~~
> +
> +Targeted libc is https://www.gnu.org/software/libc/[GNU C Library (glibc)].
> +
> +https://uclibc-ng.org/[uClibc-ng] is not being tested should work as well as it
> +attempt to maintain a glibc compatible interface
> +(older https://www.uclibc.org/[uClibc] might have problems).
> +
> +https://musl.libc.org/[musl] is not yet supported
> +(see https://github.com/linux-test-project/ltp/blob/master/travis/alpine.sh[travis script]
> +for list of files which need to be deleted in order to compile under musl).
> +
> +For bionic libc please (Android) use https://android.googlesource.com/platform/external/ltp/[AOSP fork].

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
