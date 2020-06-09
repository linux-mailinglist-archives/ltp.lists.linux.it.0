Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A33B21F349F
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 09:05:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 994F43C2E75
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 09:05:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A70E23C094D
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 09:05:41 +0200 (CEST)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8F43114002D6
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 09:05:40 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id j1so9507084pfe.4
 for <ltp@lists.linux.it>; Tue, 09 Jun 2020 00:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/0FpLC8OgFfWONI9f3cz8LyMgFiCnUzk9txqsGsRw7o=;
 b=Q84++SleD1XgLHCCuoH8JHH6rM7E7tMLGyun/4et1mG13ZQZpcyPgs5WcrZRVShjC0
 864Rhq+roDXZF3/+NrJCQu9ZocjCAg0HivdeZWH0i05mmGUwCAveghNuv3E2yauTFs/P
 4FYuyk0Ci7fo3qHFuk4Q84P5wq3eNmmCgaaWrBU5TEkIwSb/eSGBst20jai4yvVe6C6b
 7CPbWcikHm65VfsHMWXytv7m1Z5E9Qmo5wIiqMdneXgty2KoHzPBF4pMPQAPWKXE7VTa
 XJF+z9edagAqQLFyu1dXnt6Aus8LeKEeDrpWQ9H0n81IrpTV/ascPyPsVlRuH5q3WmTg
 prhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/0FpLC8OgFfWONI9f3cz8LyMgFiCnUzk9txqsGsRw7o=;
 b=RjHHQeluLDwIlByNsbYobuSc0V9tHYOIpzilpo1JR5zS4rtyaQAg9efzrPZcWIHRgP
 z8SPAoVPp/P/8Z1x3zrlGdfFofBBYFnmHGM3dbvrsvGv3WTa+Aptf3sCVCCf23PbFtKu
 I2dgVPCfxiRrh3oD765bbjABIdqAdiaWs+pWKs0wQ8mnx8pTWHckGww3kOOM07xNdAoQ
 UmK8W5qXhfNwJBR2v/Z5j+KDHG79HYIWSjG20iMcxDiv906NLH2wX5+hKdNaEy0c/JL1
 SS+QV/gnFGxS6xwj+fJi4Yhzdo6nmVHN2qLDWO55jnk85ZNwPQSO6ZDroNv8J6JXngSe
 N51Q==
X-Gm-Message-State: AOAM530qwpsprAYGHt8Ph+X2VkE+SnCm70gPhURyVKRZPlXYQsafO/w6
 ZnnijebCKQ2kkRy895FodSbOyQ==
X-Google-Smtp-Source: ABdhPJySZ47lLjCR49ervqKiyfm9rTC8PwtaRMMwUwIoFLGP/4uXRLeAIXPDzBV/HPfM4/IjPp1tLA==
X-Received: by 2002:a63:658:: with SMTP id 85mr22696179pgg.181.1591686338684; 
 Tue, 09 Jun 2020 00:05:38 -0700 (PDT)
Received: from localhost ([122.172.62.209])
 by smtp.gmail.com with ESMTPSA id y10sm9243267pfq.34.2020.06.09.00.05.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 00:05:37 -0700 (PDT)
Date: Tue, 9 Jun 2020 12:35:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200609070535.iym6m5n2v5urykbc@vireshk-i7>
References: <e15907ed42f0276f09c4120b9255db5764d4e9b6.1591343286.git.viresh.kumar@linaro.org>
 <CAK8P3a0b2BbZq_yYBKJHUfZgzCYUtdidpzJEj-HzuBKf1Q_nnQ@mail.gmail.com>
 <20200608100900.c4fi7pw7euie6tnt@vireshk-i7>
 <CAK8P3a004cavRhyWx+uXYYteBi1LviahAv11+9JyGadN-vo8og@mail.gmail.com>
 <20200608112000.sjrbvmqjciifgyub@vireshk-i7>
 <CAK8P3a0PqtFWTZr9hvSy5Y0ZZOSNgfzw0x1DTTyuzfsfROpAvw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0PqtFWTZr9hvSy5Y0ZZOSNgfzw0x1DTTyuzfsfROpAvw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

On 08-06-20, 16:51, Arnd Bergmann wrote:
> You already have a special case for gettimeofday(), so just round down
> the 'start' value to the previous microsecond when you are in that
> case.

Since this will also affect the next reading as well (as we will loose
values < 1 us), I tried to do it a bit differently.

@@ -78,6 +78,13 @@ static void run(unsigned int i)
                        tv->gettime(clks[i], tst_ts_get(&ts));
                        end = tst_ts_to_ns(ts);
 
+                       /*
+                        * gettimeofday() doesn't value less than 1 us, copy
+                        * that from start.
+                        */
+                       if (tv->gettime == my_gettimeofday && end < start)
+                               end += start % 1000;
+
                        /* Skip comparison on first traversal */
                        if (count == 10000 && !j)
                                continue;

> > +static void run(unsigned int i)
> > +{
> > +       struct tst_ts ts;
> > +       long long start, end = 0, diff;
> > +       struct test_variants *tv;
> > +       int count = 10000;
> > +       unsigned int j;
> > +
> > +       do {
> > +               for (j = 0; j < ARRAY_SIZE(variants); j++) {
> > +                       /* Refresh time in start */
> > +                       start = end;
> > +
> > +                       tv = &variants[j];
> > +                       ts.type = tv->type;
> > +
> > +                       /* Do gettimeofday() test only for CLOCK_REALTIME */
> > +                       if (tv->gettime == my_gettimeofday && clks[i] != CLOCK_REALTIME)
> > +                               continue;
> > +
> > +                       tv->gettime(clks[i], tst_ts_get(&ts));
> > +                       end = tst_ts_to_ns(ts);
> > +
> > +                       /* Skip comparison on first traversal */
> > +                       if (count == 10000 && !j)
> > +                               continue;

I am skipping diff for the first iteration..

> > +
> > +                       diff = end - start;
> 
> I think on the first iteration, 'start' is wrong here as well, and needs to
> be initialized once, as you did in the earlier versions.

And so this won't be a problem.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
