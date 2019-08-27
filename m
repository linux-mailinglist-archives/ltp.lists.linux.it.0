Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B68CB9DE1F
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 08:34:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B2BA3C1D16
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 08:34:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B8B2D3C1C67
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 08:34:31 +0200 (CEST)
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E1D6560062A
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 08:34:30 +0200 (CEST)
Received: by mail-lf1-x144.google.com with SMTP id u29so1347325lfk.7
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 23:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=woMVWkO9N6OT+1wNpvLDhrI+4gOoEkBxINhlAwTjVgY=;
 b=G4V7AIOrXki/MR83mgS7/vhnAxuOkNK7tsBKMt1NW6cCkgqpM4R8d9xC4iwkAMKiWd
 LupUWwErlZt4gN+zA6J9pxAHDpS3bwnR7tKZOB/PQ7sp3tCSFEhOyHe67Jx7qy4C7h2f
 KRB9EN4z3eor2gPcv53aQ8W+11PixefFeSDA+rQ1JLxOEFFsN1pTeEU8Ybt0O1V6ETiu
 hpXBKpaaxe8Xpz/qkqnJPUHmyQzxPxMGU73lDiNGFSjmZxGkCjuxkR3wPsmtOMK3uEeC
 fKSSJUzLjax8k+oCvFNuPq5EUWubGEAIjUs89Nv4DgYyI5h+P1dKGZXyXWhLE8KTVMpX
 efGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=woMVWkO9N6OT+1wNpvLDhrI+4gOoEkBxINhlAwTjVgY=;
 b=lOgjgUg36KFSJp6rXyZZRvt/DUrDkSRDUn8RRKHEYE84hW3S99pNbA6tUywCYR4A7i
 UKw+tLBBqIqO7gHMFeuem8+y1KnzECO6CrH0a7TIBtHIjdctD0crVlka5M4Q0iZ0xrH2
 6zW1gH4EMm/QkntDcW3qs4kbf5JbKk+UCiT6vmTr/FKK9O0LAKrhm8KpP/QYpKpwXOgi
 IDGB5qOe2VS4qddFDtfAqHz1wJXpYmQxJcBqQ7Z59ORxwq3DWGlHXYL9K+FqjZBeKxpl
 p/l8rCJdSRtlYSaf7Mii4MEW0/P/ECeecsblg9huuzpo05jvKSIBt8pr11ZUz3/UwbtL
 kAGg==
X-Gm-Message-State: APjAAAXGtL6q/4iyNSlvo4qh4+ZdUWMSYkr7JHEvShJj1Gdz/oUJZLE0
 BHBlVGpo5ncLgwyf8QnapDbnAGG46mRxSX+xswE7/Q==
X-Google-Smtp-Source: APXvYqwtKMfXhng/fHj5e3j0vDEcN/gvDNAvxUrvbkGaP71Rckkcpm2TGpsDunvFIDoF+3rhd497aAMEnFMQ3svRqjQ=
X-Received: by 2002:a19:750b:: with SMTP id y11mr12265790lfe.99.1566887670119; 
 Mon, 26 Aug 2019 23:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtN2tjHZtjtc8isdsD5hF76teeh2-pngUp+uj3WYdj7jA@mail.gmail.com>
 <20190826104127.GA14729@haruka>
 <1264279239.8133737.1566817520787.JavaMail.zimbra@redhat.com>
 <CA+G9fYsHpNKFHr=ZukVvj+uMJDyHj2Xwb9bCfzPQyYzMjZ0rCw@mail.gmail.com>
 <203971593.8175020.1566830285708.JavaMail.zimbra@redhat.com>
 <fcd20866bb836d45b1e384dd68080c671bcde938.camel@hammerspace.com>
 <2039173876.8300255.1566861172742.JavaMail.zimbra@redhat.com>
In-Reply-To: <2039173876.8300255.1566861172742.JavaMail.zimbra@redhat.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 27 Aug 2019 12:04:17 +0530
Message-ID: <CA+G9fYvKbU5St+D=awgQS--SSO-_AteEpfMJ69COq-eOTHa2NA@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325:
 Failed to run cmd: useradd hsym
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
Cc: open list <linux-kernel@vger.kernel.org>,
 the hoang0709 <the_hoang0709@yahoo.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Trond Myklebust <trondmy@hammerspace.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, 27 Aug 2019 at 04:42, Jan Stancek <jstancek@redhat.com> wrote:
>
>
> ----- Original Message -----
> > On Mon, 2019-08-26 at 10:38 -0400, Jan Stancek wrote:
>
> No change with that patch,

Same for me.

> but following one fixes it for me:

Works for me.
Thanks for the fix patch.

>
> diff --git a/fs/nfs/pagelist.c b/fs/nfs/pagelist.c
> index 20b3717cd7ca..56cefa0ab804 100644
> --- a/fs/nfs/pagelist.c
> +++ b/fs/nfs/pagelist.c
> @@ -590,7 +590,7 @@ static void nfs_pgio_rpcsetup(struct nfs_pgio_header *hdr,
>         }
>
>         hdr->res.fattr   = &hdr->fattr;
> -       hdr->res.count   = 0;
> +       hdr->res.count   = count;
>         hdr->res.eof     = 0;
>         hdr->res.verf    = &hdr->verf;
>         nfs_fattr_init(&hdr->fattr);
>
> which is functionally revert of "NFS: Fix initialisation of I/O result struct in nfs_pgio_rpcsetup".
>
> This hunk caught my eye, could res.eof == 0 explain those I/O errors?
>                 /* Emulate the eof flag, which isn't normally needed in NFSv2
>                  * as it is guaranteed to always return the file attributes
>                  */
>                 if (hdr->args.offset + hdr->res.count >= hdr->res.fattr->size)
>                         hdr->res.eof = 1;


- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
