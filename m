Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B7C1BDD54
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 15:16:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B8A6C3C2826
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 15:16:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 259D23C27DA
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 15:16:27 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 51D792013D1
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 15:16:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7ECD6AAC7;
 Wed, 29 Apr 2020 13:16:25 +0000 (UTC)
Date: Wed, 29 Apr 2020 15:16:24 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200429131624.GB10236@dell5510>
References: <20200429033511.1848449-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429033511.1848449-1-raj.khem@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Define __NR_futex to be __NR_futex_time64 on
 riscv32
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Khem,

> RISCV glibc has decided to use 64bit time_t from get go unlike
> other 32bit architecture therefore aliasing __NR_futex to
> __NR_futex_time64 helps avoid the below errors on rv32

> tst_checkpoint.c:99:17: error: use of undeclared identifier 'SYS_futex'

Thanks for your fix.

BTW, out of curiosity, is Risc-v 32 bit merged into glibc master?

I found a patch from Alistair Francis from January, which implements what you claim:
https://sourceware.org/legacy-ml/libc-alpha/2020-01/msg00205.html
...
+/* RV32 and RV64 both use 64-bit time_t */
+#define __TIMESIZE	64
diff --git a/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h b/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h
...

(part of https://patches-gcc.linaro.org/project/glibc/list/?series=21554
patchset) but it hasn't been merged yet to master.

+ There is older patchset from Zong Li, not yet merged.
https://patches-gcc.linaro.org/cover/12952/

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  lib/tst_checkpoint.c                        | 4 ++++
>  testcases/kernel/syscalls/clone/clone08.c   | 4 ++++
>  testcases/kernel/syscalls/futex/futextest.h | 4 ++++
>  3 files changed, 12 insertions(+)

> diff --git a/lib/tst_checkpoint.c b/lib/tst_checkpoint.c
> index 5e5b11496c..0388e9db2f 100644
> --- a/lib/tst_checkpoint.c
> +++ b/lib/tst_checkpoint.c
> @@ -21,6 +21,10 @@
>   * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>   */

> +#if !defined(__NR_futex) && defined(__riscv) && __riscv_xlen == 32
> +# define __NR_futex __NR_futex_time64
> +#endif

I guess this should go to include/lapi/futex.h, so we don't repeat ourselves.
(and clone08.c needs to include it, others already do).

...

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
