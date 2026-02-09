Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DXH3KPjCiWkPCAUAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 09 Feb 2026 12:20:24 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F7A10E987
	for <lists+linux-ltp@lfdr.de>; Mon, 09 Feb 2026 12:20:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770636023; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=t9YIz51hro1Rhfd+CDWG9dIgZ51biuzp8vRTJtjkx0U=;
 b=LjdJMeElTeiysEJ1EyCkbewDbd6iRYvCrkXnajtzJ2gn0B1XqtVi028EM8FPa0kiCukH0
 U/PImq7or7p/McOM363m6ZldcSkfHbwmnCu8uqr+R7vwnZ3ScfebhgBFDH3W7kbbN6dHqdl
 aSOnASggAE0lwsLVGfsADgYXfYt/N0o=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 239543C99D6
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Feb 2026 12:20:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C0EB13C5E09
 for <ltp@lists.linux.it>; Mon,  9 Feb 2026 12:20:20 +0100 (CET)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 865F360027D
 for <ltp@lists.linux.it>; Mon,  9 Feb 2026 12:20:18 +0100 (CET)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CE2493F1F0
 for <ltp@lists.linux.it>; Mon,  9 Feb 2026 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1770636018;
 bh=ShUWit5Q2UjKylFs8q1DLaFvLOcLExp2OQbcM3atgJs=;
 h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To;
 b=TKx48UTAwQhaWsZWkMwa46rBNDxZma2xlmisju8rrRa0+EobL3TJk4yGX0Mo0SvSb
 BIz2DnScy+eaiSLPK5eFUy5ufCCdr4tM0Y1816HiuJOamjJw7ClNv0NP8NRqJ/bR/Z
 2S46Dmyi41C8y+4qQ9cDtjhFNhCxqzGVJ4W4yhbhp0y3bG5fvBpanzwGGHCs97mxeh
 gPpcaxRksCxJaGx0Dr3XJzpGsMUlnEI+6yISDm+mWZ4Ua36/ec14DrIaUvvvzhsqiK
 bntMJCDuZbB5S+uV1tWPZj+gFk6qRLchHhxRO4hiJXeOuSOdJcCh4xDQK4wLbUw7OV
 FuGHUmj/+hJBRwWtgKH4gB7W9nRjS9WAypUNwyW0qayDFMdlAQmlhEtqPDLm9HEfUL
 YD6PoNA77POmBGIJcu4jyZ+XzqVJXOOIrABRTIRSdglSTpDcAl1TmzvVISgZuGybOb
 kvhzPVycII19FlEl7ukr/toPhDo7EnZGk9Zl6ANmFQvVQdYwjB4O/j0UnTfDmf22IW
 +iZLQLYaHvBB0yUEnGSrhEflDbolt8qp8crScKvEVsuBf9gRAt+hxy7pxrYCkLXghy
 BNCZK/+UIl7X6BmJm1C4t0TH2wc4FeNigSOKGlsMBHMshLRYKamNBWc4d9l32lbICv
 0sl8Yc1EVY1BUvpZqjCWdzus=
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-29f2381ea85so75053915ad.0
 for <ltp@lists.linux.it>; Mon, 09 Feb 2026 03:20:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770636016; x=1771240816;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ShUWit5Q2UjKylFs8q1DLaFvLOcLExp2OQbcM3atgJs=;
 b=K8bcjC7KipBMfrWzcqDnt/jRmflGWOphXdhu/giVzXq85wOxin+fwZyZElu3S/CDSB
 lnJpsSZ7n0WrshT3CJX0l9FCxuiczKrSf8DkS3q7bOCBWeZ6STs3TlqTUVlRwZt1qqaz
 8ewiy1grUQnVZUvpVYFeMMbqlvU8bfKVUZxlcFtxfYVBR3pfu2mWE6Y2bL1FKm47dFnV
 LOOhfb3nOkWKD3s7z/70uuTQzXTPuhF3DdTrKul8m7n45MsWvgD7jGj7XvDDuEjCEzB2
 K0XTyPs/3B43PaBpxbKRLAsndP1B189j4EZbJgwU5mG0aDLwfy2EFDEtOzZ7+QLKdTrf
 cX6A==
X-Gm-Message-State: AOJu0YyyAUCbbDMlINffZnojFomQnip+1y5LP5XqVYTkKG/wRx4pRzSj
 WEwvDNJNv/qh2bgVGReBcB/48XqNHzOODJyjN+WiUPbJFZtFFUAXQiP//E0ZmmRFqEnsuyDn68r
 XrbFL1wNWAHdMCGuIyAMzgh3OTg494uUzWWQK3eEB0NRlU26xvcyAxeiQU+w15ppvWcEqMf3m91
 0gOeE=
