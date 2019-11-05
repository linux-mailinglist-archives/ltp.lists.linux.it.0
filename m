Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EC1EF75F
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 09:39:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 622E13C22CD
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 09:39:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id F1CFE3C22AC
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 09:39:17 +0100 (CET)
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 58EEB1000C1E
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 09:39:17 +0100 (CET)
Received: by mail-lf1-x143.google.com with SMTP id j5so14423579lfh.10
 for <ltp@lists.linux.it>; Tue, 05 Nov 2019 00:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gdzE+6c0X0YWGdBkPcVhB+2E6S0ZBzl2+HXJPyALIxo=;
 b=QoZchN2MlJxPPnfv5ip5jv0Yo/GI7K8lFrh8GppZAg2NoF2W82BYVVKtg8unjTzK05
 4A0/STOOVg6Egqgg2JuVCqqBEcfeh8NoH3qWwBjLn6uodEGKQjeQYBqWIu2+5LkIRfmT
 hQxINtSoOnQ/95nXgsgY99s0YJ1IM3csCK0Pu81y1dzf0mVQctc4eBzgUpfzjMK6noVN
 +kZk15IkAKk8cw48vsn+fnOdniu1sAarADDlbsGSw8dBSugzLiv3uLKCJz0bKszhTKBr
 0z0vo2oYlJ4OeOLYxptMxI1fv0ziGoDQ6+VwZazbe++mjuPb5pvg2Z1akOSS8oHzTVHr
 e/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gdzE+6c0X0YWGdBkPcVhB+2E6S0ZBzl2+HXJPyALIxo=;
 b=UJZNstJrMcH8URDTha5LvNddtwgqXC2Cu+uDgE/Kop394d43/ihijlYxpZHzCkZNPn
 RnXxfsAMdQIbM9bv39a3JheLoqYgs1bD2EdZfXoTDBvByXj3imniTD2+wU/UWlWByyEn
 zjX5imp/GhKP1WD/j4v6D0S34RSLxXWkNBz4PzKtAjbLA1oWgZ7OetRB/ioIM1TrZD4c
 cEmmgUkBUaXBHX/NMCNZ5Dr2FR0RgdAzhC0NQg3+FcY3w4JRbe2nVvdWy3iiIzJsLHJ5
 O6uJTLfO449Cpcj+mtpr9KLkxJBcz01zIozwzQk2FzQhJFiIEGYfK4yLTeSByFLVdgJd
 kIVQ==
X-Gm-Message-State: APjAAAX6t6XnXicorjgyi4XzDGHli/z3Jw3MCLFiIUelkwzKNh7Wa2Wo
 uXYa9D6COhALdxFRDTp3tWbRbGbVjOMSU2L+h3HNJA==
X-Google-Smtp-Source: APXvYqxqx8NSYnV4wfLrSehgFQT8UMqVuaihF8wIQXecappLCoFsidLTOfL7TBdEsLOE2/tRXfW1vIiqXg3kPMs383U=
X-Received: by 2002:ac2:5930:: with SMTP id v16mr1088027lfi.67.1572943156625; 
 Tue, 05 Nov 2019 00:39:16 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYsWTFQZTHXUDPToaepnKGBoh61SsA_8SHcYgYZXN_L+mg@mail.gmail.com>
 <CA+G9fYu+6A3pYQGs2rydYtHNSCf1t9+OTRqrZeCbpc2ARLx2zA@mail.gmail.com>
 <20191105073459.GB2588562@kroah.com>
 <CA+G9fYvau-CY8eeXM=atzQBjYbmUPg78MXu_GNjCyKDkW_CcVQ@mail.gmail.com>
 <20191105080614.GB2611856@kroah.com>
In-Reply-To: <20191105080614.GB2611856@kroah.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 5 Nov 2019 14:09:05 +0530
Message-ID: <CA+G9fYtWc+6XzWZtG76T7+TdF+tAyUqJPQT8-ykZRTy1sCgEPQ@mail.gmail.com>
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

On Tue, 5 Nov 2019 at 13:36, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> > > > These reported failures got fixed on latest stable-rc 5.3.y after
> > > > dropping a patch [1].
> > >
> > > What is the subject of the patch?
> >
> > blackhole_netdev: fix syzkaller reported issue
> > upstream commit b0818f80c8c1bc215bba276bd61c216014fab23b
>
> That commit is not in any stable queue or tree at the moment, are you
> sure this is still an issue?

Since it has been dropped, the issue is gone now.

>
> > > > The kernel warning is also gone now.
> > > >
> > > > metadata:
> > > >   git branch: linux-5.3.y
> > > >   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
> > > >   git commit: 75c9913bbf6e9e64cb669236571e6af45cddfd68
> > >
> > > The -rc tree is rebased all the time, can I get a "real" subject line to
> > > get a chance to figure out what you are trying to refer to here?
> >
> > Linux 5.3.9-rc1 is good candidate on branch linux-5.3.y and
> > linux-stable-rc tree.
>
> I can not parse this, what do you mean?

linux-stable-rc linux-5.3.y branch and make kernel version 5.3.9-rc1
is been tested and
no regresion found.

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
