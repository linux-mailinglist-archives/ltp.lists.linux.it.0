Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8807912024
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2024 11:08:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 656443D0F7A
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2024 11:08:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C00FE3C8B52
 for <ltp@lists.linux.it>; Fri, 21 Jun 2024 10:45:04 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66;
 helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de;
 receiver=lists.linux.it)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BE7986002E8
 for <ltp@lists.linux.it>; Fri, 21 Jun 2024 10:45:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vnRm0j85otx50gSN5LqFcKunoR/H3ua98B1Wub0g2Lg=; t=1718959503; x=1719564303; 
 b=UHyxa/0IkQl8D7l0PkhKie19Z6JJM74A03yApoBy71GPxHtpP3cfgqyAPhBrqw4eRR2Hbmc2ET+
 Ne+k552j3hZsfo8nZ8u64lSeJgV1E1reAxkj1pOWazllXrc5SeGn0Jqrn2RVm9ZBP1fhSqe1D1o4p
 TzYstoFiUigWvxCKxX/FXXoPg0DT2pcC3uuNrXVvESgIKqWeZGMhVvFL0thibQOwszFqv+s+nLZ5X
 Ab3WmwYwd+s1cjLWSvDvx/pdISlMp0f07cfDrMKQ0Ei2l6Ck9EXnNuzZU2/QtbmcP4mCymR8H6M+B
 CurCvQpuvd/gtjSUbi3UX8xj2tzzXqaGQEtw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.97) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1sKZsu-00000001rSo-3cOK; Fri, 21 Jun 2024 10:44:41 +0200
Received: from p5b13a475.dip0.t-ipconnect.de ([91.19.164.117]
 helo=suse-laptop-2.fritz.box)
 by inpost2.zedat.fu-berlin.de (Exim 4.97) with esmtpsa (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1sKZsv-00000001cr3-0HzV; Fri, 21 Jun 2024 10:44:41 +0200
Message-ID: <366548c1a0d9749e42c0d0c993414a353c9b0b02.camel@physik.fu-berlin.de>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Arnd Bergmann <arnd@kernel.org>, linux-arch@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 21 Jun 2024 10:44:39 +0200
In-Reply-To: <20240620162316.3674955-10-arnd@kernel.org>
References: <20240620162316.3674955-1-arnd@kernel.org>
 <20240620162316.3674955-10-arnd@kernel.org>
User-Agent: Evolution 3.52.2 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.164.117
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Fri, 21 Jun 2024 11:00:08 +0200
Subject: Re: [LTP] [PATCH 09/15] sh: rework sync_file_range ABI
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
 Alexander Viro <viro@zeniv.linux.org.uk>, ltp@lists.linux.it,
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

Hi Arnd,

thanks for your patch!

On Thu, 2024-06-20 at 18:23 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The unusual function calling conventions on superh ended up causing
                                              ^^^^^^
                                       It's spelled SuperH

> sync_file_range to have the wrong argument order, with the 'flags'
> argument getting sorted before 'nbytes' by the compiler.
> 
> In userspace, I found that musl, glibc, uclibc and strace all expect the
> normal calling conventions with 'nbytes' last, so changing the kernel
> to match them should make all of those work.
> 
> In order to be able to also fix libc implementations to work with existing
> kernels, they need to be able to tell which ABI is used. An easy way
> to do this is to add yet another system call using the sync_file_range2
> ABI that works the same on all architectures.
> 
> Old user binaries can now work on new kernels, and new binaries can
> try the new sync_file_range2() to work with new kernels or fall back
> to the old sync_file_range() version if that doesn't exist.
> 
> Cc: stable@vger.kernel.org
> Fixes: 75c92acdd5b1 ("sh: Wire up new syscalls.")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/sh/kernel/sys_sh32.c           | 11 +++++++++++
>  arch/sh/kernel/syscalls/syscall.tbl |  3 ++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/sh/kernel/sys_sh32.c b/arch/sh/kernel/sys_sh32.c
> index 9dca568509a5..d5a4f7c697d8 100644
> --- a/arch/sh/kernel/sys_sh32.c
> +++ b/arch/sh/kernel/sys_sh32.c
> @@ -59,3 +59,14 @@ asmlinkage int sys_fadvise64_64_wrapper(int fd, u32 offset0, u32 offset1,
>  				 (u64)len0 << 32 | len1, advice);
>  #endif
>  }
> +
> +/*
> + * swap the arguments the way that libc wants it instead of

I think "swap the arguments to the order that libc wants them" would
be easier to understand here.

> + * moving flags ahead of the 64-bit nbytes argument
> + */
> +SYSCALL_DEFINE6(sh_sync_file_range6, int, fd, SC_ARG64(offset),
> +                SC_ARG64(nbytes), unsigned int, flags)
> +{
> +        return ksys_sync_file_range(fd, SC_VAL64(loff_t, offset),
> +                                    SC_VAL64(loff_t, nbytes), flags);
> +}
> diff --git a/arch/sh/kernel/syscalls/syscall.tbl b/arch/sh/kernel/syscalls/syscall.tbl
> index bbf83a2db986..c55fd7696d40 100644
> --- a/arch/sh/kernel/syscalls/syscall.tbl
> +++ b/arch/sh/kernel/syscalls/syscall.tbl
> @@ -321,7 +321,7 @@
>  311	common	set_robust_list			sys_set_robust_list
>  312	common	get_robust_list			sys_get_robust_list
>  313	common	splice				sys_splice
> -314	common	sync_file_range			sys_sync_file_range
> +314	common	sync_file_range			sys_sh_sync_file_range6
                                                                 ^^^^^^ Why the suffix 6 here?

>  315	common	tee				sys_tee
>  316	common	vmsplice			sys_vmsplice
>  317	common	move_pages			sys_move_pages
> @@ -395,6 +395,7 @@
>  385	common	pkey_alloc			sys_pkey_alloc
>  386	common	pkey_free			sys_pkey_free
>  387	common	rseq				sys_rseq
> +388	common	sync_file_range2		sys_sync_file_range2
>  # room for arch specific syscalls
>  393	common	semget				sys_semget
>  394	common	semctl				sys_semctl

I wonder how you discovered this bug. Did you look up the calling convention on SuperH
and compare the argument order for the sys_sync_file_range system call documented there
with the order in the kernel?

Did you also check what order libc uses? I would expect libc on SuperH misordering the
arguments as well unless I am missing something. Or do we know that the code is actually
currently broken?

Thanks,
Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
