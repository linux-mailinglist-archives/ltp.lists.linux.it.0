Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C834B706CFC
	for <lists+linux-ltp@lfdr.de>; Wed, 17 May 2023 17:37:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7320A3CEE27
	for <lists+linux-ltp@lfdr.de>; Wed, 17 May 2023 17:37:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E44233CB8F3
 for <ltp@lists.linux.it>; Wed, 17 May 2023 17:36:44 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EB7441400191
 for <ltp@lists.linux.it>; Wed, 17 May 2023 17:36:43 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1F024226C6;
 Wed, 17 May 2023 15:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1684337803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bIgVv4QqSF7zeCwlX26+h1ASwgAlafZ+x/m4Q5Q06qQ=;
 b=y+XVt3TVeJcgF9UswzoyUG/UHDgfE1aa8Xshc8HeNhv5ctBMvVD3HEFzs/OSiNovSjVBgt
 ou64OQZ+1uaOaxbCTNX/ix+iLRmlXm9NPX8S/dY8Uv7Oiz/n8QBtKjK5vagDkvewZEyDeD
 xR3dsJfd2YSWvcVkpUphXIV174bK59U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1684337803;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bIgVv4QqSF7zeCwlX26+h1ASwgAlafZ+x/m4Q5Q06qQ=;
 b=EalHLbo1blft6S989k9pqrB0L7W1QV9Vz8i+yTqUEFDRcxS2S40DmMpC9OaV31CYY7rJ77
 hjiD0kO6+huOPICA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0AEC4139F5;
 Wed, 17 May 2023 15:36:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uF77AYv0ZGSTCgAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Wed, 17 May 2023 15:36:43 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: Nicolai Stange <nstange@suse.de>,
	ltp@lists.linux.it
Date: Wed, 17 May 2023 17:36:37 +0200
Message-Id: <20230517153642.26919-3-mdoucha@suse.cz>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230517153642.26919-1-mdoucha@suse.cz>
References: <20230517153642.26919-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/7] Add test for CVE 2021-3656
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

The reproducer was verified on vulnerable SLE kernels.

 runtest/kvm                      |   1 +
 testcases/kernel/kvm/.gitignore  |   1 +
 testcases/kernel/kvm/kvm_svm02.c | 159 +++++++++++++++++++++++++++++++
 3 files changed, 161 insertions(+)
 create mode 100644 testcases/kernel/kvm/kvm_svm02.c

diff --git a/runtest/kvm b/runtest/kvm
index 726d72f0a..59e410beb 100644
--- a/runtest/kvm
+++ b/runtest/kvm
@@ -1,2 +1,3 @@
 kvm_pagefault01 kvm_pagefault01
 kvm_svm01 kvm_svm01
+kvm_svm02 kvm_svm02
diff --git a/testcases/kernel/kvm/.gitignore b/testcases/kernel/kvm/.gitignore
index b284b9528..c757cd3f4 100644
--- a/testcases/kernel/kvm/.gitignore
+++ b/testcases/kernel/kvm/.gitignore
@@ -1,2 +1,3 @@
 /kvm_pagefault01
 /kvm_svm01
