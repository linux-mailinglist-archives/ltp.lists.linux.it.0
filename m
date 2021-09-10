Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D79AD40688A
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Sep 2021 10:34:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78F2D3C86C6
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Sep 2021 10:34:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AD7A43C20F4
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 10:34:34 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DAD74140142F
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 10:34:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E0C4B1FE4F;
 Fri, 10 Sep 2021 08:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631262872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AzZ/EWW1ALt6riq7DDaxLxEpHKNViJeyEzP00APUxAU=;
 b=V/6LoKa1L6INzsGBz3eR+Ga92LpIW5JxRaOHgOCYO3gSULgC/+E/cCdXP0uU/l4qQmCzw3
 x6NXAiwpexNOMlCMsjWvq4X+VWaulIEpq9IggAQXPZPxlwkpZjLnMhhQm8ZFlWl/1Q8jmp
 Rx/aySqJqjCZIJQVNJcVQ2MX8nuDGl0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631262872;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AzZ/EWW1ALt6riq7DDaxLxEpHKNViJeyEzP00APUxAU=;
 b=c6jWSpeeTGN9yfUFUG7c2nPEGSAO/fOGxwI11SJ+J4eiG9GzGvvn/g42+oc1jOtCSuyp20
 MyQzewKSun6TzTBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFA1513D15;
 Fri, 10 Sep 2021 08:34:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MzkJMpgYO2FzVAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 10 Sep 2021 08:34:32 +0000
Date: Fri, 10 Sep 2021 10:34:48 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YTsYqBJP8oWiuEGQ@yuki>
References: <20210909163326.42598-1-krzysztof.kozlowski@canonical.com>
 <20210909163326.42598-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210909163326.42598-2-krzysztof.kozlowski@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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

Hi!
> rtc01 fails on missed alarm on multiple different Azure instances if the
> alarm is set for the next minute:
> 
>   rtc01 0 TINFO : RTC READ TEST:
>   rtc01 1 TPASS : RTC READ TEST Passed
>   rtc01 0 TINFO : Current RTC date/time is 11-6-2021, 09:00:58.
>   rtc01 0 TINFO : RTC ALARM TEST :
>   rtc01 0 TINFO : Alarm time set to 09:01:03.
>   rtc01 0 TINFO : Waiting 5 seconds for the alarm...
>   rtc01 2 TFAIL : rtc01.c:151: Timed out waiting for the alarm
> 
> Reproduced easily with rtcwake:
> 
>   $ rtcwake -d rtc0 -m on -s 50 -v
> 
> If alarm is set for now+60 seconds, it works fine.  Clearly Microsoft
> Hyper-V cloud instances have a broken CMOS RTC which unfortunately
> cannot be easily fixed.  Adding simple workaround to extend the time to
> 60 seconds allows to avoid false positives in expense of longer testing
> time.

I do not think that adding workarounds for a broken platforms into
testcases is a right thing to do.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
