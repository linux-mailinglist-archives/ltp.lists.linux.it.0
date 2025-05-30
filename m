Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EFAAC916D
	for <lists+linux-ltp@lfdr.de>; Fri, 30 May 2025 16:23:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1748615006; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=9cTQUijaWuX4d2mIyaislwrEgufELGQ2q8Zk1pRI+3o=;
 b=dxJxAK8rxaO8Cv/ryYxisIRN0qJcKnDGH9u34E6bOUactR4+qFEvwKCkwJwb/EPOkzqWj
 b67AhdR5aMfwJBEqptMSuIReXAf9RbJ/05zlDLQystTjXgqPqZ2sMAZQoh08tUnN+jiCtXK
 poAuqcFNeb8qpRWcPAkpX9woGbdYI68=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B700F3C93FC
	for <lists+linux-ltp@lfdr.de>; Fri, 30 May 2025 16:23:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 84BD43C4E71
 for <ltp@lists.linux.it>; Fri, 30 May 2025 16:23:14 +0200 (CEST)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4A9681400990
 for <ltp@lists.linux.it>; Fri, 30 May 2025 16:23:13 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-442fda876a6so17704265e9.0
 for <ltp@lists.linux.it>; Fri, 30 May 2025 07:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1748614993; x=1749219793; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JnQ9a68cgOlzOfQoRrtyHWlF18K0KvS0lOEzZiRtW9U=;
 b=cfPvebhjUVIkeoxotdc3neO9ZCdGu3OYA1wLZgTBbo2Rm7xoIQnXusiJ4W7nGGOkhi
 rQv3FSRc+1we96JZjmH30jiLTUb9pwvJWYfs5OewPPL/IHo/QXNjqHFFJ+QMXdK0IBpC
 kSkUJrRR309Ih3qpb7pue3rW/EY+l8mnPkKj/7nlx8Gg542WUFKE9MnLvt8yMJcFNFAp
 mv0ISssscJFA6Ysp6XBlRFBkyEXo/CT/LgGs3tZJ6IRZE7BfdOi/gCnMvAN+ctQKFlnd
 kvC2LKuV0RCNOn27Dpt+GIGtMCOrxk1cRjcO9ontA7Fn46tpd0HlTYJor1CX4h5Z8RPi
 YhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748614993; x=1749219793;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JnQ9a68cgOlzOfQoRrtyHWlF18K0KvS0lOEzZiRtW9U=;
 b=lShd3EhYh9kZXOz75PsD3oNu3jOtHWa6KqZgSfIU0ZmAfryiNJzi2nTfekdoYBsBbh
 0iXLcTk9gWnw3TW/iivTPQMenf77+UjXiSK/m1UIee14qXHh/rlKRdwTmIHwunyl9Ral
 sgVXhRO4zrdTyUfcEdCXOKcQRAph+xSCY9QeuJkAgCkWcKnVD2q6Fkp37c1pLIpZISxw
 ZDqKffBu1sMMpbu1kGAhrdUnx41um+JAIAXqosN8+iNluZAxsqCX2UmoI4Rz9N+RCeqY
 TnMqQmj2wbChAApM3/pxMTd3g71ps1w1Ku89ZlWzQxbd800XmgADz+4yJIZuJFUPAMO1
 AuSA==
X-Gm-Message-State: AOJu0Yx0da5WfIbF2ouHynFTryWIaLXCvmuQtw4JgZSBUyCqFXMvk1dk
 uSxhz1zkQm3J7ps6MV57KrIwDZmha2eTND4eLLvJLFfpvl5YjGKYlrpVIo2tYIVE0Zc=
X-Gm-Gg: ASbGncuOo2obwl73PHkhg6VIDlvDjVG8Dm986TnmsgjZQfdl5fwzkwDb+leA1rihOQx
 aSQ1wMaQam0E2IsMlbNyH+IeoAX5XvG/5gydgjP1uV4Uz8vUJSt47srqe9MqwJpa6FnNywUSljm
 8LvdwDA5QcVfb9sKObK+H79TyDvPf5bnfaeZYugLN0fwiK6MC2l6U9aPpy1EOh2hXfXizNyCXTg
 Bi8T7ZxuRDt6Lm+Vn9d3ZDSiHOn4bsEK56+E9rPZyOfkISuPkP8m2OQJas7WfY/XpUpzegnP2nF
 Tsj5ghvFS9plZUKS44YZuO8MyMVAUPxlAeK36NZR/cj4k4JQ8qMYaV5Sxnc14JixLJQb+3+nWnB
 XHnDEnp6Zpqa3MVYAcDv08jiom7+PBPjU7IQs4+M6snGNtHMfNHzF0985Sd0XRxq4zR5CyoKEIe
 GBvNESjxCsymR+2Q==
X-Google-Smtp-Source: AGHT+IFtkoyPF19h/zA8S1yqVNQ2e3zN6orbblTjpR8zfXngSESRB8KzLEZagl20qvbfyxDYdpecPA==
X-Received: by 2002:a05:600c:6295:b0:450:d5c8:29ae with SMTP id
 5b1f17b1804b1-450d64cef1emr33168855e9.1.1748614992601; 
 Fri, 30 May 2025 07:23:12 -0700 (PDT)
Received: from ?IPV6:2003:ef:2f18:9700:bff9:d9af:e929:c0c4?
 (p200300ef2f189700bff9d9afe929c0c4.dip0.t-ipconnect.de.
 [2003:ef:2f18:9700:bff9:d9af:e929:c0c4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f8eceasm19441825e9.7.2025.05.30.07.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 May 2025 07:23:12 -0700 (PDT)
Message-ID: <c3f5d138-dcf2-41cd-bafa-946c9a871d25@suse.com>
Date: Fri, 30 May 2025 16:23:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cyril Hrubis <chrubis@suse.cz>, Andrea Cervesato <andrea.cervesato@suse.de>
References: <20250530-fix_irqbalance-v2-1-f5db338b21af@suse.com>
 <aDm45Lp39y8hUxeS@yuki.lan>
Content-Language: en-US
In-Reply-To: <aDm45Lp39y8hUxeS@yuki.lan>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] irq: informative message for irqbalance01
 result
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Merged thanks!

On 5/30/25 15:55, Cyril Hrubis wrote:
> Hi!
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
