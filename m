Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E69E2A10975
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2025 15:33:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1736865198; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=X1t5fjr67z3bB6zJpKqGlCWUCLMRhlyMKxXZItToYKE=;
 b=kSfuUcvgHQwVMyVMDGadWzCdJsfcna2CENV6AtvyLCPQvXqeaIwxu6T7aisw3YVYQ1q3X
 L7uKkB0tFakqoCAa92aVUl7EayatAPv7uCKAAnE12Gd5ubJVBvJFM2RhqB+MfEONI356ecV
 vS7GHg0i0aUc1wK1P52ksa2ARFymohE=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE1E83C7AE2
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2025 15:33:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 839173C7B15
 for <ltp@lists.linux.it>; Tue, 14 Jan 2025 15:32:42 +0100 (CET)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AC47427BDE2
 for <ltp@lists.linux.it>; Tue, 14 Jan 2025 15:32:41 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso2964823f8f.3
 for <ltp@lists.linux.it>; Tue, 14 Jan 2025 06:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1736865161; x=1737469961; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mFrGMmc/nru1R9UJbAhfdaahlP/akbndbvCKUX7TXJM=;
 b=gfDR32Qh0Hu7EzxWYKAGLRuvMTydtQoHWAauoWZehXl7W9nDblC8OBz/BiKMTBuyJU
 NBERqgWZlY6VoxuVoBgUH4VdvYVQDbEoVJOBjVUOOLmmVOSGkJqHVsiWOfNf5LiL0z1x
 tSNr4unn9IOQG+sXj1ZkL9C6htDG6XKL3Ui3clG+3uMH9PRvupUoaSNDurbd8iT8F4G0
 PBVFkWJ7FaEHDq4b1PwgM8TCynG92JoksiZ27Ol/J30dEmTdN4RaBs1HjQELVkq5NvKw
 uAFhY88TBU3V0GA4iaT2eGrWTk8Jy+3yg8c0W8P1YWCG1pL/+704wCVoz/gNdfcWG7mL
 y19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736865161; x=1737469961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mFrGMmc/nru1R9UJbAhfdaahlP/akbndbvCKUX7TXJM=;
 b=dpZdqu2UZAFQE7iR/ZdE38e/8cm0B+WfPZJYRpgJeMMHipRHbiUPllisNGc8FMLCjd
 doxsWj7xjQbe4Algyc4I0ZyLHQaHrSzb6sppCigwTe7eZJEitKedmPYAVH8oNYgD5tnD
 FNe8+wB3DM/Hm4nCRAiWaULgAHkTqVVYscpcoqyG5TSthvqdOKt73Yr44WjDFFLetW2g
 bXpKpJlOanhjhq9gD0nYvIPe7xOAn9vCZC9EXd7wN6Pt9ptSVFPGztflkM8jtUBC9yGW
 rrr0yhGS/DX6PTIyWPcr8Yo5h9AYdQroEEhzG1Ju7FcwVZkvr7LxzV0Ebr95ZPHChgOM
 U9kw==
X-Gm-Message-State: AOJu0YwU18lB5zdaonQ31DGNd26UxkJhZZhL7vcsF+Iy0s1Qomh9QgOQ
 P+9Q4jqNRo5OiNpnm5DR2WKkmxtCM1S+j4161FnCW4cX8/nEmPXSufRejabGOkq1OX0c3/Nf1Cc
 =
X-Gm-Gg: ASbGnctKIrMbFbaJwzLz5opNqKAy4H7hIZdp4OdlID3XDIRcE5oRdXrvFUpBpuE0FSd
 ze5oBSnQd5C8FPTE/h8SByzccfTrYDYslMKG8W68VlpPU6I0TtOpXuVNmuPLuUdiBsoyZCfKbLb
 Xp/ALK6sF4zuUNs+l0X5i6Jtp0aDcAXXmZrLrxiGvLer/01PTwRkKK79nhklmhJvXPO9Ce6WS86
 em3Gw5C1nRSi14NecObaylt+DbfDGJPyug/NbePFMfe5g==
