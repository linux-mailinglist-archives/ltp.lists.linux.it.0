Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 827E9264776
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 15:50:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB1843C535D
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 15:50:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E4A423C2BFD
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 15:50:54 +0200 (CEST)
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3EFA910005B0
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 15:50:54 +0200 (CEST)
Received: by mail-il1-x142.google.com with SMTP id q6so5660300ild.12
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 06:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kzn6JbCYqK22Zww4auPzfe8UdBTItimCL3yGAlYmHzE=;
 b=IXVkMyfFP7UcdWJJcSmIEbQhMnR/tPitA3cqdQPStULOiyVfXJOzc3NPAQq0Yr5t2F
 dgWGWWL3a1Px58outxu7ijo/xNS7lQiiMzlKXxcTguFGf0jfti4e2hU/Zwzh+Ep69iPO
 kKfoTB9UIznMkw5R9V52rj1Npl64FPgd7Eyqvk4tFxpoS06J9vgaKR4ZC/bdVR9MuiG0
 e5ywmYuK4LmDzIyildvkfUQqd68tiNnTZNvIhaRHFBP0gAZ+vzRupVI9r3Eg9ph5ed8t
 /+8UCwucUuAJban5QX9hAxH3EVGTxWKUDgGAMU1q3l+lRMVhV/4Scma4ss4qwlBnulIg
 SpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kzn6JbCYqK22Zww4auPzfe8UdBTItimCL3yGAlYmHzE=;
 b=lP+lCsxijzn+a51oVfTy2jVgjzpTp0fnom4fR2AkDTsykV8n1V5ZzWzNd7pZWaErgu
 ZgFLFaRvwXgy53wZIY2yyBwItelPaoYPQ2RGA6ZzrKMaYR4YdoxWMK2i3bsrXx7zysCt
 uzRvBRmyDfwcJN+T1Ro6tthlGMU8z0H+IyOpWE1KgQRdGGW2AHwv/7++3n47vqgh/OQf
 0yTyhRp4QNFae5wBKVmxfvXZr3UEWOOdfvIf6ahxj6uwrTTlYm0xCI1PLwSHN93fi0Nv
 PoZX68ZfTzQUZlq8/HBVL/U9/KbfLRjXqxRcqzFos140D6zy8A0ObIvC6/URN/OjD1jA
 OTIw==
X-Gm-Message-State: AOAM533eR0YQ7IDYld4MAxm1d2zOJlRFvZfQf2c3+pEl2MX3hd7J676s
 HjUciqtzC5NExPZX8/iNq1JiQLTcJK/QRgZXpJU=
X-Google-Smtp-Source: ABdhPJxbVIxh4BpNYcx5JjEGYtRA4d3cF4FptoR2ei91c+qegODPmY5+DN+EFUo6BLok/2L2hHfXHp4xr2y6LFHb++Y=
X-Received: by 2002:a92:d482:: with SMTP id p2mr8327908ilg.9.1599745852968;
 Thu, 10 Sep 2020 06:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200909175707.10670-1-amir73il@gmail.com>
 <20200910112730.GA7194@dell5510>
 <CAOQ4uxjAwQcmSnsJ5=O88bi2zxAzAe8uXCgg4+5mF6qOmSBfGQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxjAwQcmSnsJ5=O88bi2zxAzAe8uXCgg4+5mF6qOmSBfGQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 10 Sep 2020 16:50:42 +0300
Message-ID: <CAOQ4uxi3fv-ONsJoXYwTh2iP5fM2Ssj7GgcrzcEGRtsEbYgNLw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 00/10] Fanotify tests for v5.9
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
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Sep 10, 2020 at 4:36 PM Amir Goldstein <amir73il@gmail.com> wrote:
>
> On Thu, Sep 10, 2020 at 2:27 PM Petr Vorel <pvorel@suse.cz> wrote:
> >
> > Hi Amir,
> >
> > > Following are the tests that were used to develop the upcoming fanotify
> > > features in v5.9.
> >
> > > The inotify/dnotify tests and fanotify09 test case are regression tests
> > > for a mid series bug that has been fixed before the merge.
> > Patchset merged.
> >
> > > fanotify10 gets another set of test cases to catch yet another ignored
> > > mask logic bug. The fix commit will be too hard to backport IMO, so
> > > perhaps these test cases should go into a new test with .min_kver = "5.9".
> > Can we just skip particular test with tst_parse_kver() or tst_kvcmp()? Because
> > other tests are valid, thus why to skip them (which would be when using
> > .min_kver).
>
> Sure I did not know about tst_parse_kver() I will send a patch.
>
> BTW, sorry for the wrong commit id in the test.
> Your fix missed removing the old commit from comment:
>
>   * Test cases #17-#23 are regression tests for commit:
>   *
>   *     497b0c5a7c06 fsnotify: send event to parent and child with single...
>   *     eca4784cbb18 fsnotify: send event to parent and child with single...
>   */
>

Actually, I don't see any examples of tests that use tst_kvcmp()
Do you mind making and testing this change?

All the test cases in fanotify10 with non zero tc->ignored_onchild should be
skipped for kver < 5.9

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
