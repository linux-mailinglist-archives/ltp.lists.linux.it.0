Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2055B1D9351
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 11:29:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1DE73C4E8D
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 11:29:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 61F6D3C2240
 for <ltp@lists.linux.it>; Tue, 19 May 2020 11:29:02 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0AA0A1000DB3
 for <ltp@lists.linux.it>; Tue, 19 May 2020 11:29:02 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id s69so1060599pjb.4
 for <ltp@lists.linux.it>; Tue, 19 May 2020 02:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=afVZaw5JmCmBUMah8aga5kbvvPAON2X6520g2DbgkF8=;
 b=tiUHarRm4YMXXt4fMXAt4sG8Z5O9pfYj1A5MNfJQ4JkpxDHHq/a+srM2JQCu5mkbe/
 zAh32NHDmG9YjneQ9SIeE45WjAYs1kjUa99P/i4EaOFnQGSbgq6ObBjYfKQvKd8cn1+C
 nB8KMg0MrnQ1rlUEmzrGMcBC+iWqZzreUBVSlItlV04hd59bHrISCnv8gdgpCUKbs7Wa
 2ny2LHf8FL+53rCzeYnJWIeEp47I5OWNrD6ZtFPW1VNQTHUqArCJCM0PblSo2hkBUUCU
 j9qnOq8xPa/Flj/eLRvTlA+taG5nQaLLY3nuEmBgrt016dg7O66QCcf6BtBl+wXIFw1R
 RXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=afVZaw5JmCmBUMah8aga5kbvvPAON2X6520g2DbgkF8=;
 b=IcQzBPPAg1iVe1B2TtqSLc9L9zdYRzw3jvSYM02IP8GnxixXhMZ1mbF9qEKCojo1vL
 LIygbXM6WbIDeTruFRBYV9rWUXWch8gvfsqIDEOsZ6wwYj/CkY1J6IM0IYUfL+bt3xRB
 zKBFqJOV6FJqJkzr3J2+TdzUw6UTLd00hWF/D9Ezs0iVxh+EdndwdUuKTNmSWSksGYR6
 1BNMq+w5PxrklgtdnhvqCuuBzo0fPPN7D8oJqWmXoe08knSvuSvMgUpabPoT3GJeBGzT
 W2myAyfKOEY8G2hZmxLyW5ZM2G6hbPkyjmYiTfZyjjd5VWgC5nPBOV6XSUi9ZtyP7Mlz
 cROw==
X-Gm-Message-State: AOAM532CUZemQpIZ341szVez7xsjqDiabajx5q+mmILYK3bTJ/tgZo9T
 rfTaPzVl5kVkUgNd98Q+TMRcqQ==
X-Google-Smtp-Source: ABdhPJwDIrfZw0YhBnUTtpoR+CLW0z1jO+ySRFS5JYl22cM8ppZ0lEF/M+F9ZrcDHXcmX8z4XNdOmQ==
X-Received: by 2002:a17:90a:8404:: with SMTP id
 j4mr3907983pjn.12.1589880540536; 
 Tue, 19 May 2020 02:29:00 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id y75sm11101175pfb.212.2020.05.19.02.28.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 02:28:59 -0700 (PDT)
Date: Tue, 19 May 2020 14:58:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200519092858.yryokifjisufysti@vireshk-i7>
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <3f3b7d669d47ae701385b43deb8280a353dd231e.1589877853.git.viresh.kumar@linaro.org>
 <CAK8P3a2+OMw4dGWkwNT1GLkBtgVN=-zYZt2G955M--WG2fyjgA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2+OMw4dGWkwNT1GLkBtgVN=-zYZt2G955M--WG2fyjgA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/5] syscalls: Don't use tst_syscall()
 unnecessarily
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

On 19-05-20, 11:22, Arnd Bergmann wrote:
> On Tue, May 19, 2020 at 10:51 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> > @@ -472,7 +471,7 @@ static uint64_t get_current_time(void)
> >  {
> >         struct timespec ts;
> >
> > -       tst_clock_gettime(CLOCK_MONOTONIC, &ts);
> > +       clock_gettime(CLOCK_MONOTONIC, &ts);
> 
> Again, you are changing from the low-level syscall interface that is not
> present on new 32-bit architectures which only have clock_gettime64
> to a high-level interface.
> 
> This change correctly changes it to pass matching timespec variant, but
> the changelog text does not mention that.

Right, I can actually mention why this change was necessary.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
