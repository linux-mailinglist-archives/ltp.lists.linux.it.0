Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4924DEF6B1
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 08:58:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF8A33C2385
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 08:58:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 1ADD43C22C5
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 08:58:14 +0100 (CET)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 518C21000C36
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 08:58:13 +0100 (CET)
Received: by mail-lj1-x243.google.com with SMTP id n5so9644186ljc.9
 for <ltp@lists.linux.it>; Mon, 04 Nov 2019 23:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M0wxXarYwGq77xR0cg46b8aXGRRcSnoyv1t4jCG/d4U=;
 b=eSumxHPcOiFl7VhO3WyGBPumPC/v4Gc1aGiHdrzRvyYQ0qesyHB2lYFxyO/Qcinafd
 OzWa6Nabin/RC1XmJ2LaCrRvgbJ3xtONiPrXIcWCXFrtGGNtSY0XcVdgTyglQhj3Mx5V
 u/zy3LBOF37tj0eEzKQC2dej4Wp8Nvlx7IZRdqfYdZAzgwJdaKUIn/5zFIx7hfUrbDWz
 K4ZKtASudEh1ehCqFcnD52++70ap+jkvZDUlEAwJTkd8sp6XPG+oKtUJKCzNJjhX8OIR
 AHeITDXH8JIWVFpw3mfIygK43KkFEIR6tLl+KPIVeDMAFNtaGCBpIxQGC2ytJ30z/Z1q
 ZtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M0wxXarYwGq77xR0cg46b8aXGRRcSnoyv1t4jCG/d4U=;
 b=npDBZfWSq7QbIMdi/rzcgnLmgi0ld+8oiaxbG74BjJa7h98yw9S4kwLSmkEeeKb2Ht
 UBtMTGZHmY1OnXAvdj808thxUjNPoDjkQ0w228dksOVdVozZ3ap2TF+AkBhMTrfHxMIs
 rXVnog52m4eE7d/1dGI2Tjsi4b5x9JYfh+eZGIILtfWw5FlHdWSZlP52MDMhNyDoFmvC
 SL12sH95Bc+kOM/TIJn3qs1zIuXAP2Ke51WZ5ufmcbCBt6wF5rMRvb2wV5KEs8h8rZVB
 273p5eHByc3SluTqsVZ/sNp2iTNtwgbogIDqXezqJEVV56k5SGMPbwsl/QJagwuL/XGI
 LKJA==
X-Gm-Message-State: APjAAAVXfnFTNt9lFbFSWvbVX1yH0cdzhfMqQ5bOwUXJ2x9BTAHLBA7H
 TTDG0cart/QKlw7vyuWKEcUeWcIbfWLyHd9OuvRfbw==
X-Google-Smtp-Source: APXvYqwItRlN33Dc1rOEb3W8JxKhUBQReYULMFvISIZF6rJ0IO/3DGEZL5QxrgAUTcdO4Qxg1RzQsi4ARYRhodTeuvM=
X-Received: by 2002:a2e:9a5a:: with SMTP id k26mr12064510ljj.46.1572940692487; 
 Mon, 04 Nov 2019 23:58:12 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYsWTFQZTHXUDPToaepnKGBoh61SsA_8SHcYgYZXN_L+mg@mail.gmail.com>
 <CA+G9fYu+6A3pYQGs2rydYtHNSCf1t9+OTRqrZeCbpc2ARLx2zA@mail.gmail.com>
 <20191105073459.GB2588562@kroah.com>
In-Reply-To: <20191105073459.GB2588562@kroah.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 5 Nov 2019 13:28:01 +0530
Message-ID: <CA+G9fYvau-CY8eeXM=atzQBjYbmUPg78MXu_GNjCyKDkW_CcVQ@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] stable-rc-5.3.9-rc1: regressions detected -
 remove_proc_entry: removing non-empty directory 'net/dev_snmp6',
 leaking at least 'lo'
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
Cc: Sasha Levin <sashal@kernel.org>, mmarhefk@redhat.com,
 Netdev <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, "David S. Miller" <davem@davemloft.net>,
 linux- stable <stable@vger.kernel.org>, Basil Eljuse <Basil.Eljuse@arm.com>,
 maheshb@google.com, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, 5 Nov 2019 at 13:05, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> > > Linux stable rc 5.3 branch running LTP reported following test failures.
> > > While investigating these failures I have found this kernel warning
> > > from boot console.
> > > Please find detailed LTP output log in the bottom of this email.
> > >
> > > List of regression test cases:
> > >   ltp-containers-tests:
> > >     * netns_breakns_ip_ipv6_ioctl
<trim>
> > >     * netns_comm_ns_exec_ipv6_netlink
> >
> > These reported failures got fixed on latest stable-rc 5.3.y after
> > dropping a patch [1].
>
> What is the subject of the patch?

blackhole_netdev: fix syzkaller reported issue
upstream commit b0818f80c8c1bc215bba276bd61c216014fab23b

>
> > The kernel warning is also gone now.
> >
> > metadata:
> >   git branch: linux-5.3.y
> >   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
> >   git commit: 75c9913bbf6e9e64cb669236571e6af45cddfd68
>
> The -rc tree is rebased all the time, can I get a "real" subject line to
> get a chance to figure out what you are trying to refer to here?

Linux 5.3.9-rc1 is good candidate on branch linux-5.3.y and
linux-stable-rc tree.

>
> > ref:
> > [PATCH AUTOSEL 5.3 12/33] blackhole_netdev: fix syzkaller reported issue
> > [1] https://lkml.org/lkml/2019/10/25/794
>
> lore.kernel.org is much more reliable :)

Thank you.

[ Sasha Levin <sashal@kernel.org>  wrote on Mon, 4 Nov 2019 12:13:45 -0500 ]
I've dropped this patch from 5.3 too, it was reverted upstream.
https://lore.kernel.org/netdev/20191104171345.GG4787@sasha-vm/

Ref:

Reverting below patch fixed this problem.
---
commit b0818f80c8c1bc215bba276bd61c216014fab23b
Author: Mahesh Bandewar <maheshb@google.com>
Date:   Fri Oct 11 18:14:55 2019 -0700

    blackhole_netdev: fix syzkaller reported issue

    While invalidating the dst, we assign backhole_netdev instead of
    loopback device. However, this device does not have idev pointer
    and hence no ip6_ptr even if IPv6 is enabled. Possibly this has
    triggered the syzbot reported crash.

    The syzbot report does not have reproducer, however, this is the
    only device that doesn't have matching idev created.

    Crash instruction is :

    static inline bool ip6_ignore_linkdown(const struct net_device *dev)
    {
            const struct inet6_dev *idev = __in6_dev_get(dev);

            return !!idev->cnf.ignore_routes_with_linkdown; <= crash
    }

    Also ipv6 always assumes presence of idev and never checks for it
    being NULL (as does the above referenced code). So adding a idev
    for the blackhole_netdev to avoid this class of crashes in the future.

    Signed-off-by: David S. Miller <davem@davemloft.net>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
