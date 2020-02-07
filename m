Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF92D155447
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 10:05:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 742033C23DC
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 10:05:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id D9B543C2368
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 10:05:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C89761A027AD
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 10:05:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C1D40AC79
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 09:05:20 +0000 (UTC)
Date: Fri, 7 Feb 2020 10:05:19 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20200207090519.GC8415@dell5510>
References: <20200206162722.18945-1-pvorel@suse.cz>
 <20200207081854.GU14282@dhcp-12-102.nay.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207081854.GU14282@dhcp-12-102.nay.redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] syscalls/fsmount01: Add test for new mount
 API v5.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Zorro,

> > I implemented fixes for "newmount" Zorro's patch, hoping this is a final
> > version. Changes are minor, asked by Cyril + rename test to fsmount01,

BTW I forget to add v5 to be clear that it's a follow up of Zorro's v4 [1].

> Thanks so much!
You're welcome :). We thank you to finally start writing tests for new syscalls,
we need to test all new ones.

> I think I shouldn't ack a patch from myself. So I just ask a small question.
> I noticed that you decide to use the name as "syscalls/fsmount/fsmount01".
> I hope the "fsmount" is a general name, which doesn't mean fsmount() itself.
> Due to I might write other cases don't aim to test fsmount(). E.g.
> open_tree() and move_tree(). But I will name the name as fsmount?? . I hope
> that meets your expectation.
I chose fsmount as I agreed with Cyril [2] that fsmount() is the main syscall
tested (although your test is testing all of them). If you look in various tests
in LTP, they often use many syscalls, but just one of them is the main one (e.g.
testcases/kernel/syscalls/mount/mount0*.c and testcases/kernel/syscalls/umount2/umount2_0*.c
are using both mount() and umount()), but we always use real syscalls name.

So when you test specifically just open_tree(), use that name.
I was thinking whether to change this approach in current topic (new mount API
from v5.2), but IMHO from long term perspective people search for particular
tests names, so newmount would hide it. But we can always change it in the
future.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/patch/1224056/
[2] https://lists.linux.it/pipermail/ltp/2020-January/015068.html

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
