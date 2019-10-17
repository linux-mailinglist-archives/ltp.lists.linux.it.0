Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95948DA807
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 11:06:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FBE13C22A8
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 11:06:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 418453C2297
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 11:06:33 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 665231400E7B
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 11:06:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AE113B0C6;
 Thu, 17 Oct 2019 09:06:31 +0000 (UTC)
Date: Thu, 17 Oct 2019 11:06:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20191017090629.GA17707@dell5510>
References: <20190924182841.4528-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190924182841.4528-1-pvorel@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] make: Add make check target + run.sh
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

> +check: | $(MAKE_TARGETS)
> +	./run.sh
> diff --git a/lib/newlib_tests/run.sh b/lib/newlib_tests/run.sh
> new file mode 100755
> index 000000000..566454106
> --- /dev/null
> +++ b/lib/newlib_tests/run.sh
> @@ -0,0 +1,17 @@
> +#!/bin/sh

I guess, I should set PATH here to cwd and to testcases/lib/ (remove it from
lib/newlib_tests/shell/test_timeout_mul.sh). Probably some setup.sh loaded by
each test would be good, so all tests gets correct PATH)
> +
> +# blacklist directory content which is not a test
> +FILTER_OUT_FILES="$(basename $0) *.c config[0-9]* Makefile test_kconfig"
Instead of blacklisting tests, I should use approach from
lib/newlib_tests/shell/test_timeout_mul.sh: specify test and it's expected exit
code. Then it'd be possible to have also results which TBROK.
+ maybe disable color for tests and use colors for this comparison of expected
output.
> +
> +grep_pattern=
> +for i in $(echo $FILTER_OUT_FILES); do
> +	grep_pattern="-e $i $grep_pattern"
> +done
> +
> +for i in *; do
> +	if ! echo $i | grep -q $grep_pattern; then
> +		echo "===== $i ====="
> +		./$i
> +		echo
> +	fi
> +done

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
