Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC0A140F3A
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 17:45:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B75AA3C2266
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 17:45:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 281243C2095
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 17:45:03 +0100 (CET)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1B35A1001593
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 17:45:02 +0100 (CET)
Received: by mail-lj1-x243.google.com with SMTP id z22so27148863ljg.1
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 08:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cTFFRrPPMNXyj68w5vFnNgaB8lehH1R0kT3hViXW+dk=;
 b=R/vqnjE1Cn6gnUAGoqsEnQDlF+U9TWR6jn320mob3Bmoz89qWxGzMTXFzNGBYcHNvm
 8wr/EyxWxH8mkCUOfiC789zbhhzOJbb0pwd0NxNvejUKxDBDlur6vZC2vWxXZ4G7elsq
 Rgtq3hBYdS4e5y/1hph9y4I2BQ+NpKCZCIlWR27tf1Cy6dCGSMQgqX8+SIFKjvOhfE8y
 68ZFz9u/l6R0o1Iqi4XgO9qjdmGpy1Bj3MurPgJCUmymIqgS14CsFHgkzUB/EIdnYAu4
 hcs6Sq0sYOJDfgJvi+IBrae5oRnkBIUZWz8XxbjfhnDgH2DDPIPwSuaw3JgfsxEA44iT
 dhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cTFFRrPPMNXyj68w5vFnNgaB8lehH1R0kT3hViXW+dk=;
 b=rUfqotso42ztoMTm4goCt/yVH5ODkGHuSDx1vToGWySVOwOAC1qqcmhTL8MHrkMs+s
 eqL64ofAF+o6YqO9veIHEbOf6LjBg7r0s4erxp/f6yE+rY3o8AyukohS8aPJvEk1y87w
 ROup1+W7UZh25TXuLeOzEuwRH9Hkg2qfs8Zv+cGGjKh5sQub1MIL9OJkpA9zMoz/cSMI
 uv7tFolKrJf4cIzblDew2+DF4k52wOutRAGaWfFRWUZnRffXuXgr4qKt2ygYrW/JOJp/
 b84Dn0ErmsT8Xq7zulx//G/ez8onJasTfoTAmSA4vFzmVLAhO3jSv05gvq3NezxTlftW
 jfXA==
X-Gm-Message-State: APjAAAVQTxmhHf2dzrz8RIGo6WoRbsoAa0983W8AadzrKtqnJ2X8RSjv
 FQsAPC+/MIx/hUt9PYXyyxHscGJpUF5xcFKPhTgEHg==
X-Google-Smtp-Source: APXvYqw3yFKpW73XgyJYcfYTsxOUShvhUDwR3Pjl9K1P63s7+QfByvx2PVt0acuaTHxDrzoiEwUsikGbxWQ/I43pl9U=
X-Received: by 2002:a2e:9c0b:: with SMTP id s11mr6081829lji.11.1579279501423; 
 Fri, 17 Jan 2020 08:45:01 -0800 (PST)
MIME-Version: 1.0
References: <cki.FA900DB853.LBD049H627@redhat.com>
 <84944fa0-3c18-f8a4-47ca-7627eb4e0594@redhat.com>
 <20200116153741.GA558@rei>
 <1477632721.2420697.1579250111441.JavaMail.zimbra@redhat.com>
In-Reply-To: <1477632721.2420697.1579250111441.JavaMail.zimbra@redhat.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 17 Jan 2020 22:14:35 +0530
Message-ID: <CA+G9fYuuVLziEVJ+93OWSWeB0h-=_qaYcAObe=_JSsbtydO7cQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] ??? FAIL: Test report for kernel 5.4.13-rc1-7f1b863.cki
 (stable)
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
Cc: Jianwen Ji <jiji@redhat.com>, CKI Project <cki-project@redhat.com>,
 Hangbin Liu <haliu@redhat.com>, Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>, Jianlin Shi <jishi@redhat.com>,
 LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, 17 Jan 2020 at 14:05, Jan Stancek <jstancek@redhat.com> wrote:
>
>
>
> ----- Original Message -----
> > Hi!
> > > > One or more kernel tests failed:
> > > >
> > > >      ppc64le:
> > > >       ??? LTP
> > >
> > > Hi, I see max_map_count failed on ppc64le:
> > > https://artifacts.cki-project.org/pipelines/385189/logs/ppc64le_host_2_LTP_mm.run.log
> >
> > That's strange, we do attempt to map 65536 mappings but we do not touch
> > them, so these shouldn't be faulted in, so there is no real reason why
> > mmap() in the child process should stop prematurely at 65532.
> >
> > I guess that we cannot do much here, unless it's reproducible, because
> > there is not much information there.
>
> max_map_count.c:205: FAIL: 64882 map entries in total, but expected 65536 entries
>
> I can reproduce it by running it in loop for couple hours. Though no idea
> why we started seeing it only in 5.4.13 rc kernels, as there doesn't seem
> to be any significant mm changes.
>
> I'll try some older kernels.

I have noticed max_map_count fail intermittently on multiple stable
branches on slow devices.

max_map_count.c:202: FAIL: 63231 map entries in total, but expected
65536 entries

https://qa-reports.linaro.org/lkft/linux-stable-rc-4.19-oe/tests/ltp-mm-tests/max_map_count
https://qa-reports.linaro.org/lkft/linux-mainline-oe/tests/ltp-mm-tests/max_map_count?&page=2

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
