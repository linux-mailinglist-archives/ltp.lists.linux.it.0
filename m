Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BD682EAD
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 11:29:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84DCF3C1D24
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 11:29:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id BD3963C1C81
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 11:29:20 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8474C1A01141
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 11:29:19 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id 4so30630192pld.10
 for <ltp@lists.linux.it>; Tue, 06 Aug 2019 02:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LZE9JwqxHyBZxeyTQZ15MsXKicsAc2pA3zLUS7s27Q8=;
 b=mBJmJ3ZQ5t6MkJf94lKss/nd1I73cmLn5VSUCxsNkOYW/M+KO4aexOLA4Fz9SfTQRg
 Ej59WYQrqUldYeOmcLczu7MO6RxUCdPX6Si5Nl2M64P/+meCeYDy40mCZQfmly6nnAWw
 SnA0tkw1nQuCTn0omzD53jY3kuNF51uiv7w3kNXq62Z0eI4z3qcnB5zVUjauJN4fjHdC
 EU+60j4o0Gn9uwrev/JEp34Lqul1YIkN7WztoC/sDW+pc3VVbpDsyejp6IWM2Gscf/gx
 VB/btHJSDsugPv14YZrukusgv5TT/hZgtDhPBx3YFur8hO5bzvTtb8HMx4O1n9INoOLR
 G5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LZE9JwqxHyBZxeyTQZ15MsXKicsAc2pA3zLUS7s27Q8=;
 b=Smro2BSil3bvWb6k2HZF5QmikJUrB0/8juxJxoPrApjBGFh+zly5RouZLOLKVMpvLt
 nDqC0wv74DHYXwid1pKXFZNj2dKRN0xJoh6z06sOpBc5gX4R8fwwJvFwfUw9ec2CNoYu
 4jsESe8qWtuuxPc6PqFIkdbSivkg65Wn6IxNOWl+jtfPMXAPi0VbomQ94kbP2UApf1T/
 MDt1jUb3bxK4OYHyLGMxMLBqJXp0M/BZMMWQh+IC4eAVC1f78Z6Hb4nz8jbQ5YFoG4mJ
 ALzxi7ZGpV98+z115SLAuYwJVWWo2oVPAdt5GX7PoXEMNqjZt1CBtRztUY6hagQlAeoc
 ozyw==
X-Gm-Message-State: APjAAAVugYMVtZUJHq646ZJFTppURdcsf0m4TDx1uibXanKQt3e/V0Vu
 q/NgmZKEZ2Apy8N1LEl8YwY=
X-Google-Smtp-Source: APXvYqzohgXUEcjCDnJtp6VR0pL/JdVw3a1xpd5CdJ/1Oyr6eNd46IEQTwHtLIkF2Gl8sHpPTxR4gQ==
X-Received: by 2002:a17:902:8a87:: with SMTP id
 p7mr2263857plo.124.1565083758083; 
 Tue, 06 Aug 2019 02:29:18 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id p23sm91888595pfn.10.2019.08.06.02.29.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 02:29:17 -0700 (PDT)
