Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 313CE3B1476
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 09:16:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E1003C6FD3
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 09:16:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4B5523C8E49
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 09:16:02 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 47C6E1A01108
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 09:16:01 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 1B3049FBCF;
 Wed, 23 Jun 2021 07:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1624432560; bh=LxDyP8tksDehiK09ccklzMuzFUEAmm1pWz3faOIwuHc=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=g3/JdgcCEm3gUtNmhNv7Vku7n75W1NR01B886ks/vStOJc1nyyDqk8RxOTOYnfB3v
 VXZo13htGwHkBNsUh9+l4pPZ8d9gPcCR0NtpF/GlvgTgs+NnkjbPUjnyTVfc/+ozQ7
 Yo8SXeHA9trbH5ehSNYQSESGLQJ9EQdwNicH9mxs=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	rpalethorpe@suse.com
Date: Wed, 23 Jun 2021 09:15:41 +0200
Message-Id: <20210623071543.171021-3-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623071543.171021-1-lkml@jv-coder.de>
References: <20210623071543.171021-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 2/3] cpuset_regression_test: Drop min cpu requirement
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

The bug can also be reproduced with only one cpu.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../controllers/cpuset/cpuset_regression_test.sh  | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_regression_test.sh b/testcases/kernel/controllers/cpuset/cpuset_regression_test.sh
index 1dda19704..369fbedae 100755
--- a/testcases/kernel/controllers/cpuset/cpuset_regression_test.sh
+++ b/testcases/kernel/controllers/cpuset/cpuset_regression_test.sh
@@ -27,13 +27,6 @@ old_cpu_exclusive_value=1
 
 setup()
 {
-	local cpu_num
-
-	cpu_num=$(tst_getconf _NPROCESSORS_ONLN)
-	if [ $cpu_num -lt 2 ]; then
-		tst_brk TCONF "We need 2 cpus at least to have test"
-	fi
-
 	if ! is_cgroup_subsystem_available_and_enabled "cpuset"; then
 		tst_brk TCONF "Either kernel does not support cpuset controller or feature not enabled"
 	fi
@@ -101,12 +94,12 @@ test()
 	fi
 
 	# This may trigger the kernel crash
-	echo 0-1 > ${root_cpuset_dir}/testdir/${cpus}
-	[ $? -ne 0 ] && tst_brk TFAIL "'echo 0-1 > ${root_cpuset_dir}/testdir/${cpus}' failed"
+	echo 0 > ${root_cpuset_dir}/testdir/${cpus}
+	[ $? -ne 0 ] && tst_brk TFAIL "'echo 0 > ${root_cpuset_dir}/testdir/${cpus}' failed"
 
 	cpus_value=$(cat ${root_cpuset_dir}/testdir/${cpus})
-	if [ "${cpus_value}" != "0-1" ]; then
-		tst_brk TFAIL "${cpus} is '${cpus_value}', expected '0-1'"
+	if [ "${cpus_value}" != "0" ]; then
+		tst_brk TFAIL "${cpus} is '${cpus_value}', expected '0'"
 	fi
 
 	tst_res TPASS "Bug is not reproducible"
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
