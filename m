Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0183C20AB00
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 05:55:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D3C63C58CC
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 05:55:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 1DF303C1C9A
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 05:55:14 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6B65B600F3D
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 05:55:13 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id b92so4379408pjc.4
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 20:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6oMBCSkyBPj2GPG7XzI66I9oFqI8LbpsJdJD9CyADEc=;
 b=nRwjU+e88h/2/q5Y62yHSuacGOfLOAiOWmLkux9qfNNfin6ArkxU5SHuSXpOTXkNA0
 vMmC8WdiCspeEg6tnE+T6X/OhkwLs6y/53n4EL+V1iQzsdF1fQtchUIYlYHwtdGU045S
 1qTUYZow3LWYCVZlZ2mntWO2ZYvHIcZuj8fZHbtiNnmfqx0zYzOxVqE/5NL2BN+Q9972
 Klfk17uEogvno19to08wFopaiEYj+rCJFO+r6jMUBb8W6xUv306+5EEhuoOkTfq2xqyD
 JaL7vsHS6vXYGxiMDPiOlRnbuB18eSOWj8O5E1GeHnLghohNbADGJnq8qBcCLo6gKlbh
 8YLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6oMBCSkyBPj2GPG7XzI66I9oFqI8LbpsJdJD9CyADEc=;
 b=LLg4tdF/FEp0xq2lfbTARtwuvad8I6z/54tCeavMJCRm9ulo3EJ5TDsuk9/YfMxzws
 IpF8kVAdSxrtEPwZ7LaZQydFl0JNEh1fhxTEZWhYz2jICpLTIExbG3MQwdaqQlRnBeQn
 /oAEx5r5sEm/cGVNIPKtAkeVLpZqhxx2wY552taD7aWRHkZk+aR9uke1yPzV83DhWLnq
 HYYwXSpkc8oTJ2xnE2WLOFQhe92DDru7QypMCdYO0tMKnGCcyvDbyEbDcmUOI6cf5/Ss
 W0ccqZCqL8OJySMngdfCa34Cs3scvxYJFo8H1iAhVzXNJns2+p6Mbw4l18re4WjiT07d
 sE5A==
X-Gm-Message-State: AOAM530jrvM7qOKeWjUeJeccFMv9+kbngLmcNMHvaX6mBQOjOFfzhBRJ
 q2Mf8Q0Q9nkiCcQGQ7f0qngb2w==
X-Google-Smtp-Source: ABdhPJw897r5gJrFGRd4K4x9YizTjFinRpZef2B71l7YtgsH4z7GpNV6uuvtXtAYXlD14nMtrzByxQ==
X-Received: by 2002:a17:90a:a08d:: with SMTP id
 r13mr1295788pjp.28.1593143711691; 
 Thu, 25 Jun 2020 20:55:11 -0700 (PDT)
Received: from localhost ([122.172.127.76])
 by smtp.gmail.com with ESMTPSA id y7sm10102323pjy.21.2020.06.25.20.55.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jun 2020 20:55:11 -0700 (PDT)
Date: Fri, 26 Jun 2020 09:25:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200626035509.vag5m6fejs6rwl7x@vireshk-i7>
References: <0f1cc05d6d79238ed94b93417f300e9a026a2063.1591864369.git.viresh.kumar@linaro.org>
 <20200625132352.GA28350@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200625132352.GA28350@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 1/2] libs: Import vdso parsing lib from kernel
 tree
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 25-06-20, 15:23, Cyril Hrubis wrote:
> Hi!
> Pushed with minor changes, thanks.
> 
> * Moved the comment about the function usage to the header
> 
> * Fixed some compiler warnings

I avoided these so in future we can simply copy paste the file from
kernel tree to get more updates, and so we keep the delta between them
to none.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
