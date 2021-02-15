Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCE731B5F3
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Feb 2021 09:41:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B6093C6771
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Feb 2021 09:41:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id D686D3C068D
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 09:41:28 +0100 (CET)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4F7FA1A00A2C
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 09:41:28 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id n13so3213192ejx.12
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 00:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZQ348ps0wv2e4InmeINuZX0d9m8CN4q6775IcZAmEBs=;
 b=WwXoLyKA7iLvagNbuwuWEIhoH6920JGn9vk+p2/qHasRxhmrfaIzyGnwPCzLv/tgkh
 rpEBaJfiqElIc/qidrP2eV6nG2ENJZSxcT/uX+8wxKiH+ItNsJ/v7kEI9cCNUBTEn5Z1
 9YOY1IVi5j9JS7jhXICw/gTeZZyKXeXyssTMg0Zs5n2QzaGEWtD7rwWZV7IapInYr6yw
 vXVZyq6zsmPJ3nPeGpnwJ9NEVMosYb4o5wkEBzYgZyDOd4Q034S5DC0+ieztwHs9VDuH
 roUwq1/8gK2BIgSG/2CsDGYeVSObOclVbn16pXctORSKdgRJ0p+4ZUxXGRbBzho6oRYo
 EoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZQ348ps0wv2e4InmeINuZX0d9m8CN4q6775IcZAmEBs=;
 b=csB8wVAfMIiQOCLLEs0qd2AEIwhjSXjgmR9vNVgaX72ozXPFYb81rHOJp0C2N8xIE8
 0K5GkwR+okNv2HU4Z2FgaQ926ejjLVEmMVBQnv0hTLUmWzk783FgzPRVx4hbtstgvC9Z
 ckCd45zEV73NoB6pf5+8lkrjJkCvSjG90bbPnVlBEI6/aayhw80fuXknloqFllU+jHpk
 JzgGGHJauOwCcUgLoa/O+pnATg25pDhl7AfXw458YfJ0koHrpeE0hKRFSWfzdtBP+QHv
 MV2Lc9cejr2phHgmdhmq3fkbcQ+OYcWXkNnGy5kFIgmy8exfBQjWcxK1lwkb9PapBLDK
 caxg==
X-Gm-Message-State: AOAM531sQxi3OfbVqFt9o6SM1AbXUUeL6VUqT6zjvFYydMajAjqb2wlk
 ZvNdAu4e5i+0PCvxGlb0k6Fne8ydwFJ0GAhTTJJTaQ==
X-Google-Smtp-Source: ABdhPJwBYIVGzRM8ktSwxPe+1DHpTVEGkJgdoSGdgtG0XVGO6Y4e8KVeROvznUZ6sMQxqT/IsuG/vcnltlKkq2cwtY8=
X-Received: by 2002:a17:906:685a:: with SMTP id
 a26mr5372182ejs.503.1613378487664; 
 Mon, 15 Feb 2021 00:41:27 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYsvDWDogC+xgeG2V9MMofV5svTipDigDiUBje+2jSRK8g@mail.gmail.com>
 <CAK8P3a2OeeW29ekbD70Ns4LTjGRJRT9P0wM-SAxUin1zAxP7TA@mail.gmail.com>
 <CA+G9fYv89bfbixjuudPWkBAucTYg7qhNxcV54RMEkRP5is-bnQ@mail.gmail.com>
 <YCmAGNyFAOZs7GCG@zeniv-ca.linux.org.uk>
In-Reply-To: <YCmAGNyFAOZs7GCG@zeniv-ca.linux.org.uk>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 15 Feb 2021 14:11:15 +0530
Message-ID: <CA+G9fYsZnBv4wAEKYb0mgMd-BsgXcPUGBQ=VRKcONqAZry_4XQ@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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

Hi Al Viro,

