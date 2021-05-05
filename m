Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE153736DF
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 11:17:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D6CD3C57B8
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 11:17:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 14BD83C56FC
 for <ltp@lists.linux.it>; Wed,  5 May 2021 11:16:31 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 574BB1000EBE
 for <ltp@lists.linux.it>; Wed,  5 May 2021 11:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620206190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4rtYJGAs3PPfBZtJecci4uXgF/IqjCw/vk4DHMB4qjg=;
 b=s+MzbOyvDPiPS0heeZvsAubAf5Uay8sdZVIpfqr3ofz2au/wRrQ/07L1/vW9OToyFFKaHI
 jrIvuUtZJXAoBTtZ49hCuXm4/csbW8LWALxnvzGkTu8warpiZnvPA1uJveCsQwyF03Nuam
 VRNrziZviI94/dPc8c5HCn0JCLT63Sc=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED96BB231;
 Wed,  5 May 2021 09:16:29 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed,  5 May 2021 10:16:21 +0100
Message-Id: <20210505091623.29121-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505091623.29121-1-rpalethorpe@suse.com>
References: <20210505091623.29121-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/4] bpf: Add map_array helper functions/macro and
 constify
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

We usually just create an array map with standard key and value
size. Then fetch some values from the array. So we can create some
standard functions for this.

The byte code which stores the values in the map can also be
extracted into a macro. So a macro has been added, however it is only
used in the new bpf_prog05 test. The old tests do some pointer
arithmetic on the map call return value to trigger bugs. They could be
rewritten, but then would need verifying.

This also adds some extra const checks and attributes.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/syscalls/bpf/bpf_common.c | 49 ++++++++++++++++----
 testcases/kernel/syscalls/bpf/bpf_common.h | 53 ++++++++++++++++++++--
 testcases/kernel/syscalls/bpf/bpf_prog01.c | 25 +++-------
 testcases/kernel/syscalls/bpf/bpf_prog02.c | 47 +++++--------------
 testcases/kernel/syscalls/bpf/bpf_prog03.c | 25 ++--------
 testcases/kernel/syscalls/bpf/bpf_prog04.c |  8 +---
 6 files changed, 112 insertions(+), 95 deletions(-)

diff --git a/testcases/kernel/syscalls/bpf/bpf_common.c b/testcases/kernel/syscalls/bpf/bpf_common.c
index fd299b73d..42c72b975 100644
--- a/testcases/kernel/syscalls/bpf/bpf_common.c
+++ b/testcases/kernel/syscalls/bpf/bpf_common.c
@@ -28,7 +28,7 @@ void rlimit_bump_memlock(void)
 	}
 }
 
-int bpf_map_create(union bpf_attr *attr)
+int bpf_map_create(union bpf_attr *const attr)
 {
 	int ret;
 
@@ -48,12 +48,45 @@ int bpf_map_create(union bpf_attr *attr)
 	return ret;
 }
 
