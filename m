Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D6836ECF9
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 17:06:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C9813C6197
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 17:06:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AD0463C0F91
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 17:05:20 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2D4B11A014B9
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 17:05:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1619708719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U4tpeyA1ak2f4CNxuyvlqPDucxZiZGZIkig9F66ZVLI=;
 b=ldggK6qdGEBzUNS/gHaBBxtmAp72o/OF9vCdUAml3GcqdG53cv/sYus7nP4DQEJLG3rz0a
 BOQILAKY2YBTa6ifbC999sedSjMrWdbX67eiS+fMk0t3ygDVFhJr5m5b6r3iu4JN4tiO8W
 +r7oauAmYz8qAZxz1DLRsZWykmgPdzo=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B10E1B1C5;
 Thu, 29 Apr 2021 15:05:19 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 29 Apr 2021 16:05:09 +0100
Message-Id: <20210429150510.21585-5-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429150510.21585-1-rpalethorpe@suse.com>
References: <20210429150510.21585-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/5] bpf: Add bpf_insn_buf,
 map and instruction concatenation helpers
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

Add helpers for building up programs. Tests before bpf_prog05 have not
been updated to use this for two reasons.

1. Some apply offsets to the map pointer returned or jump to the end
   of the program instead of just over an immediate exit
   instruction. Either way modifying them would require testing they
   still reproduce the bug.

2. Some have a lot of comments describing the program which is useful
   to learn from. These would need to be moved.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/syscalls/bpf/bpf_common.c | 40 ++++++++++++++++++++++
 testcases/kernel/syscalls/bpf/bpf_common.h | 12 +++++++
 2 files changed, 52 insertions(+)

diff --git a/testcases/kernel/syscalls/bpf/bpf_common.c b/testcases/kernel/syscalls/bpf/bpf_common.c
index b5337c22a..d80ed91bb 100644
--- a/testcases/kernel/syscalls/bpf/bpf_common.c
+++ b/testcases/kernel/syscalls/bpf/bpf_common.c
@@ -82,6 +82,46 @@ long bpf_map_array_get(const int map_fd,
 	return TST_RET;
 }
 
+void bpf_insn_buf_cat(struct bpf_insn_buf *const self,
+		      const struct bpf_insn *const insn_to_cat,
+		      const size_t insn_to_cat_len)
+{
+	memcpy(((char *)self->insn) + self->byte_len,
+	       insn_to_cat, insn_to_cat_len);
+	self->byte_len += insn_to_cat_len;
+}
+
+/* map[array_indx] = reg_to_save
+ *
+ * Inserts the following into insn_out.
+ *
+ * r1 = map_fd
+ * r2 = fp
+ * r2 = r2 - 4
+ * r2 = array_indx
+ * call map_lookup_elem(r1, r2)
+ * if r0 != 0 goto pc+1
+ * exit
+ * *r0 = reg_to_save
+ *
+ */
+ void bpf_insn_buf_array_set(struct bpf_insn_buf *const self, const int map_fd,
+			     const uint32_t array_indx, const uint8_t reg_to_save)
+{
+	const struct bpf_insn map_insn[] = {
+		BPF_LD_MAP_FD(BPF_REG_1, map_fd),
+		BPF_MOV64_REG(BPF_REG_2, BPF_REG_10),
+		BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, -4),
+		BPF_ST_MEM(BPF_W, BPF_REG_2, 0, array_indx),
+		BPF_EMIT_CALL(BPF_FUNC_map_lookup_elem),
+		BPF_JMP_IMM(BPF_JNE, BPF_REG_0, 0, 1),
+		BPF_EXIT_INSN(),
+		BPF_STX_MEM(BPF_DW, BPF_REG_0, reg_to_save, 0),
+	};
+
+	bpf_insn_buf_cat(self, map_insn, sizeof(map_insn));
+}
+
 void bpf_init_prog_attr(union bpf_attr *attr, const struct bpf_insn *prog,
 	size_t prog_size, char *log_buf, size_t log_size)
 {
diff --git a/testcases/kernel/syscalls/bpf/bpf_common.h b/testcases/kernel/syscalls/bpf/bpf_common.h
index 9e9935c2c..10b1eee86 100644
--- a/testcases/kernel/syscalls/bpf/bpf_common.h
+++ b/testcases/kernel/syscalls/bpf/bpf_common.h
@@ -13,6 +13,11 @@
 
 #define BPF_MEMLOCK_ADD (2*1024*1024)
 
+struct bpf_insn_buf {
+	size_t byte_len;
+	struct bpf_insn insn[BPF_MAXINSNS];
+};
+
 void rlimit_bump_memlock(void);
 int bpf_map_create(union bpf_attr *attr);
 int bpf_map_array_create(uint32_t max_entries);
@@ -20,6 +25,13 @@ long bpf_map_array_get(const int map_fd,
 		       const uint32_t *const array_indx,
 		       uint64_t *const array_val);
 
+void bpf_insn_buf_cat(struct bpf_insn_buf *const self,
+		      const struct bpf_insn *const insn_to_cat,
+		      const size_t insn_to_cat_len);
+void bpf_insn_buf_array_set(struct bpf_insn_buf *const self,
+			    const int map_fd,
+			    const uint32_t array_indx, const uint8_t reg_to_save);
+
 void bpf_init_prog_attr(union bpf_attr *attr, const struct bpf_insn *prog,
 			size_t prog_size, char *log_buf, size_t log_size);
 int bpf_load_prog(union bpf_attr *attr, const char *log);
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