On Mon, 15 Feb 2021 at 01:25, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Jan 25, 2021 at 10:01:48PM +0530, Naresh Kamboju wrote:
> > commit 8a3cc755b13808eba74846dfd1033fcbc21f9a65
> > Author: Al Viro <viro@zeniv.linux.org.uk>
> > Date:   Sun Mar 8 09:16:37 2020 -0400
> >
> >     coredump: don't bother with do_truncate()
> >
> >     have dump_skip() just remember how much needs to be skipped,
> >     leave actual seeks/writing zeroes to the next dump_emit()
> >     or the end of coredump output, whichever comes first.
> >     And instead of playing with do_truncate() in the end, just
> >     write one NUL at the end of the last gap (if any).
> >
> >     Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> >
> >  fs/binfmt_elf.c          |  1 -
> >  fs/coredump.c            | 56 +++++++++++++++++++++++++++---------------------
> >  include/linux/binfmts.h  |  1 +
> >  include/linux/coredump.h |  1 -
> >
> >
> > Test case output link,
> > https://lkft.validation.linaro.org/scheduler/job/2184975#L1369
> > https://lkft.validation.linaro.org/scheduler/job/2184972#L1358
>
> I think I see what's going on.  Could you check if the following
> fixes your reproducer?
>
> diff --git a/arch/powerpc/platforms/cell/spufs/coredump.c b/arch/powerpc/platforms/cell/spufs/coredump.c
> index 60b5583e9eaf..1a587618015c 100644
> --- a/arch/powerpc/platforms/cell/spufs/coredump.c
> +++ b/arch/powerpc/platforms/cell/spufs/coredump.c
> @@ -149,8 +149,7 @@ static int spufs_arch_write_note(struct spu_context *ctx, int i,
>                         return -EIO;
>         }
>
> -       if (!dump_skip(cprm, roundup(cprm->pos - ret + sz, 4) - cprm->pos))
> -               return -EIO;
> +       dump_skip_to(cprm, roundup(cprm->pos - ret + sz, 4));
>         return 0;
>  }
>
> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> index 66137d5dca5f..474a3c7dd5ce 100644
> --- a/fs/binfmt_elf.c
> +++ b/fs/binfmt_elf.c
> @@ -2267,8 +2267,7 @@ static int elf_core_dump(struct coredump_params *cprm)
>                 goto end_coredump;
>
>         /* Align to page */
> -       if (!dump_skip(cprm, dataoff - cprm->pos))
> -               goto end_coredump;
> +       dump_skip_to(cprm, dataoff);
>
>         for (i = 0; i < vma_count; i++) {
>                 struct core_vma_metadata *meta = vma_meta + i;
> diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
> index be4062b8ba75..01f043971644 100644
> --- a/fs/binfmt_elf_fdpic.c
> +++ b/fs/binfmt_elf_fdpic.c
> @@ -1640,8 +1640,7 @@ static int elf_fdpic_core_dump(struct coredump_params *cprm)
>                                 goto end_coredump;
>         }
>
> -       if (!dump_skip(cprm, dataoff - cprm->pos))
> -               goto end_coredump;
> +       dump_skip_to(cprm, dataoff);
>
>         if (!elf_fdpic_dump_segments(cprm, vma_meta, vma_count))
>                 goto end_coredump;
> diff --git a/fs/coredump.c b/fs/coredump.c
> index 27a93f724251..bfac7422cd14 100644
> --- a/fs/coredump.c
> +++ b/fs/coredump.c
> @@ -894,7 +894,14 @@ int dump_emit(struct coredump_params *cprm, const void *addr, int nr)
>  }
>  EXPORT_SYMBOL(dump_emit);
>
> -int dump_skip(struct coredump_params *cprm, size_t nr)
> +void dump_skip_to(struct coredump_params *cprm, unsigned long pos)
> +{
> +       cprm->to_skip = pos - cprm->pos;
> +       return 0;


fs/coredump.c:903:9: error: 'return' with a value, in function
returning void [-Werror=return-type]
 903 | return 0;
        | ^

Build failed due to above error.

build log link,
https://gitlab.com/Linaro/lkft/users/naresh.kamboju/linux/-/jobs/1029838856#L383

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