X-Google-Smtp-Source: AGHT+IFtdW4LAteJFAJA1LVqXFSks8WJnXePvzleN+UKC2gx7EsBOyINaXu3+hjrBXYlLd7/Dd4jxg==
X-Received: by 2002:a05:6000:144d:b0:38a:615b:9ec0 with SMTP id
 ffacd0b85a97d-38a873122edmr23247530f8f.54.1736865160880; 
 Tue, 14 Jan 2025 06:32:40 -0800 (PST)
Received: from localhost ([202.127.77.110]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e37e36asm14688937f8f.5.2025.01.14.06.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 06:32:40 -0800 (PST)
To: ltp@lists.linux.it
Date: Tue, 14 Jan 2025 09:32:17 -0500
Message-Id: <20250114143217.21018-3-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250114143217.21018-1-wegao@suse.com>
References: <20250114124023.4702-1-wegao@suse.com>
 <20250114143217.21018-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v7 2/2] ptrace06: Refactor the test using new LTP API
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Wei Gao <wegao@suse.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/ptrace/ptrace06.c   | 325 ++++++++++--------
 .../kernel/syscalls/ptrace/ptrace06_child.c   |  16 +
 2 files changed, 190 insertions(+), 151 deletions(-)
 create mode 100644 testcases/kernel/syscalls/ptrace/ptrace06_child.c

diff --git a/testcases/kernel/syscalls/ptrace/ptrace06.c b/testcases/kernel/syscalls/ptrace/ptrace06.c
index a1db3bab8..b760ab89d 100644
--- a/testcases/kernel/syscalls/ptrace/ptrace06.c
+++ b/testcases/kernel/syscalls/ptrace/ptrace06.c
@@ -1,199 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * check out-of-bound/unaligned addresses given to
+ * Copyright (c) 2008 Analog Devices Inc.
+ * Copyright (c) Linux Test Project, 2009-2022
+ * Copyright (c) 2023 Wei Gao <wegao@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Check out-of-bound/unaligned addresses given to
+ *
  *  - {PEEK,POKE}{DATA,TEXT,USER}
  *  - {GET,SET}{,FG}REGS
  *  - {GET,SET}SIGINFO
- *
- * Copyright (c) 2008 Analog Devices Inc.
- *
- * Licensed under the GPL-2 or later
  */
 
-#define _GNU_SOURCE
-
-#include <errno.h>
-#include <stdbool.h>
-#include <stdio.h>
 #include <stdlib.h>
-#include <unistd.h>
 #include <sys/ptrace.h>
-
-#include "test.h"
-#include "spawn_ptrace_child.h"
+#include "tst_test.h"
 
 /* this should be sizeof(struct user), but that info is only found
  * in the kernel asm/user.h which is not exported to userspace.
  */
+
 #if defined(__i386__)
-#define SIZEOF_USER 284
+# define SIZEOF_USER 284
 #elif defined(__x86_64__)
-#define SIZEOF_USER 928
+# define SIZEOF_USER 928
 #else
-#define SIZEOF_USER 0x1000	/* just pick a big number */
+# define SIZEOF_USER 0x1000	/* just pick a big number */
 #endif
 
