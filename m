Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C50FC57E62
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jun 2019 10:40:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4982E3C1C6F
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jun 2019 10:40:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id EA8D63C02C3
 for <ltp@lists.linux.it>; Thu, 27 Jun 2019 10:39:57 +0200 (CEST)
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5B68F601EE7
 for <ltp@lists.linux.it>; Thu, 27 Jun 2019 10:39:56 +0200 (CEST)
Received: by mail-yb1-xb44.google.com with SMTP id j15so1077303ybh.11
 for <ltp@lists.linux.it>; Thu, 27 Jun 2019 01:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qiZ8CRW0mp+dMwvDoevPPnrjcBrjr2bmx7iTqX38mKE=;
 b=AwGS8aKx7wP+bFMpmqCpuvdzmvjIfLoB1oNAS6zP3xci29bJlcLTkyjGNV3ZVy5Pxw
 +Heg6TnE027dsNhqn3rQ40MSXElN62Vpzb5WOkQRpqUhrkn6GVcUyRxyNaWhKPHXMka4
 ZXkEBE6E4236Mlrw42sOKI6D/UqsNmljxXUSlVmAyaBkcf+PSym/IBuAVd9h3kVTuUso
 KeyOa30iaIDdlKyzuKnxWj2XJrrX5nHSzK6otFvBeZdNuVoIisQ7zEcjM32zdrkwTlE8
 dLerXNobsjYAxrTYZJRl2sIgsK4Zpan73zKt9xjqhQQ+eWWy/vEi4cN8vd0s49Wtyh+/
 /KCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qiZ8CRW0mp+dMwvDoevPPnrjcBrjr2bmx7iTqX38mKE=;
 b=B0sdOhXxR/bP0JsNhS9/1FSX5kYEYbQiA9V2QJsscSL2Ppmpa03b0/WJnmJglziRZi
 E5Vn2iVwDmXuSyb/Mbq4uu0R+epnMYpbYM9jL1CPhibT73HxnhAIr38ZCOouYQrw2c6V
 tx4gJxN4JD499BcRWb8POPKMAGWEaJtXACFJtX9Bkz9yFGdNE+Fmr0Io788OOc0byAiq
 efK6ALl6n6v/CdtpN2VZVb2zscUCEZ9qx2JqelsrKIZbpi7p8Mjh8VN5mTJKe8kMVLmL
 bLIVT5duv8DAb1POyh9+DExdx1BPQngsLPItMne+GuDd5s+A3hwg3z2SeMCoqnC6sbQR
 aE6g==
X-Gm-Message-State: APjAAAW454fZHMAzPKsxj6Z/WjC+mLIVrO9th8fKPTSfd+Bd3q2oI1wZ
 ns8iBBzsJcmGPlsEHoaBE20eBOMK0iHJQHNmBYw=
X-Google-Smtp-Source: APXvYqxpZ8PNoD3F43ogPq9LQzjFX0MZwFSO7CYO1IGd37E5a7K38elYPCt+5HUZJ4Vjsrk+KbaBCquJx9S5VIC75X4=
X-Received: by 2002:a25:744b:: with SMTP id p72mr1741615ybc.439.1561624795245; 
 Thu, 27 Jun 2019 01:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <1559292243-2882-1-git-send-email-huangjh.jy@cn.fujitsu.com>
 <5CF0FEB5.4030700@cn.fujitsu.com>
 <CAEemH2erJkdcKU_qg8RsjWUf7A37wj1QgMv=UZ21xUy=vXq9rg@mail.gmail.com>
 <CAOQ4uxjE6RC_60SR0KZk7dJvU12pxPXEq56-tz840rDCQth1Xg@mail.gmail.com>
 <5D147856.5040709@cn.fujitsu.com>
In-Reply-To: <5D147856.5040709@cn.fujitsu.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 27 Jun 2019 11:39:44 +0300
Message-ID: <CAOQ4uxjxOWCOBV1OQVg9B5D2eT4jUdQfOAaxTSJgFkqQDUVapg@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02.c: Compatible with new
 and old kernels
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

On Thu, Jun 27, 2019 at 11:03 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
>
> on 2019/05/31 21:02, Amir Goldstein wrote:
>
> > On Fri, May 31, 2019 at 3:03 PM Li Wang<liwang@redhat.com>  wrote:
> >>
> >>
> >> On Fri, May 31, 2019 at 6:15 PM Xiao Yang<yangx.jy@cn.fujitsu.com>  wrote:
> >>> On 2019/05/31 16:44, Jinhui huang wrote:
> >>>> On new kernels, copy_file_range() returned EISDIR when copyed contents
> >>>> to directory, but on old kernels, it returned EBADF, we should accept
> >>>> EBADF to be compatible with new and old kernels.
> >>>>
> >>>> The patch as follows:
> >>>> commit 11cbfb10775a ("vfs: deny copy_file_range() for non regular files")
> >>> Hi,
> >>>
> >>>  From description of commit, I wonder if we can add more tests for some
> >>> non regular files(e.g. block, pipe)?
> >>
> >> I have no objection on this. But, is there really make sense to test some more non regular files which not being mentioned by Linux Manual Page?
> >>
> > FYI, more changes to copy_file_range checks are in the works:
> > https://lore.kernel.org/linux-fsdevel/20190526061100.21761-1-amir73il@gmail.com/T/#me34d4363449118bd3b2ec8421d282a77e9a7d2d1
>
> Hi Amir
>
>      Meet again.  We can increase ltp copy_file_range02 coverage include( swapfile ->ETXTBUSY,  immutable file->EPERM) as same as xfstests generic/553[4].
> Also the two other checks(overlaping and offset wrap).  I am glad to do it.

That would be great!

>
> PS: Why we don't have test for overlaping and offset wrap check on xfstests? Or, I miss it?

The bounds check test was posted to xfstests:
https://marc.info/?l=linux-xfs&m=155947929219690&w=2

But because the test requires a new feature from xfs_io:
https://marc.info/?l=linux-xfs&m=156152984109774&w=2

I recommended that xfstests maintainer will hold off merging the test,
before the
required change is at least in xfsprogs for-next branch.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
