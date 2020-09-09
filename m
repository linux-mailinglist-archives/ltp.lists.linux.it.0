Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1504C263722
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 22:11:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BDF623C2A76
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 22:11:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 96C393C180A
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 22:11:20 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9FBF31400153
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 22:11:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99507AF48
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 20:11:34 +0000 (UTC)
Date: Wed, 9 Sep 2020 22:11:17 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200909201117.GB27395@dell5510>
References: <20200908073138.GB2475@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200908073138.GB2475@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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

> As usual we should start preparing for a next release.

...
> What else should go in?

I haven't done review of Amir's fanotify tests for v5.9, but on first look they
look ok
https://patchwork.ozlabs.org/project/ltp/list/?series=200606

How about Richie's Wrapper for Syzkaller reproducers?
https://patchwork.ozlabs.org/project/ltp/patch/20200610072928.1331-1-rpalethorpe@suse.com/

I wanted to post docparser patch in next few days. But that will be probably too
late for including in this release.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
