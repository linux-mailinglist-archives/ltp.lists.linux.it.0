Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F1B72B7B
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 11:34:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 981333C1CF9
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 11:34:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 0B2213C18F7
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 11:34:10 +0200 (CEST)
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 46F77600F86
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 11:34:12 +0200 (CEST)
Received: by mail-vs1-f68.google.com with SMTP id m23so30931959vso.1
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 02:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=17/Lxui9DQO0n5f+CTOvalp25/ng8txjPgsGfMnyTYY=;
 b=twxKsxWvVpPWcXcI31n+mtDhubTtH9gSCkXKInEk257MT9q/q/j2JnaYSydTWKf3AC
 p+nbeFPUsDd3nyCNYRHJ7fT5eof6N3FQszR1kTLrDjgoF9Et4u3DfyhqW0cMVbbITBwO
 GHmDI8rfkQ9Mo3Beo1NRXV353pkYzhhDVevcdxIoJQrfXvyov7hXuFeIKkurdmzE7fv+
 FZ3QgH8jC44Bj+QQwlPHeutCO1Ogg/ClBvQibQl/pl4PLp2cn++nzEwNmK6x/VS8Opbe
 KJ6vSmBGuqVZSvQVmukBMQM3UTidPlWnE8Lxq56WRq9CGQxjpRUab4H+WozO6VNA0yrb
 5qig==
X-Gm-Message-State: APjAAAVK8uyhPxO6KQxcJpBOMBlRd12YIefzFsZEw1vAlXhCWQ07qDb+
 Tov/y0E5WDoxWhlCcZwo+W/RlO++/rvoPCISQlXdiA==
X-Google-Smtp-Source: APXvYqzU7JXj7s13ZRwcGwd60VjDh83ifRsj/2M40jtk3I5KgiolZl4rqYkFxaETWIzujUXiXS/nYpRthJpI2Q82f9k=
X-Received: by 2002:a67:e24e:: with SMTP id w14mr32060526vse.124.1563960848679; 
 Wed, 24 Jul 2019 02:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190607095213.13372-1-liwang@redhat.com>
 <20190703131005.GA1712@rei>
 <CAEemH2fGUABOfz=Yq6xONgmHwjaiU6n_q=9EXyZz2EUedpuK8Q@mail.gmail.com>
 <CAEemH2eMA78=5eNwJnZPJ1kw1GZnimSyBsQ+e_wrAu3E+JOoPg@mail.gmail.com>
 <20190710125954.GA5628@rei.lan>
 <CAEemH2ffEk0QT_LHdo6NEuy2FRkwe4j1rRgf9C0E8HzQE-V_eA@mail.gmail.com>
In-Reply-To: <CAEemH2ffEk0QT_LHdo6NEuy2FRkwe4j1rRgf9C0E8HzQE-V_eA@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 24 Jul 2019 17:33:57 +0800
Message-ID: <CAEemH2eYgUn9LFr2OzX8TsuZ_jDrbOccU56h8FkSYYztB_Y8yA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] move_pages12: handle errno EBUSY for
 madvise(..., MADV_SOFT_OFFLINE)
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

Hi Cyril,

Would you mind if I apply this patch? or do you have other thoughts
besides retry mmap on ENOMEM?

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
