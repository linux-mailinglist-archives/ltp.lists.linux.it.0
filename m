Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5BB1F63AE
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 10:34:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B0F23C2E0C
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 10:34:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 6CF093C14A2
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 10:34:27 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 73855100023E
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 10:34:26 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id 64so2362724pfv.11
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 01:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jz0CqmmMBnJhmmIxihg7YAwcxLCb3crQ94Xext+mVvQ=;
 b=xFn/JcxozBsiVxbIXFjro8/2FhiqT9eyUcsAtoLETYkFiyA72H7C6cRcmeEshwRnhU
 7iB+5PW5oylpJgSG1vapr3AvUPii46YgxeJCr83GwA5iHTnpO2YjP2o8ZABBUCBgboje
 LEWRbq5gGX1t/A/v72k4AyPrCnZTKhwJJUTnKd5FFc/UewOJTLNQiT9zwaMGTDgUyQ9I
 3iPiFI+XBBpfk5wT+HqM3pH57Xf47H06y3YL3O6veLUaRPJYOkMHJK+I/vDt98nnnarD
 CmQfYd2JYcpov+UsVkprVdU6G/ivO73zJoQ/RecpPrg1EpWD6+1YyjSdpueNK4ZIIDEl
 FqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jz0CqmmMBnJhmmIxihg7YAwcxLCb3crQ94Xext+mVvQ=;
 b=MCj0WcQUnzhXuepc6gslcycj92GCY0aTD84UNiLb43ioKI6G8IqSXcGWso1Obcc5Rr
 wZbltE3CdCd8qJtt+FB3GPsH/O9gur95YFO9nEWJNshY9+0dVTerCiA1AR5RAXCk76BB
 xxfQi2RKaWVFMArdi5afIDNJaIXdPluihEo+KPikUB3K3JDJkI56Gc95JtoClhsi9oJT
 /mw0BVk0xM+usnVKJaM8QV2WqaJtj6NXckwGGPI5Wd3EICIdf28kMVHJydGl87pF1SDq
 fNpNmUDZBQK2fOIowlg28MJRTloclVGtY8Ss6g29f0MvDrCujbxsUquCIKruRYkXMeE1
 kEig==
X-Gm-Message-State: AOAM532oSC+hxe90YuCWgOsAJ2kS2DE8tnoyOlQnAEjTGXQjSJjX3S5K
 Pyxur/moHEwW3kVwYZBCX3byDlwaQk0=
X-Google-Smtp-Source: ABdhPJxZs31t3Td+pRzEczky3fHz5BLqxFE8+CIlh1s9LSu8xhgO6hB1CAU6wEr9UROmyfVYFC0RWQ==
X-Received: by 2002:a62:c105:: with SMTP id i5mr6371766pfg.250.1591864464265; 
 Thu, 11 Jun 2020 01:34:24 -0700 (PDT)
Received: from localhost ([122.172.62.209])
 by smtp.gmail.com with ESMTPSA id c12sm2087690pgt.91.2020.06.11.01.34.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jun 2020 01:34:23 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 11 Jun 2020 14:04:19 +0530
Message-Id: <0f1cc05d6d79238ed94b93417f300e9a026a2063.1591864369.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V2 1/2] libs: Import vdso parsing lib from kernel tree
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This imports the vdso symbol parsing library from the kernel tree.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2: New patch.

 include/parse_vdso.h         |  16 +++
 libs/libltpvdso/Makefile     |  11 ++
 libs/libltpvdso/README       |   1 +
 libs/libltpvdso/parse_vdso.c | 269 +++++++++++++++++++++++++++++++++++
 4 files changed, 297 insertions(+)
 create mode 100644 include/parse_vdso.h
 create mode 100644 libs/libltpvdso/Makefile
 create mode 100644 libs/libltpvdso/README
 create mode 100644 libs/libltpvdso/parse_vdso.c

