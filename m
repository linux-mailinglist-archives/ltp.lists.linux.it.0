Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A34F1DB5
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 19:42:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFE4C3C23CC
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 19:42:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 8BD7D3C23BB
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 19:42:33 +0100 (CET)
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3C86B60106F
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 19:42:33 +0100 (CET)
Received: by mail-wr1-x443.google.com with SMTP id w30so4533354wra.0
 for <ltp@lists.linux.it>; Wed, 06 Nov 2019 10:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dJsfSpw4pTXkQRHr6UYyIW+0zD/COuqwBhFIoZC5P5w=;
 b=FdlgLeZn8gLdgraGS9i266WWIotDZwM6cGVTx34yo6vgBtPqG8sCbVSnamXXpVz+Ib
 6PzqaaC7UycNj59+xuK2gg4Tj0UuJxN3UK4sgxt7G35eXnElHSb3dS0RTHWrL+NBLudj
 ddb0Bq0r4YQEn2iNioJAiWydMG0U3z/1IUn3BEsydRvfiZkMAzk2PUuT7j2mD0X6tR8/
 m/uqsIZFyXcZoMz4Eba9Y2KxDR3goddj0dMSDI8B/2WuiMES9oa/wbNcgXiQD7uF49is
 A7kyi3K3powa/aCYIRXpC39hB5wezeEKGJUWDqIQvZ1KL74H48gj1rDZGna8XBUgQJj8
 +pFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=dJsfSpw4pTXkQRHr6UYyIW+0zD/COuqwBhFIoZC5P5w=;
 b=ja+UKGTu7YoCttHLvBTk71kXZJ+unWHZ0vjj7YhclUVmUpdZLNR6vyaxNB6fIBKWFH
 AITWM30qYFo5EnmsOdHzcLC4g9uLDbofjWtZ3JiGMYFuu/ioNHnYSONs2RYSTAPDQIH4
 rXLbGnRWyytOxSEUQMKXteTGw4+b8VKTBWQ8yHRswpmQJgRHkK770IiJdJxDlo0o0w3N
 00BfmniO5XFZD4RwaHWlCMfHVNNrHhdBvK/IDRpiuM6ewpgh87r4TeA3uHhgAZx9qjuU
 0W8evLbmaFyS+HwYkrtAqLk86IslkWPrJNAKg+2K1nctsM1V+NPlRJazXPixON79GVFh
 SK4A==
X-Gm-Message-State: APjAAAV9pnRWvEPhLF7I+cgKEk5jp3jylBNMBnVpQm6YuJpZiExKr8cK
 G0BctknwJWov+LbvtfACVvk=
X-Google-Smtp-Source: APXvYqzrX+IefRb89wjy86KxI1XD47QypBypCB5+FSqUA+uI/Yvfgl7lTnAlfWJuzf1L0VxbYtkwGw==
X-Received: by 2002:adf:ed48:: with SMTP id u8mr3878454wro.28.1573065752775;
 Wed, 06 Nov 2019 10:42:32 -0800 (PST)
Received: from x230 ([178.21.189.11])
 by smtp.gmail.com with ESMTPSA id m15sm13641467wrq.97.2019.11.06.10.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 10:42:32 -0800 (PST)
Date: Wed, 6 Nov 2019 19:42:30 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191106184230.GA10470@x230>
References: <20191105005341.19033-1-petr.vorel@gmail.com>
 <20191105005341.19033-3-petr.vorel@gmail.com>
 <20191105130412.GC8511@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105130412.GC8511@rei.lan>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] fanotify: Rename fanotify_event_info_fid
 struct
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > To fix build on musl, which also defines fanotify_event_info_fid,
> > but uses fsid_t type for fsid instead of __kernel_fsid_t.

> > This fixes errors:

> > fanotify13.c: In function ???do_test???:
> > fanotify13.c:278:20: error: ???fsid_t??? {aka ???struct __fsid_t???} has no member named ???val???; did you mean ???__val????
> >     event_fid->fsid.val[0],
> >                     ^~~
> > ../../../../include/tst_test.h:49:53: note: in definition of macro ???tst_res???
> >   tst_res_(__FILE__, __LINE__, (ttype), (arg_fmt), ##__VA_ARGS__)
> >                                                      ^~~~~~~~~~~
> > fanotify13.c:279:20: error: ???fsid_t??? {aka ???struct __fsid_t???} has no member named ???val???; did you mean ???__val????
> >     event_fid->fsid.val[1],

> > musl (unlike glibc and uclibc-ng) defines fanotify_event_info_fid in
> > fanotify.h and uses fsid_t as type for fanotify_event_info_fid.fsid
> > member, which defines __val[2] (unlike val[2] in __kernel_fsid_t).

> I don't know, this really sounds like a bug in musl.
What would you propose to fix? Change fsid_t member to val[2]?
I'm a bit confused, which one is correct.
Or removing fanotify_event_info_fid struct?

In musl: 32b82cf5 ("fix the fsid_t structure to match name of __val")
changed it from val[2] to __val[2] in 2011 with comment:

    this is a case of poorly written man pages not matching the actual
    implementation, and why i hate implementing nonstandard interfaces
    with no actual documentation of how they're intended to work.

Kernel defines __kernel_fsid_t with val[2]
/* kernel include/uapi/asm-generic/posix_types.h */
#ifndef __kernel_fsid_t
typedef struct {
	int	val[2];
} __kernel_fsid_t;
#endif

And it was using val[2] at least in v2.6.31-rc1 - no sing to be __val[2].

glibc has __val[2] member. That's what triggered musl change I guess.
It looks to me it was here 2.3.1, before it used __u_quad_t
(typedef unsigned long long int __u_quad_t), but still with __val[2].

/* glibc posix/bits/types.h */
__STD_TYPE __FSID_T_TYPE __fsid_t;	/* Type of file system IDs.  */
/* glibc bits/typesizes.h */
#define __FSID_T_TYPE		struct { int __val[2]; }
/* glibc bits/statvfs.h */
struct statvfs
  {
...
    __fsid_t f_fsid;

Uclibc defines __kernel_fsid_t, sometimes defines it as val[2] and sometimes
have a condition __USE_ALL to have it val[2] (not sure if __USE_ALL is a
default, I haven't found any doc about it (is it uclibc specific or what?)

/* uclibc include/sys/types.h */
typedef __fsid_t fsid_t;

/* uclibc libc/sysdeps/linux/x86_64/bits/kernel_types.h */
typedef struct {
#ifdef __USE_ALL
	int val[2];
#else
	int __val[2];
#endif
} __kernel_fsid_t;

#endif
/* uclibc libc/sysdeps/linux/aarch64/bits/kernel_types.h */
typedef struct {
	int	val[2];
} __kernel_fsid_t;

But for __fsid_t uses the same code as glibc, with __val[2].

=> libc types use __val[2], kernel types __val.
The problem is really with mixing kernel and libc struct.
That's why I'd be to ask musl to remove it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
