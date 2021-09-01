Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 047F23FD62F
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 11:08:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C9D23CB0F8
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 11:08:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D939D3CAA68
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 11:07:56 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CA02810009FC
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 11:07:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630487274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pC5DFZzc9UewsBvUzJjXQABLpwkycaRX2qmvMdvRQvg=;
 b=fK+jbyXps0gJoi4cGfRL11h9kEWHIcZhx3BJsoeA8ZR9AyJ32ryEjkTq3kptYekoACdxAn
 dOROKf7nkL+1c2z7keQWTMByQlMpyoCnKrbr1vIP3uxhh0rdkCeDL1a5e4PFTUt8pGsRWw
 T/SRxKkWWWGS22PaUZ1P0XohbKq4gHg=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-m3SkydwgOCWYx7qDeRogbw-1; Wed, 01 Sep 2021 05:07:52 -0400
X-MC-Unique: m3SkydwgOCWYx7qDeRogbw-1
Received: by mail-lj1-f198.google.com with SMTP id
 q62-20020a2e2a41000000b001d37080f948so827180ljq.17
 for <ltp@lists.linux.it>; Wed, 01 Sep 2021 02:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pC5DFZzc9UewsBvUzJjXQABLpwkycaRX2qmvMdvRQvg=;
 b=YFYMJOz/JQ8kBqlTMswzerMLb8XycT4jssvhb7h+bDzlsi05wyPASTYV82kMlyXIok
 WjyR3sGvMgfKcmmS1eDK+WVtlQjogrGu5Dt2+JxZwU0PG60ac58T1vACm0u70Wy2dfy8
 LBXAW+deofJ1iKhrDhCDIOOTW7JZbulr2gDxTcuQb/wcqnN/4oPyXqW9B6CpKzn67Sug
 rA/rsCJuIRZO1Lxcqc06V8kRS54wghqmguaBPvk8oJgdkXo3ztQy3plYHBcPX8Ae4plS
 z1YI4+8PzHG0lxK7gLqm+cPSL5+wpDxjCJHuZEED2WJtAYu/xK7UXoC7Jih0LDRz8/1y
 0cFw==
X-Gm-Message-State: AOAM5326mPwXF83GTZedqXCRSLkdy8Hp0svzEgOs785NTmLa6N2RkN4M
 7IhvQQnPa1xoDoyvWzKXGiyPsf3D7TJtfjqrsKsg/OEdSskHkMz/+1OtUXYYzhCx3DpTr//dz8A
 mkC+Rw6yJePUsUEqI3o77GL1fu9o=
X-Received: by 2002:ac2:5f99:: with SMTP id r25mr24899372lfe.119.1630487269839; 
 Wed, 01 Sep 2021 02:07:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCjlIr93XXbKArF0PJ73dglUAoKTqvfHM73COi+OYKKLISM5JVJXEYtGbt4lUK6eOmo4eqSWzqXe6z3Flhvvc=
X-Received: by 2002:ac2:5f99:: with SMTP id r25mr24899355lfe.119.1630487269593; 
 Wed, 01 Sep 2021 02:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210825051710.GA5358@xsang-OptiPlex-9020>
 <cf358b73cbda90fd6c023f3a59a8df94698cf0bc.camel@kernel.org>
 <20210901030357.GD14661@xsang-OptiPlex-9020>
In-Reply-To: <20210901030357.GD14661@xsang-OptiPlex-9020>
From: Murphy Zhou <xzhou@redhat.com>
Date: Wed, 1 Sep 2021 17:07:38 +0800
Message-ID: <CALWRkkhxg7pyL7yagJzdBarfkEc70q8te-xy2-LAAqrJu3Lw+w@mail.gmail.com>
To: Oliver Sang <oliver.sang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=xzhou@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [fs] f7e33bdbd6: ltp.ftruncate04_64.fail
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
Cc: lkp@intel.com, Jeff Layton <jlayton@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org,
 linux-fsdevel@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

In my test, CONFIG_MANDATORY_FILE_LOCKING is not set.

# mount(NULL, MNTPOINT, NULL, MS_REMOUNT|MS_MANDLOCK, NULL);

But the mount call in setup() returns 0, with setting errno to EFAULT.

This testcase needs some tweaking to have an accurate verdict about manlock.

The kernel return value for mount looks buggy too.

On Wed, Sep 1, 2021 at 10:46 AM Oliver Sang <oliver.sang@intel.com> wrote:
>
> Hi Jeff,
>
> On Wed, Aug 25, 2021 at 06:32:38AM -0400, Jeff Layton wrote:
> > On Wed, 2021-08-25 at 13:17 +0800, kernel test robot wrote:
> > >
> > > Greeting,
> > >
> > > FYI, we noticed the following commit (built with gcc-9):
> > >
> > > commit: f7e33bdbd6d1bdf9c3df8bba5abcf3399f957ac3 ("fs: remove mandatory file locking support")
> > > https://git.kernel.org/cgit/linux/kernel/git/jlayton/linux.git locks-next
> > >
> > >
> > > in testcase: ltp
> > > version: ltp-x86_64-14c1f76-1_20210821
> > > with following parameters:
> > >
> > >     disk: 1HDD
> > >     fs: ext4
> > >     test: syscalls-07
> > >     ucode: 0xe2
> > >
> > > test-description: The LTP testsuite contains a collection of tools for testing the Linux kernel and related features.
> > > test-url: http://linux-test-project.github.io/
> > >
> > >
> > > on test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz with 32G memory
> > >
> > > caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> > >
> > >
> > >
> >
> > [...]
> >
> > > <<<test_start>>>
> > > tag=ftruncate04_64 stime=1629792639
> > > cmdline="ftruncate04_64"
> > > contacts=""
> > > analysis=exit
> > > <<<test_output>>>
> > > tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
> > > tst_test.c:916: TINFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
> > > mke2fs 1.44.5 (15-Dec-2018)
> > > tst_test.c:1348: TINFO: Timeout per run is 0h 25m 00s
> > > ftruncate04.c:116: TINFO: Child locks file
> > > ftruncate04.c:49: TFAIL: ftruncate() offset before lock succeeded unexpectedly
> > > ftruncate04.c:49: TFAIL: ftruncate() offset in lock succeeded unexpectedly
> > > ftruncate04.c:84: TPASS: ftruncate() offset after lock succeded
> > > ftruncate04.c:127: TINFO: Child unlocks file
> > > ftruncate04.c:84: TPASS: ftruncate() offset in lock succeded
> > > ftruncate04.c:84: TPASS: ftruncate() offset before lock succeded
> > > ftruncate04.c:84: TPASS: ftruncate() offset after lock succeded
> > >
> > > Summary:
> > > passed   4
> > > failed   2
> > > broken   0
> > > skipped  0
> > > warnings 0
> >
> > I think this failed because of the above, which is expected now that we
> > ignore the "mand" mount option (and mandatory locking support is gone).
> >
> > Oliver, you may need to update the expected test output for this test.
>
> Thanks for the information! we will do the corresponding change ASAP
>
> >
> > Thanks,
> > --
> > Jeff Layton <jlayton@kernel.org>
> >
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
