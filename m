Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2367278174
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 09:25:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10A5E3C4D0F
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 09:25:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 6196B3C29A0
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 09:25:26 +0200 (CEST)
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DE1261001180
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 09:25:25 +0200 (CEST)
Received: by mail-vs1-xe43.google.com with SMTP id y190so840690vsy.1
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 00:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9+u6pjC7pRB1K9gjeMWKj3lZ/9RhhBMJjz0Kr1AOtzs=;
 b=znz84rc2KTxMeuZHBWoFa4B0qNPH/4nMwsP+S61V9IatDeRCRbBjXCWmOV7byKF1Ky
 bGXKIXbQQctoF47LltBYdfHbE2uiREyLYy9UhpNNnvid+BRkL1sIaQG8L1wpb4Beips4
 bLArDC1gja85x2EyHWr9tAj/QhRNmk13a/gDQ7c1or9dEfw7Ms2f5/4JE4m2MXFR4cOl
 xHJI2gMFnqOnTaF3B/e5JtCFSAscq63Be9G3eEXpIhND/l4UGyYCyuxDfyK2k0O+1uiK
 tWRVcCmbOJ7AqOmtNYTudR+d3/AF9bXMQgfRUZDbctTyziK/+wBrDxrsEBAFbgXgKu8M
 G7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9+u6pjC7pRB1K9gjeMWKj3lZ/9RhhBMJjz0Kr1AOtzs=;
 b=axqq8dtl7+lxjjNp4+cEICPS5vXFGl5/w0bDwev8DUQEAbQXUQLw8uFP2vdw62nTQn
 FMCDV+Ur/u/OFRuhLa1N9ryHsPiiisrY7hsZXE56ZLm5MchsWbVFhngG0VU0a2MDlRt9
 fN98FqIwKwdRAWJb2WFrV9xzZf5aK+5BAAJqTpP+zuqbV1p8Eom0CqMa5cVnTUI9ICEn
 59OIFK4gSOLU1BVudVFo2hJV7rE7nZj0XsCS4umGFyvgfnKTM/pC9xAPEbamJPQnaFVu
 7gazDf+aVVP8gCc85mu4j/3Jnn2WmnCe66Yesci+z/88xvwIqODRf5nFlxka60tIlQpU
 a2rg==
X-Gm-Message-State: AOAM5316Bm7cFUlvtWFyRjz35lZP2meZvIWmeYBRr68P73J3O+qJnl0j
 LymktI+SOSLfXza1TK7t6LYnqWAcTpdiRmpco2YFRQ==
X-Google-Smtp-Source: ABdhPJxm91UI/6425cQgEhSBX27qS9BjdpzuZURqe/ddUA6VRpeq7VAcm07HpZ9q7gSb+uP7goG3e5shfB26CcIpzfE=
X-Received: by 2002:a05:6102:310f:: with SMTP id
 e15mr1937206vsh.39.1601018724645; 
 Fri, 25 Sep 2020 00:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20180823023839.GA13343@shao2-debian>
 <20180828195347.GA228832@joelaf.mtv.corp.google.com>
 <CA+G9fYtV_sjTKLMXWMP0w0A-H+p+CN-uVJ6dvHovDy9epJZ2GQ@mail.gmail.com>
 <20200925051518.GA605188@kroah.com>
In-Reply-To: <20200925051518.GA605188@kroah.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 25 Sep 2020 12:55:13 +0530
Message-ID: <CA+G9fYuokHUBwNkTs=gWqCHxj80gg+RetU4pRd+uLP7gNas4KQ@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [stable 4.19] [PANIC]: tracing: Centralize preemptirq
 tracepoints and unify their usage
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
Cc: Sasha Levin <sashal@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, linux- stable <stable@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, lkft-triage@lists.linaro.org,
 Joel Fernandes <joel@joelfernandes.org>, Namhyung Kim <namhyung@kernel.org>,
 LTP List <ltp@lists.linux.it>, Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, 25 Sep 2020 at 10:45, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Sep 25, 2020 at 10:13:05AM +0530, Naresh Kamboju wrote:
> > >From stable rc 4.18.1 onwards to today's stable rc 4.19.147
> >
> > There are two problems  while running LTP tracing tests
> > 1) kernel panic  on i386, qemu_i386, x86_64 and qemu_x86_64 [1]
> > 2) " segfault at 0 ip " and "Code: Bad RIP value" on x86_64 and qemu_x86_64 [2]
> > Please refer to the full test logs from below links.
> >
> > The first bad commit found by git bisect.
> >    commit: c3bc8fd637a9623f5c507bd18f9677effbddf584
> >    tracing: Centralize preemptirq tracepoints and unify their usage
> >
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
> So this also is reproducable in 5.4 and Linus's tree right now?

No.
The reported issues are not reproducible on 5.4, 5.8 and Linus's tree.

>
> Or are newer kernels working fine?

No.
There are different issues while testing LTP tracing on 5.4, 5.8 and
Linus 's 5.9.

NETDEV WATCHDOG: eth0 (igb): transmit queue 2 timed out
WARNING: CPU: 1 PID: 331 at net/sched/sch_generic.c:442 dev_watchdog+0x4c7/0x4d0
https://lore.kernel.org/stable/CA+G9fYtS_nAX=sPV8zTTs-nOdpJ4uxk9sqeHOZNuS4WLvBcPGg@mail.gmail.com/

I see this on 5.4, 5.8 and Linus 's 5.9.
rcu: INFO: rcu_sched self-detected stall on CPU
? ftrace_graph_caller+0xc0/0xc0
https://lore.kernel.org/stable/CA+G9fYsdTLRj55_bvod8Sf+0zvK0RRMp5+FeJcOx5oAcAKOGXA@mail.gmail.com/T/#u

>
> thanks,
>
> greg k-h

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
