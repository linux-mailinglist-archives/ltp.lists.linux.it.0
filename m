Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C245AFD6C
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Sep 2022 09:24:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A92C03CA80D
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Sep 2022 09:24:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7D2C93C0475
 for <ltp@lists.linux.it>; Wed,  7 Sep 2022 09:24:29 +0200 (CEST)
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C9D8460090C
 for <ltp@lists.linux.it>; Wed,  7 Sep 2022 09:24:28 +0200 (CEST)
Received: by mail-qk1-x72e.google.com with SMTP id h27so9873175qkk.9
 for <ltp@lists.linux.it>; Wed, 07 Sep 2022 00:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=ftPAbVGMDGzvjhyFpXMVMtkRUNCc8ryag6urQ+3KelI=;
 b=BAZ5aM/rA4YqhxReMFTf6baLsgKZeCVWv2muTDtVLQIzl66x77seYrAv5WcW54Y8dS
 e2TCMd5EmwS66kLhdk3IPS1lne3TeGV+UTeE0hYkzt2DYCEdTL+9zwc7ZW9cdGbcWz+C
 TMZsK0weE1/Ri05DdD1r6mi4qa9P1s25SLXwfU8yzE8VEPirRiXMS3Bd2whZWyq1gE2L
 6nkr3ZUSpc6ncbEhdjvTU5lK/Ho8CpvVPt6tR+d9i8n8DwHqIv5F4ekj6xAA+JLB/hFo
 ENp0MlCFwKQvlCZfjWRqgHTBTl9dXoPNkK2zcqqUZA6vVnjIUJqkqgjoN3dsf3/4LBat
 qHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=ftPAbVGMDGzvjhyFpXMVMtkRUNCc8ryag6urQ+3KelI=;
 b=vIBjQK774fuF8U2zRulg9SK0hVTJw0V1yE9ONfsXxpgaFj6iHYDLIP4+IqOk26Tb0D
 +Hizv2YJaeAPuP7MSfhUAzWAUPW2b4Dw2vCN1CJgXTDWKUTSyTMXhG17dII0mez1c6bt
 MZoKSWoBhl40/2gAf3ZOoIzc5tDguhJh3u3bnp/T2kWrCGmQJwh1FTVbxFdldwEgyxev
 HeB9un8Sw30C0iK7ArA0RXCY8rdHA5Rhnldo7HeL4ebd1aW6DogC+0nyDPDVAANnDUpP
 U8SwuESgWYtAJGEzlG+X0X1hM1Dv7T5jkz0XgphQmYFToZEwPj86POZ1zN2DZlE29krQ
 OT6Q==
X-Gm-Message-State: ACgBeo1tRt19wMtToXx79Bbmen3CrpSpAw4oe79a55t9TRL4y77Bmrck
 gEbwvqSccXmkRxTPyqFGPGAOhg==
X-Google-Smtp-Source: AA6agR6qOnMuVhzcfG1KRLQyK32m8tyU+zKamtf0xh1mLbRkqUH5209kUrluwxXECEdmt3a58cWGDg==
X-Received: by 2002:a05:620a:2b04:b0:6ba:4589:1cd2 with SMTP id
 do4-20020a05620a2b0400b006ba45891cd2mr1742361qkb.612.1662535467531; 
 Wed, 07 Sep 2022 00:24:27 -0700 (PDT)
Received: from google.com (123.178.145.34.bc.googleusercontent.com.
 [34.145.178.123]) by smtp.gmail.com with ESMTPSA id
 w8-20020a05620a424800b006be8713f742sm13922088qko.38.2022.09.07.00.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 00:24:27 -0700 (PDT)
Date: Wed, 7 Sep 2022 07:24:23 +0000
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YxhHJ9HaADTWzPpY@google.com>
References: <20220906092615.15116-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906092615.15116-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
 SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] fanotify{14,20}: cleanup
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
From: Matthew Bobrowski via ltp <ltp@lists.linux.it>
Reply-To: Matthew Bobrowski <repnop@google.com>
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Sep 06, 2022 at 11:26:12AM +0200, Petr Vorel wrote:
> Hi,
> 
> just an example how to further cleanup fanotify tests by using test macros
> from include/tst_test_macros.h. This can wait till Amir's FAN_MARK_IGNORE
> patchset [1] is merged (unless there is going to be v2).
>
> fanotify20 is an example what I'd address in the code, fanotify14 just
> uses newly added TST_EXP_FD_ERRNO() (more cleanup here and actually in
> other tests could be done).

So, are you suggesting that we have a TODO list? ;)

> I also admit code in include/tst_test_macros.h is a bit hard to read due
> being macro. We should probably add some documentation to it.

Documentation is always nice. A lot of time could be saved as a result
of not having to decipher a given macro.

/M

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
