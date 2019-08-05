Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6D0816EE
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Aug 2019 12:22:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DACAB3C2020
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Aug 2019 12:22:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 992303C17C5
 for <ltp@lists.linux.it>; Mon,  5 Aug 2019 12:22:21 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B9067200E03
 for <ltp@lists.linux.it>; Mon,  5 Aug 2019 12:22:20 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id r7so39416052pfl.3
 for <ltp@lists.linux.it>; Mon, 05 Aug 2019 03:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qAWIV4sVrMFf0c4SyyqPI0MYlV1OWL+PFL9coM4Ahas=;
 b=ihydvMb5LnaiJJI443GRegmW7Y7fJWkts0kHh0gAskVa+CrIjrM59zJA9p19GJNnSp
 rjT79zZYwpjJ7B7uyi3ScgEfKtQLfKBb2hOVY1D1o6QChXperOWtoIEBRnTL+bcvibJb
 wlRSLqwy8VTs4A6zkCAbBlVWvgzqb4PGwqQ/OL9mboXvYcvrYo1fOf4biLk/U7ZtZpdp
 5nShTv75uWEbRD56Izl6uPmBTkHtL2bjhsvyDTRUV4sYqBdVljtqtlGbWssEEc5//MfP
 ++TiiW+Y3/raSKh9JW+ZrAJ6feFt5Zybx1W5fSXIw/lXOkFQ0QEBiwPLjbpFBrvUTkyH
 DjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qAWIV4sVrMFf0c4SyyqPI0MYlV1OWL+PFL9coM4Ahas=;
 b=RdrXWuZggY58+xFXkALa0dO7aK1crw/w/btbKx/p5arrV0vXlQppym7D2/dlopOWQJ
 ZYOji00z5fVFILP9txVUDCoUTMH36wlHYmH4QKmU5H/5hvz4ee5/ydy38F7xz+uhJb5S
 P37fyds8tIoDOxXJk+5HRtz/59ZDCssjkxRfi+IxNC4cas++wu1LRCg7KymGkMMRe/IT
 RE5q10NVoQqQkvqquO/fTs5H3rqa+nqcoNHW8lzelx5Fl108tfWBJGPFKqvPahtVy7e6
 v8ltqvRmfYpTsq0PhIEy+yCbXQErj8kgp7WYH4kI6YVDmRV8nZvjKBGVHje5iFbMKwIH
 G8vQ==
X-Gm-Message-State: APjAAAXgTJOP2M3umEmSQTNk3q+N0egIGfrA98gITkRVkdlUOYu8Jkbr
 s7Mt8URdIACQUxgDXD4FJq0=
X-Google-Smtp-Source: APXvYqzk25b7aR8rwO69KzOgELji/6h2KqIRurKye2WYLh56vdI3Kx1VtqQ0DghGH+Tul5cc8ZCHzQ==
X-Received: by 2002:a63:cc14:: with SMTP id x20mr90115212pgf.142.1565000539032; 
 Mon, 05 Aug 2019 03:22:19 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id m4sm96496467pgs.71.2019.08.05.03.22.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 03:22:18 -0700 (PDT)
Date: Mon, 5 Aug 2019 18:22:11 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190805102211.pvyufepn6xywi7vm@XZHOUW.usersys.redhat.com>
References: <20190730110555.GB7528@rei.lan>
 <1564569629-2358-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1564569629-2358-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190805065832.ti6vpoviykfaxcj7@XZHOUW.usersys.redhat.com>
 <5D47D6B9.9090306@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D47D6B9.9090306@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

On Mon, Aug 05, 2019 at 03:11:53PM +0800, Yang Xu wrote:
> on 2019/08/05 14:58, Murphy Zhou  wrote:
> 
> > > + * 13) Try to copy contents to a file with target file range
> > > >  + *     beyond maximum supported file size ->EFBIG
> > Test 13) fails on latest Linus tree. Is there any report or working on this?
> Hi Murphy
> 
>    Test 13)  passed on my system(64bit, 5.2.0+, ext4,vfat,btrfs,xfs ).
>    Do you provide more infomation(filesystem, 32bit or 64bit)?

All of them, ext234 xfs and vfat. 64bit

copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 32

[root@8u ltp (master)]# gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/x86_64-redhat-linux/8/lto-wrapper
OFFLOAD_TARGET_NAMES=nvptx-none
OFFLOAD_TARGET_DEFAULT=1
Target: x86_64-redhat-linux
Configured with: ../configure --enable-bootstrap --enable-languages=c,c++,fortran,lto --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-bugurl=http://bugzilla.redhat.com/bugzilla --enable-shared --enable-threads=posix --enable-checking=release --enable-multilib --with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions --enable-gnu-unique-object --enable-linker-build-id --with-gcc-major-version-only --with-linker-hash-style=gnu --enable-plugin --enable-initfini-array --with-isl --disable-libmpx --enable-offload-targets=nvptx-none --without-cuda-driver --enable-gnu-indirect-function --enable-cet --with-tune=generic --with-arch_32=x86-64 --build=x86_64-redhat-linux
Thread model: posix
gcc version 8.3.1 20190507 (Red Hat 8.3.1-4) (GCC) 
[root@8u ltp (master)]# rpm -qv glibc
glibc-2.28-72.el8.x86_64
[root@8u ltp (master)]# mke2fs -V
mke2fs 1.44.6 (5-Mar-2019)
	Using EXT2FS Library version 1.44.6
[root@8u ltp (master)]# mkfs.xfs -V
mkfs.xfs version 5.2.0-rc0
[root@8u ltp (master)]# 

Looks like the copy succeeded at that offset.

Thanks,
M

> 
> Thanks
> Yang Xu
> 
> > Thanks!
> > M
> > 
> 
> 
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
