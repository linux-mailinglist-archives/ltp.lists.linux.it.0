Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3A54096AF
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 17:00:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 859B43C92A4
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 17:00:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 66E043C1DC8
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 17:00:08 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 91BB96009F3
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 17:00:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631545206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2XExcfJjhYqqFSPxDcdBobpzf/4x6yU+QQaVQ6sYCFc=;
 b=JAlELa6UbIcCoTEmGsCReZS8ZbXOPtDum2biU8lUVx+juefBc1Ju4xg0OU31V4U92g7Ul5
 1ncR9/d69ViG8i91rQgkDxmuuJ8qPqbQcJHt6B8vc6MJs8pjzkankpP2jawqY3VVW0Izj8
 ILnt+ZK6blGfytahJyJml7H2m5F9zI8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-L--cA0d_M-2dklpEU492Xg-1; Mon, 13 Sep 2021 11:00:02 -0400
X-MC-Unique: L--cA0d_M-2dklpEU492Xg-1
Received: by mail-qk1-f198.google.com with SMTP id
 w2-20020a3794020000b02903b54f40b442so41238855qkd.0
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 08:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2XExcfJjhYqqFSPxDcdBobpzf/4x6yU+QQaVQ6sYCFc=;
 b=0fePX0MXH2q6hI/oHQIy1KF5ueYQ6uo0EbOO1wIbm9JwJOQkwR+5n8Dkv/GvlEuTmY
 syJO49sC1hMpLZa5Npj9FVfVc3wqZqY9bCvVkocbdEveYjBAx1VEgBL8fxTnQXngU1ge
 D60uYDHCsYdOkXWxkTjDOFIrw1Na7ApzP3uikLBIcFXUD0tdCLYRQr7IW5DluCEPVN8w
 712l+VxhYMuehQvtfsZLlm4MCt7P2syO2jtYv1rOsVkrBm2pkcpEJlKbh9q7C3Fqgrp/
 MSfhmTZVj/Ne/BLUz5MulIMwXw15BYk1UMjs4BBJvL6iOgz7EUCznI9iJnZhvqk9Q+Ff
 59ig==
X-Gm-Message-State: AOAM5311y07Qyes5WfXnddBfcCT2K4hiD6HIF7Sw9wUeB/JiyHUOxJND
 f8YC/W7Ud7TB7xHnhVjDaGqAoYZ/ZkQHjyp4ZpANhsqHYvj89yXdNUm/SEFWnXAShjc8pIjdFVT
 vqlTLcgZhScpXB5bnqXoKjCfaIZ8=
X-Received: by 2002:ac8:4d41:: with SMTP id x1mr9881606qtv.283.1631545202427; 
 Mon, 13 Sep 2021 08:00:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIvLA1bOfGt14N8V8eXhYeDcrI9zojosD5e6UEzOrU113k+/xBMMYsIGkeewyg03T/DxlYztmC3UkBtmLTxdU=
X-Received: by 2002:ac8:4d41:: with SMTP id x1mr9881572qtv.283.1631545202194; 
 Mon, 13 Sep 2021 08:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210912123429.GA25450@xsang-OptiPlex-9020>
 <YT8HqsXsHFeMdDxS@yuki>
In-Reply-To: <YT8HqsXsHFeMdDxS@yuki>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Mon, 13 Sep 2021 16:59:51 +0200
Message-ID: <CAOssrKdQ0XWqk1nbpRjRAO7E+t5+7qzXm1mkJPObkzsQrbAoKg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mszeredi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [mm/page] ab19939a6a: ltp.msync04.fail
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
Cc: Jan Kara <jack@suse.cz>, lkp@intel.com, Chi Wu <wuchi.zero@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Jens Axboe <axboe@fb.com>,
 lkp@lists.01.org, kernel test robot <oliver.sang@intel.com>,
 Sedat Dilek <sedat.dilek@gmail.com>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Sep 13, 2021 at 10:19 AM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: ab19939a6a5010cba4e9cb04dd8bee03c72edcbd ("mm/page-writeback: Fix performance when BDI's share of ratio is 0.")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >
> >
> > in testcase: ltp
> > version: ltp-x86_64-14c1f76-1_20210907
> > with following parameters:
> >
> >       disk: 1HDD
> >       fs: xfs
> >       test: syscalls-03
> >       ucode: 0xe2
> >
> > test-description: The LTP testsuite contains a collection of tools for testing the Linux kernel and related features.
> > test-url: http://linux-test-project.github.io/
>
> The msync04 test formats a device with a diffrent filesystems, for each
> filesystem it maps a file, writes to the mapped page and the checks a
> dirty bit in /proc/kpageflags before and after msync() on that page.
>
> This seems to be broken after this patch for ntfs over FUSE and it looks
> like the page does not have a dirty bit set right after it has been
> written to.
>
> Also I guess that we should increase the number of the pages we dirty or
> attempt to retry since a single page may be flushed to the storage if we
> are unlucky and the process is preempted between the write and the
> initial check for the dirty bit.

Weird.  Does this reproduce 100% of the time?  If not, then I guess
it's a race and we can ignore this report (or improve the test to make
it less likely to trigger).

Thanks,
Miklos


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
