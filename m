Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B35F225AB6
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 11:03:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1AA7A3C4E12
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 11:03:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4D4213C2123
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 11:03:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DCAA41401A45
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 11:03:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 487EBB1D8;
 Mon, 20 Jul 2020 09:03:13 +0000 (UTC)
Date: Mon, 20 Jul 2020 11:03:05 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200720090305.GF11397@dell5510>
References: <20200710172044.21592-1-pvorel@suse.cz>
 <20200710172044.21592-3-pvorel@suse.cz>
 <5F155335.8080901@cn.fujitsu.com> <5F15551D.5050703@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5F15551D.5050703@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/7] tst_net.sh: Use ssh in LTP_RSH
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> testscripts/exportfs.sh, tcp_cmds/ftp/ftp01.sh and nfsv4/acl/runtest also
> use rsh command directly.

That's a sign of legacy code with questionable usability.

Although runltp-ng [1] has not been merged yet, I'm going to sent RFC patch to remove
exportfs.sh. I'll also send RFC to drop network/nfsv4 (NFS maintainers use their
own pynfs [2] anyway).

[1] https://github.com/metan-ucw/runltp-ng
[2] http://git.linux-nfs.org/?p=bfields/pynfs.git;a=summary

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
