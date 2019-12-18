Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1220E124BB0
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 16:28:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 709C13C241B
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 16:28:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id DD4B13C0131
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 16:28:36 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D1944600AF2
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 16:28:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A0120B3D8;
 Wed, 18 Dec 2019 15:28:34 +0000 (UTC)
Date: Wed, 18 Dec 2019 16:28:32 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20191218152832.GA26689@dell5510>
References: <20191217171918.10237-1-alexey.kodanev@oracle.com>
 <20191217171918.10237-2-alexey.kodanev@oracle.com>
 <20191218084406.GA10966@dell5510>
 <f0aad696-82a5-fb06-0517-a437d95ae2e7@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0aad696-82a5-fb06-0517-a437d95ae2e7@oracle.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] network/iptables: add new test for
 iptables-tranlsate and nft
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

Hi Alexey,

> Thanks Petr! Fixed them and applied the patches.
Thanks for your work.

BTW even more setup could be moved into iptables_lib.sh.
If you like this change, I can push it.

Kind regards,
Petr

 testcases/network/iptables/iptables01.sh   | 3 ---
 testcases/network/iptables/iptables_lib.sh | 8 ++++++++
 testcases/network/iptables/nft01.sh        | 3 ---
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/testcases/network/iptables/iptables01.sh b/testcases/network/iptables/iptables01.sh
index e6ed4afab..96d68e62e 100755
--- a/testcases/network/iptables/iptables01.sh
+++ b/testcases/network/iptables/iptables01.sh
@@ -4,11 +4,8 @@
 
 TST_SETUP="init"
 TST_CLEANUP="cleanup"
-TST_NEEDS_CMDS="iptables grep ping telnet"
-TST_NEEDS_DRIVERS="ip_tables"
 use_iptables=1
 
 . iptables_lib.sh
-. tst_test.sh
 
 tst_run
diff --git a/testcases/network/iptables/iptables_lib.sh b/testcases/network/iptables/iptables_lib.sh
index b098479e4..87f33dfca 100755
--- a/testcases/network/iptables/iptables_lib.sh
+++ b/testcases/network/iptables/iptables_lib.sh
@@ -12,11 +12,19 @@ TST_NEEDS_TMPDIR=1
 TST_NEEDS_ROOT=1
 
 if [ "$use_iptables" = 1 ]; then
+	cmds="iptables"
 	toolname=iptables
+	TST_NEEDS_DRIVERS="ip_tables"
 else
+	cmds="nft iptables-translate"
 	toolname=nft
+	TST_NEEDS_DRIVERS="nf_tables"
 fi
 
+TST_NEEDS_CMDS="$cmds grep ping telnet"
+
+. tst_test.sh
+
 NFRUN()
 {
 	local rule
diff --git a/testcases/network/iptables/nft01.sh b/testcases/network/iptables/nft01.sh
index 9bd10a7f5..6cbd7a3a6 100755
--- a/testcases/network/iptables/nft01.sh
+++ b/testcases/network/iptables/nft01.sh
@@ -4,14 +4,11 @@
 
 TST_SETUP="do_setup"
 TST_CLEANUP="do_cleanup"
-TST_NEEDS_CMDS="nft iptables-translate grep ping telnet"
-TST_NEEDS_DRIVERS="nf_tables"
 use_iptables=0
 cleanup_table=0
 cleanup_chain=0
 
 . iptables_lib.sh
-. tst_test.sh
 
 do_setup()
 {
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
