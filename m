Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B47CD108FEC
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Nov 2019 15:29:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 719303C220C
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Nov 2019 15:29:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 68FBF3C07D6
 for <ltp@lists.linux.it>; Mon, 25 Nov 2019 15:29:03 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E7CCF200B84
 for <ltp@lists.linux.it>; Mon, 25 Nov 2019 15:29:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EC457AF59;
 Mon, 25 Nov 2019 14:28:59 +0000 (UTC)
Date: Mon, 25 Nov 2019 15:28:58 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191125142858.GA21715@dell5510>
References: <20191106073621.58738-1-lkml@jv-coder.de>
 <365bdf26-4e52-2159-17cd-52f2fb22e7fd@jv-coder.de>
 <20191121183401.GA20889@dell5510> <20191125131411.GB8703@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191125131411.GB8703@rei.lan>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] memcg_lib/memcg_process: Better synchronization
 of signal USR1
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
Cc: ltp@lists.linux.it, Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > No, there is no support for TST_CHECKPOINT in shell.

> Well there is actually. There is a tst_checkpoint helper that calls
> tst_reinit() to map the shared page to be used with futexes and then
> just calls the corresponding wake or wait function.
Great.
Joerg, sorry for being wrong, thanks Cyril for correction.

> And yes it has been used in the cgroup testcases to synchronize C
> helper that allocates memory and shell test that executes it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
