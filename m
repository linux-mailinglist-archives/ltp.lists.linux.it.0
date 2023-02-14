Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4319A696372
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Feb 2023 13:25:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A8D993CC90D
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Feb 2023 13:25:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8D4BC3CBF71
 for <ltp@lists.linux.it>; Tue, 14 Feb 2023 13:25:36 +0100 (CET)
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 91D9D2005D0
 for <ltp@lists.linux.it>; Tue, 14 Feb 2023 13:25:34 +0100 (CET)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 31ECPSFY074002;
 Tue, 14 Feb 2023 20:25:28 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Tue, 14 Feb 2023
 20:25:26 +0800
From: Leo Yu-Chi Liang <ycliang@andestech.com>
To: <ltp@lists.linux.it>
Date: Tue, 14 Feb 2023 20:25:09 +0800
Message-ID: <20230214122509.2957225-2-ycliang@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214122509.2957225-1-ycliang@andestech.com>
References: <20230214122509.2957225-1-ycliang@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 31ECPSFY074002
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=7.0 tests=PDS_RDNS_DYNAMIC_FP,
 RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [v2 2/2] lib/tst_pid.c: Increase PIDS_RESERVED to avoid fork
 failure.
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

After Adjusting how we count used pid, we increase
the number of PIDS_RESERVED to void fork failure.

Suggested-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
---
Changes v1 -> v2
* Split into two patches
---
 lib/tst_pid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_pid.c b/lib/tst_pid.c
index a282f8cc9..7582e4828 100644
--- a/lib/tst_pid.c
+++ b/lib/tst_pid.c
@@ -36,7 +36,7 @@
 #define CGROUPS_V1_SLICE_FMT "/sys/fs/cgroup/pids/user.slice/user-%d.slice/pids.max"
 #define CGROUPS_V2_SLICE_FMT "/sys/fs/cgroup/user.slice/user-%d.slice/pids.max"
 /* Leave some available processes for the OS */
-#define PIDS_RESERVE 50
+#define PIDS_RESERVE 200
 
 pid_t tst_get_unused_pid_(void (*cleanup_fn) (void))
 {
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
