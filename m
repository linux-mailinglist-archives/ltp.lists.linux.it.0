Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 471162AA6BD
	for <lists+linux-ltp@lfdr.de>; Sat,  7 Nov 2020 17:55:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05F563C53C7
	for <lists+linux-ltp@lfdr.de>; Sat,  7 Nov 2020 17:55:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 818DA3C2397
 for <ltp@lists.linux.it>; Sat,  7 Nov 2020 17:55:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1C800200903
 for <ltp@lists.linux.it>; Sat,  7 Nov 2020 17:55:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4E863AB8F;
 Sat,  7 Nov 2020 16:55:20 +0000 (UTC)
Date: Sat, 7 Nov 2020 17:55:18 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <20201107165518.GB10159@pevik>
References: <1603691317-22811-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5FA21AA9.9020208@cn.fujitsu.com> <20201106123604.GA30097@yuki.lan>
 <0bc685ce-1983-b900-787f-3d89e75ca48d@163.com>
 <20201106164742.GA6449@rei.lan>
 <f99d3484-f86d-dd8a-e64e-7d9d94533de4@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f99d3484-f86d-dd8a-e64e-7d9d94533de4@163.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] syscalls/sync01: Remove it
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> On 11/7/20 12:47 AM, Cyril Hrubis wrote:
> > Hi!
> > > I have a doubt after reading Xu's patch[1] and Martin's patch[2]:

> > > 1) Xu removed sync01 because sync() always return 0.
> > Actually sync() is defined as void function, so the tests were bogusly
> > checking the TST_RET value which haven't been set at all.

> Hi Cyril,

> Oops, I gave a wrong example. :-(

> On error, I just wonder if we need to check all return value(i.e. negative
> value except -1).

> IOW, Is it possible for syscall to get a error value which is not -1?
There are probably other examples, but I've found only these:

man malloc_get_state(3)

	If the implementation detects that state does not point to a correctly
	formed data structure, malloc_set_state() returns -1.
	If the implementation detects that the version of the data structure
	referred to by state is a more recent version than this implementation knows
	about, malloc_set_state() returns -2.

man mmap(2)
	On error, the value MAP_FAILED (that is, (void *) -1) is returned.

> Best Regards,

> Xiao Yang


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
