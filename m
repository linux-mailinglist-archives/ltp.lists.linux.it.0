Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B803EDF026
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 16:42:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 222953C2421
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 16:42:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0B0573C23E1
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 16:42:31 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7A67060117E
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 16:42:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7E35EB760;
 Mon, 21 Oct 2019 14:42:29 +0000 (UTC)
Date: Mon, 21 Oct 2019 16:42:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: cfamullaconrad@suse.com
Message-ID: <20191021144226.GA17885@x230>
References: <20191018124502.25599-1-cfamullaconrad@suse.de>
 <20191018124502.25599-3-cfamullaconrad@suse.de>
 <20191021125053.GA18513@x230> <1571667476.4633.13.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571667476.4633.13.camel@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/5] tst_test.c: Add tst_multiply_timeout()
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

...
> > I also wonder, if this check is needed, next step is
> > results->timeout = tst_multiply_timeout(timeout);
> > which does the same check.

> In shell we have the same check. And there it is more clear, as we
> refer to TST_TIMEOUT variable. Here both messages just say "timeout"
> but the linenumber would be more close to the actual call.
True, make sense to keep it.

Unless anyone has some objections, I'll merge it with changes bellow.

Kind regards,
Petr

diff --git lib/newlib_tests/shell/test_timeout_mul.sh lib/newlib_tests/shell/test_timeout_mul.sh
index 6682e5d66..a3abda043 100755
--- lib/newlib_tests/shell/test_timeout_mul.sh
+++ lib/newlib_tests/shell/test_timeout_mul.sh
@@ -5,7 +5,6 @@
 TST_TESTFUNC=do_test
 . tst_test.sh
 
-
 call_it()
 {
 	local SAVE_MUL=${LTP_TIMEOUT_MUL}
diff --git lib/tst_test.c lib/tst_test.c
index 5f43b1e0b..7cdf3c35a 100644
--- lib/tst_test.c
+++ lib/tst_test.c
@@ -1130,7 +1130,7 @@ void tst_set_timeout(int timeout)
 	}
 
 	if (timeout < 1)
-		tst_brk(TBROK, "timeout need to be >= 1! (%d)", timeout);
+		tst_brk(TBROK, "timeout must to be >= 1! (%d)", timeout);
 
 	results->timeout = tst_multiply_timeout(timeout);
 
diff --git testcases/lib/tst_test.sh testcases/lib/tst_test.sh
index 1cc5b42b8..7d0bf347e 100644
--- testcases/lib/tst_test.sh
+++ testcases/lib/tst_test.sh
@@ -190,10 +190,10 @@ TST_RETRY_FN_EXP_BACKOFF()
 {
 	local tst_fun="$1"
 	local tst_exp=$2
-	local tst_sec=$(( $3 * 1000000 ))
+	local tst_sec=$(($3 * 1000000))
 	local tst_delay=1
 
-	tst_multiply_timeout tst_sec
+	_tst_multiply_timeout tst_sec
 
 	if [ $# -ne 3 ]; then
 		tst_brk TBROK "TST_RETRY_FN_EXP_BACKOFF expects 3 parameters"
@@ -404,9 +404,9 @@ _tst_rescmp()
 	fi
 }
 
-tst_multiply_timeout()
+_tst_multiply_timeout()
 {
-	[ $# -ne 1 ] && tst_brk TBROK "tst_multiply_timeout expect 1 parameter"
+	[ $# -ne 1 ] && tst_brk TBROK "_tst_multiply_timeout expect 1 parameter"
 	eval "local timeout=\$$1"
 
 	LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}
@@ -424,7 +424,7 @@ tst_multiply_timeout()
 	[ "$LTP_TIMEOUT_MUL" -ge 1 ] || tst_brk TBROK "$err ($LTP_TIMEOUT_MUL)"
 	[ "$timeout" -ge 1 ] || tst_brk TBROK "timeout need to be >= 1 ($timeout)"
 
-	eval "$1='$(( timeout * LTP_TIMEOUT_MUL))'"
+	eval "$1='$((timeout * LTP_TIMEOUT_MUL))'"
 	return 0
 }
 
@@ -442,7 +442,7 @@ _tst_setup_timer()
 	fi
 
 	local sec=$TST_TIMEOUT
-	tst_multiply_timeout sec
+	_tst_multiply_timeout sec
 	local h=$((sec / 3600))
 	local m=$((sec / 60 % 60))
 	local s=$((sec % 60))

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
