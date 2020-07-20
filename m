Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5EA226D2F
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 19:36:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B91D13C62FA
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 19:36:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 4AE813C097D
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 19:36:09 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B2224601294
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 19:36:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2FE1EB6C1;
 Mon, 20 Jul 2020 17:36:14 +0000 (UTC)
Date: Mon, 20 Jul 2020 19:36:06 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <20200720173606.GB20642@dell5510>
References: <20200710172044.21592-1-pvorel@suse.cz>
 <20200710172044.21592-7-pvorel@suse.cz>
 <5F155DB2.8080709@cn.fujitsu.com> <20200720115345.GA21201@dell5510>
 <9a30538f-bb7b-3fb9-7102-2f75b2d7de8c@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a30538f-bb7b-3fb9-7102-2f75b2d7de8c@163.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 6/7] net/test: Add basic testing for
 tst_rhost_run
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

Hi Yang,

> > > Hi Petr,
> > > 1) Do you want to discard stderr as well? For example:
> > > -------------------------------------------------
> > > # which gre >/dev/null
> > > /usr/bin/which: no gre in
> > > (/opt/ltp/testcases/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/root/bin)
> > That's not needed because tst_rhost_run already redirect stderr to stdout.

> Hi Petr,

> I think you means tst_rhost_run -c 'which grep' >/dev/null rather than
> tst_rhost_run -c 'which grep > /dev/null'

> The current code just discard stdout, for example:

> -------------------------------------------------------

> [root@Fedora-30-workstation net]# ./tst_rhost_run.sh
> ...
> tst_rhost_run 1 TINFO: NETNS: ns_exec 3079 net,mnt sh -c " which gre >
> /dev/null || echo RTERR" 2>&1
> which: no gre in (./../../../../testcases/lib/:/usr/share/Modules/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/root/bin:/opt/ltp/testcases/bin)
I'm sorry, I accidentally tested on which version from debianutils which prints
also errors to stdout. which from GNU which (used in openSUSE/SLES, Fedora/RHEL)
prints errors to stderr => you're right stderr should be redirected.
On the other hand when not redirected, you can see PATH.


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
