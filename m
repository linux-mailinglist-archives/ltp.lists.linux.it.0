Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC4C21BC12
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jul 2020 19:21:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DBDF53C5396
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jul 2020 19:21:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A44EC3C14F8
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 19:20:57 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C93C514016CC
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 19:20:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A97BEACC6;
 Fri, 10 Jul 2020 17:20:56 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 10 Jul 2020 19:20:39 +0200
Message-Id: <20200710172044.21592-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710172044.21592-1-pvorel@suse.cz>
References: <20200710172044.21592-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/7] tst_net.sh: Use ssh in LTP_RSH
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

for LTP_RSH (rsh fallback) it's better to use ssh instead of rsh by
default, using current user.

+ update docs.

Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_net.sh        | 2 +-
 testcases/network/stress/README | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 7ba267eda..0a8b2a8ca 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -838,7 +838,7 @@ tst_default_max_pkt()
 export RHOST="$RHOST"
 export PASSWD="${PASSWD:-}"
 # Don't use it in new tests, use tst_rhost_run() from tst_net.sh instead.
-export LTP_RSH="${LTP_RSH:-rsh -n}"
+export LTP_RSH="${LTP_RSH:-ssh -nq}"
 
 # Test Links
 # IPV{4,6}_{L,R}HOST can be set with or without prefix (e.g. IP or IP/prefix),
diff --git a/testcases/network/stress/README b/testcases/network/stress/README
index bc51a4cc9..b9537b1ce 100644
--- a/testcases/network/stress/README
+++ b/testcases/network/stress/README
@@ -48,10 +48,9 @@ To run the network stress testcases, use network.sh script, located in
 testscripts directory. For documentation about using network.sh see INSTALL
 and testcases/network/README.md
 
-Unfortunately some stress tests still depend on rsh for accessing remote host, even
-you decide to use SSH or network namespaces with network.sh.
-Instead of rsh, you can use ssh to set the environment variable LTP_RSH.
-Please refer the `Environment Variable' section of this document.
+Some stress tests originally designed to be tested with rsh for accessing
+remote host are now using ssh using the current user. Old behavior (using rsh
+can be achieved with setting LTP_RSH variable).
 
 The behaviour of network stress tests is configurable with environment
 variables (See `Environment Variable' section).
@@ -146,7 +145,7 @@ Optional environment variables
 ------------------------------
 
  o LTP_RSH
-   The name of the remote shell command, namely rsh or ssh.
+   The name of the remote shell command, namely ssh (the default) or rsh.
    In ether case, the remote host must accept the login from the local host
    without password.
 
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