X-Gm-Gg: AZuq6aIgUhnYMfR0eC5vSqfTsy0ywLNjnrOcxHdUQJi7cfyq77Sbm9ZoPytmqTwwCS/
 ZPkk7XT9rRW9pPJ2cbdY8UBb7Az9m2ngYHlT8CHd4xBNREQwCCYds+wgjYawc6w4n1gnbOVT1R7
 qCsmlFjX5ytV/gmJFUZ1xu4J+zyAsZ5EZN6wkOizTF7UM8pXOTwjU48o2FbAPmngqp9DhdXPZC7
 S8I0z2cknZrNRkFtAcSLrx93mHLME8ZPIKvNWOcEjBf41IKNqBZY+ffID1sORvKDI3y2LHUTX+n
 uo+CSaw7AEQnfKCD6+3EgEJulALrRhBLd/i1hodzaD4iG1NuhfaXCldBiN8U0XwJQk1USzIfzL6
 urv3a8YQeD4PEc6ZR4w2qAcpdmoSpUy6e/0anQU4=
X-Received: by 2002:a17:903:2983:b0:24b:24dc:91a7 with SMTP id
 d9443c01a7336-2a95196c7d9mr110297705ad.45.1770636016050; 
 Mon, 09 Feb 2026 03:20:16 -0800 (PST)
X-Received: by 2002:a17:903:2983:b0:24b:24dc:91a7 with SMTP id
 d9443c01a7336-2a95196c7d9mr110297545ad.45.1770636015664; 
 Mon, 09 Feb 2026 03:20:15 -0800 (PST)
Received: from ?IPV6:2001:67c:1560:8007::aac:c224?
 ([2001:67c:1560:8007::aac:c224]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a952222611sm100704025ad.90.2026.02.09.03.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 03:20:15 -0800 (PST)
Message-ID: <46bdaf39-4d82-4b33-94c6-0ef8525ffaf1@canonical.com>
Date: Mon, 9 Feb 2026 22:20:03 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <pvorel@suse.cz>
References: <20260207145942.299366-1-changwei.zou@canonical.com>
 <20260209075146.GA450151@pevik>
Content-Language: en-US
In-Reply-To: <20260209075146.GA450151@pevik>
X-Spam-Status: No, score=2.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,UPPERCASE_URI,WEIRD_PORT shortcircuit=no autolearn=disabled
 version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH] lapi/tls: reserve pre-TCB space to avoid
 undefined behavior in clone10.c
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
From: Changwei Zou via ltp <ltp@lists.linux.it>
Reply-To: Changwei Zou <changwei.zou@canonical.com>
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[canonical.com:s=20251003];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[changwei.zou@canonical.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,canonical.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,linux.it:url,lists.linux.it:dkim]
X-Rspamd-Queue-Id: E8F7A10E987
X-Rspamd-Action: no action

Hi Petr,
With the original upstream LTP,
I ran clone10 -i 1000 on three machines (including AArch64 and AMD64), 
and it failed on all of them.
This suggests there may be another bug that we still need to identify.
Thank you very much for your invaluable information.
Kind regards,
Changwei
*1. On an AArch64 cloud instance*
```sh
azure@clone10-aarch64-kcp:~/orig/ltp$ 
./testcases/kernel/syscalls/clone/clone10-i1000
clone10.c:68: TPASS:Parent(PID: 106163,TID:106163): TLS value correct: 100
clone10.c:48: TINFO:Child(PID: 106163,TID:106200): TLS value set to: 101
tst_test.c:1953: TBROK:TestkilledbySIGBUS!
Summary:
passed 36
failed 0
broken 1
skipped 0
warnings 0
```
*2. On an AMD64 machine*
```sh
ubuntu@ZBook:~/orig/ltp$ ./testcases/kernel/syscalls/clone/clone10-i1000
clone10.c:48: TINFO:Child(PID: 125560,TID:125870): TLS value set to: 101
clone10.c:68: TPASS:Parent(PID: 125560,TID:125560): TLS value correct: 100
double freeorcorruption(out)
clone10.c:48: TINFO:Child(PID: 125560,TID:125871): TLS value set to: 101
clone10.c:68: TPASS:Parent(PID: 125560,TID:125560): TLS value correct: 100
tst_test.c:1953: TBROK:TestkilledbySIGIOT/SIGABRT!
Summary:
passed 311
failed 0
broken 1
skipped 0
warnings 0
```
*3. On an AArch64 machine*
```sh
ubuntu@asus-pe100a:~/orig/ltp$ 
./testcases/kernel/syscalls/clone/clone10-i1000
clone10.c:68: TPASS:Parent(PID: 158953,TID:158953): TLS value correct: 100
clone10.c:48: TINFO:Child(PID: 158953,TID:159029): TLS value set to: 101
tst_test.c:1953: TBROK:TestkilledbySIGSEGV!
Summary:
passed 75
failed 0
broken 1
skipped 0
warnings 0
```


