Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FDF406A71
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Sep 2021 13:03:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F01E3C8D12
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Sep 2021 13:03:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 01BE83C20E2
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 13:03:43 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 07E33601416
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 13:03:42 +0200 (CEST)
Received: from mussarela (1.general.cascardo.us.vpn [10.172.70.58])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 496BB3F325; 
 Fri, 10 Sep 2021 11:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631271820;
 bh=shSxEmbe/0cvJRkm1R2uinJx3VVK9s5H2fqVdUBGMaM=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To;
 b=bqqOhhrQcd4yHwYZRRwWbaHrEE8+CMzaQze/uvVQuu0i0PS1J3au2k8d19T+GTmje
 vjDt4mF2vxJnxC3Y7SifL9afUTRoFpCtuwYgNIXuBL5SQ09q3VjXnYLK4Q8eR84E+H
 PiXhsJpscE2PUCZBNRHNbnyAqvxD/yhaeVnHsmT3Tb/7mMp5fin67G0sXHtcHxRKcu
 TD9ke9h0KfDTpIVr8Ov1P06PFkhX+fu+TUopmtgvlWrss4DOghBoPF+1WWJ6S0xso6
 X0S+b1XmADir47zLFIw47A0G2hyWXwKIgawweKAyDIXVjeQXH13FRT6b3Ad4TvJGxT
 JQDZ6DjbHTNiQ==
Date: Fri, 10 Sep 2021 08:03:35 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YTs7h87f8bWd+/od@mussarela>
References: <20210909163326.42598-1-krzysztof.kozlowski@canonical.com>
 <20210909163326.42598-2-krzysztof.kozlowski@canonical.com>
 <YTsYqBJP8oWiuEGQ@yuki>
 <d50543f0-6e41-8911-e24b-ba0ae61185fa@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d50543f0-6e41-8911-e24b-ba0ae61185fa@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] rtc01: add workaround for broken CMOS RTC on
 Microsoft Hyper-V cloud
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Sep 10, 2021 at 10:35:32AM +0200, Krzysztof Kozlowski wrote:
> On 10/09/2021 10:34, Cyril Hrubis wrote:
> > Hi!
> >> rtc01 fails on missed alarm on multiple different Azure instances if the
> >> alarm is set for the next minute:
> >>
> >>   rtc01 0 TINFO : RTC READ TEST:
> >>   rtc01 1 TPASS : RTC READ TEST Passed
> >>   rtc01 0 TINFO : Current RTC date/time is 11-6-2021, 09:00:58.
> >>   rtc01 0 TINFO : RTC ALARM TEST :
> >>   rtc01 0 TINFO : Alarm time set to 09:01:03.
> >>   rtc01 0 TINFO : Waiting 5 seconds for the alarm...
> >>   rtc01 2 TFAIL : rtc01.c:151: Timed out waiting for the alarm
> >>
> >> Reproduced easily with rtcwake:
> >>
> >>   $ rtcwake -d rtc0 -m on -s 50 -v
> >>
> >> If alarm is set for now+60 seconds, it works fine.  Clearly Microsoft
> >> Hyper-V cloud instances have a broken CMOS RTC which unfortunately
> >> cannot be easily fixed.  Adding simple workaround to extend the time to
> >> 60 seconds allows to avoid false positives in expense of longer testing
> >> time.
> > 
> > I do not think that adding workarounds for a broken platforms into
> > testcases is a right thing to do.
> 
> I am actually also not sure, but the broken platform is one of three
> main cloud providers. :)
> 

The test here is doing the right thing, verifying that the driver behaves as
documented and expected. The kernel should be doing any workarounds/quirks
necessary to make the RTC interface behave as expected.

Once that is done, I think it would be valuable to add to the test the specific
scenario where this is failing. That is, add the specific test where the alarm
seconds is behind the date seconds.

By the way, I have tested it and the reason 60 seconds work is because the
seconds alarm value is most often after the current value. If you use 115, for
example, it will most likely fail, unless you are within that 5 second range
where it doesn't.

The RTC CMOS driver has changed a lot over the years. I wonder if using proper
UIE instead of simulating it with set_alarm would work. But, then,
RTC_ALM_SET+RTC_AIE_ON would still fail.

Also, of note, the VM instances are lacking an HPET, which is used instead of
the old CMOS RTC when present.

Cascardo.

> 
> Best regards,
> Krzysztof
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