+/kvm_svm02
diff --git a/testcases/kernel/kvm/kvm_svm02.c b/testcases/kernel/kvm/kvm_svm02.c
new file mode 100644
index 000000000..b89622f47
--- /dev/null
+++ b/testcases/kernel/kvm/kvm_svm02.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 SUSE LLC
+ * Author: Nicolai Stange <nstange@suse.de>
+ * LTP port: Martin Doucha <mdoucha@suse.cz>
+ */
+
+/*\
+ * CVE 2021-3656
+ *
+ * Check that KVM correctly intercepts VMSAVE and VMLOAD instructions
+ * in a nested virtual machine even when the parent guest disables
+ * intercepting either instruction. If KVM does not override the disabled
+ * intercepts, it'll give the nested VM read/write access to a few bytes
+ * of an arbitrary physical memory page. Unauthorized memory access fixed in:
+ *
+ *  commit c7dfa4009965a9b2d7b329ee970eb8da0d32f0bc
+ *  Author: Maxim Levitsky <mlevitsk@redhat.com>
+ *  Date:   Mon Jul 19 16:05:00 2021 +0300
+ *
+ *  KVM: nSVM: always intercept VMLOAD/VMSAVE when nested (CVE-2021-3656)
+ */
+
+#include "kvm_test.h"
+
+#ifdef COMPILE_PAYLOAD
+#if defined(__i386__) || defined(__x86_64__)
+
+#include "kvm_x86_svm.h"
+
+#define AVIC_REG_ADDR 0x280
+#define AVIC_TEST_VAL 0xec
+#define AVIC_READ_FAIL 0x12ead
+
+#define AVIC_INFO_MASK ((1ULL << 32) | 0xff0)
+#define AVIC_INFO_EXP ((1ULL << 32) | AVIC_REG_ADDR)
+
+static void *vmsave_buf;
+
+/* Load FS, GS, TR and LDTR state from vmsave_buf */
+static int guest_vmload(void)
+{
+	asm (
+		"vmload\n"
+		:
+		: "a" (vmsave_buf)
+	);
+	return 0;
+}
+
+/* Save current FS, GS, TR and LDTR state to vmsave_buf */
+static int guest_vmsave(void)
+{
+	asm (
+		"vmsave\n"
+		:
+		: "a" (vmsave_buf)
+	);
+	return 0;
+}
+
+static int cmp_descriptor(const struct kvm_vmcb_descriptor *a,
+	const struct kvm_vmcb_descriptor *b)
+{
+	int ret;
+
+	ret = a->selector != b->selector;
+	ret = ret || a->attrib != b->attrib;
+	ret = ret || a->limit != b->limit;
+	ret = ret || a->base != b->base;
+	return ret;
+}
+
+/* Return non-zero if the VMCB fields touched by vmsave/vmload differ */
+static int cmp_vmcb(const struct kvm_vmcb *a, const struct kvm_vmcb *b)
+{
+	int ret;
+
+	ret = cmp_descriptor(&a->fs, &b->fs);
+	ret = ret || cmp_descriptor(&a->gs, &b->gs);
+	ret = ret || cmp_descriptor(&a->tr, &b->tr);
+	ret = ret || cmp_descriptor(&a->ldtr, &b->ldtr);
+	ret = ret || a->kernel_gs_base != b->kernel_gs_base;
+	ret = ret || a->star != b->star;
+	ret = ret || a->lstar != b->lstar;
+	ret = ret || a->cstar != b->cstar;
+	ret = ret || a->sfmask != b->sfmask;
+	ret = ret || a->sysenter_cs != b->sysenter_cs;
+	ret = ret || a->sysenter_esp != b->sysenter_esp;
+	ret = ret || a->sysenter_eip != b->sysenter_eip;
+	return ret;
+}
+
+void main(void)
+{
+	uint16_t ss;
+	uint64_t rsp;
+	struct kvm_svm_vcpu *vcpu;
+
+	kvm_init_svm();
+	vcpu = kvm_create_svm_vcpu(guest_vmload, 1);
+	kvm_vmcb_set_intercept(vcpu->vmcb, SVM_INTERCEPT_VMLOAD, 0);
+	vmsave_buf = kvm_alloc_vmcb();
+
+	/* Save allocated stack for later VM reinit */
+	ss = vcpu->vmcb->ss.selector;
+	rsp = vcpu->vmcb->rsp;
+
+	/* Load partial state from vmsave_buf and save it to vcpu->vmcb */
+	kvm_svm_vmrun(vcpu);
+
+	if (vcpu->vmcb->exitcode != SVM_EXIT_HLT)
+		tst_brk(TBROK, "Nested VM exited unexpectedly");
+
+	if (cmp_vmcb(vcpu->vmcb, vmsave_buf)) {
+		tst_res(TFAIL, "Nested VM can read host memory");
+		return;
+	}
+
+	/* Load state from vcpu->vmcb and save it to vmsave_buf */
+	memset(vmsave_buf, 0xaa, sizeof(struct kvm_vmcb));
+	kvm_init_guest_vmcb(vcpu->vmcb, 1, ss, (void *)rsp, guest_vmsave);
+	kvm_vmcb_set_intercept(vcpu->vmcb, SVM_INTERCEPT_VMSAVE, 0);
+	kvm_svm_vmrun(vcpu);
+
+	if (vcpu->vmcb->exitcode != SVM_EXIT_HLT)
+		tst_brk(TBROK, "Nested VM exited unexpectedly");
+
+	if (cmp_vmcb(vcpu->vmcb, vmsave_buf)) {
+		tst_res(TFAIL, "Nested VM can overwrite host memory");
+		return;
+	}
+
+	tst_res(TPASS, "VMLOAD and VMSAVE were intercepted by kernel");
+}
+
+#else /* defined(__i386__) || defined(__x86_64__) */
+TST_TEST_TCONF("Test supported only on x86");
+#endif /* defined(__i386__) || defined(__x86_64__) */
+
+#else /* COMPILE_PAYLOAD */
+
+static struct tst_test test = {
+	.test_all = tst_kvm_run,
+	.setup = tst_kvm_setup,
+	.cleanup = tst_kvm_cleanup,
+	.supported_archs = (const char *const []) {
+		"x86_64",
+		"x86",
+		NULL
+	},
+	.tags = (struct tst_tag[]){
+		{"linux-git", "c7dfa4009965"},
+		{"CVE", "2021-3656"},
+		{}
+	}
+};
+
+#endif /* COMPILE_PAYLOAD */
-- 
2.40.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
