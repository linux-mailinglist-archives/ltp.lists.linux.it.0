Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0934C78448
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 06:53:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 815843C1D1B
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 06:53:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 6CC473C1CE4
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 06:53:17 +0200 (CEST)
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5A19560072D
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 06:53:18 +0200 (CEST)
Received: by mail-ua1-f66.google.com with SMTP id 34so23475811uar.8
 for <ltp@lists.linux.it>; Sun, 28 Jul 2019 21:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bmkFrlYbN51H/0FOp5Bwp9vAWjgr+9grwxD7Ml3bxUw=;
 b=PzsydXdFMSlrOM9oHX+QtOI3vM7/nORyltwwMnT76coBAThkf6BC1a56vUqRnnOhs8
 udLQC/KOS+09JffNXIUcyjCWc5udCrFdLlMkiS+EisxbLMNnqVvk/Ntldi/lHpUQoaxR
 wXB8SdYK5BVRY+eaXrhrZxNQqE1dcBOfpWJg+GZ4sZTji9G+7gy6dvKCa7/ikr3j8QgL
 1Is36Q/5Nu6+UI8M/QItlvNar+bqVF+kiGqd9319C8zRex4w7LyfxxNQudeV2dOAGQcl
 unk6Lb4AzYJSL2JOrn6HIUsgS/ZIR1+HyCw31Fy5oBug0thu3Tw8RGoZbkc7NvlyrZrU
 iXSg==
X-Gm-Message-State: APjAAAXydMMIETdIh27YdXdx1CFo2wH5GG8X8K/ViHiR4cvK1DDGJUxu
 2QIB10eL9K4zvGlfJd4mxpGSJQ+kPHxHDzO984PsBNVZhZc=
X-Google-Smtp-Source: APXvYqxP2+Iu9pAL7YXC6ak5tZF8SVKIgCdwzvOs+mwOyxytxYJ8RWN+fpJXZ55/ETxq4IvdbExJq0cfAPAc9dyYI20=
X-Received: by 2002:a9f:3105:: with SMTP id m5mr13394755uab.142.1564375994599; 
 Sun, 28 Jul 2019 21:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190725033713.8551-1-liwang@redhat.com>
 <20190726121255.GA28028@rei.lan>
 <CAEemH2c96sB1ZA_vnTxSaBy-v=G_WnR58LX+Wt=Q8=UxO0dNtQ@mail.gmail.com>
 <20190726133124.GC28028@rei.lan>
In-Reply-To: <20190726133124.GC28028@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Mon, 29 Jul 2019 12:53:03 +0800
Message-ID: <CAEemH2dHY8A8baLEMP5hEy51_r+=5Q63j2uqG6FHHYuf43sY2w@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] move_pages12: handle errno EBUSY for
 madvise(..., MADV_SOFT_OFFLINE)
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

On Fri, Jul 26, 2019 at 9:31 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> > So, maybe we have to re-evaluate this patch V2 and to figure out why
> > the retry mmap() hitting SIGBUS fails.
>
> One possibility would be that the numa_move_pages() triggers SIGBUS
> while we do the usleep() before we attempt to retry the mmap(). In that
> case the race was present in the test all the time but couldn't be
> triggered because the window where the memory is unmapped was very
> short. If that is the case we should as well set up a handler to SIGBUS
> and ignore it as well.

No, It's not like the numa_move_pages() triggers SIGBUS because in the
end child print:
    move_pages12.c:114: FAIL: move_pages failed: ESRCH
that ESRCH means the child is still alive and detect ppid is not available.

It's more like to retry mmap() triggers SIGBUS while doing the
numa_move_pages() in background. That is very similar to the kernel
bug which was mentioned by commit 6bc9b56433b76e40d(mm: fix race on
soft-offlining ). A race condition between soft offline and
hugetlb_fault which causes unexpected process SIGBUS killing.

And, I will send an email to linux-mm@ to RFC.

--
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
