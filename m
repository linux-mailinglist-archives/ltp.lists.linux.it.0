Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 568FEB1B46
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 12:00:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E2B593C209D
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 12:00:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 904753C2074
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 12:00:15 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2991410001D2
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 12:00:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D39D6B60C;
 Fri, 13 Sep 2019 10:00:12 +0000 (UTC)
Message-ID: <1568368812.3306.7.camel@suse.de>
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
Date: Fri, 13 Sep 2019 12:00:12 +0200
In-Reply-To: <20190912201318.30931-4-pvorel@suse.cz>
References: <20190912201318.30931-1-pvorel@suse.cz>
 <20190912201318.30931-4-pvorel@suse.cz>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] net/if-mtu-change.sh: set LTP_TIMEOUT
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
Reply-To: cfamullaconrad@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, 2019-09-12 at 22:13 +0200, Petr Vorel wrote:
> The default setup (100 * 5 seconds just for sleep) is longer than
> default timeout.
> 30 sec for each iteration should be more than enough as a default.
> 
> Fixes: fbea02ab5 ("lib/tst_test.sh: setup timeout per test run for
> the shell tests")
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/network/stress/interface/if-mtu-change.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/testcases/network/stress/interface/if-mtu-change.sh
> b/testcases/network/stress/interface/if-mtu-change.sh
> index 30c013214..a1113f714 100755
> --- a/testcases/network/stress/interface/if-mtu-change.sh
> +++ b/testcases/network/stress/interface/if-mtu-change.sh
> @@ -1,6 +1,6 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0-or-later
> -# Copyright (c) 2017-2018 Petr Vorel <pvorel@suse.cz>
> +# Copyright (c) 2017-2019 Petr Vorel <pvorel@suse.cz>
>  # Copyright (c) 2015-2017 Oracle and/or its affiliates. All Rights
> Reserved.
>  # Copyright (c) International Business Machines  Corp., 2005
>  # Author: Mitsuru Chinen <mitch@jp.ibm.com>
> @@ -13,6 +13,8 @@ TST_CLEANUP="do_cleanup"
>  # The interval of the mtu change [second]
>  CHANGE_INTERVAL=${CHANGE_INTERVAL:-5}
>  
> +LTP_TIMEOUT=$(((CHANGE_INTERVAL + 30) * MTU_CHANGE_TIMES))

   ^
   TST_TIMEOUT

At least I would go with TST_ instead of LTP_ as the prefix TST_ means
for me Libray and LTP_ user. This apply to some other places of this
patchset.


> +
>  # The array of the value which MTU is changed into sequentially
>  # 552 - net.ipv4.route.min_pmtu
>  CHANGE_VALUES="784 1142 552 1500 552 1500 552 748 552 1142 1500"

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
