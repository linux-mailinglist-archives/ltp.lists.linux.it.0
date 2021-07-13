Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 662F13C6BB7
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 09:50:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1DB03C4CEA
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 09:50:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 95E1A3C4CEA
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 09:50:02 +0200 (CEST)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0B1E31400DAB
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 09:50:01 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id 11so24564707ljv.1
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 00:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uqj9Ey2KPRz2yBwK4uYxhVDkQHe4Ct+2ePNvDDi6ee4=;
 b=IvOhv/D7WXOlc50vztE4BBwBjypF1E31Q/C57KBkRZU7D9GPdcxRULeFq3xVjaq3Lx
 GUyb/iPD5a0kyHHpHnjJgZ2gnBy08aCMdEzEDpR9uFmlbuHpfrZnYInczAikFndXEU66
 3HAx1ap2Uhlb+XgxPApHLT2YANj9VR3xnInnFZskO0uEKZRzxbLNSH6jwDuaUWnbIKoJ
 MpP2GeM3pEoqRhFBh+DQx/x/Xea+8teFp1Ns60LVieZz0EZFkn17dzvUlH7ZZMW7aFwO
 okTq+EwOfnGBLpEoPiqZXNL+kvAmG1JyyAtIdXadDsYxNwNs8aFB17uc4o1wPp2EgEGV
 YCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uqj9Ey2KPRz2yBwK4uYxhVDkQHe4Ct+2ePNvDDi6ee4=;
 b=XiVF2ztu2NQQGnrthU0WEQCqWQGkXvDxKuxzifDlNCsR1NQamUQlVh2jWamLwjRP0R
 OzORXtC7vtCQ/DQwZ6VgNb+YpN0BlSrxqyLcVOMfFcqZ6FkWKTKRS0xhsom/E6I7Q7Ju
 mpvE4n02szpd2euDHvpKjc1Pg01Q0PEcACGA2KsfRN7gjL//z8NBTWnl1W0TOy+nop8g
 Ss8N67Bf7lvuul6KhgPNclo4UMeabJeNpUMcRWkP9JYHqQyNOBe//jqpvsHQkpkCkrEd
 y8sbeeGPRr8x4OYAK77Cow8pWBdmdw/3y/wQsSjgC9JcRZiAgUJ4Voets8Zk5jOMXZNg
 nxgQ==
X-Gm-Message-State: AOAM531c3vbTDgJlFTPv0I+Hi2qWerTS8KjEWS1xcSh01yTLbHpxnHpT
 0aZjLDJvO8L8E1a04aLWhDiC8nu2LLEM
X-Google-Smtp-Source: ABdhPJwSp5uTL/UJ75FIHUBeLhQftQJ8YAeiHcxr2U8aVqHe58cUwiAeHDL2UwYFXJPCsHcVJPFAtg==
X-Received: by 2002:a2e:743:: with SMTP id i3mr3079673ljd.266.1626162601059;
 Tue, 13 Jul 2021 00:50:01 -0700 (PDT)
Received: from [192.168.1.53] ([91.247.148.7])
 by smtp.gmail.com with ESMTPSA id h19sm1438512ljj.23.2021.07.13.00.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 00:50:00 -0700 (PDT)
To: Jan Stancek <jstancek@redhat.com>, Petr Vorel <pvorel@suse.cz>
References: <YOx1pir0UuBNM+4w@pevik>
 <CAASaF6zS0kPHk6vSvANA1KzuOCtJHskLmOE_DE1n4b5AhMUPkg@mail.gmail.com>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <d2d298df-b432-4afb-6654-cafb7de36bbb@bell-sw.com>
Date: Tue, 13 Jul 2021 10:50:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAASaF6zS0kPHk6vSvANA1KzuOCtJHskLmOE_DE1n4b5AhMUPkg@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] tst_strstatus.c fails on Alpine
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 13.07.2021 09:08, Jan Stancek wrote:
> 
> 
> On Mon, Jul 12, 2021 at 7:02 PM Petr Vorel <pvorel@suse.cz <mailto:pvorel@suse.cz>> wrote:
> 
>     Hi all,
> 
>     I see failures of lib/newlib_tests/tst_strstatus on Alpine:
> 
>     tst_strstatus.c:31: TPASS: exited with 1
>     tst_strstatus.c:31: TPASS: killed by SIGHUP
>     tst_strstatus.c:31: TPASS: is stopped
>     tst_strstatus.c:31: TPASS: is resumed
>     tst_strstatus.c:29: TFAIL: killed by ??? != invalid status 0xff
> 
>     Any idea what could be wrong?
> 
> 
> I'd start with definition of WIFSIGNALED on that system.
> 
> printf("%d\n", WIFSIGNALED(0xff));
> should give you 0, but it does appear to return 1 in output above.
> 

musl defines it as:
#define WIFSIGNALED(s) (((s)&0xffff)-1U < 0xffu)
so passing 0xff trigger this.

This difference from the glibc have appeared since the commit:
41c632824c08 ("fix definitions of WIFSTOPPED and WIFSIGNALED to support up to signal 127")

May be changed 0xff to 0x1ff for invalid status...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
