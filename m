Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 820AF287CCC
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Oct 2020 22:04:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 40D083C3358
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Oct 2020 22:04:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B91103C223E
 for <ltp@lists.linux.it>; Thu,  8 Oct 2020 22:04:09 +0200 (CEST)
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 71A7B2002AE
 for <ltp@lists.linux.it>; Thu,  8 Oct 2020 22:04:09 +0200 (CEST)
Received: by mail-wm1-x343.google.com with SMTP id d3so7726892wma.4
 for <ltp@lists.linux.it>; Thu, 08 Oct 2020 13:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=0cpv+tP36ues9zKZvc23gnyV9b7gmZPPP3bWOFay3Z8=;
 b=soGxHYxnlKP7l3roOE54jwTEMNQqPWr0nj6Hc9h7KhV5a8ASVFMdI1r+dyLbrtgIlV
 TIdIKxQRLCjI9QAsxQOxc9AHdwu5H5MieylLqbVx15tm0HWBhRKahOO9STQ4r/ARFp+h
 ag8HAY9rWc6BN+2zEcR6FUdQGjvyCdNf+e4zF7CfRfjQgx/nKr9oj2Lybgq7pNxViRIi
 URASZFHORPGZxpo8hBuB4alXjoaIhNJqxtu820Z8PwM9/JpM+Y4bxcXu/IKgbPSPefd4
 G3oQaPWFeqzD9PjBz9F9pBE735mtlMp6IYhU/ubBRRI9qww7GMVCbY7y8MURqzuej0rc
 GynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=0cpv+tP36ues9zKZvc23gnyV9b7gmZPPP3bWOFay3Z8=;
 b=gUuK3wdklS8fh+bZOi5EwZUb72duB8QGafLnyCq77QVvcg6PTseHCuDDrNM+GfUvbo
 dMZHnXcgVvHagG83zFVVrWyYLWQpdF7Xim+ZwCwq6EinmMGxHxUO9EXdxPntk/HGcGCf
 Eo1otTWq/87YgZp80UezYYDRA5ZIez9bBYzvehG84VLbowG72dXZ7qwgQiic5Rkoi06o
 aHYtAzjTDbVD8WFeVoOYYSFsNeMe0xVGtMXL6QTv1nCXqm1+aQIZw6338/HHVibuO3VU
 oMeLFcHhm+VEvTkcohCQavc7V+w51xtRmB1/l940oNXX2QVk63qDnY2jpH84FwECnO8c
 Tgzg==
X-Gm-Message-State: AOAM531BIgwNuKkjfrE3QRU8NKOJQWG3pH8nr+JdR4R4z3BgzhsoMUon
 gBBThfadlIh7BoKtp0v2FzU=
X-Google-Smtp-Source: ABdhPJzbefUFsnEexYnumCuenoA3EWX1ObnpD7vhR0ttyC6Vq9tiw4N7i5bJAYFbq933cEFleHu87Q==
X-Received: by 2002:a1c:4904:: with SMTP id w4mr9841419wma.99.1602187449021;
 Thu, 08 Oct 2020 13:04:09 -0700 (PDT)
Received: from dell5510 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id v2sm9103715wme.19.2020.10.08.13.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 13:04:08 -0700 (PDT)
Date: Thu, 8 Oct 2020 22:04:06 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20201008200406.GA18136@dell5510>
References: <20201002202416.28972-1-petr.vorel@gmail.com>
 <1478290725.17134142.1602069275205.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1478290725.17134142.1602069275205.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] cacheflush01: Rewrite into new API
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Ofer Levi <oferle@nvidia.com>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Guo Ren <guoren@kernel.org>, Greentime Hu <green.hu@gmail.com>,
 "Maciej W . Rozycki" <macro@linux-mips.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Vincent Chen <deanbo422@gmail.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan,

> ----- Original Message -----
> > This syscall is currently (v5.9) supported on these architectures:
> > arc, csky, mips, m68k, nds32, sh

> > constants are missing for m68k, not sure if the testcase is valid for it.
> > Untested.

> > Test for __LTP__NR_INVALID_SYSCALL saves adding autotools check for
> > <asm/cachectl.h>.

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> > Hi,

> > FYI: I was going to ask for removal of this test, but all these archs are
> > still supported. This test compiles on all archs now, but I haven't run
> > it (I don't have access to none of these archs, not sure if LTP is even
> > tested on these archs).

> I haven't tested it too, but rewrite looks good.

> Acked-by: Jan Stancek <jstancek@redhat.com>

Thanks for your review, merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
