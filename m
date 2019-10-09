Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B42B8D1781
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 20:22:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C73313C2210
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 20:22:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5A1133C1045
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 20:22:12 +0200 (CEST)
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2C01A200962
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 20:22:12 +0200 (CEST)
Received: by mail-qk1-x743.google.com with SMTP id q203so3130033qke.1
 for <ltp@lists.linux.it>; Wed, 09 Oct 2019 11:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H2xenOjKhEjI3eIbcLRwgdoYJ+Yca/GheW1m8e/Y1fI=;
 b=iSGFQLIZfMmkjaRR51tXuM3S5frAEjjZKhlmjZn6k/5dU6gTR4YZL1HctIZjL8x0z/
 ztFPTbxc0PHe23byPLC7xn9GYkJ48Uf1y9rp53qA/9f03vwBMqkVohJmyFGOMXxP9e6v
 sFsTdk8Zu+xcdEHQyA+CKtmovzimXrCV294hmRTk8x/Bv8yo6sBowaspPa/3EeLHumpz
 hV/wkjyDA9y02ysYOjSmOhczTBuRJU0LXfXcek851Z4Im3ASeABO7rbg3a3KEXJhkwct
 Gd84p/ulOFjVT0NuMpp4rdy/w7zXFE+bs3gXdd5ZtVedCG2dAlrojO7RD8+DqGPxiGMm
 OYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H2xenOjKhEjI3eIbcLRwgdoYJ+Yca/GheW1m8e/Y1fI=;
 b=o2JJH8Obe6BmRTG0bre3ssEqsWu32RsEqRaQmIZRzITbpdS4aBMQwn7bEaP5AWZdZQ
 ZWgCTUB29h0zCfQ0ptgc9aJ4oo6OemqiD9xk1RLkNS8/2W+aFoFQTaCiErq4St5rZF6j
 P06wxt7tnZiPr08pjabfMROtC31VVz/aJ8QlSqgu8TlY2JjRyWVk/AckY6p+3PrJNoA1
 DPHhLbdIOWbzYnJpxVHUahoCDVSE+CLu3+7VukTlzoAqJy3F9k2tGAIsdGfC+A4a9grF
 NxMTzSMtnB+cOCFwj1TTVhQ1Yw9PMT8HLGjTmjW9r0jXQ9IaPYjZDnNY0ZwagG80vkQJ
 QSew==
X-Gm-Message-State: APjAAAX98h5ynVSpZtSW3xAmxqn/RdMgBD7j9kSM6FvbuH2vbdaJwjw3
 Ugmum3j7f8P+/uby8jW+vRBhVhTNav/KrQCf2RfP/w==
X-Google-Smtp-Source: APXvYqyofEfweyiCTLlPPDZvFYgTchDbRQyfSzi96XRZBpMeCyWEE7EKAypqQSpLrRjLYrmmB/Kbuomn0N3J45JI3jc=
X-Received: by 2002:a05:620a:2158:: with SMTP id
 m24mr5147732qkm.250.1570645330350; 
 Wed, 09 Oct 2019 11:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191009142446.6997-1-rpalethorpe@suse.com>
 <CACT4Y+b0tTAQ0r_2gCVjjRh--Xwv=aLzh6MY=ciXMMrK+cAQsA@mail.gmail.com>
 <20191009145416.GA5014@rei.lan>
 <CACT4Y+ZL8ocQPpwR-_8+0PdF=r3AkFZKvOR==+P0y0GF67w1Vg@mail.gmail.com>
 <20191009180447.GD15291@rei.lan>
In-Reply-To: <20191009180447.GD15291@rei.lan>
Date: Wed, 9 Oct 2019 20:21:59 +0200
Message-ID: <CACT4Y+ZABX2z4Lxrvokf5DHz351xTys-gJPNhFjP+Zx6Qd2zsg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] LTP Wrapper for Syzkaller reproducers
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
From: Dmitry Vyukov via ltp <ltp@lists.linux.it>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Cc: automated-testing@yoctoproject.org, kernelci@groups.io,
 George Kennedy <george.kennedy@oracle.com>,
 syzkaller <syzkaller@googlegroups.com>,
 "open list : KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Cyril Hrubis <chrubis@suse.com>, shuah <shuah@kernel.org>, ltp@lists.linux.it,
 Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Oct 9, 2019 at 8:04 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > > Indeed, it's removed recursively by the test library.
> >
> > :popcorn:
> >
> > It took me several years to figure out how to more or less reliably
> > remove dirs after the fuzzer ;)
> > (no, unlink won't do ;))
>
> I guess that there are things such as immutable file attributes that has
> to be cleared and many more. Do you have piece of code somewhere that we
> can look into to spare us from reinventing the wheel?

Here is what we have:
https://github.com/google/syzkaller/blob/c4b9981b5f5b70dc03eb3f76c618398510101a1d/executor/common_linux.h#L2358-L2461
Maybe it can be simplified, but that's what we ended up with after
some organic evolution. At least the comments may give some hints as
to what may go wrong.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
