Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B032CEBE3
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 11:11:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B1243C6331
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 11:11:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 48B803C4C0C
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 11:11:48 +0100 (CET)
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EA9EB600546
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 11:11:47 +0100 (CET)
Received: by mail-il1-x142.google.com with SMTP id y9so4734797ilb.0
 for <ltp@lists.linux.it>; Fri, 04 Dec 2020 02:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rh2nBy+boKHl0+Z9opiRA0QzeKT/t+jXd+kB4+ttghQ=;
 b=AJ2/nMd4CAz1HzN810/d6rnpVLQX+89A9IYt2HePPoLv2SkeIcBhMiQM58y+8MG4tc
 /ny3AYt/1uXIZOmPLcC8PyvWlD/ruINhfO3VpawJXjR+NE/BdFUwy9x9cJQ8RRBUZ4as
 38uPPQEBBP+aK3sRIrprGgT/EwxboUXBBAJgBGCwiXX+r7jjC0BzEbzaNHFvBRzrwplu
 MOarnnlgRAANeJdxBP2y3n/wm2s6hfEQuiRFuObIMaIiQgxJrnDXnu9jZvsYo/0DHd7e
 /iJj2lJhimpr9hW+TbPCKh4HeuHsurGA8/YLQiHDe0WnG4XXpLLm8TLqSuxEv8NzCXcY
 jtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rh2nBy+boKHl0+Z9opiRA0QzeKT/t+jXd+kB4+ttghQ=;
 b=FxAhbebGsNe0jyiVLW/5gk6pzXJeOKHfrrpJdgO2+GrqYUYxAhh00tqHxvpTJSWZUj
 izpbMva0bDnKT5f916qTOMzdU2VDxazr7/SWDvR0IOs0fiaaMhB+jqeBzQdxgh4RBijI
 uVgRf3CZpbJK3Zk034wGf1JIdaqCxkhoYpQG9TXHPKK9ZJmE7iXkMC+ZMK3w8Dhll8+3
 Voh0s4f3hhQRAT7TtcUtVeRoedjR+OZdNbCdAuAuheh113lK2ID4uCCi48meEHh3msFt
 Lxz5Vfi9lE48d813+bIEB8F8PhDeC/I01KoV2vUmJpfowCHy28T4Ep4hU1g8KV7gbcVv
 t+cA==
X-Gm-Message-State: AOAM530Ayh5wi9D/+HfgYeS/Wq3NcIbpnaSBsu0pnuK+RlM9HzkTPkqB
 gxqKHvrTyY7R9oxwhajxDn9Nr049Ly1k+zrkQgE=
X-Google-Smtp-Source: ABdhPJzwSeenwx4Atr8y6JEX0rIAQKUCVczzZfBq9LOqMxUoGrDkF3knA4bi6kxxEQpJSO+eOYhXUNtJPITlrrrl8w4=
X-Received: by 2002:a92:6403:: with SMTP id y3mr5502523ilb.72.1607076706779;
 Fri, 04 Dec 2020 02:11:46 -0800 (PST)
MIME-Version: 1.0
References: <20201201174214.24625-1-pvorel@suse.cz>
 <20201201174214.24625-5-pvorel@suse.cz>
 <20201202154604.GD12342@yuki.lan> <X8fXG3ix4oq2Gab6@pevik>
In-Reply-To: <X8fXG3ix4oq2Gab6@pevik>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 4 Dec 2020 12:11:35 +0200
Message-ID: <CAOQ4uxhdW2x=gUD1D39Pc3Ke3QmkDUZswcLuA4djH6jcQZP_=w@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 04/10] fanotify: Add helper for FAN_REPORT_FID
 support on fs
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

On Wed, Dec 2, 2020 at 8:04 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Amir, Cyril,
>
> > > +   if (fanotify_mark(fd, FAN_MARK_ADD, FAN_ACCESS, AT_FDCWD, fname) < 0) {
> > > +           if (errno == ENODEV || errno == EOPNOTSUPP || errno == EXDEV) {
> > > +                   rval = -2;
> > > +           } else {
> > > +                   tst_brk(TBROK | TERRNO,
> > > +                           "fanotify_mark (%d, FAN_MARK_ADD, ..., AT_FDCWD, \".\") failed", fd);
> >                                                                                    ^
> >                                                                                  fname?
> ...
>
> > Maybe this would be just easier to read as a macro:
>
> > #define FANOTIFY_FAN_REPORT_FID_ERR_MSG(res_func, fail) do { \
> >       if (fail == -1) \
> >               res_func(TCONF, "FAN_REPORT_FID not supported in kernel?"); \
> >       if (fail == -2) \
> >               res_func(TCONF, ...); \
> >       } while (0)
>

Sorry, I ended up reverting that back to a function.

> ...
> > > +static inline void require_fanotify_fan_report_fid_supported_on_fs(const char *file,
> > > +   const int lineno, const char *fname)
> > > +{
> > > +   int rval;
> > > +
> > > +   rval = fanotify_fan_report_fid_supported_on_fs(fname);
> > > +   if (rval)
> > > +           fanotify_fan_report_fid_err_msg(file, lineno, tst_brk_, rval);
>
> > We don't have to do the if here, just pass the rval, it will not trigger
> > tst_brk() if we pass zero.
>
>
> > The rest is good.
>
> Both your comments fixed, patchset merged.
>
> Thank you both for your patient review,
>
> Amir, I'm sorry it took me that long.

No worries.
I know there was a lot of black magic behind all the flag checks
that needed explanations.

> Looking forward to your patchset :).
>

Posted.
Note that I only tested upstream, v5.8, v4.20 and not kernels
without permission events support and not exfat.

I trust you will help to fill those testing gaps.

If I am not mistaken, before my fixes, fanotify10 was going to fail
instead of TCONF on exfat/ntfs and kernel >= v5.9, but I did not check.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
