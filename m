Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B33D406C68
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Sep 2021 14:46:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 728633C969B
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Sep 2021 14:46:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1927A3C2156
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 14:46:43 +0200 (CEST)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 20EAF602210
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 14:46:41 +0200 (CEST)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5983A40264
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 12:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631278001;
 bh=dNRk6CVJc2m7MxqIryjWkppD4FIXm/b/Wl6jxT356gk=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=AniDjGswIxdeAgMXl82YLOVoD83M6ygtp1qAC7Z9lKUiy3hyKLXAzRce9uTlBqgsa
 7LpfIEuyfMAbcUVKiZlppCdDWkekKSLZUg5TTJ85DFZVUW8fQzlV/11MFrI6FeMtQp
 7J5hplJMdlqrZHMOO7bSUTR+tLl2BW7JUpY7KxhnW/htFtNQuePgtOXOCjkLnJjLcR
 G1a9K1q5GUYPgxwSyF4rrTX71TBOJfPwm+iY+C5sE8d7in8kfgSaBTRFp/sYt/p+5N
 zaOtP5J/su90m92JouRWHdG2qXqZV+GzeI2ompcZzKoyn5kV70ECrZVMkZoF+MRvM2
 XKObAjlJaacOg==
Received: by mail-wr1-f72.google.com with SMTP id
 t15-20020a5d42cf000000b001565f9c9ee8so479237wrr.2
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 05:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dNRk6CVJc2m7MxqIryjWkppD4FIXm/b/Wl6jxT356gk=;
 b=BjsaeoNkfdTtjExsA8SVR56sujOOIhwT54dakmqP0Qli2cUEg1qnqBoI5dTrxrUvW3
 iAPaxFC9Q/kPcgb+xmRanmJvIkuAoUR+fYGzcpmpTXsYYX7DtK2JOrG3Xh3kSfgQ6wTV
 I1YDELSGwfa4Sm5+LgY9fNAp6Wr2h7x7ECJUNDwXmbpHucqQHm5e5Xc0Lbw7Ts7BaTnt
 uQxF7F6FmzsVH3ISNkD/xTrhPc9xxGNT2z4uZzGlwNRQ2U4xWZLBipRs3nGCkUiAQ8+n
 ruj7SFtcDYP6+EAuquCiAjvehVpQ4mZwcQoSUFqgZdQLHeN6PtoArNbbbf4f+u0ZObTD
 2kuQ==
X-Gm-Message-State: AOAM532GXGAdWZrBgWTeuM60KJAb9vny3pSfKrG4pfpZE+sokaJylEpl
 V5b+ZIoUaTxVIA3Tw5Ow42GWAm+fjUI37yuoKTErHHqxrb+XbtcJPQuiSg1c4DSUUKeW4LUWp2H
 kEbmZPhU0hmoBt7PcVuv4cT96RgPt
X-Received: by 2002:a5d:53cd:: with SMTP id a13mr6627182wrw.33.1631278000706; 
 Fri, 10 Sep 2021 05:46:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmCOopGYw40DiWrar+Omp7ong0Mlp1Z7vosuz0F3x+inqzu0rqnmplckByjS64CEUBf6C8Kg==
X-Received: by 2002:a5d:53cd:: with SMTP id a13mr6627170wrw.33.1631278000570; 
 Fri, 10 Sep 2021 05:46:40 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.201])
 by smtp.gmail.com with ESMTPSA id o7sm4155148wmq.36.2021.09.10.05.46.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 05:46:40 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210909163326.42598-1-krzysztof.kozlowski@canonical.com>
 <YTsh5wcAbNDjJQpi@yuki>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <345237df-e2f6-fb46-213b-656e11622eb0@canonical.com>
Date: Fri, 10 Sep 2021 14:46:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTsh5wcAbNDjJQpi@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] rtc01: add space to beginning of comments
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

On 10/09/2021 11:14, Cyril Hrubis wrote:
> Hi!
>> Improve readability of comments - no functional change.
> 
> Actually some of the comments are really commenting the obvious so it
> would be better just to remove most.
> 
> For instance this:
> 
> 	/* Read and alarm tests */
> 	read_alarm_test();
> 
> How does the comment here add any value?
> 
> And I would say that it's mostly the same for the ioclt() calls as well,
> the constants do have reasonable names so I guess that in cases like
> this:
> 
> 	/* Read current alarm time */
> 	ret = ioctl(rtc_fd, RTC_ALM_READ, &rtc_tm);
> 
> it's kind of obvious that we do read the alarm even without the comment.

Good point but also I am not sure if removing these comments is worth
patch on its own (without patch 2/2).


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
