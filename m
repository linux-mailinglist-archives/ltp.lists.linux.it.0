Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C616EAC8C
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 10:32:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B5AE3C22DD
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 10:32:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 2D9993C229F
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 10:32:08 +0100 (CET)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 80692601F53
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 10:32:07 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id a21so5820928ljh.9
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 02:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ul+1p6kbKVH3FWizOiqgu8AKZkDkTtsbDBqXAJYLbf0=;
 b=iao+fWE6P7Hht75ULJG4A4ln75ObLBzndzjfkFuh4SBPnIaOaUv0vvzz+KTfEDPBEn
 3EQWi9DyPldrAmHlPTJavANo2pFyXzKAJntisMJCkWue2OqLbRKYBqsR90gWN5SfnivI
 o0wf73r+EWdK/xZ4803l3Dc/hGx5sXOzscXox44J3GLY4M9x0ICZHAj/lTrBbEx7V9kL
 78NEHd6IPLMEknTWYNBBebCeoMpTovb2Z2wEg/RyanMLclfJTLwFDOSIcTGfibmysbC4
 UyLfjGL8zJ2fvsSkvhn/zS4Vi5eLKQGggkC4WumJCvcWZvohsvUxTfIUWmgCh2ASj+hs
 sbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ul+1p6kbKVH3FWizOiqgu8AKZkDkTtsbDBqXAJYLbf0=;
 b=kQapagReucCaFhovrO54ZovKx3oytZsjXPQf4AkZPXmGzkDZuZ+JvMakRY3Zl9DFBX
 7horvdsY/4EE6dSGuodiLNvY2sL/Wnv19q6Gy1UM04GFspGjoFajCfABehBYKWjJxoI7
 L9YqAj8MNhT1r+K14syxzBzqhkwiTtjQyMfwFpMtapKBqkf55zQGb0ThSIjFrkGmIu6C
 nK3L4NNsLVUGut/FAE5GqrUHgEuwI0L+i0Yuzv/HZTlhwQwTnbQeaI7PrU5oCV1aBeVA
 laszYLWltFinJTd+I0RMfiJ0OU9+VzaWIA9xOZg1RHLfg8aTG7kDbhUS9l8XJYUpn1/k
 r34w==
X-Gm-Message-State: APjAAAXgt9ok1RZpQNVBL8OrpxSxEpSreeVoeSIKAfrrcB0jXeqqckOy
 Ju962wKIQfHmYn4Dns/+CCvzyV1kO2NY/WpeqdzrJA==
X-Google-Smtp-Source: APXvYqyylGZw81ADuyExFNtOW1/GdQpmLBC9W0dsu+bHOgZcGBQzLzGKsdBNuADOFnjuczP9I10rfhY1hBIhGKPCECA=
X-Received: by 2002:a2e:814b:: with SMTP id t11mr3557784ljg.20.1572514326762; 
 Thu, 31 Oct 2019 02:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv+-dz11fSjMNt8SHaAhRpu1F=8MF7ieS4ZASAwDzH7Eg@mail.gmail.com>
 <1277217234.9839643.1572476520526.JavaMail.zimbra@redhat.com>
In-Reply-To: <1277217234.9839643.1572476520526.JavaMail.zimbra@redhat.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 31 Oct 2019 15:01:55 +0530
Message-ID: <CA+G9fYvOrBPW-8pEDayhNaT1J6g1c4z-_zO3V+G1K5xAMb-T3w@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] LTP: accept02: BROK: accept02.c:52: setsockopt(6, 0, 42,
 0xffff9c56df78, 136) failed: ENODEV (19)
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
Cc: camann@suse.com, lkft-triage@lists.linaro.org,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan,

On Thu, 31 Oct 2019 at 04:32, Jan Stancek <jstancek@redhat.com> wrote:
>
>
>
> ----- Original Message -----
> > LTP syscall accept02 test failed intermittently on hikey arm64 device,
> > qemu_x86_64 and qemu_i386.
> >
> > Do you see this intermittent failure at your end ?
>
> I'm not. What does the network look like on these systems?
> Is there a default route? Is 224.0.0.0 reachable?
>
> Can you check with?
>
> # ip route
> # ip route get 224.0.0.0

on qemu_x86_64,

+ ip route
+ ip route get 224.0.0.0
RTNETLINK answers: Network is unreachable


on hickey device,
+ ip route
default via 10.66.16.1 dev eth0 proto dhcp metric 100
10.66.16.0/23 dev eth0 proto kernel scope link src 10.66.16.28 metric 100
+ ip route get 224.0.0.0
multicast 224.0.0.0 dev eth0 src 10.66.16.28 uid 0
cache <mc>

Link,
https://lkft.validation.linaro.org/scheduler/job/987925#L609

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
