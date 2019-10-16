Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6739D96C0
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 18:16:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 754243C22B6
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 18:16:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5CB5A3C1443
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 18:15:56 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 890A7200FC5
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 18:15:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2522AB34A;
 Wed, 16 Oct 2019 16:15:52 +0000 (UTC)
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: pvorel@suse.cz,
	liwang@redhat.com,
	ltp@lists.linux.it
Date: Wed, 16 Oct 2019 18:15:16 +0200
Message-Id: <20191016161519.11256-1-cfamullaconrad@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <1571225126.8494.1.camel@suse.de>
References: <1571225126.8494.1.camel@suse.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/4] tst_test.sh: Use LTP_TIMEOUT_MUL in
 TST_RETRY_FN()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Because of timeout problems when using TST_RETRY_FN() we do now use
LTP_TIMEOUT_MUL to adopt the timeout value.

Introduced tst_multiply_timeout function to have a generic place to
adopt timeout values.

Signed-off-by: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
---
 testcases/lib/tst_test.sh | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index d8071cb10..ee220ac19 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -164,9 +164,11 @@ TST_RETRY_FN_EXP_BACKOFF()
 {
 	local tst_fun="$1"
 	local tst_exp=$2
-	local tst_sec=$(expr $3 \* 1000000)
+	local tst_sec=$(( $3 * 1000000 ))
 	local tst_delay=1
 
+	tst_multiply_timeout tst_sec
+
 	if [ $# -ne 3 ]; then
 		tst_brk TBROK "TST_RETRY_FN_EXP_BACKOFF expects 3 parameters"
 	fi
@@ -376,16 +378,13 @@ _tst_rescmp()
 	fi
 }
 
-
-_tst_setup_timer()
+tst_multiply_timeout()
 {
-	TST_TIMEOUT=${TST_TIMEOUT:-300}
-	LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}
+	# first parameter is used as return value
+	local timeout="${!1}"
+	[ $# -gt 1 ] && timeout="$2"
 
-	if [ "$TST_TIMEOUT" = -1 ]; then
-		tst_res TINFO "Timeout per run is disabled"
-		return
-	fi
+	LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}
 
 	local err="LTP_TIMEOUT_MUL must be number >= 1!"
 
@@ -396,13 +395,29 @@ _tst_setup_timer()
 		LTP_TIMEOUT_MUL=$((LTP_TIMEOUT_MUL+1))
 		tst_res TINFO "ceiling LTP_TIMEOUT_MUL to $LTP_TIMEOUT_MUL"
 	fi
+
 	[ "$LTP_TIMEOUT_MUL" -ge 1 ] || tst_brk TBROK "$err ($LTP_TIMEOUT_MUL)"
+	[ "$timeout" -ge 1 ] || tst_brk TBROK "timeout need to be >= 1 ($timeout)"
+
+	eval "$1='$(( timeout * LTP_TIMEOUT_MUL))'"
+	return 0
+}
+
+_tst_setup_timer()
+{
+	TST_TIMEOUT=${TST_TIMEOUT:-300}
+
+	if [ "$TST_TIMEOUT" = -1 ]; then
+		tst_res TINFO "Timeout per run is disabled"
+		return
+	fi
 
 	if ! tst_is_int "$TST_TIMEOUT" || [ "$TST_TIMEOUT" -lt 1 ]; then
 		tst_brk TBROK "TST_TIMEOUT must be int >= 1! ($TST_TIMEOUT)"
 	fi
 
-	local sec=$((TST_TIMEOUT * LTP_TIMEOUT_MUL))
+	local sec=$TST_TIMEOUT
+	tst_multiply_timeout sec
 	local h=$((sec / 3600))
 	local m=$((sec / 60 % 60))
 	local s=$((sec % 60))
-- 
2.16.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
