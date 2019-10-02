Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A97EC8693
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Oct 2019 12:46:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C3543C23CB
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Oct 2019 12:46:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E0F1F3C2247
 for <ltp@lists.linux.it>; Wed,  2 Oct 2019 12:46:20 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E275E601E87
 for <ltp@lists.linux.it>; Wed,  2 Oct 2019 12:46:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 42B1DAD77;
 Wed,  2 Oct 2019 10:46:19 +0000 (UTC)
Date: Wed, 2 Oct 2019 12:46:17 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20191002104617.GA8313@dell5510>
References: <20190930145916.20465-1-pvorel@suse.cz>
 <20190930145916.20465-4-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190930145916.20465-4-pvorel@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v4 3/5] shell: Add timeout shell API tests
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  lib/newlib_tests/shell/test_timeout.sh | 38 ++++++++++++++++++++++++++
>  lib/newlib_tests/shell/timeout01.sh    | 13 +++++++++
>  lib/newlib_tests/shell/timeout02.sh    | 13 +++++++++
>  3 files changed, 64 insertions(+)
>  create mode 100755 lib/newlib_tests/shell/test_timeout.sh
>  create mode 100755 lib/newlib_tests/shell/timeout01.sh
>  create mode 100755 lib/newlib_tests/shell/timeout02.sh

> diff --git a/lib/newlib_tests/shell/test_timeout.sh b/lib/newlib_tests/shell/test_timeout.sh
> new file mode 100755
> index 000000000..7e296f9e9
> --- /dev/null
> +++ b/lib/newlib_tests/shell/test_timeout.sh
> @@ -0,0 +1,38 @@
> +#!/bin/sh
> +
> +PATH="$(dirname $0)/../../../testcases/lib/:$PATH"
I put PATH here, as it's the only runner and not prolong this fix.
If we want more sophisticated functionality from these test of the library
itself runners, we could create some common.sh library here, which would set
PATH and do other things (counting failures and report them etc).

> +
> +DATA="
> +timeout01.sh||0
> +timeout02.sh||0
> +timeout02.sh|foo|32
> +timeout02.sh|2|0
> +timeout02.sh|1.1|0
> +timeout02.sh|-10|32
> +"
> +
> +echo "Testing timeout in shell API"
> +echo
> +
> +failed=0
> +IFS="
> +"
> +for i in $DATA; do
> +	file=$(echo $i | cut -d'|' -f1)
> +	timeout=$(echo $i | cut -d'|' -f2)
> +	exp_exit=$(echo $i | cut -d'|' -f3)
> +
> +	echo "=== $test (LTP_TIMEOUT_MUL='$timeout') ==="
> +	LTP_TIMEOUT_MUL=$timeout ./$file
> +	ret=$?
> +	if [ $ret -ne $exp_exit ]; then
> +		echo "FAILED (exit code: $ret, expected $exp_exit)"
> +		failed=$((failed+1))
> +	else
> +		echo "PASSED"
> +	fi
> +	echo
> +done
> +
> +echo "Failed tests: $failed"
> +exit $failed

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
