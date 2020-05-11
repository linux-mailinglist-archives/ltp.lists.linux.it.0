Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F7A1CD212
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 08:49:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C7C813C55CE
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 08:49:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A1C423C26BB
 for <ltp@lists.linux.it>; Mon, 11 May 2020 08:49:34 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DD0956009FF
 for <ltp@lists.linux.it>; Mon, 11 May 2020 08:49:33 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id x77so4324775pfc.0
 for <ltp@lists.linux.it>; Sun, 10 May 2020 23:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=I2QS0EdIZ90erECENO5JfE9RGVR/c0Cknot8uBciWs0=;
 b=QUXT9/vvu9Vgg5TZJo67K402AEEbMQeEr9M1PcTCt9IKC5aHrvluDj877A8BMUDl1k
 y1TytT+cCeLv9+m0GI0mKQSy1OwY+0XkAWMhIK7Zmy7+cF19mAbVIdK7esZXgvCfDxfv
 M2sGwiX/uQ5vRiDOXFxIm5h9fnkr2K3GzNvt5ELIdUC8JiU0gKRv87iXIDDWSaqCcTY4
 RkTJE2GPChiHr5BeML+lUjhirHhS53e/Cx5JBqo5Maw7OO/SZRDm7JZAj88iGAFvsyHx
 EhNtRxJCZU/cSB9ASeZV2uM1QjkEdGCYu/49CURQczanJOPgw8WFswB+Et60mOt8nDfu
 iIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=I2QS0EdIZ90erECENO5JfE9RGVR/c0Cknot8uBciWs0=;
 b=FfWT/Lr4GbqDhrvAME4LEHaZS80ocHunuEOHTw7+BBeAHiTkfLKIxVVMZIIFnCrZ0e
 etpGMEFXYqA5TzFk5a4mMA48+kBcflbWxUDCH7KSkzjwNkqWHPtFtCR5If8pHQNXzYmL
 4m1Zvn8OkLwr6NoGOEPBx5QJfb7fRvS81FyBSG9MDCjEkY2jjTagh2/JCysU6AJmTVlY
 Di0oiNU8DpZ/GPs0yz1kraceEAjwSWxZ2O3EX9DS56DRHfSFBxeX/tTFra8S9rWPy+3K
 w89dXUr+E+wJgoK/JCvfxsqkgOXAsYT0PWSLoB5ny08L9XamKiInK2eVs/qdMw4/+iHP
 itdg==
X-Gm-Message-State: AGi0PuYHAnt83aCbQPv8O8otvMqrGZ9+4bU6h/zL+xNFuC0lUX9DFK0x
 xpRWgNSuH3gEA73olwHMeHVcNCE0+rg=
X-Google-Smtp-Source: APiQypL3OoV9K63rpEM++RB95420RcdGHQJf5SYorT/gaMzwv5RsIh+AQ/6tRh775e+NUJeOh8jCSg==
X-Received: by 2002:a63:5642:: with SMTP id g2mr13456794pgm.211.1589179772402; 
 Sun, 10 May 2020 23:49:32 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id d74sm8393911pfd.70.2020.05.10.23.49.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 May 2020 23:49:31 -0700 (PDT)
Date: Mon, 11 May 2020 12:19:29 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200511064929.pa4lydt2vfryl7ve@vireshk-i7>
References: <cover.1588911607.git.viresh.kumar@linaro.org>
 <8a675726b6e553e740016390c774bce19efc5a12.1588911607.git.viresh.kumar@linaro.org>
 <CAK8P3a1x+uK_WgVn9O8LVcLoZH=oJ_jQcePwcwzqpyhewApX9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1x+uK_WgVn9O8LVcLoZH=oJ_jQcePwcwzqpyhewApX9w@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 15/17] syscalls/semtimedop: Add support for
 semtimedop and its time64 version
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

On 08-05-20, 09:18, Arnd Bergmann wrote:
> It feels like this is more complicated than it need to be. The line
> 
> semtimedop = sys_semtimedop, .type = TST_KERN_OLD_TIMESPEC, .desc =
> "semtimedop: syscall with kernel spec32"},
> 
> should apply to any kernel that has "__NR_semtimedop !=
> __LTP__NR_INVALID_SYSCALL",
> regardless of any other macros set, and then you don't need the separate line
> 
> { .semtimedop = sys_semtimedop, .type = TST_KERN_TIMESPEC, .desc =
> "semtimedop: syscall with kernel spec64"},
> 
> which is not what the ABI is meant to be anyway (sys_semtimedop takes
> a __kernel_old_timespec,
> not a __kernel_timespec).
> 
> Similarly, the line
> 
>  { .semop = semop, .type = TST_LIBC_TIMESPEC, .desc = "semop: vDSO or syscall"},
> 
> should apply to both 32 and 64 bit machines

This is how I modified this and all other time64 tests, I hope this looks fine now ?

diff --git a/testcases/kernel/syscalls/ipc/semop/semop.h b/testcases/kernel/syscalls/ipc/semop/semop.h
index 8d1245b65ec0..8647fa686bd3 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop.h
+++ b/testcases/kernel/syscalls/ipc/semop/semop.h
@@ -26,17 +26,13 @@ struct test_variants {
        char *desc;
 } variants[] = {
        { .semop = semop, .type = TST_LIBC_TIMESPEC, .desc = "semop: vDSO or syscall"},
-#if defined(TST_ABI32)
-       { .semtimedop = sys_semtimedop, .type = TST_LIBC_TIMESPEC, .desc = "semtimedop: syscall with libc spec"},
-       { .semtimedop = sys_semtimedop, .type = TST_KERN_OLD_TIMESPEC, .desc = "semtimedop: syscall with kernel spec32"},
-#endif
 
-#if defined(TST_ABI64)
-       { .semtimedop = sys_semtimedop, .type = TST_KERN_TIMESPEC, .desc = "semtimedop: syscall with kernel spec64"},
+#if (__NR_semtimedop != __LTP__NR_INVALID_SYSCALL)
+       { .semtimedop = sys_semtimedop, .type = TST_KERN_OLD_TIMESPEC, .desc = "semtimedop: syscall with old kernel spec"},
 #endif
 
 #if (__NR_semtimedop_time64 != __LTP__NR_INVALID_SYSCALL)
-       { .semtimedop = sys_semtimedop_time64, .type = TST_KERN_TIMESPEC, .desc = "semtimedop: syscall time64 with kernel spec64"},
+       { .semtimedop = sys_semtimedop_time64, .type = TST_KERN_TIMESPEC, .desc = "semtimedop: syscall time64 with kernel spec"},
 #endif
 };

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
