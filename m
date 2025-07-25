Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD088B12125
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jul 2025 17:45:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5C5733CCEE5
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jul 2025 17:45:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 618063C6907
 for <ltp@lists.linux.it>; Fri, 25 Jul 2025 17:45:09 +0200 (CEST)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 35F4C600629
 for <ltp@lists.linux.it>; Fri, 25 Jul 2025 17:45:06 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1753458305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zfNlU9QkQSDk6X3acZW9Zv6watdmS4XLb2lpyLgX3PU=;
 b=nWi+22jj/D7vpJ3jHZNLznk1KJL9waj+gQWBvee9c3DCDjBGRQxnd34ePojIYdP6v+eVKG
 yG5tj6U0W7XvzcafeahhiJ7DsZKZL6kJKmzMVL+Ks4v2x2urTkyCLbR1OnkDjrqoOl6sj+
 VnOF6P3Ga+8BpoAwTI8VywKIdWY0K+7xbhld/p0uekv7pnRBIEx6fFFyji+bMunGgJuuVR
 URcoNjbaLEWjMDmaTrtJMO4834tjUkaAgIjqQOLkccuir0WvwA/yq2VibB7phjMZHWuSQX
 g2prDMKR6GuQEP0js+MSZVdBI+cCC7zeSkfA3PhRO2hIPyB1B09Vv+ZLZ/v7ww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1753458305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zfNlU9QkQSDk6X3acZW9Zv6watdmS4XLb2lpyLgX3PU=;
 b=2wlev3Mb1+z/3Pnnum1fsrCZ/wKE+6fI5t7UzhlvwaPmKxn6SEQEbGzJg3YvvNkBEQ1RKj
 qNo7Fzzu1wV4ZADg==
To: Oliver Sang <oliver.sang@intel.com>
In-Reply-To: <aINKAQt3qcj2s38N@xsang-OptiPlex-9020>
References: <202507231021.dcf24373-lkp@intel.com> <87a54usty4.ffs@tglx>
 <aINKAQt3qcj2s38N@xsang-OptiPlex-9020>
Date: Fri, 25 Jul 2025 17:45:04 +0200
Message-ID: <87seikp94v.ffs@tglx>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [tip:locking/futex] [futex] 56180dd20c:
 BUG:sleeping_function_called_from_invalid_context_at_kernel/nsproxy.c
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
Cc: lkp@intel.com, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, oliver.sang@intel.com,
 oe-lkp@lists.linux.dev, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Oliver!

On Fri, Jul 25 2025 at 17:10, Oliver Sang wrote:
> On Wed, Jul 23, 2025 at 07:22:43PM +0200, Thomas Gleixner wrote:
>> > [  286.673775][   C97] BUG: sleeping function called from invalid context at kernel/nsproxy.c:233   <---- (1)
>> > [  286.673784][   C97] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 6748, name: oom03
>> > [  286.673787][   C97] preempt_count: 7ffffffe, expected: 0
>> 
>> Ooops. That's a corrupted preempt counter, which has underflown twice.
>> 
>> Can you please enable CONFIG_DEBUG_PREEMPT, so we can see where this
>> happens?
>
> after enable CONFIG_DEBUG_PREEMPT, the config is as attached
> config-6.16.0-rc5-00002-g56180dd20c19

Thank you for trying, but I just realized that it tells us only when it
underflows, but we don't see where the actual extra decrement happens
before that.

Can you please enable CONFIG_PREEMPT_TRACER and add

'trace_event=preemptirq:preempt_disable,preemptirq:preempt_enable ftrace_dump_on_oops'

to the kernel command line. The latter will dump the recorded
preempt_enable/disable events and we can pinpoint the function which is
responsible for that.

Thanks,

        tglx



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
