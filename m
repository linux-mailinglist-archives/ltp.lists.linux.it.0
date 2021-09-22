Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADBC4143FF
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Sep 2021 10:45:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E608B3C808E
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Sep 2021 10:45:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 444523C185C
 for <ltp@lists.linux.it>; Wed, 22 Sep 2021 10:45:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6729D1400BE2
 for <ltp@lists.linux.it>; Wed, 22 Sep 2021 10:45:50 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 91CE0201C5;
 Wed, 22 Sep 2021 08:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632300349;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WKr6wTvBsqBQmMHpNcWarDN56Ue3U6pggap/fVhLQ5M=;
 b=e/LxdHfe+nkw4xzqKmN7rdYyREiEcRAiW++Gi4kxer7Z6sbF/sBT2Iflo2OKUD4bo+Pqvk
 X+BPg4oyKqj5r2INJ/5Aw9fk/kMCyWf/bk6KTj/5NHYzg+wH9uM9dsfpR9Kpi+51JJ8bfP
 ZToDMbIL4cFH2c9vjB6K7JXKSdHK29U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632300349;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WKr6wTvBsqBQmMHpNcWarDN56Ue3U6pggap/fVhLQ5M=;
 b=58xg6vsKeWxXcgYORrcAX4i6i5aoPV1AG1RNrqf1OjCVcItBcFRSlzOGYsmXrUuyHhQRR9
 FiWij6uBNOoYVjCQ==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 4DB91A3B90;
 Wed, 22 Sep 2021 08:45:48 +0000 (UTC)
References: <20210921130127.24131-1-rpalethorpe@suse.com>
 <CAK8P3a29ycNqOC_pD-UUtK37jK=Rz=nik=022Q1XtXr6-o6tuA@mail.gmail.com>
 <87o88mkor1.fsf@suse.de> <87lf3qkk72.fsf@suse.de>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Arnd Bergmann <arnd@arndb.de>
In-reply-to: <87lf3qkk72.fsf@suse.de>
Date: Wed, 22 Sep 2021 09:45:42 +0100
Message-ID: <87ilytkngp.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] ia32 signed long treated as x64 unsigned int by __ia32_sys*
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
Reply-To: rpalethorpe@suse.de
Cc: linux-aio <linux-aio@kvack.org>, y2038
 Mailman List <y2038@lists.linaro.org>, Linux API <linux-api@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Deepa Dinamani <deepa.kernel@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Richard Palethorpe <rpalethorpe@suse.de> writes:

> Richard Palethorpe <rpalethorpe@suse.de> writes:
>
>> Hello Arnd,
>>
>> Arnd Bergmann <arnd@arndb.de> writes:
>>
>>> On Tue, Sep 21, 2021 at 3:01 PM Richard Palethorpe <rpalethorpe@suse.com> wrote:
>>>>
>>>> The LTP test io_pgetevents02 fails in 32bit compat mode because an
>>>> nr_max of -1 appears to be treated as a large positive integer. This
>>>> causes pgetevents_time64 to return an event. The test expects the call
>>>> to fail and errno to be set to EINVAL.
>>>>
>>>> Using the compat syscall fixes the issue.
>>>>
>>>> Fixes: 7a35397f8c06 ("io_pgetevents: use __kernel_timespec")
>>>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>>>
>>> Thanks a lot for finding this, indeed there is definitely a mistake that
>>> this function is defined and not used, but I don't yet see how it would
>>> get to the specific failure you report.
>>>
>>> Between the two implementations, I can see a difference in the
>>> handling of the signal mask, but that should only affect architectures
>>> with incompatible compat_sigset_t, i.e. big-endian or
>>> _COMPAT_NSIG_WORDS!=_NSIG_WORDS, and the latter is
>>> never true for currently supported architectures. On x86, there is
>>> no difference in the sigset at all.
>>>
>>> The negative 'nr' and 'min_nr' arguments that you list as causing
>>> the problem /should/ be converted by the magic
>>> SYSCALL_DEFINE6() definition. If this is currently broken, I would
>>> expect other syscalls to be affected as well.
>>
>> That is what I thought, but I couldn't think of another explanation for
>> it.
>>
>>>
>>> Have you tried reproducing this on non-x86 architectures? If I
>>> misremembered how the compat conversion in SYSCALL_DEFINE6()
>>> works, then all architectures that support CONFIG_COMPAT have
>>> to be fixed.
>>>
>>>          Arnd
>>
>> No, but I suppose I can try it on ARM or PowerPC. I suppose printing the
>> arguments would be a good idea too.
>
> It appears it really is failing to sign extend the s32 to s64. I added
> the following printks
>
> modified   fs/aio.c
> @@ -2054,6 +2054,7 @@ static long do_io_getevents(aio_context_t ctx_id,
>  	long ret = -EINVAL;
>  
>  	if (likely(ioctx)) {
> +		printk("comparing %ld <= %ld\n", min_nr, nr);
>  		if (likely(min_nr <= nr && min_nr >= 0))
>  			ret = read_events(ioctx, min_nr, nr, events, until);
>  		percpu_ref_put(&ioctx->users);
> @@ -2114,6 +2115,8 @@ SYSCALL_DEFINE6(io_pgetevents,
>  	bool interrupted;
>  	int ret;
>  
> +	printk("io_pgetevents(%lx, %ld, %ld, ...)\n", ctx_id, min_nr, nr);
> +
>  	if (timeout && unlikely(get_timespec64(&ts, timeout)))
>  		return -EFAULT;
>
> Then the output is:
>
> [   11.252268] io_pgetevents(f7f19000, 4294967295, 1, ...)
> [   11.252401] comparing 4294967295 <= 1
> io_pgetevents02.c:114: TPASS: invalid min_nr: io_pgetevents() failed as expected: EINVAL (22)
> [   11.252610] io_pgetevents(f7f19000, 1, 4294967295, ...)
> [   11.252748] comparing 1 <= 4294967295
> io_pgetevents02.c:103: TFAIL: invalid max_nr: io_pgetevents() passed unexpectedly

and below is the macro expansion for the automatically generated 32bit to
64bit io_pgetevents. I believe it is casting u32 to s64, which appears
to mean there is no sign extension. I don't know if this is the expected
behaviour?

For the manually written compat version we cast back to s32 which is
what fixes the issue.

long __ia32_sys_io_pgetevents(const struct pt_regs *regs) {
  return __se_sys_io_pgetevents((unsigned int)regs->bx, (unsigned int)regs->cx,
                                (unsigned int)regs->dx, (unsigned int)regs->si,
                                (unsigned int)regs->di, (unsigned int)regs->bp);
}
static long __se_sys_io_pgetevents(
    __typeof(__builtin_choose_expr(
        (__builtin_types_compatible_p(typeof((aio_context_t)0), typeof(0LL)) ||
         __builtin_types_compatible_p(typeof((aio_context_t)0), typeof(0ULL))),
        0LL, 0L)) ctx_id,
    __typeof(__builtin_choose_expr(
        (__builtin_types_compatible_p(typeof((long)0), typeof(0LL)) ||
         __builtin_types_compatible_p(typeof((long)0), typeof(0ULL))),
        0LL, 0L)) min_nr,
    __typeof(__builtin_choose_expr(
        (__builtin_types_compatible_p(typeof((long)0), typeof(0LL)) ||
         __builtin_types_compatible_p(typeof((long)0), typeof(0ULL))),
        0LL, 0L)) nr,
    __typeof(__builtin_choose_expr(
        (__builtin_types_compatible_p(typeof((struct io_event *)0),
                                      typeof(0LL)) ||
         __builtin_types_compatible_p(typeof((struct io_event *)0),
                                      typeof(0ULL))),
        0LL, 0L)) events,
    __typeof(__builtin_choose_expr(
        (__builtin_types_compatible_p(typeof((struct __kernel_timespec *)0),
                                      typeof(0LL)) ||
         __builtin_types_compatible_p(typeof((struct __kernel_timespec *)0),
                                      typeof(0ULL))),
        0LL, 0L)) timeout,
    __typeof(__builtin_choose_expr(
        (__builtin_types_compatible_p(typeof((const struct __aio_sigset *)0),
                                      typeof(0LL)) ||
         __builtin_types_compatible_p(typeof((const struct __aio_sigset *)0),
                                      typeof(0ULL))),
        0LL, 0L)) usig)
{
  long ret = __do_sys_io_pgetevents(
      (aio_context_t)ctx_id, (long)min_nr, (long)nr, (struct io_event *)events,
      (struct __kernel_timespec *)timeout, (const struct __aio_sigset
  *)usig);

  ...
}

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