Date: Tue, 6 Aug 2019 17:29:09 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190806092909.nd5cch7az6bpg56u@XZHOUW.usersys.redhat.com>
References: <20190730110555.GB7528@rei.lan>
 <1564569629-2358-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1564569629-2358-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190805065832.ti6vpoviykfaxcj7@XZHOUW.usersys.redhat.com>
 <5D47D6B9.9090306@cn.fujitsu.com>
 <20190805102211.pvyufepn6xywi7vm@XZHOUW.usersys.redhat.com>
 <5D480C6F.7070108@cn.fujitsu.com> <5D49200D.9000201@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D49200D.9000201@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 3/3] syscalls/copy_file_range02: increase
 coverage and remove EXDEV test
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Aug 06, 2019 at 02:37:01PM +0800, Yang Xu wrote:
> on 2019/08/05 19:01, Yang Xu wrote:
> 
> > on 2019/08/05 18:22, Murphy Zhou  wrote:
> > > All of them, ext234 xfs and vfat. 64bit
> > > 
> > > copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 32
> > > 
> > > [root@8u ltp (master)]# gcc -v
> > > Using built-in specs.
> > > COLLECT_GCC=gcc
> > > COLLECT_LTO_WRAPPER=/usr/libexec/gcc/x86_64-redhat-linux/8/lto-wrapper
> > > OFFLOAD_TARGET_NAMES=nvptx-none
> > > OFFLOAD_TARGET_DEFAULT=1
> > > Target: x86_64-redhat-linux
> > > Configured with: ../configure --enable-bootstrap --enable-languages=c,c++,fortran,lto --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-bugurl=http://bugzilla.redhat.com/bugzilla  --enable-shared --enable-threads=posix --enable-checking=release --enable-multilib --with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions --enable-gnu-unique-object --enable-linker-build-id --with-gcc-major-version-only --with-linker-hash-style=gnu --enable-plugin --enable-initfini-array --with-isl --disable-libmpx --enable-offload-targets=nvptx-none --without-cuda-driver --enable-gnu-indirect-function --enable-cet --with-tune=generic --with-arch_32=x86-64 --build=x86_64-redhat-linux
> > > Thread model: posix
> > > gcc version 8.3.1 20190507 (Red Hat 8.3.1-4) (GCC)
> > > [root@8u ltp (master)]# rpm -qv glibc
> > > glibc-2.28-72.el8.x86_64
> > > [root@8u ltp (master)]# mke2fs -V
> > > mke2fs 1.44.6 (5-Mar-2019)
> > > 	Using EXT2FS Library version 1.44.6
> > > [root@8u ltp (master)]# mkfs.xfs -V
> > > mkfs.xfs version 5.2.0-rc0
> > > [root@8u ltp (master)]#
> > > 
> > > Looks like the copy succeeded at that offset.
> > Hi Murphy
> > Today, I use theLinux 5.3-rc3 ,  ext234 xfs and vfat 64bit all pass. This case use glibc and tst_syscall, they all failed?
> > 
> > my environment as below:
> > # gcc -v
> > gcc version 8.2.1 20180905 (8.2.1-3) (GCC)
> > 
> > #glibc -v
> > glibc-2.28-18.el8.x86_64
> > 
> > #mke2fs  -V
> > mke2fs 1.44.4 (18-Aug-2018)
> >          Using EXT2FS Library version 1.44.4
> > 
> > #mkfs.xfs -V
> > mkfs.xfs version 5.2.0-rc0
> > 
> > I will use your environment to reproduce this problem. Please wait.
> Hi Murphy
> 
> Test 13) still passes on my environment. mke2fs and mkfs.xfs version should not affetc all filesystem results, I think them can be excluded.
> I update my gcc version to 8.3.1 20190507 ,glibc updates to  glibc-2.28-66.el8.x86_64(I don't have glibc-2.28-72.el8.x86_64, if you failed
> on both glibc and syscall, I think this fail is no related with glibc).
> 
> Can you print more informatin when you run this case, as below:
> 
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> index 26bfa008a..e4a7fd246 100644
> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> @@ -109,6 +109,8 @@ static void verify_copy_file_range(unsigned int n)
>                 tst_res(TCONF, "filesystem doesn't have free loopdev, skip it");
>                 return;
>         }
> +       if (tc->exp_err == EFBIG)
> +               tst_res(TINFO, "tc->dst %ld  tc->len %ld", tc->dst, tc->len);
>         TEST(sys_copy_file_range(fd_src, 0, *tc->copy_to_fd,
>                                 &tc->dst, tc->len, tc->flags));
> 
> copy_file_range02.c:120: PASS: copy_file_range failed as expected: EOVERFLOW
> copy_file_range02.c:113: INFO: tc->dst 9223372036854710270  tc->len 65537
> copy_file_range02.c:120: PASS: copy_file_range failed as expected: EFBIG

That's odd..

copy_file_range02.c:112: INFO: 12: tc->dst 9223372036854710270, tc->len 65537
copy_file_range02.c:128: FAIL: copy_file_range returned wrong value: 32

> 
> 
> 
> > Thanks
> > Yang Xu
> > 
> > 
> > 
> 
> 
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
