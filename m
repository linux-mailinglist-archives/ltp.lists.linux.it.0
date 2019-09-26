Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B8936BF6C9
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 18:33:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A0213C22D9
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 18:33:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E63B03C22CA
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 18:33:48 +0200 (CEST)
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CA46F1A009A0
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 18:33:47 +0200 (CEST)
Received: by mail-yw1-xc41.google.com with SMTP id u65so940271ywe.4
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 09:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n2AZgX0guaiP5YgFLeTKAEfoSQ+3fPgtSsiI7KoX+/Q=;
 b=FWGPuI+7/ZX7ZYmJGgrTUtcL+w0oEWOJxyCatcLDxyC29RJOUcAfONG5JseEwxdoq1
 NvAW4Zo5Vh5pqBwYLPRF9rcx8Rhju0CaXcdNdOqNXa3HVRsLrQTY7KzMqXwt+vOPafBF
 H7m4M4KmOjSoKa7bUH8S5tmwN6H3yxU3awq9rPCgxfC7b5U2AApDenKMFTfZReu4nuVj
 jWhqxpZ+BKBO13H2N7V12z0h8yG58zZBD9JsUABOY55A4lGsIy2f2gUh0AoqEa0enb1E
 2A5ci87gTk05UErxPUrkQiVBl6AnEJUvtT1W1A6fQ96xZwk4Mou30Hbo1ElQmQ7Fs3Q6
 ok+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n2AZgX0guaiP5YgFLeTKAEfoSQ+3fPgtSsiI7KoX+/Q=;
 b=l/OnUPjQFN9Jzd85wnXildUA9IsaKyBjVhlwwjVHKdDdIoszQhkAZISIGEjwkS5gdh
 2yEqOopOqGD+M6PZ/5dkTZt0SKtOlsFFI1BZeD3hP5ctqco8qZyXANVumDI6u/mPpNEg
 j4SM+xG0gkAoOJ7MkWD95321fOonJRy4QfgraheANK0rrZb4wdpXyJ+ceC0BnW7De+rP
 Ovygq9F3in8mJeOLaN0rv04pqM0ot48nYj/Yba4pOqRZvcvTAra+PmJ/cRblbf5cqt78
 Uus2h5sarl4gaWsAcyJaJJSjHxfv3YJzOZLorVJsn6W8w/93UL7kaNs1jUMROivUbYj+
 vSYA==
X-Gm-Message-State: APjAAAXarJw2FWpYZ2MaP2tR8ApUd4rZM5KmcgroSaJFxWs0cEpybNmr
 C6jA+aaN2PlaizDH+ZcdmpDihGTrnagXTmu62o4=
X-Google-Smtp-Source: APXvYqyO2JaguAhBThAB0WOaDDohuSGt0Uia1/0TAyF4+Rs7q55h/9Aw18lfKWK+oGw0GJ6WqRqfrIdNxWHSvpPTDrs=
X-Received: by 2002:a81:6c8:: with SMTP id 191mr3269887ywg.181.1569515626516; 
 Thu, 26 Sep 2019 09:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190926155608.GC23296@dell5510> <20190926160432.GC9916@magnolia>
 <20190926161906.GD23296@dell5510>
In-Reply-To: <20190926161906.GD23296@dell5510>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 26 Sep 2019 19:33:35 +0300
Message-ID: <CAOQ4uxixSy7Wp7yWYOMpp8R5tFXD2SWR9t3koYO4jBE-Wnt8sQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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

On Thu, Sep 26, 2019 at 7:19 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Darrick,
>
> > On Thu, Sep 26, 2019 at 05:56:08PM +0200, Petr Vorel wrote:
> > > Hi Amir,
>
> > > I'm going to fix LTP test copy_file_range02 before upcoming LTP release.
> > > There are some returning errno changes introduced in v5.3-rc1, part of commit 40f06c799539
> > > ("Merge tag 'copy-file-range-fixes-1' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux").
> > > These changes looks pretty obvious as wanted, but can you please confirm it they were intentional?
>
> > > * 5dae222a5ff0 ("vfs: allow copy_file_range to copy across devices") started to return -EXDEV.

Started to return EXDEV?? quite the opposite.
But LTP tests where already adapted to that behavior AFAICT:
15cac7b46 syscalls/copy_file_range01: add cross-device test


> > > * 96e6e8f4a68d ("vfs: add missing checks to copy_file_range") started to return -EPERM, -ETXTBSY, -EOVERFLOW.
>
> > I'm not Amir, but by my recollection, yes, those are intentional. :)
> Thanks for a quick confirmation.
>

Which reminds me - I forgot to send the man pages patch out to maintainer:
https://lore.kernel.org/linux-fsdevel/20190529174318.22424-15-amir73il@gmail.com/

At least according to man page -EACCES is also possible.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
