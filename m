Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BA3912012
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2024 11:06:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EEACC3D0F88
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2024 11:05:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CD9653CB74E
 for <ltp@lists.linux.it>; Thu, 20 Jun 2024 18:25:13 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=lists.linux.it)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 906BB201174
 for <ltp@lists.linux.it>; Thu, 20 Jun 2024 18:25:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 29220CE2429;
 Thu, 20 Jun 2024 16:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3633C32786;
 Thu, 20 Jun 2024 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718900705;
 bh=cPi0ZjnBV1CIKlXBkpBvG5fVNflJ/ABQ595U6A2fdNY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L4I6Oy4U9Tj4R13eiK7pqNG2CXsWUIjkycJBnYKwfQOrvpBUldFWwHt5fforf8qGO
 W7ImwPMXiKO8CaPCzUM0SFq2R8ogOIYhE4DzW2jwybln/I37fOpfNvMxVAVrrdaDoS
 WUi8sCz8As8NoYFsujUNcySYE3BhqLiI+fdifQAzyfs9GESJFzoOrwAaRenVvMUVkG
 XnNmh77sKBmccGcKyq697GncV2zjKoPPWOKYtfbRLPaDFIGaZyswOD5mh9kmoEczBR
 MmqXf5vABoIwXanfGd9nvrIo6xDYMJfqhkmt6FUeNA/P7TOQqjAij0rew7x9s74LHq
 xobiBExDOIVlg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Thu, 20 Jun 2024 18:23:14 +0200
Message-Id: <20240620162316.3674955-14-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240620162316.3674955-1-arnd@kernel.org>
References: <20240620162316.3674955-1-arnd@kernel.org>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Fri, 21 Jun 2024 11:00:08 +0200
Subject: [LTP] [PATCH 13/15] syscalls: mmap(): use unsigned offset type
 consistently
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>,
 Guo Ren <guoren@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-s390@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 linux-sh@vger.kernel.org, linux-csky@vger.kernel.org,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 musl@lists.openwall.com, Nicholas Piggin <npiggin@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, ltp@lists.linux.it,
 Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, libc-alpha@sourceware.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Arnd Bergmann <arnd@arndb.de>

Most architectures that implement the old-style mmap() with byte offset
use 'unsigned long' as the type for that offset, but microblaze and
riscv have the off_t type that is shared with userspace, matching the
prototype in include/asm-generic/syscalls.h.

Make this consistent by using an unsigned argument everywhere. This
changes the behavior slightly, as the argument is shifted to a page
number, and an user input with the top bit set would result in a
negative page offset rather than a large one as we use elsewhere.

For riscv, the 32-bit sys_mmap2() definition actually used a custom
type that is different from the global declaration, but this was
missed due to an incorrect type check.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/csky/kernel/syscall.c              | 2 +-
 arch/loongarch/kernel/syscall.c         | 2 +-
 arch/microblaze/kernel/sys_microblaze.c | 2 +-
 arch/riscv/kernel/sys_riscv.c           | 4 ++--
 include/asm-generic/syscalls.h          | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/csky/kernel/syscall.c b/arch/csky/kernel/syscall.c
index 3d30e58a45d2..4540a271ee39 100644
--- a/arch/csky/kernel/syscall.c
+++ b/arch/csky/kernel/syscall.c
@@ -20,7 +20,7 @@ SYSCALL_DEFINE6(mmap2,
 	unsigned long, prot,
 	unsigned long, flags,
 	unsigned long, fd,
-	off_t, offset)
+	unsigned long, offset)
 {
 	if (unlikely(offset & (~PAGE_MASK >> 12)))
 		return -EINVAL;
diff --git a/arch/loongarch/kernel/syscall.c b/arch/loongarch/kernel/syscall.c
index b4c5acd7aa3b..8801611143ab 100644
--- a/arch/loongarch/kernel/syscall.c
+++ b/arch/loongarch/kernel/syscall.c
@@ -22,7 +22,7 @@
 #define __SYSCALL(nr, call)	[nr] = (call),
 
 SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len, unsigned long,
-		prot, unsigned long, flags, unsigned long, fd, off_t, offset)
+		prot, unsigned long, flags, unsigned long, fd, unsigned long, offset)
 {
 	if (offset & ~PAGE_MASK)
 		return -EINVAL;
diff --git a/arch/microblaze/kernel/sys_microblaze.c b/arch/microblaze/kernel/sys_microblaze.c
index ed9f34da1a2a..0850b099f300 100644
--- a/arch/microblaze/kernel/sys_microblaze.c
+++ b/arch/microblaze/kernel/sys_microblaze.c
@@ -35,7 +35,7 @@
 
 SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len,
 		unsigned long, prot, unsigned long, flags, unsigned long, fd,
-		off_t, pgoff)
+		unsigned long, pgoff)
 {
 	if (pgoff & ~PAGE_MASK)
 		return -EINVAL;
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 64155323cc92..d77afe05578f 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -23,7 +23,7 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 #ifdef CONFIG_64BIT
 SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len,
 	unsigned long, prot, unsigned long, flags,
-	unsigned long, fd, off_t, offset)
+	unsigned long, fd, unsigned long, offset)
 {
 	return riscv_sys_mmap(addr, len, prot, flags, fd, offset, 0);
 }
@@ -32,7 +32,7 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len,
 #if defined(CONFIG_32BIT) || defined(CONFIG_COMPAT)
 SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len,
 	unsigned long, prot, unsigned long, flags,
-	unsigned long, fd, off_t, offset)
+	unsigned long, fd, unsigned long, offset)
 {
 	/*
 	 * Note that the shift for mmap2 is constant (12),
diff --git a/include/asm-generic/syscalls.h b/include/asm-generic/syscalls.h
index 933ca6581aba..fabcefe8a80a 100644
--- a/include/asm-generic/syscalls.h
+++ b/include/asm-generic/syscalls.h
@@ -19,7 +19,7 @@ asmlinkage long sys_mmap2(unsigned long addr, unsigned long len,
 #ifndef sys_mmap
 asmlinkage long sys_mmap(unsigned long addr, unsigned long len,
 			unsigned long prot, unsigned long flags,
-			unsigned long fd, off_t pgoff);
+			unsigned long fd, unsigned long off);
 #endif
 
 #ifndef sys_rt_sigreturn
-- 
2.39.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
