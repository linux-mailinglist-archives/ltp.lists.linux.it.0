Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7893532DC
	for <lists+linux-ltp@lfdr.de>; Sat,  3 Apr 2021 08:54:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B797B3C219C
	for <lists+linux-ltp@lfdr.de>; Sat,  3 Apr 2021 08:54:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 395813C2178
 for <ltp@lists.linux.it>; Sat,  3 Apr 2021 08:54:20 +0200 (CEST)
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6F9E51000478
 for <ltp@lists.linux.it>; Sat,  3 Apr 2021 08:54:20 +0200 (CEST)
Received: by mail-qt1-x830.google.com with SMTP id y12so5052222qtx.11
 for <ltp@lists.linux.it>; Fri, 02 Apr 2021 23:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+wifCvRR2SpQMk0bXLoCaFEWDZiurorWksjmTqIpqNo=;
 b=J6BKrM7EQa3jflWyPUpFWQs0bxPEFxvYs9oc4y4Ae6uDhkqBc7Q+PVE0sgXW25j21S
 t7gCl9+s7rBMfyceu4+ofkFslEx3eTIXoUsmgDz2Acn5UII5ufo1+BYApFDEEwwXH/fQ
 3GtOTE3wgDsxFObdlelVVcABCz8HJa1YhGZ1vUCp4MpzKWO9Ou3h9vF7ke9K1Ravzjnn
 NSCGqmxr3ptOSKR9vvIKetEx4aYdYeXT3B7M2uAIaIBBgN224Q+s1/klxmQ24VOiZ7qr
 pfXJSJvZf5smy0cGZm3vKtPGbiwTUWRjbpOuYRhU8zTBrud9X5jAzahwnHClkZO5HlWY
 7v+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+wifCvRR2SpQMk0bXLoCaFEWDZiurorWksjmTqIpqNo=;
 b=lV5EjBnWDJVQFiPrAw7qsBj9GR83fV3jhoDm6+Oh4GUt9Ff5NJREcsCu+eoTOCJj4A
 oUkbk+0xzPOBC/ElEpH7S+yRTMHV8WnIR1pa4X6Ez0VwNo0RW9I0TYVcNsfScbi7MMg4
 A1t7wzT6bZwiDNC+GNrgsCprdIZUFndIFLsuHk8Az+sGOBpkAzdDhtl6EgxTyHvLzsEX
 e1VnHPH7s8uXZOvH6atVhevapV5Tf6C2pqdqRs7fF4cvf+C1OdDOw7YlzjQNs5AXcM/1
 iaIQAAOU1/XYp/wqukVn7gXw/S/IFtUCvIJcrLfzXE+fRguHfVhr1Yj5VGLGtAoxHUPW
 Bd+Q==
X-Gm-Message-State: AOAM530w0cckoiY2nEfy0SNMALJIYexjAnSJvML19gXNU8vwWtgax4Co
 HLOjgvmEGuYXGbg9Y0omwt7oLdp8CM3P/RV3Hm01gYx5ESbB9Q==
X-Google-Smtp-Source: ABdhPJyGISEkr6bHg0aZC70eELWW36FyExxN1qZ5ViohwjWAQiMDHQln48tTEV8PSi57mRo8OJ34TB1/GnA+/ZyCDRk=
X-Received: by 2002:ac8:4783:: with SMTP id k3mr14754600qtq.231.1617432859033; 
 Fri, 02 Apr 2021 23:54:19 -0700 (PDT)
MIME-Version: 1.0
From: Vinay Kumar <vinay.m.engg@gmail.com>
Date: Sat, 3 Apr 2021 12:24:08 +0530
Message-ID: <CANUMPcW1RN-xVSmJ-uyg5dLgMcmFaSMVSYuO7tptQ+Ka6cT_jA@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] TBROK: Test killed by SIGSEGV" with adjtimex02.c
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Team,

(Resending as the previous post was not in plaintext)

Below list of tests are failing with error message "BROK: Test killed
by SIGSEGV"

    adjtimex02
    getitimer02
    getrusage02
    msgctl04
    setitimer02
    shmctl02


Further analysis found that the root cause of failures are due to
"Cannot access memory at address 0xffffffff".

$cat getitimer02.c
/* call with a bad address */
TEST(getitimer(ITIMER_REAL, (struct itimerval *)-1));

#Debugging on image gives

Breakpoint 2, __getitimer (which=ITIMER_REAL, curr_value=0xffffffff)
at ../sysdeps/unix/sysv/linux/getitimer.c:33
33 ../sysdeps/unix/sysv/linux/getitimer.c: No such file or directory.
(gdb) n
50 in ../sysdeps/unix/sysv/linux/getitimer.c
(gdb) p curr_value
$3 = (struct itimerval *) 0xffffffff
(gdb) p *curr_value
Cannot access memory at address 0xffffffff

Please let us know whether we need to handle SIGSEGV in above listed
testcases or we need to work on glibc for the fix.

This behavior is observed with glibc-2.32 version and above. And
tested on target ARM 32bit .

Regards,
Vinay

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
