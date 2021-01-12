Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C71892F2CDA
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 11:30:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C04D3C5FBF
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 11:30:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 534183C2698
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 11:30:01 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CCBBE200B0C
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 11:30:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DED69ADE0
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 10:29:59 +0000 (UTC)
Date: Tue, 12 Jan 2021 11:29:58 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <X/16JnZ4MmA6PINI@pevik>
References: <X9tMlNxJbwCWIRnO@yuki.lan> <X/Wq28noppvB5MGw@yuki.lan>
 <X/b1tUeAVrTpVQBJ@yuki.lan> <X/xi2iBZZFixnCQo@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/xi2iBZZFixnCQo@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] Holidays and LTP release
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

Hi Cyril,

> Hi!
> As I anounced last week please consider git frozen for anything but
> important fixes now.

I was thinking about speedup if-mtu-change.sh [1], but unless Alexey ack that it
might be better to wait after the release.

I planned to merge two rewrites to new API (v2 get_mempolicy [2] and v3
multicast packed flood [3]), which are ready, but as there is a git freeze it
can wait after the release.

I'd also like to add some docs to ima_tpm.sh setup when running with
ima_policy=tcb on real HW, if I figure out what's needed.

I might have look into sigwaitinfo01 problems on MUSL.
There is a patch which needs to be rebased [4] (tests and libsigwait were
rewritten to new API). But simply remove all testcases because they does not
work on MUSL is probably no-go. I guess the problem is with using (void *)1 in
in various sigwaitinfo tests in test_bad_address{,2,3}()
(libs/libltpsigwait/sigwait.c).
Maybe use tst_get_bad_addr(NULL) here?

> Also if you haven't done so yet, please test latest git head now and
> report any problems you find.
Going to.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20210107120247.31465-1-pvorel@suse.cz/
[2] https://patchwork.ozlabs.org/project/ltp/patch/20210106181735.1588-1-pvorel@suse.cz/
[3] https://patchwork.ozlabs.org/project/ltp/list/?series=216562&state=*
[4] https://patchwork.ozlabs.org/project/ltp/patch/20200529014448.3815022-1-raj.khem@gmail.com/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
