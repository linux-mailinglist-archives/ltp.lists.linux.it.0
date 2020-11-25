Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C4A2C3F1F
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 12:32:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ECC2B3C2E2A
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 12:32:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B32923C2D08
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 12:32:39 +0100 (CET)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 52436600B01
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 12:32:39 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1606303958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FS0NAipJx+GT0KkrB1JBfgsiLpdyiaA0zLc4pbnB/X8=;
 b=0GdFsoAnLJHE+V8S/vbr6XgeEGNkZxH+Ook202+lE1PWUlZYrokPydiI+FUt9mAq+b2F1k
 ebna9KxeCj4yCrNegw7FOVc8OL3qkGLsFNj2PRkhwgrIOoJmrM2XxSXfVFsqNOASs35zP/
 at2vkVmgN2ayEYxt2Elnguby2EG/Kn4upDlIDbko4uQWXFxl+Xli+5aNtXg3QRNnbUcODE
 FYxWmYecC3OPgtA/L8/yfMd8vnCiA962LRFjL6W6oPa4qeGqx7YCiKz9w37T7NJB4N57KF
 gxK+yMaekT9T/oyyy0jS4ROvQO0UqPpYqq9qHtj+L9ilWgrMz3GW9jrdwGRuUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1606303958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FS0NAipJx+GT0KkrB1JBfgsiLpdyiaA0zLc4pbnB/X8=;
 b=B6Jrb0uuWpNUJFJR1bo4O39e4R0AOqZ1PciMJezEKujch9H6Qo+AjEDp4VmmhnIdGSAGNN
 mDf/MTH9ymRqW4CA==
To: Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>
In-Reply-To: <20201124153837.GA24470@yuki.lan>
References: <20201123083137.11575-1-liwang@redhat.com>
 <20201124153837.GA24470@yuki.lan>
Date: Wed, 25 Nov 2020 12:32:38 +0100
Message-ID: <875z5tllih.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls: avoid time() using
 __cvdso_gettimeofday in use-level's VDSO
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
Cc: Arnd Bergmann <arnd@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Carlos O'Donell <carlos@redhat.com>,
 John Stultz <john.stultz@linaro.org>,
 "Michael Kerrisk \(man-pages\)" <mtk.manpages@gmail.com>,
 Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Cyril,

On Tue, Nov 24 2020 at 16:38, Cyril Hrubis wrote:
> Thomas can you please have a look? It looks like we can get the SysV IPC
> ctime to be one second off compared to what we get from realtime clock.
>
> Do we care to get this fixed in kernel or should we fix the tests?

See below.

>> This shmctl01 test detect the time as the number of seconds twice
>> (before and after) the shmget() instruction, then it verifies
>> whether the 'struct shmid_ds ds' gets data correctly. But here it
>> shows 'ds->ctime' out of the seconds range (1604298586, 1604298586),
>> 
>> The reason is that shmget()/msgsnd() always use ktime_get_real_second
>> to get real seconds, but time() on aarch64 via gettimeofday() or (it
>> depends on different kernel versions) clock_gettime() in use-level's
>> VDSO to return tv_sec.
>> 
>> time()
>>   __cvdso_gettimeofday
>>    ...
>>      do_gettimeofday
>>        ktime_get_real_ts64
>>         timespc64_add_ns
>> 
>> Situation can be simplify as difference between ktime_get_real_second
>> and ktime_get_real_ts64. As we can see ktime_get_real_second return
>> tk->xtime_sec directly, however
>> 
>> timespc64_add_ns more easily add 1 more second via "a->tv_sec +=..."
>> on a virtual machine, that's why we got occasional errors like:
>> 
>> shmctl01.c:183: TFAIL: SHM_STAT: shm_ctime=1604298585, expected <1604298586,1604298586>
>> ...
>> msgsnd01.c:59: TFAIL: msg_stime = 1605730573 out of [1605730574, 1605730574]
>> 
>> Here we propose to use '__NR_time' to invoke syscall directly that makes
>> test all get real seconds via ktime_get_real_second.

This is a general problem and not really just for this particular test
case.

Due to the internal implementation of ktime_get_real_seconds(), which is
a 2038 safe replacement for the former get_seconds() function, this
accumulation issue can be observed. (time(2) via syscall and newer
versions of VDSO use the same mechanism).

     clock_gettime(CLOCK_REALTIME, &ts);
     sec = time();
     assert(sec >= ts.tv_sec);

That assert can trigger for two reasons:

 1) Clock was set between the clock_gettime() and time().

 2) The clock has advanced far enough that:

    timekeeper.tv_nsec + (clock_now_ns() - last_update_ns) > NSEC_PER_SEC

#1 is just a property of clock REALTIME. There is nothing we can do
   about that.

#2 is due to the optimized get_seconds()/time() access which avoids to
   read the clock. This can happen on bare metal as well, but is far
   more likely to be exposed on virt.

The same problem exists for CLOCK_XXX vs. CLOCK_XXX_COARSE

     clock_gettime(CLOCK_XXX, &ts);
     clock_gettime(CLOCK_XXX_COARSE, &tc);
     assert(tc.tv_sec >= ts.tv_sec);

The _COARSE variants return their associated timekeeper.tv_sec,tv_nsec
pair without reading the clock. Same as #2 above just extended to clock
MONOTONIC.

There is no way to fix this except giving up on the fast accessors and
make everything take the slow path and read the clock, which might make
a lot of people unhappy.

For clock REALTIME #1 is anyway an issue, so I think documenting this
proper is the right thing to do.

Thoughts?

Thanks,

        tglx

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
