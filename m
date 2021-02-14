Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D2E31B256
	for <lists+linux-ltp@lfdr.de>; Sun, 14 Feb 2021 20:56:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ABD563C59FE
	for <lists+linux-ltp@lfdr.de>; Sun, 14 Feb 2021 20:56:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E60553C1D23
 for <ltp@lists.linux.it>; Sun, 14 Feb 2021 20:56:02 +0100 (CET)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
 [IPv6:2607:5300:60:148a::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F419720006C
 for <ltp@lists.linux.it>; Sun, 14 Feb 2021 20:55:59 +0100 (CET)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lBNU0-00DzCn-JC; Sun, 14 Feb 2021 19:55:04 +0000
Date: Sun, 14 Feb 2021 19:55:04 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <YCmAGNyFAOZs7GCG@zeniv-ca.linux.org.uk>
References: <CA+G9fYsvDWDogC+xgeG2V9MMofV5svTipDigDiUBje+2jSRK8g@mail.gmail.com>
 <CAK8P3a2OeeW29ekbD70Ns4LTjGRJRT9P0wM-SAxUin1zAxP7TA@mail.gmail.com>
 <CA+G9fYv89bfbixjuudPWkBAucTYg7qhNxcV54RMEkRP5is-bnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYv89bfbixjuudPWkBAucTYg7qhNxcV54RMEkRP5is-bnQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] LTP: madvise08.c:203: TFAIL: No sequence in dump after
 MADV_DODUMP.
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
Cc: Arnd Bergmann <arnd@kernel.org>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Richard Palethorpe <rpalethorpe@suse.com>, Peter Xu <peterx@redhat.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Christian Brauner <christian@brauner.io>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Joerg.Vehlow@aox-tech.de,
 Andrew Morton <akpm@linux-foundation.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Jan 25, 2021 at 10:01:48PM +0530, Naresh Kamboju wrote:
> commit 8a3cc755b13808eba74846dfd1033fcbc21f9a65
> Author: Al Viro <viro@zeniv.linux.org.uk>
> Date:   Sun Mar 8 09:16:37 2020 -0400
> 
>     coredump: don't bother with do_truncate()
> 
>     have dump_skip() just remember how much needs to be skipped,
>     leave actual seeks/writing zeroes to the next dump_emit()
>     or the end of coredump output, whichever comes first.
>     And instead of playing with do_truncate() in the end, just
>     write one NUL at the end of the last gap (if any).
> 
>     Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> 
>  fs/binfmt_elf.c          |  1 -
>  fs/coredump.c            | 56 +++++++++++++++++++++++++++---------------------
>  include/linux/binfmts.h  |  1 +
>  include/linux/coredump.h |  1 -
> 
> 
> Test case output link,
> https://lkft.validation.linaro.org/scheduler/job/2184975#L1369
> https://lkft.validation.linaro.org/scheduler/job/2184972#L1358

I think I see what's going on.  Could you check if the following
fixes your reproducer?

diff --git a/arch/powerpc/platforms/cell/spufs/coredump.c b/arch/powerpc/platforms/cell/spufs/coredump.c
index 60b5583e9eaf..1a587618015c 100644
--- a/arch/powerpc/platforms/cell/spufs/coredump.c
+++ b/arch/powerpc/platforms/cell/spufs/coredump.c
@@ -149,8 +149,7 @@ static int spufs_arch_write_note(struct spu_context *ctx, int i,
 			return -EIO;
 	}
 
-	if (!dump_skip(cprm, roundup(cprm->pos - ret + sz, 4) - cprm->pos))
-		return -EIO;
+	dump_skip_to(cprm, roundup(cprm->pos - ret + sz, 4));
 	return 0;
 }
 
diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 66137d5dca5f..474a3c7dd5ce 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -2267,8 +2267,7 @@ static int elf_core_dump(struct coredump_params *cprm)
 		goto end_coredump;
 
 	/* Align to page */
-	if (!dump_skip(cprm, dataoff - cprm->pos))
-		goto end_coredump;
+	dump_skip_to(cprm, dataoff);
 
 	for (i = 0; i < vma_count; i++) {
 		struct core_vma_metadata *meta = vma_meta + i;
diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
index be4062b8ba75..01f043971644 100644
--- a/fs/binfmt_elf_fdpic.c
+++ b/fs/binfmt_elf_fdpic.c
@@ -1640,8 +1640,7 @@ static int elf_fdpic_core_dump(struct coredump_params *cprm)
 				goto end_coredump;
 	}
 
-	if (!dump_skip(cprm, dataoff - cprm->pos))
-		goto end_coredump;
+	dump_skip_to(cprm, dataoff);
 
 	if (!elf_fdpic_dump_segments(cprm, vma_meta, vma_count))
 		goto end_coredump;
diff --git a/fs/coredump.c b/fs/coredump.c
index 27a93f724251..bfac7422cd14 100644
--- a/fs/coredump.c
+++ b/fs/coredump.c
@@ -894,7 +894,14 @@ int dump_emit(struct coredump_params *cprm, const void *addr, int nr)
 }
 EXPORT_SYMBOL(dump_emit);
 
-int dump_skip(struct coredump_params *cprm, size_t nr)
+void dump_skip_to(struct coredump_params *cprm, unsigned long pos)
+{
+	cprm->to_skip = pos - cprm->pos;
+	return 0;
+}
+EXPORT_SYMBOL(dump_skip_to);
+
+void dump_skip(struct coredump_params *cprm, size_t nr)
 {
 	cprm->to_skip += nr;
 	return 0;
@@ -925,11 +932,11 @@ int dump_user_range(struct coredump_params *cprm, unsigned long start,
 			stop = !dump_emit(cprm, kaddr, PAGE_SIZE);
 			kunmap(page);
 			put_page(page);
+			if (stop)
+				return 0;
 		} else {
-			stop = !dump_skip(cprm, PAGE_SIZE);
+			dump_skip(cprm, PAGE_SIZE);
 		}
-		if (stop)
-			return 0;
 	}
 	return 1;
 }
@@ -940,7 +947,9 @@ int dump_align(struct coredump_params *cprm, int align)
 	unsigned mod = (cprm->pos + cprm->to_skip) & (align - 1);
 	if (align & (align - 1))
 		return 0;
-	return mod ? dump_skip(cprm, align - mod) : 1;
+	if (mod)
+		cprm->to_skip += align - mod;
+	return 1;
 }
 EXPORT_SYMBOL(dump_align);
 
diff --git a/include/linux/coredump.h b/include/linux/coredump.h
index 806d7f87d16a..78fcd776b185 100644
--- a/include/linux/coredump.h
+++ b/include/linux/coredump.h
@@ -23,7 +23,8 @@ extern unsigned int core_pipe_limit;
  * functions to write out all the necessary info.
  */
 struct coredump_params;
-extern int dump_skip(struct coredump_params *cprm, size_t nr);
+extern void dump_skip_to(struct coredump_params *cprm, unsigned long to);
+extern void dump_skip(struct coredump_params *cprm, size_t nr);
 extern int dump_emit(struct coredump_params *cprm, const void *addr, int nr);
 extern int dump_align(struct coredump_params *cprm, int align);
 int dump_user_range(struct coredump_params *cprm, unsigned long start,

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
