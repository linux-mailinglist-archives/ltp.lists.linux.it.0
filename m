Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1678E2725E9
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 15:42:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C230F3C2A2F
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 15:42:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 94D013C2A1C
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 15:42:03 +0200 (CEST)
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2B754600770
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 15:42:03 +0200 (CEST)
Received: by mail-vk1-xa43.google.com with SMTP id q124so3356470vkb.8
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 06:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RojDjvEhuwKSTjXSXZhaBwpAY9uVjUnVx5+5TEwnNzY=;
 b=P3GNQ/AE3OOL1550OXEAlW9C63/CDs2veKjtkxlW5rdLWLmzkv/oDcpjxbkcQ7Q1LQ
 FMyX9L7LgV8vzwSSnzNJ33ZkLnSpdMLj6mQTduXJgn0x5kmmnElxz8zn/SQ3l/HmUsmp
 kBg5hBdJctIb8+Cz8TUcqknMBiQNrCBvQvjRIhX60bI5RAs7UJkSMqA2oadzFhuyrIJ8
 A02X4MJ7gELc2zDht7mXJFhAxev15orxYNsGYgvXgwI5RVK9mSMoIpOpCcOI6eJ2Upz0
 jXscpKoIZp/auB/XfRfrkTZxPXuR98KX5RzdNkT3ebmfKxNSs26onSMpkbuEz7UYYEuW
 IM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RojDjvEhuwKSTjXSXZhaBwpAY9uVjUnVx5+5TEwnNzY=;
 b=eo2AVIriTw9s7diwHG/vbjihvCJggmLWp5i876lfwFi7tSH+aT2ESqAbVm4l1Xshcs
 g1367oD8YoIOOdG4HBiwmSn0jXDL5WGSMf+XiXeYhXkevND3L81DwWLYMnly5v0VABn6
 b6ADQ+LutiRcKJ3z9iulHwO3DJ+/1V+RATJLlbOrXRsCtxKFggRLdmBhnRomqDzVGx4h
 fmQvVRAaieGAbt+lEKncMMJ47asoUkNne+Z7QNI7z8Jf2UJ5r3PSpgUXh/37IyAQjToX
 1/QG6kI/JJ1lKP/m4wXG2VFalCPudugxkMCUEzywnLxhili9/y92cnvr5BVqLUi6YeNX
 1MpQ==
X-Gm-Message-State: AOAM533oRnYXiPM3nyKMjLVKdmwvIBoamrAKGDf77z6lnWYpkQcR60kl
 J1QyJQBy/Oj+NYbtTJ87RScOZqKxu3f9kETne7RJDw==
X-Google-Smtp-Source: ABdhPJyGQQdGrMLVihZMeQ7Iv7dtLc65BxCp5JnMSO76GGlgkO2rEo8xdhFK1HUJHxiPg9+rhzSNT0KcbU9IXZ0gJDo=
X-Received: by 2002:a1f:fec9:: with SMTP id l192mr18461vki.21.1600695721913;
 Mon, 21 Sep 2020 06:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200921114026.11184-1-chrubis@suse.cz>
 <20200921114026.11184-2-chrubis@suse.cz>
 <20200921115910.GA1993@dell5510>
In-Reply-To: <20200921115910.GA1993@dell5510>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 21 Sep 2020 19:11:50 +0530
Message-ID: <CA+G9fYs-ryAws0TuVngZ8-V1XhAh3hiEZT28nx8fNHdaeVQJkg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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

On Mon, 21 Sep 2020 at 17:29, Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Cyril,
>
> > The file wasn't properly maintained for last ten years, 99% of the
> > patches touching it were only removing removed tests. We should stop
> > pretending that it's useful anyhow it clearly does not contain well
> > selected set of tests for quick testrun anymore.

We have been using quickhit as a smoke test across all available devices
because it runs in a minute. With this file removed what could be the next best
tests for a quick smoke test ?

Since we are using and testing this quickhit shall we keep it ?

>
> > Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> > CC: "Bird, Tim" <Tim.Bird@sony.com>
> > CC: Petr Vorel <pvorel@suse.cz>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
> Kind regards,
> Petr
>

- Naresh

> --
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
