Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F34A62FC3
	for <lists+linux-ltp@lfdr.de>; Sat, 15 Mar 2025 17:03:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1742054611; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=JTh/amQ7lId84ljpxcEEbVUaZs+ymIdwLAELo8BKR0E=;
 b=L4FS6yAOR1cXY0gwaGYVWjU3Q6GpI9fuKqZBXnYzxFmv9t6BN1jnkfbYbwhmZhgUDsJAi
 SynTxN1/hVAST0O0hL0faLZvD9mYpqLPnOkrqHPGuCsgPr43np3gDdSxo273RG4XQ6HOuFv
 fnMtQxaCGnSl8blZnRiNhzbOIRUAl5E=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B02BE3CA7AB
	for <lists+linux-ltp@lfdr.de>; Sat, 15 Mar 2025 17:03:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 41CAA3C6586
 for <ltp@lists.linux.it>; Sat, 15 Mar 2025 17:03:17 +0100 (CET)
Authentication-Results: in-2.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B199F60067D
 for <ltp@lists.linux.it>; Sat, 15 Mar 2025 17:03:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742054594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=byyIwW/Cs5mTrGp3cF8//+nqstNBQ1XoOEXVTcxmfQ8=;
 b=JV9BwNe92VLyo9jmXMulteeQfhhxmuXjbii/UyyEuRC6XvQZIQvL0JFbXuUvG50eWgPIyd
 dabmcm8iBV4AtQDg3AGzIgb0+Nzm5yQNiYmp4LvWn9C7iNADvlrR1zY2CcpubgE3hE0U7w
 EaIvY/FaK9gPnrmXR3vUCBCJXOQ58Uo=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-671-pdyZsHLRPACDJI0hNbkr0A-1; Sat,
 15 Mar 2025 12:03:12 -0400
X-MC-Unique: pdyZsHLRPACDJI0hNbkr0A-1
X-Mimecast-MFC-AGG-ID: pdyZsHLRPACDJI0hNbkr0A_1742054592
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BA00A19560A1
 for <ltp@lists.linux.it>; Sat, 15 Mar 2025 16:03:11 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.44.34.160])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D579E19560AD
 for <ltp@lists.linux.it>; Sat, 15 Mar 2025 16:03:10 +0000 (UTC)
To: ltp@lists.linux.it
Date: Sat, 15 Mar 2025 17:01:47 +0100
Message-ID: <d1d830051aea3f077995c30b2183731cd2f04cf2.1742054500.git.jstancek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EhRt0npqMz3znfMiEZQefgrXPJaWT8o2BKCxdx3_h6o_1742054592
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] tracing/pt_test: TCONF if Intel PT across VMXON is
 not supported
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
From: Jan Stancek via ltp <ltp@lists.linux.it>
Reply-To: Jan Stancek <jstancek@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

As noted in 1c5ac21a0e9b ("perf/x86/intel/pt: Don't die on VMXON"),
some Broadwell systems don't support Intel PT across VMXON.

If the test fails to find any events, check whether there is a
kvm_intel module loaded, and if so check for IA32_VMX_MISC[bit 14].
If this bit is 0, it's not supported. From commit mentioned above:
    Intel SDM, 36.5 "Tracing post-VMXON" says that
    "IA32_VMX_MISC[bit 14]" being 1 means PT can trace
    post-VMXON.

Fixes: https://github.com/linux-test-project/ltp/issues/1228
Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/tracing/pt_test/pt_test.c | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/testcases/kernel/tracing/pt_test/pt_test.c b/testcases/kernel/tracing/pt_test/pt_test.c
index 54011a884d20..a5a8bad7a205 100644
--- a/testcases/kernel/tracing/pt_test/pt_test.c
+++ b/testcases/kernel/tracing/pt_test/pt_test.c
@@ -14,6 +14,7 @@
  */
 
 
+#define _GNU_SOURCE
 #include <sched.h>
 #include <stdlib.h>
 #include <stdio.h>
@@ -35,6 +36,8 @@
 #define INTEL_PT_FORMAT_TSC "/sys/devices/intel_pt/format/tsc"
 #define INTEL_PT_FORMAT_NRT "/sys/devices/intel_pt/format/noretcomp"
 
+#define MSR_IA32_VMX_MISC 0x00000485
+
 //Intel PT event handle
 int fde = -1;
 //map head and size
@@ -102,6 +105,36 @@ static void del_map(uint64_t **buf_ev, long bufsize)
 	free(buf_ev);
 }
 
+/* Some versions of Intel PT do not support tracing across VMXON */
+static int is_supported_across_vmxon(void)
+{
+	char msr_path[64];
+	int msr_fd, ret, supported;
+	uint64_t value;
+
+	sprintf(msr_path, "/dev/cpu/%d/msr", sched_getcpu());
+
+	if (access(msr_path, F_OK) != 0) {
+		tst_res(TINFO, "%s not present", msr_path);
+		tst_res(TINFO, "skipping check for INTEL PT support across VMXON");
+		return 1;
+	}
+
+	msr_fd = SAFE_OPEN(msr_path, O_RDONLY);
+	ret = pread(msr_fd, &value, sizeof(value), MSR_IA32_VMX_MISC);
+	SAFE_CLOSE(msr_fd);
+	if (ret == sizeof(value)) {
+		supported = value & (1 << 14);
+
+		tst_res(TINFO, "Intel PT %s supported across VMXON",
+			supported ? "" : "_NOT_");
+		return supported;
+	}
+
+	/* we failed on MSR read, so assume it's supported */
+	return 1;
+}
+
 static void intel_pt_trace_check(void)
 {
 	uint64_t aux_head = 0;
@@ -117,6 +150,12 @@ static void intel_pt_trace_check(void)
 	pmp = (struct perf_event_mmap_page *)bufm[0];
 	aux_head = *(volatile uint64_t *)&pmp->aux_head;
 	if (aux_head == 0) {
+		if ((access("/sys/module/kvm_intel", F_OK) == 0)
+			&& (!is_supported_across_vmxon())) {
+			tst_brk(TCONF, "Intel PT on this system can not"
+				" run at the same time as virtualization");
+		}
+
 		tst_res(TFAIL, "There is no trace");
 		return;
 	}
-- 
2.43.5


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
