Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AA47191EAE
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Aug 2019 10:17:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B0ED3C1D18
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Aug 2019 10:17:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DB65D3C180B
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 10:17:01 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 27CD62016A2
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 10:16:59 +0200 (CEST)
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1C2D24E919
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 08:16:58 +0000 (UTC)
Received: by mail-vs1-f70.google.com with SMTP id n2so514770vsq.14
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 01:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=edhFynKo/pT1wYF25HZM7m6KhNyImcudRpE57pCQlho=;
 b=bS+4uCXyK+zrQgFR76wipZ07241X92UpbZMyJJP+7f7HlBu5SvK/HT0YSgeWcd6eb+
 AqxTV9ia7FD4NE4jA3CG3cIeKE4h959ioKgp6TWU7insbktNE1CLAL6tDiqrAQBmLGEZ
 NS4bp+cR/k5TfKqiAEDFNlRtpegQ93j1XkXRZiLAc1DIkWgd9Sxs9RV0KSr38hDv9Fm0
 D0z/65h/oljOUhFJ8SexN+OonE3bqOjw2flK0JQ/YL3XjTzL7fhycjWMBsMXv6LysfMb
 li4/n4St4JFpxxAuM56qEG32J1jhEd65s4p/MaSU932g98biAAq4AgzPxZYchnFUfQ6z
 zbdg==
X-Gm-Message-State: APjAAAVizfqWgy75Z8Cm24t1u4ugIf98PO+25rKHKlFA1PXecCJu946h
 XRA8rBelm5jtHMGPlvLkNOSrvBNrHranZWIsT6cugK/Y/SwrOPGhc//aTCjQo1TqDMTEffUogFd
 kNJThCMMpaKKvl8W/tLbBIG9j0MQ=
X-Received: by 2002:ab0:70c8:: with SMTP id r8mr6268049ual.89.1566202617376;
 Mon, 19 Aug 2019 01:16:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxvDb6Q3TVxv0+alG/ya0pRs+KtOQLF2RMHFcaXAbFWmvRY7suoO8fRbiZSgn0G5e8ZONuQpncTA2s9qSt6fGY=
X-Received: by 2002:ab0:70c8:: with SMTP id r8mr6268042ual.89.1566202616999;
 Mon, 19 Aug 2019 01:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190815083630.26975-1-pvorel@suse.cz>
 <20190816085309.fqvip4exe4mvtv2o@XZHOUW.usersys.redhat.com>
In-Reply-To: <20190816085309.fqvip4exe4mvtv2o@XZHOUW.usersys.redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 19 Aug 2019 16:16:45 +0800
Message-ID: <CAEemH2d7TYn4sZ7kkjRsPc-yBnTrN9LC+w84MAO6pDxYpfiFcw@mail.gmail.com>
To: Murphy Zhou <jencce.kernel@gmail.com>,
 Yang Xu <xuyang2018.jy@cn.fujitsu.com>, 
 Amir Goldstein <amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lapi/fs.h: Replace MAX_LFS_FILESIZE constant with
 own implementation
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

On Fri, Aug 16, 2019 at 4:53 PM Murphy Zhou <jencce.kernel@gmail.com> wrote:
>
> On Thu, Aug 15, 2019 at 10:36:30AM +0200, Petr Vorel wrote:
> > Some libc implementations on arm (at least AArch32 target with hard
> > float (arm-linux-gnueabihf)) or some libc (musl, bionic) does not
> > export PAGE_SHIFT. Replace it with own inline function.
> >
> > This required to replace MAX_LFS_FILESIZE constant with function
> > tst_max_lfs_filesize(). Given that we must use MAX_OFF in a function,
> > move dst from tcase struct to verify_copy_file_range().
> >
> > Credits for 32 bit MAX_LFS_FILESIZE algorithm: Cyril Hrubis.
>
> I got the same results:
>
> copy_file_range02.c:120: INFO: dst 9223372036854710270 len 65537
> copy_file_range02.c:136: FAIL: copy_file_range returned wrong value: 32

I'm not chanllenge the tst_max_lfs_filesize().

But I don't understand why to define MAX_OFF as (MAX_LEN - MIN_OFF),
the failure indicates that not to write at a position past the maximum
allowed offset. Shouldn't we give a dst_off large than
MAX_LFS_FILESIZE?

if I change the code as below, then it could be passed.

--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
@@ -115,7 +115,7 @@ static void verify_copy_file_range(unsigned int n)
        }

        if (tc->copy_to_fd == &fd_copy)
-               dst = tst_max_lfs_filesize() - MIN_OFF;
+               dst = tst_max_lfs_filesize();


-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
