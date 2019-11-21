Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A5010599A
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 19:34:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4CCA63C22D4
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 19:34:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D073C3C1C8B
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 19:34:05 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6978A601AE5
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 19:34:04 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 75054AFB7;
 Thu, 21 Nov 2019 18:34:03 +0000 (UTC)
Date: Thu, 21 Nov 2019 19:34:01 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191121183401.GA20889@dell5510>
References: <20191106073621.58738-1-lkml@jv-coder.de>
 <365bdf26-4e52-2159-17cd-52f2fb22e7fd@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <365bdf26-4e52-2159-17cd-52f2fb22e7fd@jv-coder.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> > diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
> > index aadaae4d2..7440e1eee 100755
> > --- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
> > +++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
> > @@ -124,6 +124,7 @@ signal_memcg_process()
> >   	local usage_start=$(cat ${path}memory.usage_in_bytes)
> >   	kill -s USR1 $pid 2> /dev/null
> > +	TST_CHECKPOINT_WAIT 1
> Actually this does not work like this, because some of the
> tests trigger the oom killer and TEST_CHECKPOINT_WAIT calling
> tst_checkpoint uses ROD. Is it ok to directly call

> tst_checkpoint wait 10000 "1"

> and ignore the result here?

> BTW: Is there no such thing like TST_CHECKPOINT in the new
> shell test library?
No, there is no support for TST_CHECKPOINT in shell.
To be honest I have no idea how to implement it.
It could be done in some form of checking some file content and in a loop and
sleep in the meantime (ineffective), but sync between C and shell API is IMHO
not possible.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
