Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D951784D4
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 08:09:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 339623C1D1B
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 08:09:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 272CC3C1C95
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 08:09:27 +0200 (CEST)
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4598660108D
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 08:09:26 +0200 (CEST)
Received: by mail-ua1-f68.google.com with SMTP id j8so23502114uan.6
 for <ltp@lists.linux.it>; Sun, 28 Jul 2019 23:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cODVRmnHe8/Cs301GE/noBtBeNXrikZob1NncrcjmVk=;
 b=OBwIHBTK5ser0eXct7f/GKsWuCqptbaZlwJff4+/LI4pltAKtCLsYmauP6vX8dpRDx
 vKtWTpmT2ecsjUYMP2uxHZvYL3Cob3o8DLtYkV8z+L4TxDaADn24DuKLQ3Q6kGo1v2YX
 n9rQLxgSvy0a/yj8pqq207DduyWu+NFTkyoVOG1U1E5vTggy7r3xdaaQrVX9+w2bA5t0
 GUWLDXKgZw0U+2aOXMBYamrijwhB6sJCyp4wdcxBofTizh39P8jzdqesISAfZA2k8a3A
 xvqkuytEJflP0moG4lcIa6E4basSnku0a3aQZoOofqiWPW1gfta3kIz7WpkKYcjSJRaX
 Ea0w==
X-Gm-Message-State: APjAAAW9E4POLqDJw3zfhvnyrutXyYezBSUXeYON8XGsuO/mzgzOToTA
 U0Am9O+8euxrFH792aQKeA6rKwc3+hOpQFEyPBwlV0zS3sjPhA==
X-Google-Smtp-Source: APXvYqzW01mNmcwTSeGNOyIX4xHU6gIYfViIfwVrcMoj9BUhUjvWZMD9+9xnjVXfLjSl4rhOwuJu9lDg/rZ/oDHCC88=
X-Received: by 2002:ab0:74c7:: with SMTP id f7mr9255537uaq.106.1564380565137; 
 Sun, 28 Jul 2019 23:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190726061316.9183-1-camann@suse.com>
In-Reply-To: <20190726061316.9183-1-camann@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 29 Jul 2019 14:09:13 +0800
Message-ID: <CAEemH2egK86uQW+OCj0o7AM=cVEkAP+TC8JvoU3PfW_maz7xKg@mail.gmail.com>
To: Christian Amann <camann@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Moved timer tests to syscall directory
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Jul 26, 2019 at 2:13 PM Christian Amann <camann@suse.com> wrote:
>
> - Moved all timer tests to the syscall directory and made the numbers
>   start from 1 again (e.g timer_create02 -> timer_create01).
> - Moved common_timers.h to lapi include directory.
> - Moved the contents of the runtest/timers file into the
>   runtest/syscalls file
> - Moved leapsec_timer test to the other clock_gettime tests
>
> Signed-off-by: Christian Amann <camann@suse.com>

Pushed with tiny fixes. Thank you, Christian.

Remove timers from kernel/Makefile otherwise, it will fail at compiling phase.

--- a/testcases/kernel/Makefile
+++ b/testcases/kernel/Makefile
@@ -53,7 +53,6 @@ SUBDIRS                       += connectors \
                           sched \
                           security \
                           sound \
-                          timers \
                           tracing \


Also correct the clock_gettime03.c TCID:

--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
@@ -35,7 +35,7 @@
 #define SECONDS_BEFORE_LEAP 2
 #define SECONDS_AFTER_LEAP 2

-char *TCID = "leapsec_timer";
+char *TCID = "clock_gettime03";
 int TST_TOTAL = 1;

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
