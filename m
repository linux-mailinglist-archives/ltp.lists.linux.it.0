Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2994F2823D4
	for <lists+linux-ltp@lfdr.de>; Sat,  3 Oct 2020 13:30:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C54353C2979
	for <lists+linux-ltp@lfdr.de>; Sat,  3 Oct 2020 13:30:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 48DE03C223B
 for <ltp@lists.linux.it>; Sat,  3 Oct 2020 13:30:10 +0200 (CEST)
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 08C676012D6
 for <ltp@lists.linux.it>; Sat,  3 Oct 2020 13:30:10 +0200 (CEST)
Received: by mail-ej1-x642.google.com with SMTP id u8so5276547ejg.1
 for <ltp@lists.linux.it>; Sat, 03 Oct 2020 04:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZQeZoiwCDx2xELwgkO86877s0U92u34kFID65nXJRkU=;
 b=hccmxm1iEHlcAtzEdT4yVILvdVLlTg+t30EsWKXjPRqO3m0nyi2cVRdkVhoNRyNGX7
 4LAL1lLleAvRWWt51cVQrK/je55/PTHSQ7M3HO5Gzyjxg1lTeaG2UEd6lbdBS0EhSwuO
 UAw/ocJrCqWShlDTZYDRCJcyw81oHwUMiwsJgUw01+b4ZlfDizMSjlRh4gRDlZFrXyY1
 eAUuv7FWmNkL7kanVAtJVWkoCvRVcdUsBXBlWk5Rx3HmXGnDBNfH3zJyvaSTkPi6NG7j
 ZRVXcjW/3HT9Ib1uWWz1Y+2OrYHE1IWFWtRR/Lx96A7//DOrE6sK98/SQ/VhXRNm5Cbl
 j1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=ZQeZoiwCDx2xELwgkO86877s0U92u34kFID65nXJRkU=;
 b=g2foQtdQswtmhrynIBwc+pfawgD65ftiXixzrUXO0jWXsDwTFZxMRaxmotJAljzu0Q
 mYK+yxF5rUQ1nKfIB7mBUYjJCuFZ4MImJnMKlwTNZKxvT1g5VygT3IrAQWp45MQsqZR1
 UKUX+98PZctOpBgPOHr5zMEmccuS7RNFjWDPC0A+JPG8jMfj54tJApx4rm1bfs6G/8f+
 7+pXtlNzXC3jKPVFDP7rUkrLtZNjN1CBiXqRTvCLMnPSUvyGfJy8tPfB0hXpUh9D6nJe
 25C6zf1emTSn2JOQva94S76SODvIS7i2StmtEdWZotnWDRk3TCnA8o7E/EO5R/8gQcIL
 g5ow==
X-Gm-Message-State: AOAM531YEewtgT6Dc4FA6MiTkaY7K5Pd0S1UQXQBVw6j0a+oDXZeTZjR
 5O+IQi9xytDR5qTMZ7nzVIs=
X-Google-Smtp-Source: ABdhPJwRODFrfQD6aef2kkRN3puRlendt72yBKsrHJcZchqrAkoy7H6h/9pqNO0dx7f4/M/pYv/IRg==
X-Received: by 2002:a17:906:4b4a:: with SMTP id
 j10mr6189977ejv.498.1601724609591; 
 Sat, 03 Oct 2020 04:30:09 -0700 (PDT)
Received: from x230 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id a20sm2786514ejb.81.2020.10.03.04.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 04:30:09 -0700 (PDT)
Date: Sat, 3 Oct 2020 13:30:07 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Message-ID: <20201003113007.GA289020@x230>
References: <20201002202416.28972-1-petr.vorel@gmail.com>
 <6b5f52e8-0c0c-f83f-d7aa-6ab307d5621f@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6b5f52e8-0c0c-f83f-d7aa-6ab307d5621f@synopsys.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] cacheflush01: Rewrite into new API
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Vineet,

...
> > FYI: I was going to ask for removal of this test, but all these archs are
> > still supported. This test compiles on all archs now, but I haven't run
> > it (I don't have access to none of these archs, not sure if LTP is even
> > tested on these archs).

> LTP is pretty much regularly tested on ARC and yes we do support/need the
> cachflush syscall test.

Thanks for a confirmation!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
