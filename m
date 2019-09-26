Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FDDBF8D2
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 20:07:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EBACD3C22CC
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 20:07:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 2C2ED3C22CC
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 20:07:20 +0200 (CEST)
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 16ACB1000B0B
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 20:07:12 +0200 (CEST)
Received: by mail-yw1-xc43.google.com with SMTP id u187so2689ywa.11
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 11:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9m+nbdrnuzIY8RdTnjng+ADoFa6AiieChTxE8L3fAO4=;
 b=Yr21GQW2sPifrxNyEdZWLPApb9f4Ta2qIpdtwUI7g0zZkn/2C5u8h64I83GmBqj7yj
 64Bto8ppTvm8YR0NPv2RjF2CLimqjBOmUc1vNb4zBUIHMItC9P7skyupVQ0FSS3vGKCC
 KGzGv+NrBsYNtLJ6FOyp6Ialk0/9Dmh9XdehVVRq1EqPDwHf8Ktn/wnhNqlYePjKD+eV
 pqk493ft5RBhUbgKbartACtY5cIwPSzQvv6PNKDCeOTes1MFWGnJb1xzcCMYyr/WJA6Z
 2ET0tv9jBUVSMtzyZdrJHPzWiVpMrP5anLLzh2o88LO5r+oZJ3cgyXreeOJ2w4SywwKm
 BwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9m+nbdrnuzIY8RdTnjng+ADoFa6AiieChTxE8L3fAO4=;
 b=Hd5I3OOj7mMOQ18GroQ9Guv5x6NegAhORBOua/Fcumd26P6rT/6ou/c+fNiA5dod4V
 MTihbfZfjgNE3tO14zmlQmRL8e8JzC9me8zmF3lXl/Q9h20qslIOwFrIqJw4cVtM2T3Q
 6dMkF9zQ79vHQS1ijXrmYDIOm6lgIEDRAENKVLr/WeBSOoPlhbqCP6l+2V0FjAnPbBhY
 I/+0212rE+WXHO+6qICRE5fZuLxybNc1hf7lN4+/gsZEh9eZ+I80GTcTgG0uMF3NuYtQ
 dmO1SN3YgdD4iCRFj91pSeBUUX5eyLuvHTH5GevlktW6oH69RW8LZ7oc7K+rzFhSM1qc
 al8w==
X-Gm-Message-State: APjAAAVKvth6CJiwqLocARTIxe3CLOA9ZYst2VXwpgdKD4E4WiYk76wz
 PXOnbh1V6kbYvNybX2Yl07wSDbBhKVmkvN6a2p0=
X-Google-Smtp-Source: APXvYqzLBlCTzINCjYW+UL6VL2Djnn03Z/ZniDZBc7ep02rLJLQd7z8sr30Pfv59xe0ACSSfwu6I7YJDGHTcoU9AmjE=
X-Received: by 2002:a81:7743:: with SMTP id s64mr3570104ywc.183.1569521238956; 
 Thu, 26 Sep 2019 11:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190926155608.GC23296@dell5510> <20190926160432.GC9916@magnolia>
 <20190926161906.GD23296@dell5510>
 <CAOQ4uxixSy7Wp7yWYOMpp8R5tFXD2SWR9t3koYO4jBE-Wnt8sQ@mail.gmail.com>
 <20190926175700.GA12619@x230>
In-Reply-To: <20190926175700.GA12619@x230>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 26 Sep 2019 21:07:07 +0300
Message-ID: <CAOQ4uxisQx1C7DXrcmq0gma4-bxbaPS5UNwpwnoDOtjYVypXwA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

On Thu, Sep 26, 2019 at 8:57 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Amir,
>
> > > > > * 5dae222a5ff0 ("vfs: allow copy_file_range to copy across devices") started to return -EXDEV.
>
> > Started to return EXDEV?? quite the opposite.
> > But LTP tests where already adapted to that behavior AFAICT:
> > 15cac7b46 syscalls/copy_file_range01: add cross-device test
> I'm talking about copy_file_range02 (15cac7b46 changes copy_file_range01).
>
> Anyway, the problem which I want to fix is a backward compatibility for v5.2 and
> older to fix errors like this:
>
> copy_file_range02.c:102: INFO: Test #7: overlaping range
> copy_file_range02.c:134: FAIL: copy_file_range returned wrong value: 16
> copy_file_range02.c:102: INFO: Test #8: block device
> copy_file_range02.c:128: FAIL: copy_file_range failed unexpectedly; expected EINVAL, but got: EXDEV (18)
> copy_file_range02.c:102: INFO: Test #9: char device
> copy_file_range02.c:128: FAIL: copy_file_range failed unexpectedly; expected EINVAL, but got: EXDEV (18)
> ...
> copy_file_range02.c:102: INFO: Test #11: max length lenght
> copy_file_range02.c:128: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL (22)
> copy_file_range02.c:102: INFO: Test #12: max file size
> copy_file_range02.c:128: FAIL: copy_file_range failed unexpectedly; expected EFBIG, but got: EINVAL (22)
>
> LTP hasn't defined yet any policy about changing errnos,
> as it's probably best to check whether change was intentional
> (like your obvious fixes) or not.
>

IIUC, copy_file_range02 was written after v5.3 changes to verify that
copy_file_range
stays unbroken.
As such, I would suggest that you check if kernel supports cross-fs copy, like
copy_file_range01 does and if it doesn't, skip the test entirely.
If some one ever backports cross-fs copy to any distro stable kernel, then one
would better also backkport all of those API fixes, otherwise test will fail.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
