Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD7340AE92
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 15:07:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1CDCD3C9245
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 15:07:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DF7D03C1948
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 15:07:36 +0200 (CEST)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2BD1D60025C
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 15:07:36 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id ho42so28735276ejc.9
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 06:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A75rlFcXocWH4IZFXw7HhDxIpraTKI7VH5zflCSNz8c=;
 b=mzddmN43Q/GMsjKgTacvF0fFpWwOolkPlTWbitmi65keWN3wrr5DtMBFQSkwvP5Rt9
 Ygy53C8oWczmylCMEw3NgoQOYo+vBWwMNgfE0eDUeLe0POCUyYOrgzXh83mEf8xDiLu3
 9hHV/I9K5hYWMcPwy6yn/txvUCA55JqmpF+pf6Ofim+Yz8NP8NQIpsLc3n3O4GTM6Vpn
 iGbelpIzGAR0OW10NP3/fGgx4WwDZNwvHBm5Lj3732P3uAt9A8y/IMygfb6NDggzoX4J
 KVZDrTxP7q4YeM02KhKQQOk5Qje2nbg5b0zaMLhzWAK3uS5X5fJJWvJjK+4NGmJIF5XV
 kdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A75rlFcXocWH4IZFXw7HhDxIpraTKI7VH5zflCSNz8c=;
 b=OrjRlGnWd7bba1mMV7QYN5x4sjToShIBgvz6Awzu53K3ewllVO7Xg9Ubrqakcuml+c
 q3KQKgPKaFyeimlnWk2K6iPXjMFnVX74Qhkc6GGhTRxPwX6Y0LGRRXKjjqJgJWXKn4pc
 g41my4ldDAcVoRc/2S4Qvorq46g+BIT9kRtaV7uRLrfO9xDrDuewRZyOjFFC617lVjA7
 vg188wWoU+KZ9oiOsw2pPH0ss4pMYQPRcaszZHEelVRAg2ExTf0bPfERU24kbgqfS+6h
 FSxx6F0Au6oMX583N0/5th9J2VRyymk5Qd+/xDTaqLweZE6WWld/lv4nNoTE2gzDx0a6
 LVWQ==
X-Gm-Message-State: AOAM530Iw8y2lqg7aW2SnFy4i+vUMdtGLny9UmrW543Pqe1M48/r5GeL
 RjiFM2ZswVRReKKaUaqwVvD0FLTkcXdwQ3Mp44y1X6htKs4=
X-Google-Smtp-Source: ABdhPJx1bL+Wqb8RL5KjSEDoms14KWSS541ZjOJD0XC1v7WKcqRoa45o4EmU99FCZ6zrXg4GWfQe+EaWyzYbvFmoSns=
X-Received: by 2002:a17:906:318b:: with SMTP id
 11mr19332615ejy.493.1631624855470; 
 Tue, 14 Sep 2021 06:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210914122425.85129-1-naresh.kamboju@linaro.org>
 <YUCah4R0SBDKZvPQ@pevik>
In-Reply-To: <YUCah4R0SBDKZvPQ@pevik>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 14 Sep 2021 18:37:24 +0530
Message-ID: <CA+G9fYvY4V=FwDq_uJiRrgPm97cCm9T6Lm-qcr+B1kRhi5BxMg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] runtest/smoketest: Remove intermittent failed
 test case route4-change-dst
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, 14 Sept 2021 at 18:20, Petr Vorel <pvorel@suse.cz> wrote:
>
> > The test case route4-change-dst fails intermittently creating
> > the problem for smoketest results verdict. route4-change-dst
> > is a stress test should not be a part of smoketest. because of
> > these issues removing route4-change-dst from the smoketest.
>
> > Suggested-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
> > Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
> Did 75184c30a ("lib/tst_net.sh: disable ipv6_dad work on test interfaces")
> fixed your problem? I'd actually like to route4-change-dst in smoketest to
> have it as a detection DAD issue is working.

I will add this patch and test in loop.

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
