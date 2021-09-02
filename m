Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0A23FEA62
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 10:07:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 59A503C2B78
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 10:07:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6312C3C29D7
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 10:07:07 +0200 (CEST)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A6EC3200DC4
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 10:07:06 +0200 (CEST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E77373F329
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 08:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630570016;
 bh=is65Pvi3jTjt6Phq/TCAIPLbIcugaTyKqrnTTpXMjuU=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=gFAzUQkmD25qRuDS5pikZ3+Kyu4p7MLo8wCiAyroC0YWHjaZvmo1gtc7gH9/68jM+
 UVmQxumExt4WOcovteVLigACmney86ZqTunMwf5dN6g8TJJOoe6+thNOusmCOCtrvT
 SlSsz8AEwIX2rbEPoIHmkrlc0lTmT2A9Vc623S6sK2IV2noxvkwZptrz5V26fFM0z9
 1EMBvh3ptNLCUJJYZf6gbUhFSqFiaWhdJaDtQtuu/DzoCKMSfu4MKVNwk8bFp9hqI8
 PvNfa1Bin9J38jEv0vdlGZs9DhOlpEByFq7rgtEyz9TilUOALt+aQVF0j8kgsH/jd0
 QtLhPa8dwPk4Q==
Received: by mail-ej1-f69.google.com with SMTP id
 v19-20020a170906b013b02905b2f1bbf8f3so524205ejy.6
 for <ltp@lists.linux.it>; Thu, 02 Sep 2021 01:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=is65Pvi3jTjt6Phq/TCAIPLbIcugaTyKqrnTTpXMjuU=;
 b=c8gpJQmSK5klOzEKF2I8igkO5zoVlVZvquBAO49BdKWVbKMJ3wzJuxqHu9mtpeeDGT
 7RLcayn5arX3tAQPSrUi47XCnPqR/oqkt2epSISBxkHJbwMsWZ0AYkfhHGpTeEt9SYbs
 SCf2nip5Xqpod3vuHLxcUur6hwQBwoTb4GzrRKsSkdy+v3RsC86fP70ORuK60M+fc+LP
 xBK9l7PXWzSPoyf6/55R28/L21h990rAxELa65bi8DRJcsMhTRh3OWqtg57/lxg6Xs9G
 JtgKdfVKffBoU8Ng4AyfJbsLr8qt2JdDsu7mMA8X7NS+VOeQNMx3dS9qvPdTXH08n7cO
 gu0w==
X-Gm-Message-State: AOAM532Clyxds1iNN+sElM83FIffe3cSMPMqwwSbl4TY77Cvi9zbPxAz
 FSDeRhA5qJg+0u4O6rFXrioA+coz25Y0cHycVkBhziNUBNW4t3z+sAALBYPzLwVyjn+FcTwE/s1
 1AdhgPy60x97CieAq73ve1m3/G1ic
X-Received: by 2002:a17:906:f2d8:: with SMTP id
 gz24mr2412183ejb.343.1630570016357; 
 Thu, 02 Sep 2021 01:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx17a/Nbcs3euI1PUHGSo/RyvUaLyxAN8Y+DG8Rquvr5W/3AUmRz7x8bKuvoNHdxmRrY47FBw==
X-Received: by 2002:a17:906:f2d8:: with SMTP id
 gz24mr2412165ejb.343.1630570016160; 
 Thu, 02 Sep 2021 01:06:56 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.112.80])
 by smtp.gmail.com with ESMTPSA id u16sm543870ejy.14.2021.09.02.01.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 01:06:55 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
References: <20210901151655.95760-1-krzysztof.kozlowski@canonical.com>
 <20210901151655.95760-2-krzysztof.kozlowski@canonical.com>
 <YS/DGPyHmEHnRSZk@yuki> <YS/Iiy7xWGZJEayN@pevik>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <0e06b0e8-6e6e-6755-60f9-56580f7917a3@canonical.com>
Date: Thu, 2 Sep 2021 10:06:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YS/Iiy7xWGZJEayN@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 2/3] controllers/cpuacct: skip cpuacct_100_100
 on small memory systems
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

On 01/09/2021 20:38, Petr Vorel wrote:
>> Hi!
>>> +check_limits()
>>> +{
>>> +	local tasksneeded=$((max * nbprocess + 100))
> 
>> We allready have some reserve for the system in the tst_get_free_pids()
>> so shouldn't this be just max * nbprocess ?
> 
> Yes:
> lib/tst_pid.c
> 
> /* Leave some available processes for the OS */
> #define PIDS_RESERVE 50
> 
> I suppose 50 is enough, but if 100 is experienced to be needed I'd update PIDS_RESERVE.

Indeed, it's a duplicated reserve now. Let's dtop 100 here and use
existing PIDS_RESERVE.

> 
> Also, because you introduced use of awk, I'd add TST_NEEDS_CMDS="awk". Or is it
> that common even on embedded systems that we don't bother?

Even though most of Busybox installations have awk, it might be still
missing in some specific setup, so TST_NEEDS_CMDS="awk" seems reasonable.

> 
> NOTE: all changes can be done during merge, we just need to agree on it.
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> Kind regards,
> Petr
> 



Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
