Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6A5281F2A
	for <lists+linux-ltp@lfdr.de>; Sat,  3 Oct 2020 01:38:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC07C3C6090
	for <lists+linux-ltp@lfdr.de>; Sat,  3 Oct 2020 01:38:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 69D8F3C296C
 for <ltp@lists.linux.it>; Sat,  3 Oct 2020 01:38:42 +0200 (CEST)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 95A68601106
 for <ltp@lists.linux.it>; Sat,  3 Oct 2020 01:38:40 +0200 (CEST)
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 416E7C0344;
 Fri,  2 Oct 2020 23:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1601681917; bh=qapzN9HB4+vy1w22JrDfOBFqZmDr2rUnd7Kznpv6ccg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=RXJZDI01+tplf0w6ym3hNOyooEN2giTsiqKqCUo0aQK/7zxdDIS93M4a2HIPvIf+O
 u5DFsEtL90zrPcxT1KSEsV+mFJGuc/FXznIynxWViE3pzrwB97suGRKvZYcHKVEDK+
 or4Ju6xP+uUzPgfNBYdm2WV/dVXYnFVbRCsDPVyQztkr3jmhX+EjinT58IiBZJWYhE
 JYKIrRDjjm6f4lgb+OJ/nE8+O3vuCVQuw5tiB7nWaemxhxvLXRZ/wX4ogjiYPIGaWo
 QcU/Tq3lFfjqdMSvRqI/FIad2QingD3yJzszZ4p1Lg9q5u6WfrXTRYKKWa19nyPCLl
 EPAJdefM8fHEw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3FDEDA01F1;
 Fri,  2 Oct 2020 23:38:30 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8037940139;
 Fri,  2 Oct 2020 23:38:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="aGR3CnoO";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keRUfnHXYWLQBzsaOhARJxA7YjVTi2GigokWqzwCJISkVsl/Qt20rn9LvJRvCMFvZ2Jzvz4klbUh7yIyT4auDwOB0VmbMVQucL5GMw6xJY35b88NI9DRTduG9Et2cs1gBA+JIS+c1p0jV4iVF4S0kStc8hfN77v3MxNVgPcLR761JpHvft51+WgQUX5PIHpSHMnrWSh0i9WCAZUf49X9rdYM7hVxd45DLukZn4MCcb8fDCufuKoZ5KIZ280ea2ZHK5mao3I6aUIUQZKt6FEZMoiDOwjJkgrdGjzW2ulYInG4LlpshZyCtVKbflQApwoN0/T+gHid7MOenk9fnFPEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qapzN9HB4+vy1w22JrDfOBFqZmDr2rUnd7Kznpv6ccg=;
 b=Mg7nsy/f+xxIadKtFOyMQqbVTrHdpJ2xYqKe3YYqvIhWyYPO4pz++H3DO1uGY1JYD24z+KgH52mwmYpz6GQG/cTZUi3fTuwhO+aVeH7mWWaDLpoAOPjD97tc0gHPFWcjFQtXeZTu4YcTeeLqfGHTL4nCsXvSca52Fjgy6tpElr3FbOtHem1F6UKTqUuiBOzaEGLRusiJo1DYEZcovCqcf4GEzA6dtAeYaltNjdM1896OvA4mWdb8VUPF8TDqIVvbVsFudq9JiMqZberHz+EfThkVdHxIkJRq9xzDAwxXfUAf6BAjDgruGYBwcT4zVRuQaHa5htNlpmmmYqmE0pdLKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qapzN9HB4+vy1w22JrDfOBFqZmDr2rUnd7Kznpv6ccg=;
 b=aGR3CnoOOeW6z4Dvv9AnvCUu7CAe/Amp9eDNfRQR/X67nYpmM7JwG9qDAM1YQ6vq5XDrzfpBR/l2KcMM2Fh+4dw55GzswJdHdPGGTkiMku3A5OvPzGQstojx8JwgZTQb2Eg+SI/LbBh9OgSUZfX0PuW3N+Q8UTOqPskJqgCZx60=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4226.namprd12.prod.outlook.com (2603:10b6:a03:203::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36; Fri, 2 Oct
 2020 23:38:26 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c962:6a42:6a0b:24e8]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c962:6a42:6a0b:24e8%5]) with mapi id 15.20.3433.039; Fri, 2 Oct 2020
 23:38:26 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Petr Vorel <petr.vorel@gmail.com>, "ltp@lists.linux.it"
 <ltp@lists.linux.it>
