Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3FF3FC4A5
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:10:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 031F03C2A0B
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:10:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AA3873C2A0B
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:10:19 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3FDD71A00A3C
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:10:19 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id CF5A91FE60;
 Tue, 31 Aug 2021 09:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1630401018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iiloIT9z/mwhJnCqLOkvS7DjpxKKZ2sMgZXJ0NJO8uY=;
 b=Gqttr/8jtxAN0OchoGFNXS9jBZdDJwXcRf+FdAnJuAYw6oiZXDc+S066rZfJeuNYLDsVHm
 wMLQP8Yg2i7NxH6LoHGCXKoH2mf++6rWNNoU2McdRSps4llOM7WIgCF1vRJ9+u+RKD6V5f
 ay7OfEDOxaajRRtR0IakP5mDU/WQ5ho=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 9E1C1A3B98;
 Tue, 31 Aug 2021 09:10:18 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 31 Aug 2021 10:10:05 +0100
Message-Id: <20210831091005.25361-4-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210831091005.25361-1-rpalethorpe@suse.com>
References: <YSz36VZ18+N4YsM/@yuki>
 <20210831091005.25361-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/4] bpf_prog05: Drop CAP_BPF and check if ptr
 arithmetic is allowed
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

On older kernels pointer arithmetic requires CAP_BPF. They also lack
the ability to call BPF subprogs. This makes it difficult to exploit
the div/mod behavior.

Older kernels leave div/mod by zero undefined. This causes the test to
fail and backporting the new behavior is difficult. So when we find
that pointer arithmetic is not possible without CAP_BPF we can return
TCONF. Because in this case, we know the test will fail, the risk is
limited and there is little that can be done about it.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/lapi/bpf.h                         |  1 +
 testcases/kernel/syscalls/bpf/bpf_prog05.c | 44 +++++++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/include/lapi/bpf.h b/include/lapi/bpf.h
index 0e4527b8b..f9e50c6b7 100644
--- a/include/lapi/bpf.h
+++ b/include/lapi/bpf.h
@@ -27,6 +27,7 @@
 #define BPF_JNE		0x50	/* jump != */
 
 #define BPF_SIZE(code)  ((code) & 0x18)
+#define		BPF_B		0x10 /*  8-bit */
 #define		BPF_W		0x00    /* 32-bit */
 #define         BPF_DW		0x18	/* double word (64-bit) */
 
diff --git a/testcases/kernel/syscalls/bpf/bpf_prog05.c b/testcases/kernel/syscalls/bpf/bpf_prog05.c
index b2792c505..2be5a2cc9 100644
--- a/testcases/kernel/syscalls/bpf/bpf_prog05.c
+++ b/testcases/kernel/syscalls/bpf/bpf_prog05.c
@@ -63,6 +63,45 @@ static uint64_t *val;
 static char *log;
 static union bpf_attr *attr;
 
+static void ensure_ptr_arithmetic(void)
+{
+	const struct bpf_insn prog_insn[] = {
+		/* r2 = r10
+		 * r3 = -1
+		 * r2 += r3
+		 * *(char *)r2 = 0
+		 */
+		BPF_MOV64_REG(BPF_REG_2, BPF_REG_10),
+		BPF_MOV64_IMM(BPF_REG_3, -1),
+		BPF_ALU64_REG(BPF_ADD, BPF_REG_2, BPF_REG_3),
+		BPF_ST_MEM(BPF_B, BPF_REG_2, 0, 0),
+
+		/* exit(0) */
+		BPF_MOV64_IMM(BPF_REG_0, 0),
+		BPF_EXIT_INSN()
+	};
+	int ret;
+
+	bpf_init_prog_attr(attr, prog_insn, sizeof(prog_insn), log, BUFSIZE);
+
+	ret = TST_RETRY_FUNC(bpf(BPF_PROG_LOAD, attr, sizeof(*attr)),
+				       TST_RETVAL_GE0);
+
+	if (ret >= 0) {
+		tst_res(TINFO, "Have pointer arithmetic");
+		SAFE_CLOSE(ret);
+		return;
+	}
+
+	if (ret != -1)
+		tst_brk(TBROK, "Invalid bpf() return value: %d", ret);
+
+	if (log[0] != 0)
+		tst_brk(TCONF | TERRNO, "No pointer arithmetic:\n %s", log);
+
+	tst_brk(TBROK | TERRNO, "Failed to load program");
+}
+
 static int load_prog(void)
 {
 	const struct bpf_insn prog_insn[] = {
@@ -132,7 +171,9 @@ static void run(void)
 {
 	int prog_fd;
 
-	map_fd = bpf_map_array_create(4);
+	map_fd = bpf_map_array_create(8);
+
+	ensure_ptr_arithmetic();
 	prog_fd = load_prog();
 	bpf_run_prog(prog_fd, msg, sizeof(MSG));
 	SAFE_CLOSE(prog_fd);
@@ -157,6 +198,7 @@ static struct tst_test test = {
 	.taint_check = TST_TAINT_W | TST_TAINT_D,
 	.caps = (struct tst_cap []) {
 		TST_CAP(TST_CAP_DROP, CAP_SYS_ADMIN),
+		TST_CAP(TST_CAP_DROP, CAP_BPF),
 		{}
 	},
 	.bufs = (struct tst_buffers []) {
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
