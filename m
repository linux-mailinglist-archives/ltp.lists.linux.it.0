Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D53E4BF71F
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 18:50:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89E843C22D7
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 18:50:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E60923C1E0F
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 18:50:49 +0200 (CEST)
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 49B4D601156
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 18:50:49 +0200 (CEST)
Received: by mail-yw1-xc42.google.com with SMTP id s6so959215ywe.5
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TI6RC3Inct0631A1o1WOoOjfgl/ixIhrcQv5jgmCiq4=;
 b=Y2kjBKQAVG7dYE9BZ0V3kBWqC7j0vBLWeTwoAcDdyq2fJHFOw2ajdO4CqMUsv9+L2P
 10ZKZlGLxzGpERbL3sDKqS7wx4bLmsOAOPgC+9xwVdgu4iIR0Q/hvMOSKqx4VJCfR8Y1
 u/jUzT5yOvok+Xq2jHcWqX2wzh4JrShTP670YW6fyzriBw0jXFO2PFa0ZxqLZpuUZv4q
 VhpnprD0icnPHTT9Cm5U0vwITZqLoVkpJ1wGdxVxydtejORVH+wv3JNkgWDLt79+N0kD
 Yp8KDsWyeCSCutqhtZkPrcggd6E1adj3D1b1IXbpXT8oWDKZVZIPoAORlUbMwnlMF90e
 Pz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TI6RC3Inct0631A1o1WOoOjfgl/ixIhrcQv5jgmCiq4=;
 b=Mg6YM7tnKj07TQW/ajrx3K5t9jtuSz4Mx0OUVuaYWdPjS8LwWc51iKWJx8VHrHuKw/
 oS9L9pLWRmhoBvHrc6yeaEYGLK0dZVH+MLrt0Q0CGytY3C4w1mmg1wWL8mr6DMXlPUNV
 sGXnsBd3eXmn1Ksk5n4IQ5v/GmQ/SF67RmhuXSFI2oBg9bIoaGn02ZdrFEjIYxAT4koQ
 uJzxN5D7n642R9OJrGyg8PBmrVO2iOHNXBG5iqlYcDUojKIJG+xkxiezT8DPnUOdTk7X
 76pcpn2Xbc0eMDtctQ5BOzRn8lwxRgH2GMOnYWyOad5DBrnMf9H6XkMjiPH54y+WH3/L
 EhNw==
X-Gm-Message-State: APjAAAXqwN2bKFPAMOdOV4X1f76CG0SUUvivb0FI4RQFu5J0+Mc2DTCY
 rAXSgIn5rgS8f29XvkO+BroucJDEC7XvNX5kI0U=
X-Google-Smtp-Source: APXvYqwg/xY2N8drh8fC+vtaaiTMEFh4yHbgklJlsq/NLjm9JK2ZFceRxoGZZm0zLIoKmjIdEEbDC3Cum4tPBwO3Ako=
X-Received: by 2002:a81:6c8:: with SMTP id 191mr3323748ywg.181.1569516648028; 
 Thu, 26 Sep 2019 09:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190926155608.GC23296@dell5510> <20190926160432.GC9916@magnolia>
 <20190926161906.GD23296@dell5510>
 <CAOQ4uxixSy7Wp7yWYOMpp8R5tFXD2SWR9t3koYO4jBE-Wnt8sQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxixSy7Wp7yWYOMpp8R5tFXD2SWR9t3koYO4jBE-Wnt8sQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 26 Sep 2019 19:50:36 +0300
Message-ID: <CAOQ4uxhpiLyhJ4Tu75V3yC7zjU5THw86V6FCbUC7bHC8RsyAEA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] copy_file_range() errno changes introduced in v5.3-rc1
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
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>,
 linux-xfs <linux-xfs@vger.kernel.org>,
 "Michael Kerrisk \(man-pages\)" <mtk.manpages@gmail.com>,
 Dave Chinner <dchinner@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Sep 26, 2019 at 7:33 PM Amir Goldstein <amir73il@gmail.com> wrote:
>
> On Thu, Sep 26, 2019 at 7:19 PM Petr Vorel <pvorel@suse.cz> wrote:
> >
> > Hi Darrick,
> >
> > > On Thu, Sep 26, 2019 at 05:56:08PM +0200, Petr Vorel wrote:
> > > > Hi Amir,
> >
> > > > I'm going to fix LTP test copy_file_range02 before upcoming LTP release.
> > > > There are some returning errno changes introduced in v5.3-rc1, part of commit 40f06c799539
> > > > ("Merge tag 'copy-file-range-fixes-1' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux").
> > > > These changes looks pretty obvious as wanted, but can you please confirm it they were intentional?
> >
> > > > * 5dae222a5ff0 ("vfs: allow copy_file_range to copy across devices") started to return -EXDEV.
>
> Started to return EXDEV?? quite the opposite.
> But LTP tests where already adapted to that behavior AFAICT:
> 15cac7b46 syscalls/copy_file_range01: add cross-device test
>
>
> > > > * 96e6e8f4a68d ("vfs: add missing checks to copy_file_range") started to return -EPERM, -ETXTBSY, -EOVERFLOW.
> >
> > > I'm not Amir, but by my recollection, yes, those are intentional. :)
> > Thanks for a quick confirmation.
> >
>
> Which reminds me - I forgot to send the man pages patch out to maintainer:
> https://lore.kernel.org/linux-fsdevel/20190529174318.22424-15-amir73il@gmail.com/
>
> At least according to man page -EACCES is also possible.
>

But it looks like man page update is wrong.
I'll fix it and post.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
