Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74964D1567
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 19:20:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0265C3C2273
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 19:20:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A752F3C2026
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 19:20:21 +0200 (CEST)
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5C9981A00E4E
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 19:20:20 +0200 (CEST)
Received: by mail-qk1-x743.google.com with SMTP id w2so2942558qkf.2
 for <ltp@lists.linux.it>; Wed, 09 Oct 2019 10:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nSnnhTNLEpTMeSCRUg0zBNoXVEz2bdMff0d8gEofvx8=;
 b=vmLzriJea9JtbJ3dUCxkyVASD8LkH0jrbWi177DzBd5kdV9y8H0axd0j/dksuMS0VP
 5PSNx+4WkojupjVWSrAhcwaxHoKb6yIMR0bQZ+2DKpfqdGJ52AfO/S9qJ8V1nsUisIT3
 D7ulZJ3gl7z3vLGIbhKWbyuxNOO5T5igY9PLHWdXpn6LvDpjtycJmZRO6LjwgBZIpRJQ
 kkhQEIyUH8I9e+oD/F+a7ABcjfv4a/zVFwUX/yz+i8saZRp+uxP9/+QFaQXJ2VVRI9MV
 yNql574fY231m3V5WLJn7YULrr65lsjoTQCizhH/aj4V5XuQ6vPboWIg+9R+xmOlWhkr
 ziOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nSnnhTNLEpTMeSCRUg0zBNoXVEz2bdMff0d8gEofvx8=;
 b=WKbrFJkdTUzwfwifxr/xEJykplqrkteLBsq8yN8M3UYzUmKY3O0Ulo/YbdmPfehOes
 3jJx9GgpzD8hWK5gqel/lonSazA0WL0pGuQ9E7CSKhA/lSnbgJa5mAa6dCTHeYkVYKr5
 BsDXh2kFXldlHHOOII8Evixsxas3Hk9JH2dMVotlzrSyN5gNQ61NaRYOhMuS4mrCcFta
 WsK2dScSGmESSxBRxkrtRXzEtQRyvpIj80o8PRZK14wbDd4UXjNjnVrNw51Bzswo4d/W
 IaitCfEyRwyyT2q9sA4fTxLFfmmhIUgr+tJZvfd8niRJwnRnphsuUpurdkrkjNg22u5E
 Kg+Q==
X-Gm-Message-State: APjAAAXoZHUMf/5QxZIfrPPEnvfn9SWozbzMkm35EAOvBzk4jbrfAvdc
 KHzIdCBQqwJ0aMk+cHmusrCg0WOGItBhh286tVeP0g==
X-Google-Smtp-Source: APXvYqzmXSw0dnv28CaF3ixV652xYWDLQfA5sQxOV7hnijQ3mOCKQz8+cBdfYKD/8JeIR4j+EEOpdaoC7VtTNcVEvLM=
X-Received: by 2002:a37:65d0:: with SMTP id z199mr4354968qkb.407.1570641618500; 
 Wed, 09 Oct 2019 10:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191009142446.6997-1-rpalethorpe@suse.com>
 <CACT4Y+b0tTAQ0r_2gCVjjRh--Xwv=aLzh6MY=ciXMMrK+cAQsA@mail.gmail.com>
 <20191009145416.GA5014@rei.lan>
In-Reply-To: <20191009145416.GA5014@rei.lan>
Date: Wed, 9 Oct 2019 19:20:06 +0200
Message-ID: <CACT4Y+ZL8ocQPpwR-_8+0PdF=r3AkFZKvOR==+P0y0GF67w1Vg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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

On Wed, Oct 9, 2019 at 4:54 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > I don't have prior experience with LTP tests, but from reading the
> > code it looks reasonable to me.
> >
> > I assume that .needs_tmpdir = 1 ensures that each test runs in its own
> > new temp dir, which is later removed.
>
> Indeed, it's removed recursively by the test library.

:popcorn:

It took me several years to figure out how to more or less reliably
remove dirs after the fuzzer ;)
(no, unlink won't do ;))

> > I've stared for a while at "rem / exec_time_start < 0.98" trying to
> > understand what is that tst_timeout_remaining() returns that we want
> > to kill that process when the ratio is < 0.98... provided that we
> > convert 1 to float but not the other var. I failed to come up with the
> > answer. I have potential answers for "<0.02" and ">0.98". But I assume
> > you know what you are doing :)

Ah, I see, it's not full timeout, then it makes sense.
Probably a comment won't harm.

> The tst_timeout_remaining() returns remaining test timeout, so at test
> start it returns something close to 300 seconds, since that is a default
> for a LTP tests, so this would probably kill a process quite fast, if
> I'm reading right, after a bit more than five seconds. I guess that this
> is something intended for a quick v1 hack rather than for later use.
>
> > Re tst_res(TINFO, "Timeout; killing reproducer"). Not sure how much it
> > pollutes output on 3000 tests. If it is, it can make sense to remove
> > it. Lots of tests run forever, killing it is not something of
> > particular interest generally.
>
> I guess so.
>
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
