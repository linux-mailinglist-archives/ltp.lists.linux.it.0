Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E8A1BB559
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 06:30:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7ECDC3C2834
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 06:30:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 7FF583C2822
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 06:30:16 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 81B1B200910
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 06:30:15 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id t4so7828300plq.12
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 21:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9PWXfDGahhOKI36FRJ7MFv53CB7gTOT7NBPp0UFUk9I=;
 b=GOHxPiCdSBEwLkXRcwN7vNWRMhp9p88fgYo8LjyIFUKZ/axU/iJe951AvPX9P1Y4R8
 oiAOJyKODAuG/o66MHygW93wJwATB365rtxsBhW5wQMD7xm9ezRz1WyAsduWAOraYDKM
 /S7uzFQWr+pfR314FPreD4unrO2EEyJ4cdVUhgGlU+NGtdiGWQzpnQAnsOmBkHf5wrkL
 fWf0svY0y4G0+fVP4B0OK236UBNn4f1EJb8ksl0O0QSEf4Yo6vkUbntkYKcKRs4BKnfb
 RoNNPHtsMixMJdB9HphXal5l6nKHAetZsyJBqtAp3uRwJLXhBHxy0++xAHlsqSF1vbCz
 /TJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9PWXfDGahhOKI36FRJ7MFv53CB7gTOT7NBPp0UFUk9I=;
 b=NhZk86bRqWRSrrmOK2jrV9OgFBM5uXanZ7Yut5VC8a5S9PkmfDHHsSoM+DlIGu+j6y
 hhc1MIr/8mhNixeyuwmpzeOFVsrDJ5RMFmzjkzLCd8vXdVcMAgAbQnHtZWU1jdCLzCuP
 L3UKhlUsSg8ob/T3kht2/uZgq4yUebRc457tXnH6AYPHQA7f7OusdaXMmRh/NfUZlHVj
 VTyTm97PA5OSjH2PAEwCyUX6sKFVmi2mO9TtcgK74Nld0XBSW1YX/+mftUPtL+CgwOUX
 pj/m10sPhMEhE+JmR33wnzyE6+mEfCPrzktFwtDpGAp2eXnFFSSlRF+d6FfwaVfjdxoy
 fiBQ==
X-Gm-Message-State: AGi0PuZAn7kgrtDOdVsfjpm2MfpQfoGdw7wkSo3kOr2Qi14qFJXliuz+
 QF54ygsUDhPEW87RiyhVaI26ag==
X-Google-Smtp-Source: APiQypJ3kg8WKFXDXHoYZjCNh/vzAvWtmRfOJVfLr9IdZ29PYR/EZoMXfyMCX6ISC6x/R6q0+YS9OQ==
X-Received: by 2002:a17:90a:d086:: with SMTP id
 k6mr2805392pju.47.1588048213806; 
 Mon, 27 Apr 2020 21:30:13 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id k24sm13530014pfk.164.2020.04.27.21.30.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 21:30:13 -0700 (PDT)
Date: Tue, 28 Apr 2020 10:00:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200428043011.bsimthqeelbijr5i@vireshk-i7>
References: <a143f48ffeec14739d35c07dfb95f237981a322d.1587712683.git.viresh.kumar@linaro.org>
 <c4bf1e2c7699a8fe2d05ab498495646f9d41ce44.1587712683.git.viresh.kumar@linaro.org>
 <20200427141520.GC7661@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200427141520.GC7661@rei>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5 5/5] syscalls/clock_adjtime: Add support for
 time64 tests
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

On 27-04-20, 16:15, Cyril Hrubis wrote:
> Hi!
> I've cleaned up the code and pushed, thanks.
> 
> Fixed things such as:
> 
> * Macros should be uppercase, otherwise it's confusing
> 
> * All local variables has to be passed to macros as parameters
>   this one is confusing as hell
> 
> * No variables and parameters stating with underscore, unless
>   we defined fallback for kernel types these are reserved for
>   kernel/libc
> 
> * The tst_get_bad_addr() allocates a page for each call, so I have moved
>   it to setup
> 
> * etc...

Thanks again.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
