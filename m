Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D32E11297F
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Dec 2019 11:47:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E81123C2524
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Dec 2019 11:47:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DC84E3C2494
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 11:46:58 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 22E91209D59
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 11:46:57 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 67E1BB255
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 10:46:57 +0000 (UTC)
Date: Wed, 4 Dec 2019 11:46:55 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20191204104655.GA3852@dell5510>
References: <20191128163147.4377-1-mdoucha@suse.cz>
 <20191202032936.GA32335@dell5510>
 <b4489aba-9f59-ff44-e2b3-3af6d9cd3cb1@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4489aba-9f59-ff44-e2b3-3af6d9cd3cb1@suse.cz>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Unshare KSM pages before setting max_page_sharing
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

Hi,

> > BTW at least ksm01 will fail on VM host with running VMs,
> > but that's another story not related to this patch.

> > mem.c:251: FAIL: pages_shared is not 1 but 3629.
> > mem.c:251: FAIL: pages_sharing is not 98302 but 113789.
> > mem.c:251: FAIL: pages_volatile is not 0 but 12.
> > mem.c:251: FAIL: pages_unshared is not 1 but 48519.

> I'm aware of other KSM tests failing but the failures are rare and quite
> random so they'll be tricky to debug. The snippet you've sent looks like
> interference from another process running on the same VM but the
> failures I see in OpenQA look like some sort of race condition in kernel
> itself.
Yep, my failures are for sure different. I run the test on my workstation
(KVM host), after start of about 15 VMs. Before test was ok.
I haven't tested, but it should be ok when running on KVM guests.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
