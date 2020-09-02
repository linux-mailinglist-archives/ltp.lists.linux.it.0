Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CAD25A921
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 12:09:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B9B73C54FE
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 12:09:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 6B7F93C180A
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 12:08:56 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 675B31000C0D
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 12:08:56 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id 31so2282546pgy.13
 for <ltp@lists.linux.it>; Wed, 02 Sep 2020 03:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5MWSZG+xwQBbRIh3Hf0hhCrgQD4e3albCJfOd3HqYTg=;
 b=LlPHTlIAE0b+k3yiPHmpB+5U0ekBHvst7GFlAsHJEEmWP73md5a8S0yPDpP/OEO/n7
 KRRCyLzMzRf5B8YX49qarPgTvQj9RAvj8/PYjgzgJn8LtQH2hAF9Chm99KKp5ZlogZOP
 vMqqH9kt0FQAJichMmLW3Cl5BOHn1Bhffb/GvRvkO6IMq1kjRUM31LCV2svdDESGi+UD
 Mu7Za7Tq/ID11epzXbnhi4SH1Tyq5Pm7fLjkwnlFCWhHUyNvooUiO+GgUweYC3W9IwAu
 BOS7SSdYLI3vRWN7UaiBOEMa8NYpDC04UuhCea8PgX4JLyUVmfrQfO3/cy2/OGgCQzT4
 n0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5MWSZG+xwQBbRIh3Hf0hhCrgQD4e3albCJfOd3HqYTg=;
 b=Ly9flm/xgcf0rihFgFzUSNXDbQWoxaHlQLCyMDvsdtDdOat+cwoB4pfJY9iT47IBkl
 F17X1AvNbC9OQRH6EBjppEs6RX4iBP7TzIBbaOTHIiCBsXeGDujg5rhHhYbglUdVgHvk
 pUpsEDPb3BhMINqil2kMn/7UqD74m8iS3TIJgt46gynZ30mxls6vBhSRL9L3ZtFR6WqP
 UlJSkrHPtOYJD8X2wTLGku2YCycF+mLa1TxhgTN+bTGf+ygaNA79qcWdCR3L3ThImSXr
 jc0BOTMFMuzPbOnHvBS6d8fsn+CDVhpNSBtF6lSSzbGOAXGmB5O5sYwneWMhyI4wXG5a
 zlAw==
X-Gm-Message-State: AOAM533HPhqvKxguTG1EnodKWmSgm+69EQcUrvv2R8yFg5q317qLo+7G
 qpglh7MdymBXqrmN2hFpk0ry2w==
X-Google-Smtp-Source: ABdhPJx/i4ikUqZdv11mVhZ2HoKA+r2B689mIkcw8u2lR7VChDtDvwGviHHMn668341qwQnIUhMnFQ==
X-Received: by 2002:aa7:9d8b:: with SMTP id f11mr2535681pfq.206.1599041302708; 
 Wed, 02 Sep 2020 03:08:22 -0700 (PDT)
Received: from localhost ([122.167.135.199])
 by smtp.gmail.com with ESMTPSA id b15sm4855284pft.84.2020.09.02.03.08.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Sep 2020 03:08:22 -0700 (PDT)
Date: Wed, 2 Sep 2020 15:38:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200902100810.dka3khkk4gplq22c@vireshk-i7>
References: <b0d7642a89808c93e059beda06d8519361784686.1597839878.git.viresh.kumar@linaro.org>
 <a9e6d98c722a92d1981fcc2b7ddeba547195c40e.1597839878.git.viresh.kumar@linaro.org>
 <CAEemH2eH6YnKXfVrAQmPGK5zj1x71f=gHZcDUN-QVjZ41F8_6A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2eH6YnKXfVrAQmPGK5zj1x71f=gHZcDUN-QVjZ41F8_6A@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V9 2/2] syscalls/semtimedop: Add failure test for
 invalid timeout pointer
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 02-09-20, 17:09, Li Wang wrote:
> This '&invalid_to' can't be passed to the semtimedop(.., timeout) correctly,
> because in that wrapper function call_semop(), you invoke
> tst_ts_get(timeout)
> to resolve an invalid address which will be caused a segmental fault
> eventually.

Thanks a lot for figuring out the crash that I wasn't able to solve
then :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
