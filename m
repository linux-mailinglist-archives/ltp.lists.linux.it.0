Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6AB71320
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jul 2019 09:41:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7FB7A3C1D18
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jul 2019 09:41:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 6A5F73C1C7C
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 09:41:41 +0200 (CEST)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1704A6018AE
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 09:41:40 +0200 (CEST)
Received: by mail-vs1-f66.google.com with SMTP id u124so28200832vsu.2
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 00:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MlN5iXWGY5lVGpzqUHM5AOjyiYA0UPiMCXF6H2Ccbis=;
 b=rzXhiPW8FusDgXS/gHbvHDT8cssG5ktGCQYWYj4+Vs03ZoMSpe7yWwAiXjtQy0NLTe
 Z+5paHN59c6sEzhBqfThwXV/77BcWBzmqmmWJP8Maa0qzetPHU+UJcjC+ehxZvl0arB5
 W2XKgAEJqeLM0RS3mcYb3FdFwc1RjM41efp4+8opuiyEE6W2jH+VpBB1RbOeGkDWXNA3
 dwF/wfV4/2Dv7rTKEgu3ryWJnOPM91h3kAYDtmihWZm+4d0hHvkVmSOl5vXuWKl+zkE1
 k8349DyjeNFEy5EIGB1wmatKtW9lzAe44P7D7l4Tg+rOGeyHHBD/WQ0PUq7W7dQooiMy
 a2Cg==
X-Gm-Message-State: APjAAAWygDXdr0BW4L2VYulF/suqZj2HMD5wjY520/oyMzDqdG+vp60Q
 AL7tiMm/5v8AEMxlJTUF9GGsOTzMIinXnTXkFjya7w==
X-Google-Smtp-Source: APXvYqyHza2ptOFyZp+7rOtW2F3G+kvPW8y4usFcVVNJEqmSl+fCwPoTG7+/7Mpg90kWrhBbxfrrouWD6A8ejxwxVXc=
X-Received: by 2002:a67:ed87:: with SMTP id d7mr2585149vsp.130.1563867698978; 
 Tue, 23 Jul 2019 00:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190722150316.27395-1-chrubis@suse.cz>
In-Reply-To: <20190722150316.27395-1-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 23 Jul 2019 15:41:27 +0800
Message-ID: <CAEemH2dapin31=WrPsA97wgX=2d5rzQy8+D7LVta6nr6BwFN5A@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/mbind0{2,3,4}: Add basic mbind tests
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

On Mon, Jul 22, 2019 at 11:03 PM Cyril Hrubis <chrubis@suse.cz> wrote:
> ...
>  create mode 100644 testcases/kernel/syscalls/mbind/mbind.h
>  create mode 100644 testcases/kernel/syscalls/mbind/mbind02.c
>  create mode 100644 testcases/kernel/syscalls/mbind/mbind03.c
>  create mode 100644 testcases/kernel/syscalls/mbind/mbind04.c

Ad Petr commented in the patch V1, Makefile needs updating after
adding libltpnuma, otherwise, these test cases won't build
successfully.

LDFLAGS += -L$(top_builddir)/libs/libltpnuma
LDLIBS  += $(NUMA_LIBS) -lltpnuma

> diff --git a/testcases/kernel/syscalls/mbind/mbind02.c
> b/testcases/kernel/syscalls/mbind/mbind02.c
> ...
> +       TEST(mbind(ptr, size, mode, bm->maskp, bm->size + 1, MPOL_MF_STRICT));
> +
> +       if (TST_RET) {

I think we'd better check if the TST_RET is EIO before getting TPASS?
Otherwise, it will miss the failure with any other errno.

if (TST_ERR == EIO) {
        tst_res(TPASS | TTERRNO,
                        "mbind(%s, MPOL_MF_STRICT) node %u",
                         tst_numa_mode_name(mode), node);
} else {
         tst_res(TFAIL | TTERRNO, "mbind(%s, MPOL_MF_STRICT) node %u
failed unexpcted",
                         tst_numa_mode_name(mode), node);
}

> +               tst_res(TPASS | TTERRNO,
> +                       "mbind(%s, MPOL_MF_STRICT) node %u",
> +                       tst_numa_mode_name(mode), node);
> +       } else {
> +               tst_res(TFAIL, "mbind(%s, MPOL_MF_STRICT) node %u succeded",
> +                       tst_numa_mode_name(mode), node);
> +       }
> +
> +       tst_numa_unmap(ptr, size);
> +       numa_free_nodemask(bm);
> +}
> +
> +static void verify_mbind(unsigned int n)
> +{
> +       int mode = n ? MPOL_PREFERRED : MPOL_BIND;

Why not test MPOL_INTERLEAVE for mbind02? I guess it also makes sense
to add here.

> +       .forks_child = 1,

.forks_child is redundant?

> diff --git a/testcases/kernel/syscalls/mbind/mbind03.c b/testcases/kernel/syscalls/mbind/mbind03.c
> new file mode 100644
> index 000000000..f0622b07f
> --- /dev/null
> +++ b/testcases/kernel/syscalls/mbind/mbind03.c
> ...
> +
> +void verify_mbind(unsigned int n)
> +{
> +       int mode = n ? MPOL_PREFERRED : MPOL_BIND;

Adding MPOL_INTERLEAVE?

> +       .forks_child = 1,

remove .forks_child.

> diff --git a/testcases/kernel/syscalls/mbind/mbind04.c
> +++ b/testcases/kernel/syscalls/mbind/mbind04.c
> ...
> +
> +static void verify_policy(unsigned int node, int mode, unsigned flag)
> +{
> +       struct bitmask *bm = numa_allocate_nodemask();
> +       unsigned int i;
> +       void *ptr;
> +       unsigned long size = PAGES_ALLOCATED * page_size;
> +
> +       numa_bitmask_setbit(bm, node);
> +
> +       ptr = tst_numa_map(NULL, size);
> +
> +       TEST(mbind(ptr, size, mode, bm->maskp, bm->size + 1, flag));
> +
> +       if (TST_RET) {
> +               tst_res(TFAIL | TTERRNO,
> +                       "mbind(%s, %s) node %u",
> +                       tst_numa_mode_name(mode), mbind_flag_name(flag), node);

Do numa_free_nodemask(bm) before return?

> +static void verify_mbind(unsigned int n)
> +{
> +       unsigned int i;
> +       int mode = n ? MPOL_PREFERRED : MPOL_BIND;
> +
> +       for (i = 0; i < nodes->cnt; i++) {

I remember there are some ppc64le which have non-continuous numa nodes
in hardware configuration. I'm not sure if that special config will
break the mbind04 test, will update details to you after I run this
test on such a system.

    lscpu
    -----
    Architecture:        ppc64le
    ...
    CPU(s):              128
    Core(s) per socket:  16
    Socket(s):           2
    NUMA node(s):        2
    Model name:          POWER9, altivec supported
    ...
    NUMA node0 CPU(s):   0-63
    NUMA node8 CPU(s):   64-127

--
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
