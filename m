Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8BF1EEDE8
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 00:45:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5640B3C2FDC
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 00:45:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0937F3C209F
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 00:45:50 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C756B1030D5A
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 00:45:49 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id s10so4216345pgm.0
 for <ltp@lists.linux.it>; Thu, 04 Jun 2020 15:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0/Ifpw3zohhhizup/iPeLdkC3yBceaz+iR6KHJ3Yp7w=;
 b=SrQ7VnScu3Op+k3qtU1bTlBve/IrhoIvaPcQQfuMsKsMtmX3GiGycjsmpSaJ2AnuDA
 sLq4MjD67cj2rWV6lZm9AXde9aoXtHyST0fTrFSBtBortq/FKnBoCzc4AjAVf67w4Qok
 MGxBkAmDISkBXLpBye8qEIXP9D2ZMSO395T7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0/Ifpw3zohhhizup/iPeLdkC3yBceaz+iR6KHJ3Yp7w=;
 b=XkRCURelilnhZrWLcA/3vNJMl8HEPYWZxrnudyLIO1/2z54yC6X5gV7M1NaPQucTVx
 AVGSwgJONweMMolxb+q6GFzy8jdfovz/fKr1T36ra2OZBE74tG7g8SeYEGy5VZiTRCVY
 kLfHMO/lfxPdC4y4Mn6/d/BmWXOP+B1j1gc2tY1Foj1ShSmo71l0zV6zSDx/+JFE+pxl
 IqQrErir8KFcACUaYWd5p6f4YoOoqjcMI2b/B4s7ylr0HM7h6JWQ4erouZpC1xrZOdR0
 PvMPrXsI5OGgslD2w19kjh9/3+qj9oLXTmXJk9jDNizuZrBoh6q4J6qZdr8Fy/b21EgF
 4W9A==
X-Gm-Message-State: AOAM531CkVzKBVD5jrtfcBadegIVptAAxY76119xKJ9CqqCx/yIDHZz/
 QaZ2CIxkeLnMyOubCCjEwL8JwA==
X-Google-Smtp-Source: ABdhPJyN4dzHONC8ss9AIERs8X2Xzk+pU9aR8JSs6krPWrNtYee6rEeKAqIdDe6qG44ooQ6X4qDCxQ==
X-Received: by 2002:a63:f856:: with SMTP id v22mr6764340pgj.64.1591310748187; 
 Thu, 04 Jun 2020 15:45:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b10sm5065247pgk.50.2020.06.04.15.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 15:45:47 -0700 (PDT)
Date: Thu, 4 Jun 2020 15:45:46 -0700
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <rong.a.chen@intel.com>
Message-ID: <202006041542.0720CB7A@keescook>
References: <20200518055457.12302-3-keescook@chromium.org>
 <20200525091420.GI12456@shao2-debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200525091420.GI12456@shao2-debian>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [exec] 166d03c9ec: ltp.execveat02.fail
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
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 linux-api@vger.kernel.org, Eric Biggers <ebiggers3@gmail.com>,
 ltp@lists.linux.it, linux-kernel@vger.kernel.org, lkp@lists.01.org,
 linux-security-module@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, May 25, 2020 at 05:14:20PM +0800, kernel test robot wrote:
> Greeting,

(Whoops, I missed this in my inbox.)

> <<<test_start>>>
> tag=execveat02 stime=1590373229
> cmdline="execveat02"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
> execveat02.c:64: PASS: execveat() fails as expected: EBADF (9)
> execveat02.c:64: PASS: execveat() fails as expected: EINVAL (22)
> execveat02.c:61: FAIL: execveat() fails unexpectedly, expected: ELOOP: EACCES (13)
> execveat02.c:64: PASS: execveat() fails as expected: ENOTDIR (20)

I will go check on this. Looking at the expected result (ELOOP) I think
this just means the test needs adjustment because it's trying to
double-check for a pathological case, but it seems their test setup
trips the (now earlier) IS_SREG() test. But I'll double-check and report
back!

-- 
Kees Cook

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
