Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFA634181C
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:20:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8C7A3C602C
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:20:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id D58303C5FC1
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:19:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7F29E100128B
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:19:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1616145556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oeEbACmUFy82n8VT4Nkr4lvxlGP6iJv2pkOfrPiyA2g=;
 b=czB3Kp/Y3zPNGLDKlDi7RyUGr3uI6bSAcwzXkVZS5R4rWD35QKZqPvo00TUXEG2skg7Xvi
 ujChpGwPyuKuWA+FlL/LpSNn8NTovco4ZCrLaT05tW0W29cOewDEnFSjMtMDHGWrbceevq
 XSPljku6Ci3tnNacpVmUuhFs3TpYToA=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22D0CAE05;
 Fri, 19 Mar 2021 09:19:16 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri, 19 Mar 2021 09:18:36 +0000
Message-Id: <20210319091837.27319-7-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210319091837.27319-1-rpalethorpe@suse.com>
References: <20210319091837.27319-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 6/7] API: Add tst_ncpus_available
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Same as tst_ncpus, but takes CPU affinity into account.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/tst_cpu.h |  1 +
 lib/tst_cpu.c     | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/tst_cpu.h b/include/tst_cpu.h
index 117e27087..b3a449bea 100644
--- a/include/tst_cpu.h
+++ b/include/tst_cpu.h
@@ -8,6 +8,7 @@
 long tst_ncpus(void);
 long tst_ncpus_conf(void);
 long tst_ncpus_max(void);
+long tst_ncpus_available(void);
 
 #define VIRT_ANY	0	/* catch-all argument for tst_is_virt() */
 #define VIRT_XEN	1	/* xen dom0/domU */
diff --git a/lib/tst_cpu.c b/lib/tst_cpu.c
index 033155e47..b4c7c2f81 100644
--- a/lib/tst_cpu.c
+++ b/lib/tst_cpu.c
@@ -17,6 +17,8 @@
  *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  */
 
+#include "lapi/cpuset.h"
+
 #include <stdlib.h>
 #include <unistd.h>
 #include "test.h"
@@ -71,3 +73,27 @@ long tst_ncpus_max(void)
 	}
 	return ncpus_max;
 }
+
+long tst_ncpus_available(void)
+{
+#ifdef CPU_COUNT_S
+	long ncpus = tst_ncpus_max();
+	size_t cpusz = CPU_ALLOC_SIZE(ncpus);
+	cpu_set_t *cpus = CPU_ALLOC(ncpus);
+
+	if (!cpus)
+		tst_brkm(TBROK | TERRNO, NULL, "CPU_ALLOC(%zu)", cpusz);
+
+	if (sched_getaffinity(0, cpusz, cpus)) {
+		tst_resm(TWARN | TERRNO, "sched_getaffinity(0, %zu, %zx)",
+			cpusz, (size_t)cpus);
+	} else {
+		ncpus = CPU_COUNT_S(cpusz, cpus);
+	}
+	CPU_FREE(cpus);
+
+	return ncpus;
+#else
+	return tst_ncpus();
+#endif
+}
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
