Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC14E969413
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2024 08:47:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1725346068; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=ZObufH2c1vta/MErNptHP3zRZ9T8jhu0F52DBKz7FNE=;
 b=Y8fcyzxvFg3uNbcn/RYSRA52UcDWwuU+rAQ+dDjjvIq34fXf1Rv5LRsibhRbOhGfPiOEn
 sTPeJwIvYbJEtzl3NmEH151Ll7kO8Y0m22NovoK3jO2EAUzF4aJb+mH+mLOLHsKkuGuO6kG
 hYt7y4tzjcDMwKom4U9sPZFfuGa9+QI=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE9A23C4D6B
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2024 08:47:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 615603C2F81
 for <ltp@lists.linux.it>; Tue,  3 Sep 2024 08:47:46 +0200 (CEST)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2DB4C200DA5
 for <ltp@lists.linux.it>; Tue,  3 Sep 2024 08:47:45 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a86910caf9cso1025679566b.1
 for <ltp@lists.linux.it>; Mon, 02 Sep 2024 23:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1725346064; x=1725950864; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xE2Rbn8whdx9fQYDrcu2whw0P3p/uoedtNaqhS4TZXo=;
 b=VH0SxRmjFYN1tPo2gJ+E/MJsMV3EyZcNGtjIikVPhWbZKClX6/bX7OcubaLPN2etGz
 3inK74DTQCPNVBp5LL53PEtp4qVxcoZNrG59yQKzDXx3EYbw1vBZ04riiXmHwRVkqGX4
 ZGTDlyURBHq1AfNPJpV2mAsSLtW+zdnD6TuB8JNR+DKCwLMWlFD19Nc27oXCInmdVWv3
 bKd9A1BIJqXswoNuCbCHtZKwkLxxt9dZkeyQTQ0NbRG80OlqvagssJADlS4hXDgrCHJT
 M5AzsyrATmrNRf464lCHNyoS073qOuvmNpRfwSeAh3tybUM/4P7pGDLzAFEuQr9a2clN
 UW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725346064; x=1725950864;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xE2Rbn8whdx9fQYDrcu2whw0P3p/uoedtNaqhS4TZXo=;
 b=YewcBfRAhn+Ea941rB4G/37B3quAa878VVdi6MFsbSMMdGOqSxhY1CFVJAu16P396j
 M4oiJadzZ8auz8OYd8Er1KXBr+/NhDWcJsdVTJ1sGnk7qn6T7GMVpdp4gttNnEuCAKqX
 m84ca35kT1d7BMGlnBR595Q5xXsua9AbsokRbN8gPjrQZITNUhU/Ou8cqncgD3aY+H8U
 tfvh9NfxdwU4oVkEzogtdVDTzUevJPi8kwd3S+PkbJgNl7dYChEnapkDy3D/k355bdBZ
 3rzEAYdQTpRhuXpLJpL2YuaT35tHMIEjGKE2xnCw7bnB+ORDYwd0CaJhNhWBKHGFMytY
 Gg+w==
X-Gm-Message-State: AOJu0Yy1Bg5qFFY0fxOPImxiwmshBjSV/1NVeDEkJuYFt/lDADcp5Jpx
 NW/Dvcax/vgK8YHLYlrU0jCecfqo+226+wrGEw/+K1CiUrXCA4KR07e4X/rNAtR53DnJVo+hd57
 vSNeCZg==
X-Google-Smtp-Source: AGHT+IFDbWns4E20qHxpwceRGP+l4JkxIIJEpLO9HwZ4/5e5CYc7uRRPfUwSqamML1jQcpqtUvp7FQ==
X-Received: by 2002:a17:907:1ca7:b0:a7d:895b:fd with SMTP id
 a640c23a62f3a-a898231fd75mr1607925966b.6.1725346063880; 
 Mon, 02 Sep 2024 23:47:43 -0700 (PDT)
Received: from ?IPV6:2a02:a31b:84a1:b780:5af0:a75d:357e:866e?
 ([2a02:a31b:84a1:b780:5af0:a75d:357e:866e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89890219aasm645269266b.65.2024.09.02.23.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 23:47:43 -0700 (PDT)
Message-ID: <be9a1933-fc56-4e27-b10a-af251b813792@suse.com>
Date: Tue, 3 Sep 2024 08:47:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <pvorel@suse.cz>, Andrea Cervesato <andrea.cervesato@suse.de>
References: <20240426120051.21806-1-andrea.cervesato@suse.de>
 <20240730074147.GB1327610@pevik>
Content-Language: en-US
In-Reply-To: <20240730074147.GB1327610@pevik>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1] doc: update more syscalls stats
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

Hi!

Pushed with suggested modification. cachestat and landlock didn't need 
it since we already pushed tests for it and they are automatically 
recognized.

Andrea

On 7/30/24 09:41, Petr Vorel wrote:
>> From: Andrea Cervesato <andrea.cervesato@suse.com>
>> Some more syscalls are already tested in LTP, but they are part of
>> different testing suites. For example, seccomp() is tested in prctl()
>> testing suite. Some other syscalls need to be blacklisted, since they
>> are part of MIPS or internal kernel usage.
>> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
>> ---
>>   doc/conf.py | 4 ++++
>>   1 file changed, 4 insertions(+)
>> diff --git a/doc/conf.py b/doc/conf.py
>> index d0f185b28..b54e0e60d 100644
>> --- a/doc/conf.py
>> +++ b/doc/conf.py
>> @@ -83,6 +83,8 @@ def generate_syscalls_stats(_):
>>           'getpmsg',
>>           'putmsg',
>>           'putpmsg',
>> +        'seccomp',
>> +        'semtimedop',
> I guess there are more to add, right?
> At least cachestat and landlock.
> Could you please add them before you merge?
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
> Also it'd be nice to have the lists sorted.
>
> Kind regards,
> Petr
>
>>       ]
>>       # populate with not implemented, reserved, unmaintained syscalls defined
>> @@ -101,6 +103,8 @@ def generate_syscalls_stats(_):
>>           'sysmips',
>>           'mq_getsetattr',
>>           'vserver',
>> +        'cachectl',
>> +        'restart_syscall',
>>       ]
>>       # fetch syscalls file

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
