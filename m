Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 292DA37C030
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 16:30:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E51C3C8A92
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 16:30:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 054ED3C55EB
 for <ltp@lists.linux.it>; Wed, 12 May 2021 16:30:27 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 65B8C1000A72
 for <ltp@lists.linux.it>; Wed, 12 May 2021 16:30:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BDDB0AEB6;
 Wed, 12 May 2021 14:30:26 +0000 (UTC)
Date: Wed, 12 May 2021 16:04:06 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YJvgVi5g+NePDeqE@yuki>
References: <20210512103052.9646-1-pvorel@suse.cz> <YJu/L3HssZY14vQa@yuki>
 <YJvW+spXh4za9v5p@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJvW+spXh4za9v5p@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
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
Cc: Alexey Kodanev <alexey.kodanev@oracle.com>,
 Feiyu Zhu <zhufy.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > I guess that the most safe variant at the moment would be pushing this
> > patch, then dropping the check completely after the release.
> I'm ok if we don't want to bother with this (and with patch for
> netns_netlink.c [1]). But if you're ok to fix it for the release,
> I'd send new patch which fixes it similar way as the fix for netns_netlink.c:
> here just run "ip netns" to detect required support instead of checking version
> info.

I do not have a strong opinion here. If you want to spend time fix these
tests for this release I'm fine with that as long as the fix is minimal
and works fine.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