-void bpf_init_prog_attr(union bpf_attr *attr, const struct bpf_insn *prog,
-	size_t prog_size, char *log_buf, size_t log_size)
+int bpf_map_array_create(const uint32_t max_entries)
+{
+	union bpf_attr map_attr = {
+		.map_type = BPF_MAP_TYPE_ARRAY,
+		.key_size = 4,
+		.value_size = 8,
+		.max_entries = max_entries,
+		.map_flags = 0
+	};
+
+	return bpf_map_create(&map_attr);
+}
+
+void bpf_map_array_get(const int map_fd,
+		       const uint32_t *const array_indx,
+		       uint64_t *const array_val)
+{
+	union bpf_attr elem_attr = {
+		.map_fd = map_fd,
+		.key = ptr_to_u64(array_indx),
+		.value = ptr_to_u64(array_val),
+		.flags = 0
+	};
+	const int ret = bpf(BPF_MAP_LOOKUP_ELEM, &elem_attr, sizeof(elem_attr));
+
+        if (ret) {
+		tst_brk(TBROK | TTERRNO,
+			"Failed array map lookup: [%"PRIu32, *array_indx);
+	}
+}
+
+void bpf_init_prog_attr(union bpf_attr *const attr,
+			const struct bpf_insn *const prog,
+			const size_t prog_size, char *const log_buf,
+			const size_t log_size)
 {
 	static struct bpf_insn *buf;
 	static size_t buf_size;
-	size_t prog_len = prog_size / sizeof(*prog);
+	const size_t prog_len = prog_size / sizeof(*prog);
 
 	/* all guarded buffers will be free()d automatically by LTP library */
 	if (!buf || prog_size > buf_size) {
@@ -72,12 +105,10 @@ void bpf_init_prog_attr(union bpf_attr *attr, const struct bpf_insn *prog,
 	attr->log_level = 1;
 }
 
-int bpf_load_prog(union bpf_attr *attr, const char *log)
+int bpf_load_prog(union bpf_attr *const attr, const char *const log)
 {
-	int ret;
-
-	ret = TST_RETRY_FUNC(bpf(BPF_PROG_LOAD, attr, sizeof(*attr)),
-		TST_RETVAL_GE0);
+	const int ret = TST_RETRY_FUNC(bpf(BPF_PROG_LOAD, attr, sizeof(*attr)),
+				       TST_RETVAL_GE0);
 
 	if (ret >= 0) {
 		tst_res(TPASS, "Loaded program");
diff --git a/testcases/kernel/syscalls/bpf/bpf_common.h b/testcases/kernel/syscalls/bpf/bpf_common.h
index d36a2b09f..b4d94d90c 100644
--- a/testcases/kernel/syscalls/bpf/bpf_common.h
+++ b/testcases/kernel/syscalls/bpf/bpf_common.h
@@ -6,12 +6,57 @@
 #ifndef LTP_BPF_COMMON_H
 #define LTP_BPF_COMMON_H
 
+#include <sys/types.h>
+#include <inttypes.h>
+
+#include "lapi/bpf.h"
+
 #define BPF_MEMLOCK_ADD (2*1024*1024)
 
+/* map[array_indx] = reg_to_save
+ *
+ * Inserts the following instructions
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
+#define BPF_MAP_ARRAY_STX(map_fd, array_indx, reg_to_save)\
+	BPF_LD_MAP_FD(BPF_REG_1, map_fd),		\
+	BPF_MOV64_REG(BPF_REG_2, BPF_REG_10),		\
+	BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, -4),		\
+	BPF_ST_MEM(BPF_W, BPF_REG_2, 0, array_indx),	\
+	BPF_EMIT_CALL(BPF_FUNC_map_lookup_elem),	\
+	BPF_JMP_IMM(BPF_JNE, BPF_REG_0, 0, 1),		\
+	BPF_EXIT_INSN(),				\
+	BPF_STX_MEM(BPF_DW, BPF_REG_0, reg_to_save, 0)
+
 void rlimit_bump_memlock(void);
-int bpf_map_create(union bpf_attr *attr);
-void bpf_init_prog_attr(union bpf_attr *attr, const struct bpf_insn *prog,
-	size_t prog_size, char *log_buf, size_t log_size);
-int bpf_load_prog(union bpf_attr *attr, const char *log);
+
+int bpf_map_create(union bpf_attr *const attr)
+	__attribute__((nonnull, warn_unused_result));
+int bpf_map_array_create(const uint32_t max_entries)
+	__attribute__((warn_unused_result));
+void bpf_map_array_get(const int map_fd,
+		       const uint32_t *const array_indx,
+		       uint64_t *const array_val)
+	__attribute__((nonnull));
+
+void bpf_init_prog_attr(union bpf_attr *const attr,
+			const struct bpf_insn *const prog,
+			const size_t prog_size,
+			char *const log_buf, const size_t log_size)
+	__attribute__((nonnull));
+int bpf_load_prog(union bpf_attr *const attr, const char *const log)
+	__attribute__((nonnull, warn_unused_result));
+void bpf_run_prog(const int prog_fd,
+		  const char *const msg, const size_t msg_len)
+	__attribute__((nonnull));
 
 #endif
diff --git a/testcases/kernel/syscalls/bpf/bpf_prog01.c b/testcases/kernel/syscalls/bpf/bpf_prog01.c
index 966bf2092..ac57b24b5 100644
--- a/testcases/kernel/syscalls/bpf/bpf_prog01.c
+++ b/testcases/kernel/syscalls/bpf/bpf_prog01.c
@@ -83,14 +83,7 @@ void run(void)
 	uint32_t key = 0;
 	uint64_t val;
 
-	memset(attr, 0, sizeof(*attr));
-	attr->map_type = BPF_MAP_TYPE_ARRAY;
-	attr->key_size = 4;
-	attr->value_size = 8;
-	attr->max_entries = 1;
-
-	map_fd = bpf_map_create(attr);
-
+	map_fd = bpf_map_array_create(1);
 	prog_fd = load_prog(map_fd);
 
 	SAFE_SOCKETPAIR(AF_UNIX, SOCK_DGRAM, 0, sk);
@@ -99,15 +92,12 @@ void run(void)
 
 	SAFE_WRITE(1, sk[0], msg, sizeof(MSG));
 
-	memset(attr, 0, sizeof(*attr));
-	attr->map_fd = map_fd;
-	attr->key = ptr_to_u64(&key);
-	attr->value = ptr_to_u64(&val);
+	SAFE_CLOSE(prog_fd);
+	SAFE_CLOSE(sk[0]);
+	SAFE_CLOSE(sk[1]);
 
-	TEST(bpf(BPF_MAP_LOOKUP_ELEM, attr, sizeof(*attr)));
-	if (TST_RET == -1) {
-		tst_res(TFAIL | TTERRNO, "array map lookup");
-	} else if (val != 1) {
+        bpf_map_array_get(map_fd, &key, &val);
+	if (val != 1) {
 		tst_res(TFAIL,
 			"val = %lu, but should be val = 1",
 			val);
@@ -115,10 +105,7 @@ void run(void)
 	        tst_res(TPASS, "val = 1");
 	}
 
-	SAFE_CLOSE(prog_fd);
 	SAFE_CLOSE(map_fd);
-	SAFE_CLOSE(sk[0]);
-	SAFE_CLOSE(sk[1]);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/bpf/bpf_prog02.c b/testcases/kernel/syscalls/bpf/bpf_prog02.c
index eeba16a54..4558153ea 100644
--- a/testcases/kernel/syscalls/bpf/bpf_prog02.c
+++ b/testcases/kernel/syscalls/bpf/bpf_prog02.c
@@ -81,14 +81,7 @@ static void run(void)
 	int map_fd, prog_fd;
 	int sk[2];
 
-	memset(attr, 0, sizeof(*attr));
-	attr->map_type = BPF_MAP_TYPE_ARRAY;
-	attr->key_size = 4;
-	attr->value_size = 8;
-	attr->max_entries = 2;
-
-	map_fd = bpf_map_create(attr);
-
+	map_fd = bpf_map_array_create(2);
 	prog_fd = load_prog(map_fd);
 
 	SAFE_SOCKETPAIR(AF_UNIX, SOCK_DGRAM, 0, sk);
@@ -97,49 +90,31 @@ static void run(void)
 
 	SAFE_WRITE(1, sk[0], msg, sizeof(MSG));
 
-	memset(attr, 0, sizeof(*attr));
-	attr->map_fd = map_fd;
-	attr->key = ptr_to_u64(key);
-	attr->value = ptr_to_u64(val);
-	*key = 0;
-
-	TEST(bpf(BPF_MAP_LOOKUP_ELEM, attr, sizeof(*attr)));
-	if (TST_RET == -1) {
-		tst_res(TFAIL | TTERRNO, "array map lookup");
-		goto exit;
-	}
+	SAFE_CLOSE(prog_fd);
+	SAFE_CLOSE(sk[0]);
+	SAFE_CLOSE(sk[1]);
 
+        *key = 0;
+	bpf_map_array_get(map_fd, key, val);
 	if (*val != A64INT + 1) {
 		tst_res(TFAIL,
 			"val = %"PRIu64", but should be val = %"PRIu64" + 1",
 			*val, A64INT);
-		goto exit;
+	} else {
+		tst_res(TPASS, "val = %"PRIu64" + 1", A64INT);
 	}
 
-	tst_res(TPASS, "val = %"PRIu64" + 1", A64INT);
-
 	*key = 1;
-
-	TEST(bpf(BPF_MAP_LOOKUP_ELEM, attr, sizeof(*attr)));
-	if (TST_RET == -1) {
-		tst_res(TFAIL | TTERRNO, "array map lookup");
-		goto exit;
-	}
-
+	bpf_map_array_get(map_fd, key, val);
 	if (*val != A64INT - 1) {
 		tst_res(TFAIL,
 			"val = %"PRIu64", but should be val = %"PRIu64" - 1",
 			*val, A64INT);
-		goto exit;
+	} else {
+		tst_res(TPASS, "val = %"PRIu64" - 1", A64INT);
 	}
 
-	tst_res(TPASS, "val = %"PRIu64" - 1", A64INT);
-
-exit:
-	SAFE_CLOSE(prog_fd);
 	SAFE_CLOSE(map_fd);
-	SAFE_CLOSE(sk[0]);
-	SAFE_CLOSE(sk[1]);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/bpf/bpf_prog03.c b/testcases/kernel/syscalls/bpf/bpf_prog03.c
index 5b8a394e8..1195ddc2c 100644
--- a/testcases/kernel/syscalls/bpf/bpf_prog03.c
+++ b/testcases/kernel/syscalls/bpf/bpf_prog03.c
@@ -119,13 +119,7 @@ static void run(void)
 	int map_fd, prog_fd;
 	int sk[2];
 
-	memset(attr, 0, sizeof(*attr));
-	attr->map_type = BPF_MAP_TYPE_ARRAY;
-	attr->key_size = 4;
-	attr->value_size = 8;
-	attr->max_entries = 32;
-
-	map_fd = bpf_map_create(attr);
+	map_fd = bpf_map_array_create(32);
 
 	memset(attr, 0, sizeof(*attr));
 	attr->map_fd = map_fd;
@@ -148,22 +142,13 @@ static void run(void)
 			&prog_fd, sizeof(prog_fd));
 
 	SAFE_WRITE(1, sk[0], msg, sizeof(MSG));
-
-	memset(attr, 0, sizeof(*attr));
-	attr->map_fd = map_fd;
-	attr->key = ptr_to_u64(key);
-	attr->value = ptr_to_u64(val);
-	*key = 0;
-
-	TEST(bpf(BPF_MAP_LOOKUP_ELEM, attr, sizeof(*attr)));
-	if (TST_RET == -1)
-		tst_res(TFAIL | TTERRNO, "array map lookup");
-	else
-		tst_res(TINFO, "Pointer offset was 0x%"PRIx64, *val);
-
 	SAFE_CLOSE(sk[0]);
 	SAFE_CLOSE(sk[1]);
 	SAFE_CLOSE(prog_fd);
+
+	*key = 0;
+	bpf_map_array_get(map_fd, key, val);
+	tst_res(TINFO, "Pointer offset was 0x%"PRIx64, *val);
 exit:
 	SAFE_CLOSE(map_fd);
 }
diff --git a/testcases/kernel/syscalls/bpf/bpf_prog04.c b/testcases/kernel/syscalls/bpf/bpf_prog04.c
index 799fcb52d..1a1ee0f04 100644
--- a/testcases/kernel/syscalls/bpf/bpf_prog04.c
+++ b/testcases/kernel/syscalls/bpf/bpf_prog04.c
@@ -94,13 +94,7 @@ static void run(void)
 	int map_fd, prog_fd;
 	int sk[2];
 
-	memset(attr, 0, sizeof(*attr));
-	attr->map_type = BPF_MAP_TYPE_ARRAY;
-	attr->key_size = 4;
-	attr->value_size = 8;
-	attr->max_entries = 1;
-
-	map_fd = bpf_map_create(attr);
+	map_fd = bpf_map_array_create(1);
 	prog_fd = load_prog(map_fd);
 
 	if (prog_fd >= 0) {
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
