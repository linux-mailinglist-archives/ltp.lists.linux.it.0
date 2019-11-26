Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EE8109E1F
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 13:39:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BEDE13C207C
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 13:39:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 068873C1454
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 13:39:13 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 063A31A011DB
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 13:39:12 +0100 (CET)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id CEE2A9F655;
 Tue, 26 Nov 2019 12:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1574771951; bh=dJkiNWDRBuzO4MrYwGPo/oXqarMdgd+ql0TmO2ee+2Y=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=py/XmCrwTUijsdhMS/b18JXApbcorl4AlD51XKWdDsmAi72Vy+JK2K4yluyt/OIas
 A4cWzxy9QEpyVsYDbg75cm+fqOxflkPSn+dtjdlwxGK6EoDmc2nHuCEHKFSU2bsVtG
 EqMZl7YaLkWFdUHiPNO8sKEGsji3D5+ksvUh/isI=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20191106073621.58738-1-lkml@jv-coder.de>
 <365bdf26-4e52-2159-17cd-52f2fb22e7fd@jv-coder.de>
 <20191125132957.GC8703@rei.lan>
 <2e5756af-d7ef-7919-da6b-46e7fbf3cb66@jv-coder.de>
 <20191125153245.GA15129@rei.lan>
 <5f914dce-92b7-9070-6230-d76b73d7da34@jv-coder.de>
 <20191126121038.GC16922@rei.lan>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <42d40727-f631-39ff-fdc0-576e13336a4d@jv-coder.de>
Date: Tue, 26 Nov 2019 13:39:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191126121038.GC16922@rei.lan>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


>> Yes 30 seconds. Why shouldn't that be not acceptable? It is nothing compared
>> to the runtime of other tests.
> I have written a blog post that partly applies to this case, see:
>
> https://people.kernel.org/metan/why-sleep-is-almost-never-acceptable-in-tests
I know where you are coming from and it is basically the same as my own 
opinion.
The difference is: When I look at ltp I see a runtime of more than 6 
hours, looking at the
controller test alone it is more than 4 hours. This puts 30 seconds into 
a very differenet
perspective than looking at only syscall tests. (In the testrun I looked 
at it is around 13 minutes).
That is why I don't care about 30 seconds in this case.

>
> So the problem is that sometimes the program has not finished handling
> the first signal and we are sending another, right?
>
> I guess that the proper solution would be avoding the signals in the
> first place. I guess that we can estabilish two-way communication with
> fifos, which would also mean that we would get notified as fast as the
> child dies as well.
Correct. Using fifos is probably a viable solution, but it would require 
library work,
because otherwise the overhead is way too big.
Another thing I can think of is extending tst_checkpoint wait to also 
watch a process
and stop waiting, if that process dies. This would be the simplest way 
to get good
synchronization and get rid of the sleep.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