diff --git a/include/parse_vdso.h b/include/parse_vdso.h
new file mode 100644
index 000000000000..d81bb30bb196
--- /dev/null
+++ b/include/parse_vdso.h
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef PARSE_VDSO_H__
+#define PARSE_VDSO_H__
+
+#include <stdint.h>
+
+extern void vdso_init_from_auxv(void *auxv);
+extern void vdso_init_from_sysinfo_ehdr(uintptr_t base);
+extern void *vdso_sym(const char *version, const char *name);
+
+#endif /* PARSE_VDSO_H__ */
diff --git a/libs/libltpvdso/Makefile b/libs/libltpvdso/Makefile
new file mode 100644
index 000000000000..cf308feaee16
--- /dev/null
+++ b/libs/libltpvdso/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) International Business Machines  Corp., 2001
+
+top_srcdir		?= ../..
+
+include $(top_srcdir)/include/mk/env_pre.mk
+
+LIB			:= libltpvdso.a
+
+include $(top_srcdir)/include/mk/lib.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/libs/libltpvdso/README b/libs/libltpvdso/README
new file mode 100644
index 000000000000..e208f7ef395e
--- /dev/null
+++ b/libs/libltpvdso/README
@@ -0,0 +1 @@
+Copied from kernel tree: tools/testing/selftests/vDSO/parse_vdso.c
diff --git a/libs/libltpvdso/parse_vdso.c b/libs/libltpvdso/parse_vdso.c
new file mode 100644
index 000000000000..1dbb4b87268f
--- /dev/null
+++ b/libs/libltpvdso/parse_vdso.c
@@ -0,0 +1,269 @@
+/*
+ * parse_vdso.c: Linux reference vDSO parser
+ * Written by Andrew Lutomirski, 2011-2014.
+ *
+ * This code is meant to be linked in to various programs that run on Linux.
+ * As such, it is available with as few restrictions as possible.  This file
+ * is licensed under the Creative Commons Zero License, version 1.0,
+ * available at http://creativecommons.org/publicdomain/zero/1.0/legalcode
+ *
+ * The vDSO is a regular ELF DSO that the kernel maps into user space when
+ * it starts a program.  It works equally well in statically and dynamically
+ * linked binaries.
+ *
+ * This code is tested on x86.  In principle it should work on any
+ * architecture that has a vDSO.
+ */
+
+#include <stdbool.h>
+#include <stdint.h>
+#include <string.h>
+#include <limits.h>
+#include <elf.h>
+
+/*
+ * To use this vDSO parser, first call one of the vdso_init_* functions.
+ * If you've already parsed auxv, then pass the value of AT_SYSINFO_EHDR
+ * to vdso_init_from_sysinfo_ehdr.  Otherwise pass auxv to vdso_init_from_auxv.
+ * Then call vdso_sym for each symbol you want.  For example, to look up
+ * gettimeofday on x86_64, use:
+ *
+ *     <some pointer> = vdso_sym("LINUX_2.6", "gettimeofday");
+ * or
+ *     <some pointer> = vdso_sym("LINUX_2.6", "__vdso_gettimeofday");
+ *
+ * vdso_sym will return 0 if the symbol doesn't exist or if the init function
+ * failed or was not called.  vdso_sym is a little slow, so its return value
+ * should be cached.
+ *
+ * vdso_sym is threadsafe; the init functions are not.
+ *
+ * These are the prototypes:
+ */
+extern void vdso_init_from_auxv(void *auxv);
+extern void vdso_init_from_sysinfo_ehdr(uintptr_t base);
+extern void *vdso_sym(const char *version, const char *name);
+
+
+/* And here's the code. */
+#ifndef ELF_BITS
+# if ULONG_MAX > 0xffffffffUL
+#  define ELF_BITS 64
+# else
+#  define ELF_BITS 32
+# endif
+#endif
+
+#define ELF_BITS_XFORM2(bits, x) Elf##bits##_##x
+#define ELF_BITS_XFORM(bits, x) ELF_BITS_XFORM2(bits, x)
+#define ELF(x) ELF_BITS_XFORM(ELF_BITS, x)
+
+static struct vdso_info
+{
+	bool valid;
+
+	/* Load information */
+	uintptr_t load_addr;
+	uintptr_t load_offset;  /* load_addr - recorded vaddr */
+
+	/* Symbol table */
+	ELF(Sym) *symtab;
+	const char *symstrings;
+	ELF(Word) *bucket, *chain;
+	ELF(Word) nbucket, nchain;
+
+	/* Version table */
+	ELF(Versym) *versym;
+	ELF(Verdef) *verdef;
+} vdso_info;
+
+/* Straight from the ELF specification. */
+static unsigned long elf_hash(const unsigned char *name)
+{
+	unsigned long h = 0, g;
+	while (*name)
+	{
+		h = (h << 4) + *name++;
+		if (g = h & 0xf0000000)
+			h ^= g >> 24;
+		h &= ~g;
+	}
+	return h;
+}
+
+void vdso_init_from_sysinfo_ehdr(uintptr_t base)
+{
+	size_t i;
+	bool found_vaddr = false;
+
+	vdso_info.valid = false;
+
+	vdso_info.load_addr = base;
+
+	ELF(Ehdr) *hdr = (ELF(Ehdr)*)base;
+	if (hdr->e_ident[EI_CLASS] !=
+	    (ELF_BITS == 32 ? ELFCLASS32 : ELFCLASS64)) {
+		return;  /* Wrong ELF class -- check ELF_BITS */
+	}
+
+	ELF(Phdr) *pt = (ELF(Phdr)*)(vdso_info.load_addr + hdr->e_phoff);
+	ELF(Dyn) *dyn = 0;
+
+	/*
+	 * We need two things from the segment table: the load offset
+	 * and the dynamic table.
+	 */
+	for (i = 0; i < hdr->e_phnum; i++)
+	{
+		if (pt[i].p_type == PT_LOAD && !found_vaddr) {
+			found_vaddr = true;
+			vdso_info.load_offset =	base
+				+ (uintptr_t)pt[i].p_offset
+				- (uintptr_t)pt[i].p_vaddr;
+		} else if (pt[i].p_type == PT_DYNAMIC) {
+			dyn = (ELF(Dyn)*)(base + pt[i].p_offset);
+		}
+	}
+
+	if (!found_vaddr || !dyn)
+		return;  /* Failed */
+
+	/*
+	 * Fish out the useful bits of the dynamic table.
+	 */
+	ELF(Word) *hash = 0;
+	vdso_info.symstrings = 0;
+	vdso_info.symtab = 0;
+	vdso_info.versym = 0;
+	vdso_info.verdef = 0;
+	for (i = 0; dyn[i].d_tag != DT_NULL; i++) {
+		switch (dyn[i].d_tag) {
+		case DT_STRTAB:
+			vdso_info.symstrings = (const char *)
+				((uintptr_t)dyn[i].d_un.d_ptr
+				 + vdso_info.load_offset);
+			break;
+		case DT_SYMTAB:
+			vdso_info.symtab = (ELF(Sym) *)
+				((uintptr_t)dyn[i].d_un.d_ptr
+				 + vdso_info.load_offset);
+			break;
+		case DT_HASH:
+			hash = (ELF(Word) *)
+				((uintptr_t)dyn[i].d_un.d_ptr
+				 + vdso_info.load_offset);
+			break;
+		case DT_VERSYM:
+			vdso_info.versym = (ELF(Versym) *)
+				((uintptr_t)dyn[i].d_un.d_ptr
+				 + vdso_info.load_offset);
+			break;
+		case DT_VERDEF:
+			vdso_info.verdef = (ELF(Verdef) *)
+				((uintptr_t)dyn[i].d_un.d_ptr
+				 + vdso_info.load_offset);
+			break;
+		}
+	}
+	if (!vdso_info.symstrings || !vdso_info.symtab || !hash)
+		return;  /* Failed */
+
+	if (!vdso_info.verdef)
+		vdso_info.versym = 0;
+
+	/* Parse the hash table header. */
+	vdso_info.nbucket = hash[0];
+	vdso_info.nchain = hash[1];
+	vdso_info.bucket = &hash[2];
+	vdso_info.chain = &hash[vdso_info.nbucket + 2];
+
+	/* That's all we need. */
+	vdso_info.valid = true;
+}
+
+static bool vdso_match_version(ELF(Versym) ver,
+			       const char *name, ELF(Word) hash)
+{
+	/*
+	 * This is a helper function to check if the version indexed by
+	 * ver matches name (which hashes to hash).
+	 *
+	 * The version definition table is a mess, and I don't know how
+	 * to do this in better than linear time without allocating memory
+	 * to build an index.  I also don't know why the table has
+	 * variable size entries in the first place.
+	 *
+	 * For added fun, I can't find a comprehensible specification of how
+	 * to parse all the weird flags in the table.
+	 *
+	 * So I just parse the whole table every time.
+	 */
+
+	/* First step: find the version definition */
+	ver &= 0x7fff;  /* Apparently bit 15 means "hidden" */
+	ELF(Verdef) *def = vdso_info.verdef;
+	while(true) {
+		if ((def->vd_flags & VER_FLG_BASE) == 0
+		    && (def->vd_ndx & 0x7fff) == ver)
+			break;
+
+		if (def->vd_next == 0)
+			return false;  /* No definition. */
+
+		def = (ELF(Verdef) *)((char *)def + def->vd_next);
+	}
+
+	/* Now figure out whether it matches. */
+	ELF(Verdaux) *aux = (ELF(Verdaux)*)((char *)def + def->vd_aux);
+	return def->vd_hash == hash
+		&& !strcmp(name, vdso_info.symstrings + aux->vda_name);
+}
+
+void *vdso_sym(const char *version, const char *name)
+{
+	unsigned long ver_hash;
+	if (!vdso_info.valid)
+		return 0;
+
+	ver_hash = elf_hash(version);
+	ELF(Word) chain = vdso_info.bucket[elf_hash(name) % vdso_info.nbucket];
+
+	for (; chain != STN_UNDEF; chain = vdso_info.chain[chain]) {
+		ELF(Sym) *sym = &vdso_info.symtab[chain];
+
+		/* Check for a defined global or weak function w/ right name. */
+		if (ELF64_ST_TYPE(sym->st_info) != STT_FUNC)
+			continue;
+		if (ELF64_ST_BIND(sym->st_info) != STB_GLOBAL &&
+		    ELF64_ST_BIND(sym->st_info) != STB_WEAK)
+			continue;
+		if (sym->st_shndx == SHN_UNDEF)
+			continue;
+		if (strcmp(name, vdso_info.symstrings + sym->st_name))
+			continue;
+
+		/* Check symbol version. */
+		if (vdso_info.versym
+		    && !vdso_match_version(vdso_info.versym[chain],
+					   version, ver_hash))
+			continue;
+
+		return (void *)(vdso_info.load_offset + sym->st_value);
+	}
+
+	return 0;
+}
+
+void vdso_init_from_auxv(void *auxv)
+{
+	ELF(auxv_t) *elf_auxv = auxv;
+	for (int i = 0; elf_auxv[i].a_type != AT_NULL; i++)
+	{
+		if (elf_auxv[i].a_type == AT_SYSINFO_EHDR) {
+			vdso_init_from_sysinfo_ehdr(elf_auxv[i].a_un.a_val);
+			return;
+		}
+	}
+
+	vdso_info.valid = false;
+}
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
