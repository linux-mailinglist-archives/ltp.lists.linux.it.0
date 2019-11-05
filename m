Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC91EF679
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 08:35:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E9F393C233A
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 08:35:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C75EA3C22C1
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 08:35:06 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D4AAE2003BB
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 08:35:04 +0100 (CET)
Received: from localhost (host6-102.lan-isdn.imaginet.fr [195.68.6.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E04EF217F4;
 Tue,  5 Nov 2019 07:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572939302;
 bh=K1BKpJQLMtnH3+V92uee7SW/Z+pmSQfrcqeTyN7QlB0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eghPibRXlsACFFKrYkascPxzVND7Aiuqaf9uVBhvkHW5YFgjXLIJw1fi5B+JqEn2J
 9Ap1s3dpd6jwGSXdExj1GfwpDBNlhsNN9V3qwx+NLM+UsQ+aRJnfooJHREyAUXMm3j
 G39z1/GxCJimZ8wNJuv9uuLJ6rRp5bamdOGU6ExY=
Date: Tue, 5 Nov 2019 08:34:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20191105073459.GB2588562@kroah.com>
References: <CA+G9fYsWTFQZTHXUDPToaepnKGBoh61SsA_8SHcYgYZXN_L+mg@mail.gmail.com>
 <CA+G9fYu+6A3pYQGs2rydYtHNSCf1t9+OTRqrZeCbpc2ARLx2zA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYu+6A3pYQGs2rydYtHNSCf1t9+OTRqrZeCbpc2ARLx2zA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
 lkft-triage@lists.linaro.org, linux- stable <stable@vger.kernel.org>,
 Basil Eljuse <Basil.Eljuse@arm.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Nov 05, 2019 at 09:44:39AM +0530, Naresh Kamboju wrote:
> Hi Sasha and Greg,
> 
> On Mon, 4 Nov 2019 at 20:59, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > Linux stable rc 5.3 branch running LTP reported following test failures.
> > While investigating these failures I have found this kernel warning
> > from boot console.
> > Please find detailed LTP output log in the bottom of this email.
> >
> > List of regression test cases:
> >   ltp-containers-tests:
> >     * netns_breakns_ip_ipv6_ioctl
> >     * netns_breakns_ip_ipv6_netlink
> >     * netns_breakns_ns_exec_ipv6_ioctl
> >     * netns_breakns_ns_exec_ipv6_netlink
> >     * netns_comm_ip_ipv6_ioctl
> >     * netns_comm_ip_ipv6_netlink
> >     * netns_comm_ns_exec_ipv6_ioctl
> >     * netns_comm_ns_exec_ipv6_netlink
> 
> These reported failures got fixed on latest stable-rc 5.3.y after
> dropping a patch [1].

What is the subject of the patch?

> The kernel warning is also gone now.
> 
> metadata:
>   git branch: linux-5.3.y
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>   git commit: 75c9913bbf6e9e64cb669236571e6af45cddfd68

The -rc tree is rebased all the time, can I get a "real" subject line to
get a chance to figure out what you are trying to refer to here?

> ref:
> [PATCH AUTOSEL 5.3 12/33] blackhole_netdev: fix syzkaller reported issue
> [1] https://lkml.org/lkml/2019/10/25/794

lore.kernel.org is much more reliable :)

thanks,

greg k-h

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
