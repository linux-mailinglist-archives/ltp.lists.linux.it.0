Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FE0F7AC0
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 19:27:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1A2603C2354
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 19:27:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 380223C0FE7
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 19:27:11 +0100 (CET)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9C6C01401393
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 19:27:10 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id g3so14854080ljl.11
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 10:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MThzuPE5GHK9HkxVsoX5XDICTVaynruuXSaosaKjcs8=;
 b=Fw0twQqHYcZerf7R7Z3mbmARQOIFlH3pXVj4Yjat2DM7woJjV+SUtLUFxaEmeBl+U5
 szMKEvHO9eLWrC8gGlF9I60PdiM4n2eVfToqoV5409n1CtsBTL3vU6t0ClyXdYIp4Xvt
 nWXLT0OSdbsl0Wx6bZ6d8xeGYVa8JX7gNAf+7micSQJLTdtOlEcyFzX48Yb1d5PPyBxL
 DefhaGvaBR5etVxoKduL7AjUCl4udWuhNJWtuhe24rPNevBh9yKJxiS6oY/UpubbNHmA
 SamzTvPY1gSEo+YFXpeKBxJxPZAYb3un85/OrkIjyB8A71lPT+Iigg7yWZpwMiCJ6xq1
 VNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MThzuPE5GHK9HkxVsoX5XDICTVaynruuXSaosaKjcs8=;
 b=BL6fBSBvJpusiFJfSsINnLWy0FAmYjP1ipWjtNWREwXosNFuQXdeoEzILQKMmiIuly
 K8xXwOk3AT8S4SLMVLVjkd/SWBqM/GD3gS7FZostAhFr0UeHzYr9FjrmdnYKoK95+I+b
 epunRWpxZbGiBq5YY9UO30nXdoBkR3pnMMJ7rf508d/bEbyb3YoPEF39VRgh1suzKN8O
 Zn0Q7z1CVISq9zEqOa9qLHR4CX/XUpBnM6+/aCUxJ0D1UGgsRxFcXP2ECOxx+b2K40sv
 /0Y2LIQOae6iFxYxknb7OFiHOB2XaLAjYQiKswhkosk1ZTT3tOAtpXy7XSheXTN6g6zZ
 /Mtw==
X-Gm-Message-State: APjAAAVL6awhR3uI+J+HV6I5Zsd41FEF7ue5tpXf+/Io/nbRAlBdRqyU
 kM0pMC54OO0sSqAbunWrqPsNUthi/5anEWouz/0b6Q==
X-Google-Smtp-Source: APXvYqyWMSR5OPToEop6rDei4ILQee/UuxXH+ZjV7ZXKAeitGVZS2Lw9zm51FtgZf6Xt1NfAsveDiRmS7Mfl3wUydIw=
X-Received: by 2002:a2e:a410:: with SMTP id p16mr17228931ljn.46.1573496829912; 
 Mon, 11 Nov 2019 10:27:09 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtmA5F174nTAtyshr03wkSqMS7+7NTDuJMd_DhJF6a4pw@mail.gmail.com>
 <852514139.11036267.1573172443439.JavaMail.zimbra@redhat.com>
 <20191111012614.GC6235@magnolia>
 <1751469294.11431533.1573460380206.JavaMail.zimbra@redhat.com>
 <20191111083815.GA29540@infradead.org>
 <1757087132.11450258.1573468734360.JavaMail.zimbra@redhat.com>
In-Reply-To: <1757087132.11450258.1573468734360.JavaMail.zimbra@redhat.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 11 Nov 2019 23:56:58 +0530
Message-ID: <CA+G9fYtuwT_vkQL-RfAMcmH_HBHUWQ5ZPHdwsGoNTALhwyiZgg@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] LTP: diotest4.c:476: read to read-only space. returns 0:
 Success
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
Cc: Theodore Ts'o <tytso@mit.edu>, Arnd Bergmann <arnd@arndb.de>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Mark Brown <broonie@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Christoph Hellwig <hch@infradead.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4 <linux-ext4@vger.kernel.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, 11 Nov 2019 at 16:09, Jan Stancek <jstancek@redhat.com> wrote:
>
>
> ----- Original Message -----
> > Is this a new test?
>
> No, it's not new.
>
> > If not why was this never reported?  Sounds like
> > we should add this test case to xfstests.
>
> I'm guessing not that many users still run 32bit kernels.
> Naresh' setup is using ext4, so I assume he noticed only
> after recent changes in linux-next wrt. directio and ext4.

That's true.
Started noticing recently from Linux next-20191107 kernel on i386 and arm32.

Steps to reproduce:
./runltp -f dio -d /mounted-ext4-drive

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
