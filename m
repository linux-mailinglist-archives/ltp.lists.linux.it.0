Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A583F5D2B
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 13:35:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 661363C31F2
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 13:35:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F01C23C3106
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 13:35:31 +0200 (CEST)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3ABA8600666
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 13:35:31 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id f2so37108957ljn.1
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 04:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MlXstGRQwpREIzpI5Gx00RluhDSKjN2zWQL9mmgBhco=;
 b=nyXl9bItaquq2d+qlvrYyjhxD2UH5JNM7ad04EW8CSVZ+sEs4qFUAUQ1R4EwwInsRd
 8/Nm3CX2mewZ75vr81ANpFl9CqrOnnLTzfAN9QXEsF6LMMG1uWm30MQtL8cpkNla+CNt
 Jqf0wljAmIjEkLefmNS/qP+wt2WFGFQeiWvy8/KjE1Xgcc7MdBxAF2XbqwHSXSytVeqg
 Ekxbrep5cnwHpQhtgR3niNhDPcjknnPuKC6P2e07WOTVIND77pqdHR06EOHKfzPPhTii
 6HfTCYtmQAreB2EzvDdJqOOYZhUtVb9IKL0xIzmU18TiFkRdeTK5+dd7XuHtMTi5KplO
 Y85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MlXstGRQwpREIzpI5Gx00RluhDSKjN2zWQL9mmgBhco=;
 b=ris0KtiR+6shNf3M1DBGrdA+voOdnxIYilB3SGFI3dKQ3x7EVLzyMY+Kd/SCAzofqv
 TvAa9dZEiT62azxNLw42ftsowKlzJU+aN1QNQRUfK6S7lpOR0H8vvB51jSY0fJ4svyux
 F4iD/jtW7QMuZmnx2vEwN6ZE3RYLzNFjGEZ4uKUBpXk0jr7SMlMPt1I5ZNZkOkcqCnEv
 UzLPcoDCOs+tW+lFG9mHuIXFbGFmKR67kOSqr7i2TPREMNZcyGSgrPRzfqzI4qn2OPW2
 Q7j8tTim1afjiTsuZCh064q7K9garU3UhOG4OiDXX1jRN7sodKMKn3KrsCGFHJx3u8HT
 GaiA==
X-Gm-Message-State: AOAM531v8YTG5UWjAc102v/K27laRS0vaDMkBOcNwJaqGJLBqd/2IajW
 xA1uJpgyjBcR7oHbliYCIkJczlH1MkRt
X-Google-Smtp-Source: ABdhPJybew0CasBE/giH6YOVmqdG9DHRGBh8lPc9tqn3GoJ0VG+DQRPoYk4K0r4cE/tA2w6UOvUvnQ==
X-Received: by 2002:a05:651c:3c8:: with SMTP id
 f8mr31192433ljp.213.1629804930416; 
 Tue, 24 Aug 2021 04:35:30 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id bt38sm1724166lfb.213.2021.08.24.04.35.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 04:35:30 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20210804120446.32835-1-aleksei.kodanev@bell-sw.com>
 <20210804120446.32835-2-aleksei.kodanev@bell-sw.com> <YR+HXE01R1RE8TTH@pevik>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <48500320-6cc6-591a-fc3d-708e88fd8640@bell-sw.com>
Date: Tue, 24 Aug 2021 14:35:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YR+HXE01R1RE8TTH@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] network/tst_net.sh: fix busybox/sysctl in
 tst_set_sysctl()
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

On 20.08.2021 13:43, Petr Vorel wrote:
> Hi Alexey,
> 
>> busybox/sysctl expects -e option to be set before 'name=value'.
>> This can easily be fixed by splitting the string in tst_set_sysctl(),
>> so that 'rparam' with '-e' option is added in between.
> Good catch.
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> ...
>> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
>> index 511fb7eb1..bb30c13ec 100644
>> --- a/testcases/lib/tst_net.sh
>> +++ b/testcases/lib/tst_net.sh
>> @@ -918,7 +918,7 @@ tst_set_sysctl()
>>  	local rparam=
>>  	[ "$TST_USE_NETNS" = "yes" ] && rparam="-r '-e'"
> 
>> -	tst_net_run $safe $rparam "sysctl -q -w $name=$value"
>> +	tst_net_run $safe $rparam "sysctl -q -w" "$name=$value"
> 
> I wonder if it were a bit clearer if we moves all params to second arg:
> 	tst_net_run $safe "sysctl" "$name=$value -q -w"

OK, but changed to "sysctl" "-q -w $name=$value" because the other
options should also be placed before the key/value pair:

    Usage: sysctl -p [-enq] [FILE...] / [-enqaw] [KEY[=VALUE]]...


Thanks for review Petr! Applied the patches.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
