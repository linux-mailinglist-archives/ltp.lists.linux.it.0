Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AFC7FCF6
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 17:05:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F3B733C2080
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 17:05:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C1F4D3C2017
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 17:04:54 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5271A1402E22
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 17:04:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DB0D6B00E;
 Fri,  2 Aug 2019 15:04:52 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  2 Aug 2019 17:04:43 +0200
Message-Id: <20190802150445.10984-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802150445.10984-1-pvorel@suse.cz>
References: <20190802150445.10984-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/4] utils/ffsb: Add missing fhstat() signature +
 includes
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

Need for build with -Werror-implicit-function-declaration

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
To be hones I'd rather delete this The Flexible Filesystem Benchmark
(FFSB) (in utils/ffsb-6.0-rc2). Does anyone uses it?
If kept, I'd prefer to have it as a separate project in [1]

I probably have asked before and there is a paper from 2012 suggesting
that someone used it 7 years ago [2][3]. There is also a fork, with just a
few patches, no development now [4].

[1] https://github.com/linux-test-project/ffsb
[2] https://elinux.org/images/f/f7/FFSB_and_IOzone-_File_system_Benchmarking_Tools%2C_Features_and_Internals.pdf
[3] https://www.youtube.com/watch?v=jFhrteWcahI
[4] https://github.com/FFSB-Prime/ffsb

 utils/ffsb-6.0-rc2/fh.h      | 2 ++
 utils/ffsb-6.0-rc2/fileops.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/utils/ffsb-6.0-rc2/fh.h b/utils/ffsb-6.0-rc2/fh.h
index 23a198bb8..29410c7ce 100644
--- a/utils/ffsb-6.0-rc2/fh.h
+++ b/utils/ffsb-6.0-rc2/fh.h
@@ -19,6 +19,7 @@
 #define _FH_H_
 
 #include <inttypes.h>
+#include "ffsb_thread.h"
 
 struct ffsb_thread;
 struct ffsb_fs;
@@ -29,6 +30,7 @@ int fhopencreate(char *, struct ffsb_thread *, struct ffsb_fs *);
 int fhopenappend(char *, struct ffsb_thread *, struct ffsb_fs *);
 
 void fhread(int, void *, uint64_t, struct ffsb_thread *, struct ffsb_fs *);
+void fhstat(char *name, ffsb_thread_t * ft, ffsb_fs_t * fs);
 
 /* can only write up to size_t bytes at a time, so size is a uint32_t */
 void fhwrite(int, void *, uint32_t, struct ffsb_thread *, struct ffsb_fs *);
diff --git a/utils/ffsb-6.0-rc2/fileops.c b/utils/ffsb-6.0-rc2/fileops.c
index 3212c18b2..72e133a13 100644
--- a/utils/ffsb-6.0-rc2/fileops.c
+++ b/utils/ffsb-6.0-rc2/fileops.c
@@ -30,6 +30,7 @@
 #include "ffsb.h"
 #include "fileops.h"
 #include "ffsb_op.h"
+#include "ffsb_thread.h"
 
 static void do_stats(struct timeval *start, struct timeval *end,
 		     ffsb_thread_t * ft, ffsb_fs_t * fs, syscall_t sys)
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
