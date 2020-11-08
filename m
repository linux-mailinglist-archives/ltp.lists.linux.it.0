Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAFE2AAA1D
	for <lists+linux-ltp@lfdr.de>; Sun,  8 Nov 2020 09:43:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C55513C2F8D
	for <lists+linux-ltp@lfdr.de>; Sun,  8 Nov 2020 09:43:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C9CDE3C2397
 for <ltp@lists.linux.it>; Sun,  8 Nov 2020 09:43:15 +0100 (CET)
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 851DF6009AD
 for <ltp@lists.linux.it>; Sun,  8 Nov 2020 09:43:15 +0100 (CET)
Received: by mail-io1-xd41.google.com with SMTP id s24so6701765ioj.13
 for <ltp@lists.linux.it>; Sun, 08 Nov 2020 00:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wie2YmCGFdX89pZdQZvVK53OoaPH0Lpdsl1x4BLM/IU=;
 b=LQ7mLE6EGBA+DuAIfllHiwmDSRfrQquzebQyrEScFHFi531WyxgtpXMozlNI2qATZp
 VZbHsPewZVw8+YFM1inYw2gh24qKGGu3QXC3Bd/NiM8xy1FFZNIvH7jBaFh+V7nVWOiR
 ePOlFkbpqwwfdpGSIb5IJzviCHiLWAmzn/M451i5YeAAkkX9RsdyH70adKkvFGil8K3Z
 r9aoAD/NgJXj8ZOVFYJricqu6b84V8HT+5WTu3KT8GqNiX5TyJ68Uz74SfR+u0bFSTLx
 alf2F5+MBgitx6/Ax/wgBMp3iSyR8lgB/OVKBEdv2g1Ssb8WRLKIz+8Jy/qDeWAck9v0
 SVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wie2YmCGFdX89pZdQZvVK53OoaPH0Lpdsl1x4BLM/IU=;
 b=Awh1bwxYRQIEtrsTCDfLqDCWx7S4Bn9yUPij6dQdIAQODMwUuSpxqtWr1LOEJopOON
 JDLar+lrHuiC0Vxz52ttCdX9xg6PvNLhndqWMuCV/YdWtf6+mkR3J6zgkzfqnx4W7U5G
 2jzBJAvQTJcpibfn14Q3JBFNd9CN/TEsjTYj6VNoM7ojl4hBtk1GAxbPS5hEXHgJJWzM
 n4zRdJ/RW4EbahIltTZ7p+itqLCR1z07eV7AAgtIeZK3QI851r9VItQC4Ne6bDXewyJ8
 fZV4smd7wlNgUXsNXtopK43MKKDdyy7NaX/wvsU9HHqPdOLP4qDvizztIBNz/N/a+Vdk
 9VMA==
X-Gm-Message-State: AOAM532PfXB5GrT3fbqvEvWhiFBDk8KLNdP9eLmWyRW4PjFXFHPiclqK
 gsF87ipfTxSF96ZpE7pwfpEf02QEWUuEL68nEEY=
X-Google-Smtp-Source: ABdhPJyF0ndCFrfoLLbHBw4FhK3iQAVg1EChunvR+XM0QkuCfVV5hjmz6oCLXp1H771aDXygCBcHf9UNkvgNoiMy094=
X-Received: by 2002:a02:2e45:: with SMTP id u5mr7242029jae.81.1604824994355;
 Sun, 08 Nov 2020 00:43:14 -0800 (PST)
MIME-Version: 1.0
References: <20201016112441.4838-1-pvorel@suse.cz>
 <CAOQ4uxixzOtXjyVTUNR03ffJHgTQCm5+L46zNNgdxvB0n9ZuhA@mail.gmail.com>
 <20201020070017.GA4263@dell5510>
In-Reply-To: <20201020070017.GA4263@dell5510>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 8 Nov 2020 10:43:03 +0200
Message-ID: <CAOQ4uxgAk_k8de0XTewYoFKYYr2Ykpe3Ww5vy7Xfqy9hbUb7VA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] fanotify16: Introduce SAFE_FANOTIFY_MARK()
 macro
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Oct 20, 2020 at 10:00 AM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Amir,
>
> thanks for your suggestions, I'll send v2 shortly.
> I've been thinking about it for a while and agree it's better to simplify
> safe_fanotify_mark() hints.
> I'll also separate fixes into more commits to be more readable.
>

Hi Petr,

I guess v2 got delayed, so while at it let me ask -
Did you maybe consider also moving the checks for
"FAN_REPORT_FID not supported in kernel?" and
"FAN_REPORT_NAME not supported in kernel?"
into safe_fanotify_init()?

The reason I am asking is because I am working on adding a test case
to fanotify09 [1], which involves converting SAFE_FANOTIFY_INIT()
to fanotify_init(), due to pottenitally unsupported init flags in the kernel.

Thanks,
Amir.

[1] https://github.com/amir73il/ltp/commits/fsnotify-fixes

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
