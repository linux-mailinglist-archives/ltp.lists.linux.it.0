Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C8A1BC401
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 17:47:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C36A3C5F41
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 17:47:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 964373C2820
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 17:47:29 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C78966008E0
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 17:47:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7E451AB7F
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 15:47:27 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 28 Apr 2020 17:47:26 +0200
Message-Id: <20200428154727.29206-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] tst_is_virt(): Allow checking for any
 hypervisor
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

Add two more valid arguments for tst_is_virt():
- VIRT_ANY: return 1 if any hypervisor is detected
- VIRT_OTHER: return 1 if an unrecognized hypervisor is detected

Also fix bugs in try_systemd_detect_virt() and return -1 on error.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1: New patch

The is_kvm() fallback test pretty much doesn't work anywhere except in our
OpenQA setup. But looking at SystemD sources (yuck), detecting KVM properly
will be a major pain in the ass, never mind any other hypervisor. So I'll
leave any further improvements as an exercise for the reader.

BTW, systemd-detect-virt can't detect the PowerPC LPAR hypervisor.

 include/tst_cpu.h |  2 ++
 lib/tst_virt.c    | 23 +++++++++++++++++------
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/include/tst_cpu.h b/include/tst_cpu.h
index db6138f43..c83a58260 100644
--- a/include/tst_cpu.h
+++ b/include/tst_cpu.h
@@ -9,8 +9,10 @@ long tst_ncpus(void);
 long tst_ncpus_conf(void);
 long tst_ncpus_max(void);
 
+#define VIRT_ANY	0	/* catch-all argument for tst_is_virt() */
 #define VIRT_XEN	1	/* xen dom0/domU */
 #define VIRT_KVM	2	/* only default virtual CPU */
+#define VIRT_OTHER	0xffff	/* unrecognized hypervisor */
 
 int tst_is_virt(int virt_type);
 
diff --git a/lib/tst_virt.c b/lib/tst_virt.c
index 090e6334c..53d33e69c 100644
--- a/lib/tst_virt.c
+++ b/lib/tst_virt.c
@@ -49,7 +49,7 @@ static int is_kvm(void)
 
 static int is_xen(void)
 {
-	char hypervisor_type[3];
+	char hypervisor_type[4];
 
 	if (access("/proc/xen", F_OK) == 0)
 		return 1;
@@ -90,30 +90,41 @@ static int try_systemd_detect_virt(void)
 	 * systemd-detect-virt not found by shell or no virtualization detected
 	 * (systemd-detect-virt returns non-zero)
          */
+	if (ret < 0 || (WIFEXITED(ret) && WEXITSTATUS(ret) == 127))
+		return -1;
+
 	if (ret)
 		return 0;
 
-	if (strncmp("kvm", virt_type, 3))
+	if (!strncmp("kvm", virt_type, 3))
 		return VIRT_KVM;
 
-	if (strncmp("xen", virt_type, 3))
+	if (!strncmp("xen", virt_type, 3))
 		return VIRT_XEN;
 
-	return 0;
+	return VIRT_OTHER;
 }
 
 int tst_is_virt(int virt_type)
 {
 	int ret = try_systemd_detect_virt();
 
-	if (ret)
-		return ret == virt_type;
+	if (ret >= 0) {
+		if (virt_type == VIRT_ANY)
+			return ret != 0;
+		else
+			return ret == virt_type;
+	}
 
 	switch (virt_type) {
+	case VIRT_ANY:
+		return is_xen() || is_kvm();
 	case VIRT_XEN:
 		return is_xen();
 	case VIRT_KVM:
 		return is_kvm();
+	case VIRT_OTHER:
+		return 0;
 	}
 
 	tst_brkm(TBROK, NULL, "invalid virt_type flag: %d", virt_type);
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
