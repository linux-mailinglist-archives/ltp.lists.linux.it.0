Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FC437BE2D
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 15:24:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 90C153C8A9E
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 15:24:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F22593C4C12
 for <ltp@lists.linux.it>; Wed, 12 May 2021 15:24:13 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 825361000F66
 for <ltp@lists.linux.it>; Wed, 12 May 2021 15:24:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B88CCB16B;
 Wed, 12 May 2021 13:24:11 +0000 (UTC)
Date: Wed, 12 May 2021 15:24:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJvW+spXh4za9v5p@pevik>
References: <20210512103052.9646-1-pvorel@suse.cz>
 <YJu/L3HssZY14vQa@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJu/L3HssZY14vQa@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] netns_helper.sh: Fix parsing recent iproute2
 versions
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Alexey Kodanev <alexey.kodanev@oracle.com>,
 Feiyu Zhu <zhufy.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> > diff --git a/testcases/kernel/containers/netns/netns_helper.sh b/testcases/kernel/containers/netns/netns_helper.sh
> > index a5b77a0aa..4dac0e306 100755
> > --- a/testcases/kernel/containers/netns/netns_helper.sh
> > +++ b/testcases/kernel/containers/netns/netns_helper.sh
> > @@ -47,16 +47,21 @@ IFCONF_IN6_ARG=

> >  tst_check_iproute()
> >  {
> > -	local cur_ipver="$(ip -V)"
> > -	local spe_ipver="$1"
> > +	local current_ver="$(ip -V)"
> > +	local expected_ver="111010"

> So if I'm reading this right, this is 2010 again. I wonder if we can
> just remove this check as well.
Thanks for your input. FYI it's about iproute2 v3.0.0 (2011).

> I guess that the most safe variant at the moment would be pushing this
> patch, then dropping the check completely after the release.
I'm ok if we don't want to bother with this (and with patch for
netns_netlink.c [1]). But if you're ok to fix it for the release,
I'd send new patch which fixes it similar way as the fix for netns_netlink.c:
here just run "ip netns" to detect required support instead of checking version
info.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20210512100746.5907-1-pvorel@suse.cz/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