Thread-Topic: [PATCH 1/1] cacheflush01: Rewrite into new API
Thread-Index: AQHWmPoPGeaGTq1Upk+kaNHECB1UAamE+EqA
Date: Fri, 2 Oct 2020 23:38:26 +0000
Message-ID: <6b5f52e8-0c0c-f83f-d7aa-6ab307d5621f@synopsys.com>
References: <20201002202416.28972-1-petr.vorel@gmail.com>
In-Reply-To: <20201002202416.28972-1-petr.vorel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59de4093-c488-48f5-2b08-08d8672c4274
x-ms-traffictypediagnostic: BY5PR12MB4226:
x-microsoft-antispam-prvs: <BY5PR12MB4226236494DF1BE1623AF720B6310@BY5PR12MB4226.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ycJ+M8FMHC4uP0uvUZtHTuoSmaUY10+foK00q+fyt2djDHlWZPzNRT2xspxHvLmyOfLAMAyZZiHm9zQdGx8jM0FYj+dlfT30gBv458V8x9jmpyHTxCHHoYvSqd35QzBhiO7MM6oMJckPZNrTx0EH6xlx5qlY7y4i/d6sfc0gvNVC9293i9PLyWMbC+MOy9XWAxSac3KNUnZICfZoc2oH7pFfxysjIPRVTvrUn6paFwOpg8tRU7KtJqsvVFwXH3Cht25nUNYk3S4LFzDKORnnmelHD8wh0dDRdQMFkLwjU/EntWyu7ItbAQ/keaVzvLpiLk+b7MeaYOhpWn1KlVEBFbr5gZoxWg3OE1ofor6jf333KJ8MP+2WtGEm3qbV92U6mI4bPuUeyvekCDyD4jbAi2/u7BJpaRcWT0Sn5w/QzCaoBUHlTzdnfNrhKv/f03a68I+8Z3LDP05srUXqVJKv0CEj8+r0lcV3G150g2862+A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(6486002)(5660300002)(8936002)(31686004)(71200400001)(2906002)(86362001)(76116006)(64756008)(6506007)(4326008)(66946007)(83380400001)(53546011)(66446008)(31696002)(66476007)(26005)(6512007)(66556008)(8676002)(316002)(54906003)(186003)(110136005)(83080400001)(36756003)(7416002)(2616005)(478600001)(966005)(2004002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: jrEfblgzxD6JneQLO2Qvi4dMar2e8+pXxAO/ensRi0HXcFHiEaN7X6ryYuVLDF4rJtDGJpq+ji9Hy1HulF4AP0ZvtzE8nIPx+VBpQpaRaWMMdQxxV1bSt/zc4JuVFTkynt0O1MhUMZ3Sqk++LKv2Wv3MClN5vQxC7jcKEKIECNmQCy8oKCqFbfjHSB3gq40De6gI3f86LsBGNll0NNUSe1B1axDoBSl1f5lCGODbbPtWai18o6koq7d3ntmz7VoHeprVX9kIf8QEzDrrVBJVj9awkJN1VVuSlrFV2GIqJ4uUYboBBGEWNOatLrgY71oNZyXzBS5STXFQ56Eo/NXT/4xJY5HQGsjlViTE3ksii80ojGMNMXNN1u9ElSk1ZrCpjNO86afuge9jItfbHVWV530UnTUs9r0KtK6SEB9cpfato/g2uLnW8GJGnVaETv3wVScsjoxmD2Q1JmqoEhsIwiNJlIaSVTJuROxLbwe21ywKdAl9F4q+YIAj1xtjc6eT2fY7sjgAv5lpOLc2+oRepmx/YtSj342WUM/2mT3rrG0eFMTfXNMi1DJSsHzZmsWaQAKVyAfG6CAYkqkmwajp3b5aFuxerpjw9OA9tqhfC/kcFv010OmucSJgVuXw1/0TmXeLYuOCwrntUvSXLunr5A==
x-ms-exchange-transport-forked: True
Content-ID: <25A5E5A070254D419D27AAB3A2BAE301@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59de4093-c488-48f5-2b08-08d8672c4274
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2020 23:38:26.2177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NZ/7Or5sGD14nxhR2q6Axf8o4EoDp3lti53w6R4QvlaENzMUZdPuFdKOLo1suQBQcAWl/5YmdsqFawYj4Ilc3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4226
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] cacheflush01: Rewrite into new API
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
Cc: Ofer Levi <oferle@nvidia.com>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>,
 "Maciej W . Rozycki" <macro@linux-mips.org>, Guo Ren <guoren@kernel.org>,
 Vincent Chen <deanbo422@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On 10/2/20 1:24 PM, Petr Vorel wrote:
