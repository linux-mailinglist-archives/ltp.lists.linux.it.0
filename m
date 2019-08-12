Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2024289674
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 06:52:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A77A73C1D14
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 06:52:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0AF873C0886
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 06:52:42 +0200 (CEST)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 365CB1000A22
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 06:52:35 +0200 (CEST)
Received: by mail-vs1-f65.google.com with SMTP id 62so6274144vsl.5
 for <ltp@lists.linux.it>; Sun, 11 Aug 2019 21:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mEGzP7NM6xNrGMongS/93qh35vuRsmo9s7NQ8ROistQ=;
 b=Nr5IhfPqxqPdhdaXAgWYv5gzOs2PsAfiVxCKGW6o8uLUtGqhi4gmE52bYngwz4B4IJ
 OX0HqVyOmDtFadKeAMHtOEZkVuIew3JCX1DXPJZjPc54/Tn86rokqobzcVpwDIi4kxlg
 uuTz+QVGjneWlUuTthKtgw8xgAZ7MGazQ341sq1dO8kfbC2ZEdFnDxUX9HfIVwzgDtUU
 ZUj1UEwKBIzstu7ElG4xLw74gIcHSNXbyD1t9ChDx/qq6ffcVuXpdvW6tRizTryMLOi1
 bZyYhd2bUJWCumGfPlAF2BTfKoB2dwiQxjNjBJY6oRSr0JUVnzGwfXWgE/eXS1rR0bSq
 pUFQ==
X-Gm-Message-State: APjAAAX3TYiHk9LInjaLkTWq8GnI21Ini290SOR2A9GI68RMfOofkdFA
 OIYb9jrGjCDxZEC9nlXAfxwrXZKw8t4cbDWyFuoU6A==
X-Google-Smtp-Source: APXvYqzPC70P0/gSnXWQ5skV6oCS5YUSefBaBVSspWUItg1LFTA/Yr5Lbn11vrfjy1yGCcMQ8x5k7YpLZTo3t1+6k+o=
X-Received: by 2002:a67:1a07:: with SMTP id a7mr954294vsa.58.1565585560077;
 Sun, 11 Aug 2019 21:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <ee463189a82212a10c1ac06229dc0a418e18305b.1565361031.git.jstancek@redhat.com>
In-Reply-To: <ee463189a82212a10c1ac06229dc0a418e18305b.1565361031.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 12 Aug 2019 12:52:29 +0800
Message-ID: <CAEemH2edRKv02Hu=LzBe06Op=NCnYpweJKQNxJ4pxoN4cp8iPw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] clock_getres01: drop case which is passing
 NULL res parameter
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

On Fri, Aug 9, 2019 at 10:32 PM Jan Stancek <jstancek@redhat.com> wrote:
>
> Since commit a9446a906f52 ("lib/vdso/32: Remove inconsistent NULL pointer checks")
> VDSO treats NULL parameter differently than in syscall.
>
> Drop NULL parameter, subsequent patch will add test variants that test NULL
> res parameter using syscall.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
Acked-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
