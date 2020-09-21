Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E482725FC
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 15:45:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92FDC3C2A2F
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 15:45:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 7936E3C2A1C
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 15:45:21 +0200 (CEST)
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 26307200AFF
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 15:45:21 +0200 (CEST)
Received: by mail-ua1-x944.google.com with SMTP id v5so4314999uau.10
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 06:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mg7k2DRm+f/AoilNjbmDQGHgj1ctpaMkeatx2IRj4oE=;
 b=Nowqz2UKGPQAlKZCGNCvUCcOezQaApvSQWb7vRUiMqHsJgY8FdOyTyBpIQDpaED3xe
 /2kd5yf1QZi6TjyHIqJQcy2V3CX/QpQd3M4Pn/mS5W2xV9q+PyB9uXqzq+qZZrsN35NX
 tmjvhh0ExSx7NuI0bMisdwzTqdIa2TLv2Bsh5fXiexZM2YXwyjoKv7Pc1S4bsM31pYpI
 GmKiQFXVNh1z8/HUSFlucyjBztlCLpnK/S5NfokPlQaATp+yzVn3uAM92YkQUN0eMCW8
 pcSTjUDyyjEi+3gOrPSanFye3NkyGckYD1fs3uLoUA12ytsUwVhkfUigxynXcRoptbTV
 Ul/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mg7k2DRm+f/AoilNjbmDQGHgj1ctpaMkeatx2IRj4oE=;
 b=EdGB1Rz6sZb+AU+1ZI0mqA7CHY+gZ6/+XCC/lzhvFQVox1cmbVUA/GGuJ1VINDirIe
 83xOBFab6uzZU80ukALP5hTNR0ZCVq1RjGIUJhs5J3NHPb3ZK7S4KbgPOoqguxGG7lHw
 pU4TBg6E8hwG+AolFLV884BhJh4rnmMGd1mDWGEnYbETBXtQ8TUvdc87nyd726Ap2aI0
 RqGjuvFBq1n8tGgSJYa3etLo4t9e/shGAbjhIsyx8x75U0+OPlMWApscofYNy2W0VbeR
 1mdMqwGATiuwhByRF5vGGn0/SEAqhRWc1h1JWbnILGhoTfbtijP6lCBWSzqhVCxcQtFL
 FT8w==
X-Gm-Message-State: AOAM531bULPjUsKgSVCPEsMFJtokuALCPC2RSsO9ORQE0xi2uVIuTNg1
 1BN5+l+/rqsrV+QMawKpthUBkQbG3F+4LyBcj+6cZw==
X-Google-Smtp-Source: ABdhPJxY5yz9FF/P9pJmKUdnlRIJltu6l/zuuaJ3k9zx7sPzYU/5E1yMmewKb3LWhv4aroYJp63/mEL4rf9QnHR2QzI=
X-Received: by 2002:ab0:2eb3:: with SMTP id y19mr14923uay.113.1600695919292;
 Mon, 21 Sep 2020 06:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200921114026.11184-1-chrubis@suse.cz>
 <20200921114026.11184-2-chrubis@suse.cz>
 <20200921115910.GA1993@dell5510>
 <CA+G9fYs-ryAws0TuVngZ8-V1XhAh3hiEZT28nx8fNHdaeVQJkg@mail.gmail.com>
In-Reply-To: <CA+G9fYs-ryAws0TuVngZ8-V1XhAh3hiEZT28nx8fNHdaeVQJkg@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 21 Sep 2020 19:15:08 +0530
Message-ID: <CA+G9fYt5QJ334V+j80TA_NONQQHd1ji23Fy1y28JNMFjXSw_9w@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] runtest/quickhit: Remove
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, lkft-triage@lists.linaro.org,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, 21 Sep 2020 at 19:11, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Mon, 21 Sep 2020 at 17:29, Petr Vorel <pvorel@suse.cz> wrote:
> >
> > Hi Cyril,
> >
> > > The file wasn't properly maintained for last ten years, 99% of the
> > > patches touching it were only removing removed tests. We should stop
> > > pretending that it's useful anyhow it clearly does not contain well
> > > selected set of tests for quick testrun anymore.
>
> We have been using quickhit as a smoke test across all available devices
> because it runs in a minute. With this file removed what could be the next best
> tests for a quick smoke test ?
>

I got the answer to my question on other patch adding smoketest

runtest/smoketest: Add smoketest

> Since we are using and testing this quickhit shall we keep it ?

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
