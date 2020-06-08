Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6BD1F1669
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 12:09:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BACD13C2E80
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 12:09:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id AF9013C176C
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 12:09:05 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EC59F1000A3E
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 12:09:04 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id r10so8516960pgv.8
 for <ltp@lists.linux.it>; Mon, 08 Jun 2020 03:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+GoHS63U7cC4hynXfTARrc+B7ZfJQ8cSxScZZDeWM0I=;
 b=rKflBLIFbL+6C3Qw/aUv5Sr5+vAmDpu3WwMa/ym/Ai+ZuDMEvZr/a5gAUCc0XnuHyO
 1/QIjhBgS6RO06eI2axANPdRcxYieMKoyU5i+N4pKPYFGnicgtkVsx3SBsDl5YOQzau2
 v471+IdePE3Ow90f9Y1WbJazuqsK/V5nNofoRO2zKgX/9uG4rK+ct1PAIrIjNKY3wOTi
 KLiavb6ZvL/+J2VhDRVmUWFdPD6IxTY0zkwAlzhmGap+k5P5yI/cKSHBAR2ZMbRfjX4U
 5Id/AHPtaqZWMq9YsckOSkj4Yv7oK58pG8lxDrX4qeSee8WrCiBTt1/x+k6WNLoDSDwO
 uU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+GoHS63U7cC4hynXfTARrc+B7ZfJQ8cSxScZZDeWM0I=;
 b=dZclUC3YSOQeRUyrc+AwFDnMxw97cMzSkGx7JuZHjte7DyyUb19jH+w/KR9cUY7yWs
 qZ2lFRh1BwtTTq9aA015hFZfn1SGFdtgvOy/UkxKN7al+kf17Ez2//H7nBBUwp/W/8Cu
 BX6c4K33y9Qjjf5kRW6oHYtba9M1CrbYC4eUBY5ht3m6xnKaLoGL5FW9BeSnIWXR+f4C
 cKt0WIfPol0oX+1VGapwumtceFlV0R2ghCyhVVPsXuwAki0Bx3Ml55nOEJG57g63/Jul
 k2+i/WDuMd3Rsz5IJVMNU81xiHbGKcXXyK1dkmMEZ4IrdtZ5jffC6taQ5ommFsyKTVA6
 tSRQ==
X-Gm-Message-State: AOAM531DF0/G4xYodkoT8p61go6bQqGmouT9GtCEXoYkKdbhj1QRal6i
 MFDQFrR9B/Lhlq0H+n1ISW5afw==
X-Google-Smtp-Source: ABdhPJwYXOI8RtFTZCUmIykR15Hx5uBqv3XAt5VdIodMZBiGhnQJDv4tR4xSKB54+CQZpxyQ8Bqgtg==
X-Received: by 2002:a62:504:: with SMTP id 4mr21083415pff.67.1591610943223;
 Mon, 08 Jun 2020 03:09:03 -0700 (PDT)
Received: from localhost ([122.172.62.209])
 by smtp.gmail.com with ESMTPSA id m9sm6799443pfo.200.2020.06.08.03.09.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 03:09:02 -0700 (PDT)
