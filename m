Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ED46D4CA7
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Apr 2023 17:53:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 617083CCAB5
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Apr 2023 17:53:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 67D013CC81F
 for <ltp@lists.linux.it>; Mon,  3 Apr 2023 17:53:06 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 73B1D60069E
 for <ltp@lists.linux.it>; Mon,  3 Apr 2023 17:53:05 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3907FEC
 for <ltp@lists.linux.it>; Mon,  3 Apr 2023 08:53:47 -0700 (PDT)
Received: from e126380.arm.com (unknown [10.57.56.198])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 09B773F6C4
 for <ltp@lists.linux.it>; Mon,  3 Apr 2023 08:53:02 -0700 (PDT)
From: Teo Couprie Diaz <teo.coupriediaz@arm.com>
To: ltp@lists.linux.it
Date: Mon,  3 Apr 2023 16:52:58 +0100
Message-Id: <20230403155258.309714-1-teo.coupriediaz@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] ipc/msgstress03: Assume all forks will run
 concurently
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

It appears that msgstress03 doesn't account for all PIDs that its children
can use, as it expects the tasks will terminate quickly and not reach
the PID limit.
On some systems, this assumption can be invalid and the PID limit
will be hit.
Change the limit to account for all possible children at once, knowning
that each child will fork as well.

Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>
---
v2:
  - Slightly change the computation, kind of similar to what is done
    in msgstress04, to make the warning make sense with the change.
  - Added comment to clarify.

Maybe the message could be rephrased entirely ? Something along the lines
of: "Maximum number of used processes higher than limit [...]"

CI build: https://github.com/Teo-CD/ltp/actions/runs/4598445898

 testcases/kernel/syscalls/ipc/msgstress/msgstress03.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
index 3cb70ab18a80..aa37d9058b3e 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
+++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
@@ -110,11 +110,12 @@ int main(int argc, char **argv)
 	}
 
 	free_pids = tst_get_free_pids(cleanup);
-	if (nprocs >= free_pids) {
+	/* Each forked child forks once, take it into account here. */
+	if (nprocs * 2 >= free_pids) {
 		tst_resm(TINFO,
 			 "Requested number of processes higher than limit (%d > %d), "
-			 "setting to %d", nprocs, free_pids, free_pids);
-		nprocs = free_pids;
+			 "setting to %d", nprocs * 2, free_pids, free_pids);
+		nprocs = free_pids / 2;
 	}
 
 	srand(getpid());
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
