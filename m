Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F04A3F2B35
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 13:28:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A10F43C1A97
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 13:28:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B41B53C1A97
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 13:28:34 +0200 (CEST)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0ECCF1400DE5
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 13:28:34 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id g13so19876655lfj.12
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 04:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2Xgca0ARp+wtP5L3R38iLNC4fciDA+O7N2W8wn+pB68=;
 b=j5mON27SnWqKkx7HPm9XdMAIL8NV94dMKeBMjQIkhWBjBTQ0QuFALOWXxU68nxmzrA
 Xfl3y5sRvo4DuiDlOL4DkMnNZ2dPrGGFZOaMj7f8LPEpnRmNTkkEHo0b3nKhyle4gMZx
 +dC9w2M5R1KZYToze3P4MexIbpxbnr98QXqXtHdD7u1vSjU2HYtKanUl6SvkjJm3ib6g
 CpFVJgum71KyYzZgR8ZNg3acwzh76OdHbv5BwrAatRKFc0yQPgVkY3z/JWBC2CL0T51T
 VUzA7vt/pAyAmoAOB9OHhI/XqweS9lAAT7tUFD9ur/FHk2Ptey6OpxsVuh6/IG/Hv99q
 OcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2Xgca0ARp+wtP5L3R38iLNC4fciDA+O7N2W8wn+pB68=;
 b=rk0PUfkKSJI+e6+VlLs5l6stnhVGorobbWMWm/Hjgi60JhD5RCyZnej6AD7n/oK+Vz
 YkR/Q5a717S7AJuVlml+YjxVS4tzKT2msmgN2M8jKrMIdgxSRfgkGXrPGeK/dT+pQte6
 W+0uWUVH8b3f53rb4Dk2VperGtwc0RlZNkKlQ9jajKpUDpZSVORb4bkne/50/kfVZn8h
 fQS5caoYcVi+pVa9xjobQjcfSlSw30vXei2EHgkyIaSiFRaVQ8LQ1IhpVOz+Zoda1CUD
 sEk4IqaCyoLqGVL41hmUuOmswI4WXZKm/JZvOupEzI2GO9pjLxRflpfvsNRaXWcSFDpq
 kGwg==
X-Gm-Message-State: AOAM531VbjTwfJXWUI076y6aj5iNMmbj0Occe+SN9xUpa3vFRP1YKH9n
 nJA6OCfWA9Musvbz1fP1+zvq4j4Xhv5a
X-Google-Smtp-Source: ABdhPJzkmBKT3KoqqJBlgnRMmmIaw5yrwNJcR26xuzyk0lQ/kuXM/BMrti18xrMX6T8I6oBw/LAU1g==
X-Received: by 2002:ac2:4947:: with SMTP id o7mr14149402lfi.601.1629458913313; 
 Fri, 20 Aug 2021 04:28:33 -0700 (PDT)
Received: from [192.168.1.53] ([91.247.148.3])
 by smtp.gmail.com with ESMTPSA id k13sm605725lfm.168.2021.08.20.04.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 04:28:32 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20210804120446.32835-1-aleksei.kodanev@bell-sw.com>
 <20210804120446.32835-3-aleksei.kodanev@bell-sw.com> <YR+H7ar8cYin8mHe@pevik>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <682fbc24-5b58-aacf-a3cc-8648ea52be33@bell-sw.com>
Date: Fri, 20 Aug 2021 14:28:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YR+H7ar8cYin8mHe@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] network/tst_net.sh: extend the pattern in
 tst_ping_opt_unsupported()
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

Hi Petr,
On 20.08.2021 13:46, Petr Vorel wrote:
> Hi Alexey,
> 
>> -	ping $@ 2>&1 | grep -q "invalid option"
>> +	ping $@ 2>&1 | grep -qE "(invalid|unrecognized) option"
> 
> Which implementation needs it? Both ping from iputils and busybox report
> "invalid option".
> 

It's busybox/ping that is using musl libc getopt():
misc/getopt.c:			__getopt_msg(argv[0], ": unrecognized option: ", optchar, k);

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