Date: Mon, 8 Jun 2020 15:39:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200608100900.c4fi7pw7euie6tnt@vireshk-i7>
References: <e15907ed42f0276f09c4120b9255db5764d4e9b6.1591343286.git.viresh.kumar@linaro.org>
 <CAK8P3a0b2BbZq_yYBKJHUfZgzCYUtdidpzJEj-HzuBKf1Q_nnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0b2BbZq_yYBKJHUfZgzCYUtdidpzJEj-HzuBKf1Q_nnQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/clock_gettime: Add test to check bug
 during successive readings
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 05-06-20, 14:19, Arnd Bergmann wrote:
> On Fri, Jun 5, 2020 at 9:48 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> > +static struct test_variants {
> > +       int (*gettime)(clockid_t clk_id, void *ts);
> > +       enum tst_ts_type type;
> > +       char *desc;
> > +} variants[] = {
> > +       { .gettime = libc_clock_gettime, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
> > +
> > +#if (__NR_clock_gettime != __LTP__NR_INVALID_SYSCALL)
> > +       { .gettime = sys_clock_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
> > +#endif
> > +
> > +#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
> > +       { .gettime = sys_clock_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
> > +#endif
> > +};
> 
> Would it be possible to add a direct call to the two vdso
> implementations here as well?

Which two vdso calls are you talking about here ?

> > +static void run(unsigned int i)
> > +{
> > +       struct tst_ts ts_start, ts_end;
> > +       long long start, end, diff;
> > +       struct test_variants *tv;
> > +       int count = 10000;
> > +       unsigned int j;
> > +
> > +       while (--count) {
> > +               /* Store reference time in start */
> > +               if (clks[i] == CLOCK_REALTIME) {
> > +                       struct timeval tval;
> > +
> > +                       /* Compare CLOCK_REALTIME with gettimeofday() as well */
> > +                       if (gettimeofday(&tval, NULL) < 0)
> > +                               tst_brk(TBROK | TERRNO, "gettimeofday() failed");
> > +
> > +                       start = tst_timeval_to_ms(tval);
> > +               } else {
> > +                       tv = &variants[0];
> > +                       ts_start.type = tv->type;
> > +                       tv->gettime(clks[i], tst_ts_get(&ts_start));
> > +                       start = tst_ts_to_ms(ts_start);
> > +               }
> > +
> > +               for (j = 0; j < ARRAY_SIZE(variants); j++) {
> > +                       tv = &variants[j];
> > +                       ts_end.type = tv->type;
> > +
> > +                       tv->gettime(clks[i], tst_ts_get(&ts_end));
> > +                       end = tst_ts_to_ms(ts_end);
> > +
> > +                       diff = end - start;
> > +                       if (diff < 0) {
> > +                               tst_res(TFAIL, "%s: Time travelled backwards: %lld",
> > +                                               tst_clock_name(clks[i]), diff);
> > +                               return;
> > +                       }
> 
> I think this check should be done on the nanoseconds, not after the
> conversion to milliseconds -- otherwise you miss when time goes
> backwards by less than a millisecond.
> 
> > +
> > +                       if (diff >= 5) {
> > +                               tst_res(TFAIL, "%s: Difference between successive readings greater than 5 ms: %lld",
> > +                                               tst_clock_name(clks[i]), diff);
> > +                               return;
> > +                       }
> > +
> > +                       /* Refresh time in start */
> > +                       start = end;
> 
> resetting start here seems like the right choice in order to check for
> backward jumps between loop iterations, but I see that the start of
> the loop invalidates that by overwriting it again.
> 
> One way to solve this would be by having the gettimeofday() call
> as part of the loop but skip it for !CLOCK_REALTIME, and adding
> a special case for the lower resolution.

This is what I have done now:

 static void run(unsigned int i)
 {
-       struct tst_ts ts_start, ts_end;
+       struct tst_ts ts;
        long long start, end, diff;
        struct test_variants *tv;
        int count = 10000;
        unsigned int j;
 
-       while (--count) {
-               /* Store reference time in start */
-               if (clks[i] == CLOCK_REALTIME) {
-                       struct timeval tval;
-
-                       /* Compare CLOCK_REALTIME with gettimeofday() as well */
-                       if (gettimeofday(&tval, NULL) < 0)
-                               tst_brk(TBROK | TERRNO, "gettimeofday() failed");
-
-                       start = tst_timeval_to_ms(tval);
-               } else {
-                       tv = &variants[0];
-                       ts_start.type = tv->type;
-                       tv->gettime(clks[i], tst_ts_get(&ts_start));
-                       start = tst_ts_to_ms(ts_start);
-               }
+       /* Store reference time in start */
+       if (clks[i] == CLOCK_REALTIME) {
+               struct timeval tval;
 
+               /* Compare CLOCK_REALTIME with gettimeofday() as well */
+               if (gettimeofday(&tval, NULL) < 0)
+                       tst_brk(TBROK | TERRNO, "gettimeofday() failed");
+
+               start = tst_timeval_to_us(tval) * 1000;
+       } else {
+               tv = &variants[0];
+               ts.type = tv->type;
+               tv->gettime(clks[i], tst_ts_get(&ts));
+               start = tst_ts_to_ns(ts);
+       }
+
+       while (--count) {
                for (j = 0; j < ARRAY_SIZE(variants); j++) {
                        tv = &variants[j];
-                       ts_end.type = tv->type;
+                       ts.type = tv->type;
 
-                       tv->gettime(clks[i], tst_ts_get(&ts_end));
-                       end = tst_ts_to_ms(ts_end);
+                       tv->gettime(clks[i], tst_ts_get(&ts));
+                       end = tst_ts_to_ns(ts);
 
                        diff = end - start;
                        if (diff < 0) {
-                               tst_res(TFAIL, "%s: Time travelled backwards: %lld",
-                                               tst_clock_name(clks[i]), diff);
+                               tst_res(TFAIL, "%s: Time travelled backwards: %lld ns",
+                                       tst_clock_name(clks[i]), diff);
                                return;
                        }
 
+                       diff /= 1000000;
+

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