> This syscall is currently (v5.9) supported on these architectures:
> arc, csky, mips, m68k, nds32, sh
>
> constants are missing for m68k, not sure if the testcase is valid for it.
> Untested.
>
> Test for __LTP__NR_INVALID_SYSCALL saves adding autotools check for
> <asm/cachectl.h>.
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
>
> FYI: I was going to ask for removal of this test, but all these archs are
> still supported. This test compiles on all archs now, but I haven't run
> it (I don't have access to none of these archs, not sure if LTP is even
> tested on these archs).

LTP is pretty much regularly tested on ARC and yes we do support/need the
cachflush syscall test.

Thx,
-Vineet

>
> Kind regards,
> Petr
>
>  .../kernel/syscalls/cacheflush/cacheflush01.c | 173 ++++--------------
>  1 file changed, 40 insertions(+), 133 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/cacheflush/cacheflush01.c b/testcases/kernel/syscalls/cacheflush/cacheflush01.c
> index 29cf2014a..85125f2ee 100644
> --- a/testcases/kernel/syscalls/cacheflush/cacheflush01.c
> +++ b/testcases/kernel/syscalls/cacheflush/cacheflush01.c
> @@ -1,157 +1,64 @@
> -/******************************************************************************/
> -/* Copyright (c) Maxin John <maxin.john@gmail.com>, 2009                      */
> -/* LKML Reference: https://urldefense.com/v3/__http://lkml.org/lkml/2009/4/9/203__;!!A4F2R9G_pg!MvWpmrCHRK36ROXcP8-qw3B1lCwih8RxIojwKW11TJz0iL7EvnloBIHwI5zr8m1c$                           */
> -/* This program is free software;  you can redistribute it and/or modify      */
> -/* it under the terms of the GNU General Public License as published by       */
> -/* the Free Software Foundation; either version 2 of the License, or          */
> -/* (at your option) any later version.                                        */
> -/*                                                                            */
> -/* This program is distributed in the hope that it will be useful,            */
> -/* but WITHOUT ANY WARRANTY;  without even the implied warranty of            */
> -/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  */
> -/* the GNU General Public License for more details.                           */
> -/*                                                                            */
> -/* You should have received a copy of the GNU General Public License          */
> -/* along with this program;  if not, write to the Free Software               */
> -/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
> -/*                                                                            */
> -/******************************************************************************/
> -/******************************************************************************/
> -/*                                                                            */
> -/* File:        cacheflush01.c                                                */
> -/*                                                                            */
> -/* Description: The cacheflush_check() syscall                     	      */
> -/*		Tests EINVAL error of cacheflush system call.		      */
> -/* 		Its expected behaviour is cacheflush() should return -EINVAL  */
> -/*		when cache parameter is not one of ICACHE, DCACHE, or BCACHE. */
> -/*                                                                            */
> -/* Usage:  <for command-line>                                                 */
> -/* cacheflush01 [-c n] [-e][-i n] [-I x] [-p x] [-t]                          */
> -/*      where,  -c n : Run n copies concurrently.                             */
> -/*              -e   : Turn on errno logging.                                 */
> -/*              -i n : Execute test n times.                                  */
> -/*              -I x : Execute test for x seconds.                            */
> -/*              -P x : Pause for x seconds between iterations.                */
> -/*              -t   : Turn on syscall timing.                                */
> -/*                                                                            */
> -/* Total Tests: 1                                                             */
> -/*                                                                            */
> -/* Test Name:   cacheflush01                                                  */
> -/******************************************************************************/
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  
> -#include <unistd.h>
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <errno.h>
> -
> -#include "test.h"
> +#include "tst_test.h"
>  #include "lapi/syscalls.h"
>  
>  #if __NR_cacheflush != __LTP__NR_INVALID_SYSCALL
> +
>  #include <asm/cachectl.h>
> -#else
> +
> +/*
> + * m68k does not have these constants
> + */
> +
>  #ifndef   ICACHE
> -#define   ICACHE   (1<<0)	/* flush instruction cache        */
> +# define   ICACHE   (1<<0)
>  #endif
> +
>  #ifndef   DCACHE
> -#define   DCACHE   (1<<1)	/* writeback and flush data cache */
> +# define   DCACHE   (1<<1)
>  #endif
> +
>  #ifndef   BCACHE
> -#define   BCACHE   (ICACHE|DCACHE)	/* flush both caches              */
> -#endif
> +# define   BCACHE   (ICACHE|DCACHE)
>  #endif
>  
> -char *TCID = "cacheflush01";
> -int TST_TOTAL = 1;
> +#define CACHE_DESC(x) .cache = x, .desc = #x
>  
> -/* Extern Global Functions */
> -/******************************************************************************/
> -/*                                                                            */
> -/* Function:    cleanup                                                       */
> -/*                                                                            */
> -/* Description: Performs all one time clean up for this test on successful    */
> -/*              completion,  premature exit or  failure. Closes all temporary */
> -/*              files, removes all temporary directories exits the test with  */
> -/*              appropriate return code by calling tst_exit() function.       */
> -/*                                                                            */
> -/* Input:       None.                                                         */
> -/*                                                                            */
> -/* Output:      None.                                                         */
> -/*                                                                            */
> -/* Return:      On failure - Exits calling tst_exit(). Non '0' return code.   */
> -/*              On success - Exits calling tst_exit(). With '0' return code.  */
> -/*                                                                            */
> -/******************************************************************************/
> -void cleanup(void)
> -{
> +static struct test_case_t {
> +	int cache;
> +	const char *desc;
> +} test_cases[] = {
> +	{ CACHE_DESC(ICACHE) },
> +	{ CACHE_DESC(DCACHE) },
> +	{ CACHE_DESC(BCACHE) },
> +};
>  
> -	tst_rmdir();
> -}
> +static char *addr;
>  
> -/* Local  Functions */
> -/******************************************************************************/
> -/*                                                                            */
> -/* Function:    setup                                                         */
> -/*                                                                            */
> -/* Description: Performs all one time setup for this test. This function is   */
> -/*              typically used to capture signals, create temporary dirs      */
> -/*              and temporary files that may be used in the course of this    */
> -/*              test.                                                         */
> -/*                                                                            */
> -/* Input:       None.                                                         */
> -/*                                                                            */
> -/* Output:      None.                                                         */
> -/*                                                                            */
> -/* Return:      On failure - Exits by calling cleanup().                      */
> -/*              On success - returns 0.                                       */
> -/*                                                                            */
> -/******************************************************************************/
> -void setup(void)
> +static void setup(void)
>  {
> -	/* Capture signals if any */
> -	/* Create temporary directories */
> -	TEST_PAUSE;
> -	tst_tmpdir();
> +	addr = SAFE_MALLOC(getpagesize());
>  }
>  
> -int main(int ac, char **av)
> +static void test_cacheflush(unsigned int i)
>  {
> +	struct test_case_t *tc = &test_cases[i];
>  
> -	char *addr = NULL;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	tst_count = 0;
> -	/* Create some user address range */
> -	addr = malloc(getpagesize());
> -	if (addr == NULL) {
> -		tst_brkm(TFAIL | TTERRNO, cleanup, "malloc failed");
> -	}
> -
> -	/* Invokes cacheflush() with proper parameters */
> -	TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize(), ICACHE));
> -	if (TEST_RETURN == 0) {
> -		tst_resm(TPASS, "passed with no errno");
> -	} else {
> -		tst_resm(TFAIL, "failed with unexpected errno");
> -	}
> -
> -	TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize(), DCACHE));
> -	if (TEST_RETURN == 0) {
> -		tst_resm(TPASS, "passed with no errno");
> +	TEST(tst_syscall(__NR_cacheflush, addr, getpagesize(), tc->cache));
> +	if (TST_RET == 0) {
> +		tst_res(TPASS, "%s passed", tc->desc);
>  	} else {
> -		tst_resm(TFAIL, "failed with unexpected errno");
> +		tst_res(TFAIL | TTERRNO, "%s failed", tc->desc);
>  	}
> +}
>  
> -	TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize(), BCACHE));
> -	if (TEST_RETURN == 0) {
> -		tst_resm(TPASS, "passed with no errno");
> -	} else {
> -		tst_resm(TFAIL, "failed with unexpected errno");
> -	}
> +static struct tst_test test = {
> +	.setup = setup,
> +	.test = test_cacheflush,
> +	.tcnt = ARRAY_SIZE(test_cases),
> +};
>  
> -	cleanup();
> -	tst_exit();
> -}
> +#else
> +	TST_TEST_TCONF("system doesn't support cacheflush()");
> +#endif


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
