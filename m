Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F511041C1
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 18:09:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8E423C237D
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 18:09:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 1BD8A3C1824
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 18:09:54 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AE2A62017A4
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 18:09:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D3AC0B2805;
 Wed, 20 Nov 2019 17:09:49 +0000 (UTC)
Date: Wed, 20 Nov 2019 18:09:48 +0100
From: Petr Vorel <pvorel@suse.cz>
To: "Xu, Yang" <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191120170948.GA7010@dell5510>
References: <20191031152646.GA7078@dell5510>
 <1572612959-20577-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1572612959-20577-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191115155123.GA658@x230>
 <989b7cbfa4cf4d7bb65c9b7df45b8c37@G08CNEXMBPEKD04.g08.fujitsu.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <989b7cbfa4cf4d7bb65c9b7df45b8c37@G08CNEXMBPEKD04.g08.fujitsu.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/5] syscalls/quotactl01.c: Add Q_GETNEXQUOTA
 test
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

> >>  	TEST(quotactl(tc->cmd, tst_device->dev, *tc->id, tc->addr));
> >>+	if (TST_ERR == EINVAL) {
> >> +		tst_res(TCONF, "Current system doesn't support this cmd");
> >nit: cmd? Maybe something like "quotactl() syscall does not support this command"
> >or "quotactl() syscall does not support to %s", tc->des to follow other messages. I'd actually prefer to have some macro, which prints QCMD flags, but that's a detail which we can >ignore.
> I think we can add some info before each run (such as prctl02.c and copy_file_range02.c, make error cases more clear ), as below:
> 	tst_res(TINFO, "Test #%d: %s", n, tc->tname);  // this tname is a QCMD_string

+1.  It could use similar approach as it's in testcases/kernel/syscalls/mbind/mbind01.c

#define POLICY_DESC(x) .policy = x, .desc = #x
#define POLICY_DESC_TEXT(x, y) .policy = x, .desc = #x" ("y")"

static struct test_case tcase[] = {
	{
		POLICY_DESC(MPOL_DEFAULT),
		...
	},
	{
		POLICY_DESC_TEXT(MPOL_DEFAULT, "target exists"),

But I'd prefer to have it as a separate patch after v4 of this patchset is merged.
I'd prefer to finish v4 (I've already fixed small formatting things, I can fix
the rest of needed things myself).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