-char *TCID = "ptrace06";
-
-struct test_case_t {
+static struct test_case_t {
 	int request;
 	long addr;
 	long data;
 } test_cases[] = {
-	{
-	PTRACE_PEEKDATA,.addr = 0}, {
-	PTRACE_PEEKDATA,.addr = 1}, {
-	PTRACE_PEEKDATA,.addr = 2}, {
-	PTRACE_PEEKDATA,.addr = 3}, {
-	PTRACE_PEEKDATA,.addr = -1}, {
-	PTRACE_PEEKDATA,.addr = -2}, {
-	PTRACE_PEEKDATA,.addr = -3}, {
-	PTRACE_PEEKDATA,.addr = -4}, {
-	PTRACE_PEEKTEXT,.addr = 0}, {
-	PTRACE_PEEKTEXT,.addr = 1}, {
-	PTRACE_PEEKTEXT,.addr = 2}, {
-	PTRACE_PEEKTEXT,.addr = 3}, {
-	PTRACE_PEEKTEXT,.addr = -1}, {
-	PTRACE_PEEKTEXT,.addr = -2}, {
-	PTRACE_PEEKTEXT,.addr = -3}, {
-	PTRACE_PEEKTEXT,.addr = -4}, {
-	PTRACE_PEEKUSER,.addr = SIZEOF_USER + 1}, {
-	PTRACE_PEEKUSER,.addr = SIZEOF_USER + 2}, {
-	PTRACE_PEEKUSER,.addr = SIZEOF_USER + 3}, {
-	PTRACE_PEEKUSER,.addr = SIZEOF_USER + 4}, {
-	PTRACE_PEEKUSER,.addr = -1}, {
-	PTRACE_PEEKUSER,.addr = -2}, {
-	PTRACE_PEEKUSER,.addr = -3}, {
-	PTRACE_PEEKUSER,.addr = -4}, {
-	PTRACE_POKEDATA,.addr = 0}, {
-	PTRACE_POKEDATA,.addr = 1}, {
-	PTRACE_POKEDATA,.addr = 2}, {
-	PTRACE_POKEDATA,.addr = 3}, {
-	PTRACE_POKEDATA,.addr = -1}, {
-	PTRACE_POKEDATA,.addr = -2}, {
-	PTRACE_POKEDATA,.addr = -3}, {
-	PTRACE_POKEDATA,.addr = -4}, {
-	PTRACE_POKETEXT,.addr = 0}, {
-	PTRACE_POKETEXT,.addr = 1}, {
-	PTRACE_POKETEXT,.addr = 2}, {
-	PTRACE_POKETEXT,.addr = 3}, {
-	PTRACE_POKETEXT,.addr = -1}, {
-	PTRACE_POKETEXT,.addr = -2}, {
-	PTRACE_POKETEXT,.addr = -3}, {
-	PTRACE_POKETEXT,.addr = -4}, {
-	PTRACE_POKEUSER,.addr = SIZEOF_USER + 1}, {
-	PTRACE_POKEUSER,.addr = SIZEOF_USER + 2}, {
-	PTRACE_POKEUSER,.addr = SIZEOF_USER + 3}, {
-	PTRACE_POKEUSER,.addr = SIZEOF_USER + 4}, {
-	PTRACE_POKEUSER,.addr = -1}, {
-	PTRACE_POKEUSER,.addr = -2}, {
-	PTRACE_POKEUSER,.addr = -3}, {
-	PTRACE_POKEUSER,.addr = -4},
+	{PTRACE_PEEKDATA, .addr = 0},
+	{PTRACE_PEEKDATA, .addr = 1},
+	{PTRACE_PEEKDATA, .addr = 2},
+	{PTRACE_PEEKDATA, .addr = 3},
+	{PTRACE_PEEKDATA, .addr = -1},
+	{PTRACE_PEEKDATA, .addr = -2},
+	{PTRACE_PEEKDATA, .addr = -3},
+	{PTRACE_PEEKDATA, .addr = -4},
+	{PTRACE_PEEKTEXT, .addr = 0},
+	{PTRACE_PEEKTEXT, .addr = 1},
+	{PTRACE_PEEKTEXT, .addr = 2},
+	{PTRACE_PEEKTEXT, .addr = 3},
+	{PTRACE_PEEKTEXT, .addr = -1},
+	{PTRACE_PEEKTEXT, .addr = -2},
+	{PTRACE_PEEKTEXT, .addr = -3},
+	{PTRACE_PEEKTEXT, .addr = -4},
+	{PTRACE_PEEKUSER, .addr = SIZEOF_USER + 1},
+	{PTRACE_PEEKUSER, .addr = SIZEOF_USER + 2},
+	{PTRACE_PEEKUSER, .addr = SIZEOF_USER + 3},
+	{PTRACE_PEEKUSER, .addr = SIZEOF_USER + 4},
+	{PTRACE_PEEKUSER, .addr = -1},
+	{PTRACE_PEEKUSER, .addr = -2},
+	{PTRACE_PEEKUSER, .addr = -3},
+	{PTRACE_PEEKUSER, .addr = -4},
+	{PTRACE_POKEDATA, .addr = 0},
+	{PTRACE_POKEDATA, .addr = 1},
+	{PTRACE_POKEDATA, .addr = 2},
+	{PTRACE_POKEDATA, .addr = 3},
+	{PTRACE_POKEDATA, .addr = -1},
+	{PTRACE_POKEDATA, .addr = -2},
+	{PTRACE_POKEDATA, .addr = -3},
+	{PTRACE_POKEDATA, .addr = -4},
+	{PTRACE_POKETEXT, .addr = 0},
+	{PTRACE_POKETEXT, .addr = 1},
+	{PTRACE_POKETEXT, .addr = 2},
+	{PTRACE_POKETEXT, .addr = 3},
+	{PTRACE_POKETEXT, .addr = -1},
+	{PTRACE_POKETEXT, .addr = -2},
+	{PTRACE_POKETEXT, .addr = -3},
+	{PTRACE_POKETEXT, .addr = -4},
+	{PTRACE_POKEUSER, .addr = SIZEOF_USER + 1},
+	{PTRACE_POKEUSER, .addr = SIZEOF_USER + 2},
+	{PTRACE_POKEUSER, .addr = SIZEOF_USER + 3},
+	{PTRACE_POKEUSER, .addr = SIZEOF_USER + 4},
+	{PTRACE_POKEUSER, .addr = -1},
+	{PTRACE_POKEUSER, .addr = -2},
+	{PTRACE_POKEUSER, .addr = -3},
+	{PTRACE_POKEUSER, .addr = -4},
 #ifdef PTRACE_GETREGS
-	{
-	PTRACE_GETREGS,.data = 0}, {
-	PTRACE_GETREGS,.data = 1}, {
-	PTRACE_GETREGS,.data = 2}, {
-	PTRACE_GETREGS,.data = 3}, {
-	PTRACE_GETREGS,.data = -1}, {
-	PTRACE_GETREGS,.data = -2}, {
-	PTRACE_GETREGS,.data = -3}, {
-	PTRACE_GETREGS,.data = -4},
+	{PTRACE_GETREGS, .data = 0},
+	{PTRACE_GETREGS, .data = 1},
+	{PTRACE_GETREGS, .data = 2},
+	{PTRACE_GETREGS, .data = 3},
+	{PTRACE_GETREGS, .data = -1},
+	{PTRACE_GETREGS, .data = -2},
+	{PTRACE_GETREGS, .data = -3},
+	{PTRACE_GETREGS, .data = -4},
 #endif
 #ifdef PTRACE_GETFGREGS
-	{
-	PTRACE_GETFGREGS,.data = 0}, {
-	PTRACE_GETFGREGS,.data = 1}, {
-	PTRACE_GETFGREGS,.data = 2}, {
-	PTRACE_GETFGREGS,.data = 3}, {
-	PTRACE_GETFGREGS,.data = -1}, {
-	PTRACE_GETFGREGS,.data = -2}, {
-	PTRACE_GETFGREGS,.data = -3}, {
-	PTRACE_GETFGREGS,.data = -4},
+	{PTRACE_GETFGREGS, .data = 0},
+	{PTRACE_GETFGREGS, .data = 1},
+	{PTRACE_GETFGREGS, .data = 2},
+	{PTRACE_GETFGREGS, .data = 3},
+	{PTRACE_GETFGREGS, .data = -1},
+	{PTRACE_GETFGREGS, .data = -2},
+	{PTRACE_GETFGREGS, .data = -3},
+	{PTRACE_GETFGREGS, .data = -4},
 #endif
 #ifdef PTRACE_SETREGS
-	{
-	PTRACE_SETREGS,.data = 0}, {
-	PTRACE_SETREGS,.data = 1}, {
-	PTRACE_SETREGS,.data = 2}, {
-	PTRACE_SETREGS,.data = 3}, {
-	PTRACE_SETREGS,.data = -1}, {
-	PTRACE_SETREGS,.data = -2}, {
-	PTRACE_SETREGS,.data = -3}, {
-	PTRACE_SETREGS,.data = -4},
+	{PTRACE_SETREGS, .data = 0},
+	{PTRACE_SETREGS, .data = 1},
+	{PTRACE_SETREGS, .data = 2},
+	{PTRACE_SETREGS, .data = 3},
+	{PTRACE_SETREGS, .data = -1},
+	{PTRACE_SETREGS, .data = -2},
+	{PTRACE_SETREGS, .data = -3},
+	{PTRACE_SETREGS, .data = -4},
 #endif
 #ifdef PTRACE_SETFGREGS
-	{
-	PTRACE_SETFGREGS,.data = 0}, {
-	PTRACE_SETFGREGS,.data = 1}, {
-	PTRACE_SETFGREGS,.data = 2}, {
-	PTRACE_SETFGREGS,.data = 3}, {
-	PTRACE_SETFGREGS,.data = -1}, {
-	PTRACE_SETFGREGS,.data = -2}, {
-	PTRACE_SETFGREGS,.data = -3}, {
-	PTRACE_SETFGREGS,.data = -4},
+	{PTRACE_SETFGREGS, .data = 0},
+	{PTRACE_SETFGREGS, .data = 1},
+	{PTRACE_SETFGREGS, .data = 2},
+	{PTRACE_SETFGREGS, .data = 3},
+	{PTRACE_SETFGREGS, .data = -1},
+	{PTRACE_SETFGREGS, .data = -2},
+	{PTRACE_SETFGREGS, .data = -3},
+	{PTRACE_SETFGREGS, .data = -4},
 #endif
 #if HAVE_DECL_PTRACE_GETSIGINFO
-	{
-	PTRACE_GETSIGINFO,.data = 0}, {
-	PTRACE_GETSIGINFO,.data = 1}, {
-	PTRACE_GETSIGINFO,.data = 2}, {
-	PTRACE_GETSIGINFO,.data = 3}, {
-	PTRACE_GETSIGINFO,.data = -1}, {
-	PTRACE_GETSIGINFO,.data = -2}, {
-	PTRACE_GETSIGINFO,.data = -3}, {
-	PTRACE_GETSIGINFO,.data = -4},
+	{PTRACE_GETSIGINFO, .data = 0},
+	{PTRACE_GETSIGINFO, .data = 1},
+	{PTRACE_GETSIGINFO, .data = 2},
+	{PTRACE_GETSIGINFO, .data = 3},
+	{PTRACE_GETSIGINFO, .data = -1},
+	{PTRACE_GETSIGINFO, .data = -2},
+	{PTRACE_GETSIGINFO, .data = -3},
+	{PTRACE_GETSIGINFO, .data = -4},
 #endif
 #if HAVE_DECL_PTRACE_SETSIGINFO
-	{
-	PTRACE_SETSIGINFO,.data = 0}, {
-	PTRACE_SETSIGINFO,.data = 1}, {
-	PTRACE_SETSIGINFO,.data = 2}, {
-	PTRACE_SETSIGINFO,.data = 3}, {
-	PTRACE_SETSIGINFO,.data = -1}, {
-	PTRACE_SETSIGINFO,.data = -2}, {
-	PTRACE_SETSIGINFO,.data = -3}, {
-	PTRACE_SETSIGINFO,.data = -4},
+	{PTRACE_SETSIGINFO, .data = 0},
+	{PTRACE_SETSIGINFO, .data = 1},
+	{PTRACE_SETSIGINFO, .data = 2},
+	{PTRACE_SETSIGINFO, .data = 3},
+	{PTRACE_SETSIGINFO, .data = -1},
+	{PTRACE_SETSIGINFO, .data = -2},
+	{PTRACE_SETSIGINFO, .data = -3},
+	{PTRACE_SETSIGINFO, .data = -4},
+#endif
+};
+
+#define SPT(x)[PTRACE_##x] = #x,
+static char *strings[] = {
+	SPT(TRACEME)
+	SPT(PEEKTEXT)
+	SPT(PEEKDATA)
+	SPT(PEEKUSER)
+	SPT(POKETEXT)
+	SPT(POKEDATA)
+	SPT(POKEUSER)
+#ifdef PTRACE_GETREGS
+	SPT(GETREGS)
+#endif
+#ifdef PTRACE_SETREGS
+	SPT(SETREGS)
+#endif
+#ifdef PTRACE_GETSIGINFO
+	SPT(GETSIGINFO)
 #endif
+#ifdef PTRACE_SETSIGINFO
+	SPT(SETSIGINFO)
+#endif
+#ifdef PTRACE_GETFGREGS
+	SPT(GETFGREGS)
+#endif
+#ifdef PTRACE_SETFGREGS
+	SPT(SETFGREGS)
+#endif
+	SPT(KILL)
+	SPT(SINGLESTEP)
 };
 
-int TST_TOTAL = ARRAY_SIZE(test_cases);
+static void child(void)
+{
+	SAFE_PTRACE(PTRACE_TRACEME, 0, NULL, NULL);
+	raise(SIGSTOP);
+	exit(0);
+}
 
-int main(int argc, char *argv[])
+static void run(void)
 {
 	size_t i;
-	long ret;
-	int saved_errno;
+	int pid;
+	int status;
+	int exp_errnos[] = {EIO, EFAULT};
+
+	pid = SAFE_FORK();
 
-	tst_parse_opts(argc, argv, NULL, NULL);
+	if (!pid)
+		child();
 
-	make_a_baby(argc, argv);
+	SAFE_WAIT(&status);
+
+	if (!WIFSTOPPED(status))
+		tst_brk(TBROK, "child %d was not stopped", pid);
 
 	for (i = 0; i < ARRAY_SIZE(test_cases); ++i) {
 		struct test_case_t *tc = &test_cases[i];
 
-		errno = 0;
-		ret =
-		    ptrace(tc->request, pid, (void *)tc->addr,
-			   (void *)tc->data);
-		saved_errno = errno;
-		if (ret != -1)
-			tst_resm(TFAIL,
-				 "ptrace(%s, ..., %li, %li) returned %li instead of -1",
-				 strptrace(tc->request), tc->addr, tc->data,
-				 ret);
-		else if (saved_errno != EIO && saved_errno != EFAULT)
-			tst_resm(TFAIL,
-				 "ptrace(%s, ..., %li, %li) expected errno EIO or EFAULT; actual: %i (%s)",
-				 strptrace(tc->request), tc->addr, tc->data,
-				 saved_errno, strerror(saved_errno));
-		else
-			tst_resm(TPASS,
-				 "ptrace(%s, ..., %li, %li) failed as expected",
-				 strptrace(tc->request), tc->addr, tc->data);
+		TEST(ptrace(tc->request, pid, (void *)tc->addr,
+					(void *)tc->data));
+		TST_EXP_FAIL_ARR(ptrace(tc->request, pid, (void *)tc->addr,
+					(void *)tc->data), exp_errnos, ARRAY_SIZE(exp_errnos),
+					"ptrace(%s, ..., %li, %li) failed as expected",
+					 strings[tc->request], tc->addr, tc->data);
 	}
 
-	/* hopefully this worked */
-	ptrace(PTRACE_KILL, pid, NULL, NULL);
+	SAFE_PTRACE(PTRACE_CONT, pid, NULL, NULL);
 
-	tst_exit();
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.forks_child = 1,
+};
diff --git a/testcases/kernel/syscalls/ptrace/ptrace06_child.c b/testcases/kernel/syscalls/ptrace/ptrace06_child.c
new file mode 100644
index 000000000..350b0e8df
--- /dev/null
+++ b/testcases/kernel/syscalls/ptrace/ptrace06_child.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2018 Linux Test Project
+ * Copyright (C) 2015 Cyril Hrubis chrubis@suse.cz
+ */
+
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+
+int main(int argc, char *argv[])
+{
+
+	tst_res(TPASS, "%s executed", argv[0]);
+
+	return 0;
+}
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
