Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0886FD3CC8
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 11:54:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C4F2C3C1508
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 11:54:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D47C33C1452
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 11:54:54 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 105FA1001995
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 11:53:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BE35BB2BE;
 Fri, 11 Oct 2019 09:54:53 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 11 Oct 2019 11:54:41 +0200
Message-Id: <20191011095442.10541-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011095442.10541-1-pvorel@suse.cz>
References: <20191011095442.10541-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v5 4/5] memcg_stress_test.sh: use TST_TIMEOUT (replace
 LTP_TIMEOUT_MUL)
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

keeping the same timeout

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
index 5b19cc292..ad8605e16 100755
--- a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
+++ b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
@@ -17,7 +17,7 @@ TST_NEEDS_CMDS="mount umount cat kill mkdir rmdir grep awk cut"
 
 # Each test case runs for 900 secs when everything fine
 # therefore the default 5 mins timeout is not enough.
-LTP_TIMEOUT_MUL=7
+TST_TIMEOUT=2100
 
 . cgroup_lib.sh
 
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
