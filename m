Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B1C109871
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 06:08:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 36DC93C220C
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 06:08:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C1BEC3C131B
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 06:08:03 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F0E841000CE5
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 06:08:02 +0100 (CET)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 9FB699F655;
 Tue, 26 Nov 2019 05:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1574744881; bh=kwK7rN+8clAEosEpLchjZitDyv/eJQyEi2Npfj5r/JA=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=qWb0T3ZSCWpXIAiq4IaQTn5A6lx2UzsNXmgIaxS5ETSaM7Q4e6hy1Iv6o3nKBmhkE
 tqgYkNKOXURHzJ/VrvbQewUNR6mRoOOXwgNV9GWuTaVco454ZLSBCcup7CvCi7gP02
 gRt3+ztqOvNzD6DOdAzvtWEl5LVWdgD8v75fl1MM=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20191106073621.58738-1-lkml@jv-coder.de>
 <365bdf26-4e52-2159-17cd-52f2fb22e7fd@jv-coder.de>
 <20191125132957.GC8703@rei.lan>
 <2e5756af-d7ef-7919-da6b-46e7fbf3cb66@jv-coder.de>
 <20191125153245.GA15129@rei.lan>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <5f914dce-92b7-9070-6230-d76b73d7da34@jv-coder.de>
Date: Tue, 26 Nov 2019 06:08:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191125153245.GA15129@rei.lan>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
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


>> We run the test with timeout=1000 now and it works fine. It is simpler
>> than thinking about any
>> other synchronization technique. The additonal wait adds less than 30
>> for all tests, that use memcg_process.
> 30 what? seconds? That is unfortunatelly not acceptable.
Yes 30 seconds. Why shouldn't that be not acceptable? It is nothing compared
to the runtime of other tests.
>
> Actually having a closer look at the code there is a loop that checks
> every 100ms if:
>
> 1) the process is still alive
> 2) if there was increase in usage_in_bytes in the corresponding cgroup
>
> So what is wrong with the original code?
Please reread the description of my initial post. The problem is the 
signal race
not the check. The checkpoint system prevents the race. There is no way 
around
a solid synchronization.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
