Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C3131C4BC
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Feb 2021 02:03:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9AE863C6888
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Feb 2021 02:03:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 1A5783C5994
 for <ltp@lists.linux.it>; Tue, 16 Feb 2021 02:03:24 +0100 (CET)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 003EC6008FD
 for <ltp@lists.linux.it>; Tue, 16 Feb 2021 02:03:23 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id y26so14003750eju.13
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 17:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zrjbMWbLD5k1YU1gY6sgg8lrLPs48sMOTQtq5qr6+JE=;
 b=LIupk08tNIWocLfmHYdevHIaMUM6xGoaBpAWMYTkuBgf3r3EGTFB209egHvSXfoGNS
 GWCWd7fEN/Bq4pnpKID2URgFbQqUTAU0x5/K9yCIWixQjRfUYcasFfnfI4Dz/HnBRG54
 dhmq2a26jT7RKOsFjj3UmPANSPpO/7HeXa05EhfgHmDdrRYh0xun30YVkTlAlSliJdOU
 x9oPZ9Mw5Y+RDjR1FrWgrdAicmx3f7lHd4l1LWa9dYQyyqjqsWggjk61PKX40m4ENZxw
 pC5aJ3gDug4zgcA1QWzS75Qk5sOiWwwLuPUfn3cSlR4bGI7xeUwEbZSP01Nb3XKKQ4gp
 NviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zrjbMWbLD5k1YU1gY6sgg8lrLPs48sMOTQtq5qr6+JE=;
 b=PwsUi6T2DtUH1Vt3RCL1q0+Rtz2BXJmxjEqmF2rQXrnoAOpfUNTbh8CQxZ0qLaV2IL
 sMG4Hk9kLf0C6BrT4xyUI3tiWgmg3TWMFqGTwkH6HKVOfetoBBJYDhEKD3SdfmnKzWFj
 z8yGrDQsB0xnwXaNSP4FBVJysuqxyKNfljm/pbrWQUnej94K8SdKwDqNVAuFwzCpEoxB
 5cfVVbUpprWz+vL83Q3qSbG7MPH4V230ox96qNEYS//uRobpzW/16u2g+OnrVWFkTvq8
 vifYE1jORaYSJ0Fbv+qnlPTHWksYWWRs/5GiRbo0Fc/Y0GYK3yb1dPDFLay2t8mSz50W
 C8IQ==
X-Gm-Message-State: AOAM532IaNceAp8jdxStK7YTERIFywMws8n4twZtU57HruGoZ/FwJdTy
 hhGHP1nu9CuxSIirYDMDi6ZkSYCDJopcryX2maoNSQ==
X-Google-Smtp-Source: ABdhPJy8c/0gVUxzxzOu465gevLaW/oq5+vXZq8cBcdf0ZCueZjV3UO69BfxcbMCkyHxtXaBOFrKeIBIx/oCPyWBv/g=
X-Received: by 2002:a17:906:4c85:: with SMTP id
 q5mr17896470eju.375.1613437403417; 
 Mon, 15 Feb 2021 17:03:23 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYsvDWDogC+xgeG2V9MMofV5svTipDigDiUBje+2jSRK8g@mail.gmail.com>
 <CAK8P3a2OeeW29ekbD70Ns4LTjGRJRT9P0wM-SAxUin1zAxP7TA@mail.gmail.com>
 <CA+G9fYv89bfbixjuudPWkBAucTYg7qhNxcV54RMEkRP5is-bnQ@mail.gmail.com>
 <YCmAGNyFAOZs7GCG@zeniv-ca.linux.org.uk>
 <CA+G9fYsZnBv4wAEKYb0mgMd-BsgXcPUGBQ=VRKcONqAZry_4XQ@mail.gmail.com>
 <YCqGX36I+KR7SoA8@zeniv-ca.linux.org.uk>
In-Reply-To: <YCqGX36I+KR7SoA8@zeniv-ca.linux.org.uk>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 16 Feb 2021 06:33:12 +0530
Message-ID: <CA+G9fYuq7bpDhY3cA5O66bf0nxKUkbtiTMcLMqBYvWKLhNfrjQ@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] LTP: madvise08.c:203: TFAIL: No sequence in dump after
 MADV_DODUMP.
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
Cc: Arnd Bergmann <arnd@kernel.org>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Richard Palethorpe <rpalethorpe@suse.com>, Peter Xu <peterx@redhat.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Christian Brauner <christian@brauner.io>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Joerg.Vehlow@aox-tech.de,
 Andrew Morton <akpm@linux-foundation.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, 15 Feb 2021 at 20:05, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Feb 15, 2021 at 02:11:15PM +0530, Naresh Kamboju wrote:
>
> > fs/coredump.c:903:9: error: 'return' with a value, in function
> > returning void [-Werror=return-type]
> >  903 | return 0;
> >         | ^
> >
> > Build failed due to above error.
>
> FWIW, here the test results in
> Running tests.......
> <<<test_start>>>
> tag=madvise08 stime=1613398818
> cmdline="madvise08"
> contacts=""
> analysis=exit
> <<<test_output>>>
> incrementing stop
> tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s
> madvise08.c:78: TINFO: Temporary core pattern is '/tmp/ltp-tgvQ3Lz1UZ/B6lwy6/dump-%p'
> madvise08.c:117: TINFO: Dump file should be dump-2276
> madvise08.c:201: TPASS: madvise(..., MADV_DONTDUMP)
> madvise08.c:117: TINFO: Dump file should be dump-2277
> madvise08.c:205: TPASS: madvise(..., MADV_DODUMP)
>
> Summary:
> passed   2
> failed   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
>
> (built without -Werror=return-type, so I'd missed the warnings)
>
> Anyway, I've folded the fix (with those stray return 0 removed, of course)
> into #work.coredump and #for-next; works here.  Could you test either
> branch (in git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git)?

By using Linaro tuxsuite [1] I have built your tree and tested on x86_64 and
the reported test PASS now.

LTP syscalls [2] and LTP fs [3] tested on x86_64 and both PASS.

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>


[1] https://gitlab.com/Linaro/tuxsuite
[2] https://lkft.validation.linaro.org/results/2278012
[3] https://lkft.validation.linaro.org/results/2280979

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
