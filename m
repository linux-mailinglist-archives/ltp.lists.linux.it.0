Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C0137F411
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 10:31:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2EF053C4B92
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 10:31:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A19523C4AE3
 for <ltp@lists.linux.it>; Thu, 13 May 2021 10:31:27 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D6A10200FCA
 for <ltp@lists.linux.it>; Thu, 13 May 2021 10:31:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F088BAD1B;
 Thu, 13 May 2021 08:31:25 +0000 (UTC)
Date: Thu, 13 May 2021 10:05:06 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YJzdsnRv/5IZBt4r@yuki>
References: <9d5d4dc9-ab51-7218-23f3-2ec835210fcf@suse.cz>
 <YJvftrFCueG3TXPf@yuki> <609C8EBC.80409@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <609C8EBC.80409@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] syscalls/mallinfo01 test is broken
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> the mallinfo01 test is failing on some of our test machines because it
> >> makes wrong assumptions about how malloc() and free() will change the
> >> number of free chunks (ordblks). I recommend we remove the test from
> >> runfiles before the upcoming release and fix it later because part of
> >> the test scenario needs major redesign.
> >
> > I've started some pre-release testruns and I've seen some failures as
> > well. I guess that removing it from runtest file and fixing it after
> > release sounds sane at this point.
> This case fails because malloc uses fastbin blocks.
> So the fix has two ways
> 1) disable fastbin by using mallopt(M_MXFAST, 0)
> 2) use another mallinfo struct info3 to get free chunks, so compare 
> info3 and info2 ordblks member.

If you are going to fix this test please do so as fast as possible so
that we have enough time to test the fixed test.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
