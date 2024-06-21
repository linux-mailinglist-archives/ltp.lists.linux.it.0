Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 169A8911FE5
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2024 11:01:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 546603CFE8B
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2024 11:01:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A77723CB74E
 for <ltp@lists.linux.it>; Thu, 20 Jun 2024 18:23:45 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org;
 receiver=lists.linux.it)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 127641A01940
 for <ltp@lists.linux.it>; Thu, 20 Jun 2024 18:23:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BBACF62097;
 Thu, 20 Jun 2024 16:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2418C4AF09;
 Thu, 20 Jun 2024 16:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718900622;
 bh=CGFeZxnM99WO8CUQsmcPRyeSqTluGP6wK4tt26wo7MA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qFPMZFuIa5R0Glf5ENc2BYFqZfPhYo8QIZnyrdimQlTBKvaHbuCtPvrIfomllEd9/
 JpLNq2SDbtHqlJyuLH0dQP8moKiF8uhmumJYs9o2sBsCPGtMQKxsjkvFceJbD2sCe5
 iqYfcls+BOXFi8S8pRjY7giMA82l1MsB4/7AAhWDtByCl8OAAtDGML8o/+To3bUkRa
 PuTTC4pDoNbmyoCTObOuXs8R+JSz0u0eYIhSXe0Dmh5XnqLbr+7IhR9P908xkYXNwP
 ZamhH6pESgfZ6DKzg3bZRZInz7WGQ0gGLigYJa47XVNNvrSHskhf5n0cIAxbD+morq
 YgXJDRrkqY+ZA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Thu, 20 Jun 2024 18:23:02 +0200
Message-Id: <20240620162316.3674955-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240620162316.3674955-1-arnd@kernel.org>
References: <20240620162316.3674955-1-arnd@kernel.org>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Fri, 21 Jun 2024 11:00:07 +0200
Subject: [LTP] [PATCH 01/15] ftruncate: pass a signed offset
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
 stable@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Arnd Bergmann <arnd@arndb.de>

The old ftruncate() syscall, using the 32-bit off_t misses a sign
extension when called in compat mode on 64-bit architectures.  As a
result, passing a negative length accidentally succeeds in truncating
to file size between 2GiB and 4GiB.

Changing the type of the compat syscall to the signed compat_off_t
changes the behavior so it instead returns -EINVAL.

The native entry point, the truncate() syscall and the corresponding
loff_t based variants are all correct already and do not suffer
from this mistake.

Fixes: 3f6d078d4acc ("fix compat truncate/ftruncate")
Cc: stable@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/open.c                | 4 ++--
 include/linux/compat.h   | 2 +-
 include/linux/syscalls.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/open.c b/fs/open.c
index 89cafb572061..50e45bc7c4d8 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -202,13 +202,13 @@ long do_sys_ftruncate(unsigned int fd, loff_t length, int small)
 	return error;
 }
 
-SYSCALL_DEFINE2(ftruncate, unsigned int, fd, unsigned long, length)
+SYSCALL_DEFINE2(ftruncate, unsigned int, fd, off_t, length)
 {
 	return do_sys_ftruncate(fd, length, 1);
 }
 
 #ifdef CONFIG_COMPAT
-COMPAT_SYSCALL_DEFINE2(ftruncate, unsigned int, fd, compat_ulong_t, length)
+COMPAT_SYSCALL_DEFINE2(ftruncate, unsigned int, fd, compat_off_t, length)
 {
 	return do_sys_ftruncate(fd, length, 1);
 }
diff --git a/include/linux/compat.h b/include/linux/compat.h
index 233f61ec8afc..56cebaff0c91 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -608,7 +608,7 @@ asmlinkage long compat_sys_fstatfs(unsigned int fd,
 asmlinkage long compat_sys_fstatfs64(unsigned int fd, compat_size_t sz,
 				     struct compat_statfs64 __user *buf);
 asmlinkage long compat_sys_truncate(const char __user *, compat_off_t);
-asmlinkage long compat_sys_ftruncate(unsigned int, compat_ulong_t);
+asmlinkage long compat_sys_ftruncate(unsigned int, compat_off_t);
 /* No generic prototype for truncate64, ftruncate64, fallocate */
 asmlinkage long compat_sys_openat(int dfd, const char __user *filename,
 				  int flags, umode_t mode);
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 9104952d323d..ba9337709878 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -418,7 +418,7 @@ asmlinkage long sys_listmount(const struct mnt_id_req __user *req,
 			      u64 __user *mnt_ids, size_t nr_mnt_ids,
 			      unsigned int flags);
 asmlinkage long sys_truncate(const char __user *path, long length);
-asmlinkage long sys_ftruncate(unsigned int fd, unsigned long length);
+asmlinkage long sys_ftruncate(unsigned int fd, off_t length);
 #if BITS_PER_LONG == 32
 asmlinkage long sys_truncate64(const char __user *path, loff_t length);
 asmlinkage long sys_ftruncate64(unsigned int fd, loff_t length);
-- 
2.39.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
