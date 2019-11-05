Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5468EEF464
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 05:14:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A1933C2509
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 05:14:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id D7FBE3C24DF
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 05:14:51 +0100 (CET)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3BAA21B61C49
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 05:14:51 +0100 (CET)
Received: by mail-lj1-x242.google.com with SMTP id q2so13580102ljg.7
 for <ltp@lists.linux.it>; Mon, 04 Nov 2019 20:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8KB+te/nLoebcMQPIFtuyG/ym5HSoU7PnWgKfaQPNOE=;
 b=gTNyTkL5COxLe6mqgrHi3rTaVdO7kVoZQp01mpmI55r12uEYKWt0QJBX1E1p6C7I/l
 btHxbM50pwDG3wpnQ4m55tveqmvQ1sU5LCVbxLPyjMIU9VEwz3awilFHSrwSMLMemOxD
 xZdsRRLzbw0IXm8mE+KQJgsw2PDAQsDawCM/GfZbY2Ngk2PT/DmZ5yMBSeOEhZhHnW3z
 MsxM4eyGrq/S5zZ0ni7q91iHMVNxC9hqketMuY6Htr4dFoOrStv+OUpYCQxCH05MM9VO
 uWtuu4oEU7pecgxvZXUb23Dg+KEIWLE9/QL+qmKP0blqSuXFGFdtZ9VDSzywwSQUClpW
 378g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8KB+te/nLoebcMQPIFtuyG/ym5HSoU7PnWgKfaQPNOE=;
 b=Q9FZtUJpY8iMuDu3e+6CzH5/L+yE7fvmglniMg2cgl/m2L08nz3nITAVSWkNZR4x5v
 id6DOSRk/vwOWd7nJD1UBEH22ih4N2kHdFll/CCsdn8xmol/g7nXlW39xFhoE5wjYqui
 FovRkzBAHU7eoRzaSZL4SokL5R1oVOHUkKNPZf8fSTnJdKgldEOiZ3CXtXERoWsmidN/
 zIW1YRm/3DWck6T3nvOmFj5MSrw9KYOMYB5I/FjJZA1+15OomGvk36XLSzGc3kbwRhv5
 6YAWyBhD9C1ONrUYu9BOEvxPG6Y/9PPHFU9AHv0SNpcM6t4oS53ixQdYjoidzyzXq7Na
 CmKA==
X-Gm-Message-State: APjAAAV2/MVVZjLUih+XF9AJrw2ST3LI5uPPM/eUEXqq6iTCohofIgFb
 6MLOTr7CVSzrwgBMn2Gh845FER2wtvLYV6INk3ytOw==
X-Google-Smtp-Source: APXvYqzo8BCoI5pHogfN3mp2CXgLWA5a2xI0z1nWrz3rcFHdAQqHlzKc7jtT22WecxPiwuhFxoupOIdodhQEymY8ey0=
X-Received: by 2002:a2e:888a:: with SMTP id k10mr10715245lji.195.1572927290338; 
 Mon, 04 Nov 2019 20:14:50 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYsWTFQZTHXUDPToaepnKGBoh61SsA_8SHcYgYZXN_L+mg@mail.gmail.com>
In-Reply-To: <CA+G9fYsWTFQZTHXUDPToaepnKGBoh61SsA_8SHcYgYZXN_L+mg@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 5 Nov 2019 09:44:39 +0530
Message-ID: <CA+G9fYu+6A3pYQGs2rydYtHNSCf1t9+OTRqrZeCbpc2ARLx2zA@mail.gmail.com>
To: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Cc: mmarhefk@redhat.com, Netdev <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux- stable <stable@vger.kernel.org>, Basil Eljuse <Basil.Eljuse@arm.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Sasha and Greg,

On Mon, 4 Nov 2019 at 20:59, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Linux stable rc 5.3 branch running LTP reported following test failures.
> While investigating these failures I have found this kernel warning
> from boot console.
> Please find detailed LTP output log in the bottom of this email.
>
> List of regression test cases:
>   ltp-containers-tests:
>     * netns_breakns_ip_ipv6_ioctl
>     * netns_breakns_ip_ipv6_netlink
>     * netns_breakns_ns_exec_ipv6_ioctl
>     * netns_breakns_ns_exec_ipv6_netlink
>     * netns_comm_ip_ipv6_ioctl
>     * netns_comm_ip_ipv6_netlink
>     * netns_comm_ns_exec_ipv6_ioctl
>     * netns_comm_ns_exec_ipv6_netlink

These reported failures got fixed on latest stable-rc 5.3.y after
dropping a patch [1].
The kernel warning is also gone now.

metadata:
  git branch: linux-5.3.y
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
  git commit: 75c9913bbf6e9e64cb669236571e6af45cddfd68

ref:
[PATCH AUTOSEL 5.3 12/33] blackhole_netdev: fix syzkaller reported issue
[1] https://lkml.org/lkml/2019/10/25/794

Best regards
Naresh Kamboju

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
