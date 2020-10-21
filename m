Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F67295157
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 19:11:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D43E3C56B8
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 19:11:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 939753C2480
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 19:11:03 +0200 (CEST)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 14C621A003E7
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 19:11:03 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id a9so4047790lfc.7
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 10:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jZ8rX4nMXu9yVxF6VhEpyRT/HJL/yeSOHN33lmmqE3Q=;
 b=d6nJua3ZU/+MbORwAQIhOyj2afUAGnde4GMpRV2HxlMNrYs0QlTInEU5dTEigbF5Df
 dmv41P9p05B6BQtvCcM2OmGGKAdgaTWy1b42EvZb4/P124a6kJRtmA9iy0DRhNfGxKOc
 95gwtWQc4/Bu6Cew4ZrJmy92LVxyerHew+FaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jZ8rX4nMXu9yVxF6VhEpyRT/HJL/yeSOHN33lmmqE3Q=;
 b=YinzdGkz4s+n2rzxwgsTeonPuVXeQZb/WXVB0ERwoXqm6WZdbKkmqWvyoaaXL6wS2D
 l6VZPkP60INoqzAvS1EPZOma/kcswwaUrDoe6esvk1TQcuOuQEKmhV73jvgUZeo3/Yy7
 pb6uxhNiZF+9gHd1zCgowjFClEYe+hF2hBTxwp2qqI+pXOlEH77ug7EQN0LPGLoJGI5r
 unf5YlLGkM8Bn/UuOFPo3qgEia8bMMkGk9srsq7R5oTI8Fy2z8TwfC+p1S1VmoMq0uXb
 y2K9zioKZLID+Oy0nXMrz8cW5hEEudzqCin31NhNjsEy4noHejfutpmcIuY1hNgjXKCH
 5ozg==
X-Gm-Message-State: AOAM530K6ANpsTpHOMr9U86H3C/EkEQHhbA14Q/2G/zT/MOTCEfuUnAG
 RUAL3gZAKDl5FINC1PpUhXcyR72TJYRLDA==
X-Google-Smtp-Source: ABdhPJy927jhif4FAzgsoOyealanJVKnFUTpl3aNgn8bOY1Pyqm+aFYR/R4ibCR7w8MjmrDEz0laiQ==
X-Received: by 2002:a05:6512:34d3:: with SMTP id
 w19mr1509468lfr.180.1603300262051; 
 Wed, 21 Oct 2020 10:11:02 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id v70sm475938lfa.93.2020.10.21.10.11.01
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2020 10:11:01 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id c141so4062160lfg.5
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 10:11:01 -0700 (PDT)
X-Received: by 2002:a19:c703:: with SMTP id x3mr1474665lff.105.1603299922233; 
 Wed, 21 Oct 2020 10:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
In-Reply-To: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 21 Oct 2020 10:05:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
Message-ID: <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] mmstress[1309]: segfault at 7f3d71a36ee8 ip
 00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in
 libc-2.27.so[7f3d77058000+1aa000]
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, zenglg.jy@cn.fujitsu.com,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, X86 ML <x86@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-mm <linux-mm@kvack.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, kasan-dev <kasan-dev@googlegroups.com>,
 Dmitry Vyukov <dvyukov@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Ingo Molnar <mingo@redhat.com>, LTP List <ltp@lists.linux.it>,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Oct 21, 2020 at 9:58 AM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> LTP mm mtest05 (mmstress), mtest06_3 and mallocstress01 (mallocstress) tested on
> x86 KASAN enabled build. But tests are getting PASS on Non KASAN builds.
> This regression started happening from next-20201015 nowards

Is it repeatable enough to be bisectable?

             Linus

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
