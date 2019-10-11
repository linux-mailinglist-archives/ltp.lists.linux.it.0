Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE8FD4149
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 15:31:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E17B3C2284
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 15:31:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3B1FD3C1453
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 15:31:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2739E1A01931
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 15:31:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7AA89B5AB;
 Fri, 11 Oct 2019 13:31:47 +0000 (UTC)
Date: Fri, 11 Oct 2019 15:31:46 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191011133129.GA23391@dell5510>
References: <20191011095442.10541-1-pvorel@suse.cz>
 <20191011095442.10541-4-pvorel@suse.cz>
 <1570797394.4238.7.camel@suse.de> <20191011125413.GA30000@dell5510>
 <20191011125648.GF2591@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011125648.GF2591@rei>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 3/5] shell: Add timeout shell API tests
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
Cc: cfamullaconrad@suse.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > timeout02 1 TCONF: LTP_TIMEOUT_MUL must be number >= 1! (0)
> > BTW I wonder if TBROK shouldn't be used instead of TCONF.
> > Anybody strong opinion?

> If we fail to run a test because user passed wrong input data it has to
> be TBROK because TCONF can end up unnoticed.
+1.

I'd like to merge v5 with following diff:
Please let me know if anything else is problematic.

Kind regards,
Petr

diff --git lib/newlib_tests/shell/test_timeout.sh lib/newlib_tests/shell/test_timeout.sh
index 2cbc66412..948c7f02d 100755
--- lib/newlib_tests/shell/test_timeout.sh
+++ lib/newlib_tests/shell/test_timeout.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-PATH="$(dirname $0)/../../../testcases/lib/:$PATH"
+PATH="$(dirname $0):$(dirname $0)/../../../testcases/lib/:$PATH"
 
 DATA="
 timeout01.sh||0
@@ -9,6 +9,11 @@ timeout02.sh|foo|32
 timeout02.sh|2|0
 timeout02.sh|1.1|0
 timeout02.sh|-10|32
+
+timeout01.sh|2|0
+timeout02.sh|-1.1|32
+timeout02.sh|-10.1|32
+timeout02.sh|-0.1|0
 "
 
 echo "Testing timeout in shell API"
@@ -21,7 +26,7 @@ for i in $DATA; do
 	exp_exit=$(echo $i | cut -d'|' -f3)
 
 	echo "=== $test (LTP_TIMEOUT_MUL='$timeout') ==="
-	LTP_TIMEOUT_MUL=$timeout ./$file
+	LTP_TIMEOUT_MUL=$timeout $file
 	ret=$?
 	if [ $ret -ne $exp_exit ]; then
 		echo "FAILED (exit code: $ret, expected $exp_exit)"
diff --git testcases/lib/tst_test.sh testcases/lib/tst_test.sh
index 8713c1cdd..d8071cb10 100644
--- testcases/lib/tst_test.sh
+++ testcases/lib/tst_test.sh
@@ -389,14 +389,14 @@ _tst_setup_timer()
 
 	local err="LTP_TIMEOUT_MUL must be number >= 1!"
 
-	tst_is_num "$LTP_TIMEOUT_MUL" || tst_brk TCONF "$err ($LTP_TIMEOUT_MUL)"
+	tst_is_num "$LTP_TIMEOUT_MUL" || tst_brk TBROK "$err ($LTP_TIMEOUT_MUL)"
 
 	if ! tst_is_int "$LTP_TIMEOUT_MUL"; then
 		LTP_TIMEOUT_MUL=$(echo "$LTP_TIMEOUT_MUL" | cut -d. -f1)
 		LTP_TIMEOUT_MUL=$((LTP_TIMEOUT_MUL+1))
 		tst_res TINFO "ceiling LTP_TIMEOUT_MUL to $LTP_TIMEOUT_MUL"
 	fi
-	[ "$LTP_TIMEOUT_MUL" -ge 1 ] || tst_brk TCONF "$err ($LTP_TIMEOUT_MUL)"
+	[ "$LTP_TIMEOUT_MUL" -ge 1 ] || tst_brk TBROK "$err ($LTP_TIMEOUT_MUL)"
 
 	if ! tst_is_int "$TST_TIMEOUT" || [ "$TST_TIMEOUT" -lt 1 ]; then
 		tst_brk TBROK "TST_TIMEOUT must be int >= 1! ($TST_TIMEOUT)"

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
