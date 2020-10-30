Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6342B2A02E7
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Oct 2020 11:30:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E95C13C30DC
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Oct 2020 11:30:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E262E3C2467
 for <ltp@lists.linux.it>; Fri, 30 Oct 2020 11:30:40 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7672C1001394
 for <ltp@lists.linux.it>; Fri, 30 Oct 2020 11:30:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8DDF2B812
 for <ltp@lists.linux.it>; Fri, 30 Oct 2020 10:30:39 +0000 (UTC)
Date: Fri, 30 Oct 2020 11:31:16 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20201030103116.GA27262@yuki.lan>
References: <20201026164756.30556-1-mdoucha@suse.cz>
 <20201026164756.30556-5-mdoucha@suse.cz>
 <20201029155907.GC8378@yuki.lan> <20201029160222.GD8378@yuki.lan>
 <af6cdfdd-23e8-1593-9509-43685e4706c3@suse.cz>
 <20201029161714.GE8378@yuki.lan>
 <fbb52689-5797-7615-e4b8-a8bcabee09e8@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fbb52689-5797-7615-e4b8-a8bcabee09e8@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 04/19] Unify error handling in lib/safe_file_ops.c
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> These safe file functions could use some additional improvements but
> >> changing the return value is out of scope of my patchset. That would
> >> probably require reviewing and modifying some test code as well. The
> >> patchset is over 4000 lines long as is.
> > 
> > It's actually not since you are chaning the void functions to return
> > int, if you kept them void that would mean that it's out of scope.
> 
> Changing return type from void to int is fully backwards compatible
> because the return value is ignored everywhere anyway.

However it exposes suboptimal interface that shouldn't have been exposed
in the first place. So I would rather leave these to return void so that
no new code starts to depend on the current behavior.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
