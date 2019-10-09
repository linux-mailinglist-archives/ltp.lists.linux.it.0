Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24363D1160
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 16:36:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B04F63C220E
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 16:36:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id DF24D3C0B92
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 16:36:37 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 47E0F601A9C
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 16:36:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 838F7AC68;
 Wed,  9 Oct 2019 14:36:36 +0000 (UTC)
Date: Wed, 9 Oct 2019 16:36:35 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20191009143635.GF7561@rei.lan>
References: <20190930145916.20465-1-pvorel@suse.cz>
 <20190930145916.20465-4-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190930145916.20465-4-pvorel@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
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

Do we have to change IFS here? It should be set to space, tab, and
newline by default, so the loop over $DATA should work correctly
anyways.

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
> diff --git a/lib/newlib_tests/shell/timeout01.sh b/lib/newlib_tests/shell/timeout01.sh
> new file mode 100755
> index 000000000..ab7428a2d
> --- /dev/null
> +++ b/lib/newlib_tests/shell/timeout01.sh
> @@ -0,0 +1,13 @@
> +#!/bin/sh
> +
> +TST_TESTFUNC=do_test
> +
> +TST_TIMEOUT=-1
> +. tst_test.sh
> +
> +do_test()
> +{
> +	tst_res TPASS "timeout $TST_TIMEOUT set"
> +}
> +
> +tst_run
> diff --git a/lib/newlib_tests/shell/timeout02.sh b/lib/newlib_tests/shell/timeout02.sh
> new file mode 100755
> index 000000000..73af09125
> --- /dev/null
> +++ b/lib/newlib_tests/shell/timeout02.sh
> @@ -0,0 +1,13 @@
> +#!/bin/sh
> +
> +TST_TESTFUNC=do_test
> +
> +TST_TIMEOUT=2
> +. tst_test.sh
> +
> +do_test()
> +{
> +	tst_res TPASS "timeout $TST_TIMEOUT set (LTP_TIMEOUT_MUL='$LTP_TIMEOUT_MUL')"
> +}
> +
> +tst_run
> -- 
> 2.23.0
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