On 2/9/26 18:51, Petr Vorel wrote:
> Hi Changwei,
>
>> Allocate extra space before the TLS area to hold a struct pthread, ensuring
>> THREAD_SELF->cancelhandling is initialized to 0. This prevents undefined
>> behavior in __pthread_disable_asynccancel(), which is called at thread
>> cancellation points such as write().
>> Without this, touch_tls_in_child() could get stuck in tst_res().
> LGTM, but I'd prefer others had a look on it.
> Acked-by: Petr Vorel<pvorel@suse.cz>
>
> BTW clone10.c segfaults w/a the patch when run with more iterations:
>
> ./clone10 -i200
> clone10.c:48: TINFO: Child (PID: 4271, TID: 4285): TLS value set to: 101
> clone10.c:68: TPASS: Parent (PID: 4271, TID: 4271): TLS value correct: 100
> clone10.c:48: TINFO: Child (PID: 4271, TID: 4286): TLS value set to: 101
> clone10.c:68: TPASS: Parent (PID: 4271, TID: 4271): TLS value correct: 100
> tst_test.c:1953: TBROK: Test killed by SIGSEGV!
>
> Summary:
> passed   15
> failed   0
> broken   1
> skipped  0
> warnings 0
>
> Kind regards,
> Petr
>
>> (gdb) bt
>>    0  futex_wait () at ../sysdeps/nptl/futex-internal.h:141
>>    1  futex_wait_simple () at ../sysdeps/nptl/futex-internal.h:172
>>    2  __libc_disable_asynccancel () at ../nptl/cancellation.c:100
>>    3  __GI___libc_write () at ../sysdeps/unix/sysv/linux/write.c:26
>>    4  __GI___libc_write () at ../sysdeps/unix/sysv/linux/write.c:24
>>    5  print_result ()  at tst_test.c:387
>>    6  tst_vres_ () at tst_test.c:401
>>    7  tst_res_ () at tst_test.c:512
>>    8  touch_tls_in_child (arg=<optimized out>) atclone10.c:48
>>    9  thread_start () at ../sysdeps/unix/sysv/linux/aarch64/clone.S:78
>> Signed-off-by: Changwei Zou<changwei.zou@canonical.com>
>> ---
>>   include/lapi/tls.h | 16 +++++++++++++---
>>   1 file changed, 13 insertions(+), 3 deletions(-)
>> diff --git a/include/lapi/tls.h b/include/lapi/tls.h
>> index 468fe3086..7f2fa18a1 100644
>> --- a/include/lapi/tls.h
>> +++ b/include/lapi/tls.h
>> @@ -22,6 +22,15 @@
>>   #define TLS_SIZE 4096
>>   #define TLS_ALIGN 16
>> +/*
>> + * Space allocated large enough to hold a struct pthread.
>> + *
>> + * Zero-initialized to ensure THREAD_SELF->cancelhandling starts at 0,
>> + * avoiding undefined behavior (e.g., in clone10.c) in __pthread_disable_asynccancel(),
>> + * which is called at thread cancellation points such as write().
>> + */
>> +#define TLS_PRE_TCB_SIZE (TLS_ALIGN * 256)
>> +
>>   #if defined(__x86_64__)
>>   typedef struct {
>>   	void *tcb;
>> @@ -36,10 +45,11 @@ extern void *tls_ptr;
>>   static inline void *allocate_tls_area(void)
>>   {
>> -	void *tls_area = aligned_alloc(TLS_ALIGN, TLS_SIZE);
>> +	char *tls_area = aligned_alloc(TLS_ALIGN, TLS_PRE_TCB_SIZE + TLS_SIZE);
>>   	if (!tls_area)
>>   		tst_brk(TBROK | TERRNO, "aligned_alloc failed");
>> -	memset(tls_area, 0, TLS_SIZE);
>> +	memset(tls_area, 0, TLS_PRE_TCB_SIZE + TLS_SIZE);
>> +	tls_area += TLS_PRE_TCB_SIZE;
>>   #if defined(__x86_64__)
>>   	tcb_t *tcb = (tcb_t *)tls_area;
>> @@ -59,7 +69,7 @@ static inline void free_tls(void)
>>   {
>>   	usleep(10000);
>>   	if (tls_ptr) {
>> -		free(tls_ptr);
>> +		free(((char *)tls_ptr) - TLS_PRE_TCB_SIZE);
>>   		tls_ptr = NULL;
>>   	}
>>   }

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
