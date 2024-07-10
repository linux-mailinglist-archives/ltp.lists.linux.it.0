Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACC192D7C7
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2024 19:54:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1720634046; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=7yIUMOtY/1W4bEQl1xfdEWBwK8ODrB8B1sgK/A5H6UY=;
 b=RwFdg1Q2JTlMdNn7DoWwwUWFZQxal+laI9nx2Q3Fy5VHQEfcOD90GmCfPqya/mxSL1GN+
 naJzDmkt+rDlQSDGfrLNL0zh74mRoRDNeuwWCjgtdiz+OHjy0lOFWpGC6krCc9Iv3JZMsEf
 hpLMFAsWiXFY5OP3IowmxUHItiq6/+M=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD8603D383E
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2024 19:54:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5D0CF3D3818
 for <ltp@lists.linux.it>; Wed, 10 Jul 2024 19:54:04 +0200 (CEST)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 02F22140111D
 for <ltp@lists.linux.it>; Wed, 10 Jul 2024 19:54:02 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ee90f56e31so274761fa.0
 for <ltp@lists.linux.it>; Wed, 10 Jul 2024 10:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1720634042; x=1721238842; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JRJOM5/QbK8bp9tm1QCDgFtJMEA/C45CoTJUcqR5Ws8=;
 b=LzNYlEtwb7hXmbpLQX6BqjrUirxMgkkoZRMvirEr0wHBasuTakoqkVRhd+kPMVSYC8
 yyikocwcVRS48r48LhtBTp7D1WDw5w3Mo3OzZqhJj1+Ay/CG3znkZwuB63qzQNs+toyS
 +Q/ms3JYVy059wFb2VpCkLTxzuJLY50cVxCleTrdv20LTINBOUoSHsH/ufNY+LoCJFmf
 aFcoTh7ik8L5TrPl19iOMk/mOtfLAe9loAndj/qwbmsr28Lhh3/+3UP5uo7eYpGhUP+Q
 CW96fbPpwE2y+h8gJS1nbCHyP9IZdO6NmGtmqCGSecw4uCFpGIuzoDKvtQNl2AcuuZ7Q
 fOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720634042; x=1721238842;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JRJOM5/QbK8bp9tm1QCDgFtJMEA/C45CoTJUcqR5Ws8=;
 b=jdM5JKl4D9V9+3balkPKykevCQn+9GBQCKg6tl/bNJc2KvpO3kw+6b14lHVZSYbV1G
 SKsv66M2e6fbgTITTjfoQvrEPLinygl1SjjmS7hA0EowHrzHySkugYTLRC8S55HURAYb
 A2GQUlUJAIH4HaX55zyqqrTcAuTV/w58LZvY3UC2dTO4L9UPa4UerfTb5TEw3yfoJ/zW
 42fqYiTDDUTxX9OdWGUGSuKDf/MiJMMXkLGVqXYePUeWvU54N261q1rWn2nn+IMVJxAO
 2DalvAme+SvsyiLXI29GJHbNyPtjRoogYUsokImWZoV9WFqIHEKjUeOTuiRay6k1xq9v
 dCRg==
X-Gm-Message-State: AOJu0Yz77zTlP49h3TSn8AAJWBC12ksEIJKqKW33AFeeLzEE5dCA7WtZ
 JEH6goUSydFCd5YXgRGTMWfD9V+J9irvy9pD03Q+AmmnUb3vaupmbXgAEEdcyYbmvILjk4Zedlq
 LpUM=
X-Google-Smtp-Source: AGHT+IGm5NIecMmvsHoIidYv3GG6nvudMFCckQDuuy8+wxCKfEA5jxc9NFgcSXcExUNz7ejHrIqw8g==
X-Received: by 2002:a2e:b059:0:b0:2ee:4a63:e927 with SMTP id
 38308e7fff4ca-2eeb3188c8dmr39986351fa.39.1720634041666; 
 Wed, 10 Jul 2024 10:54:01 -0700 (PDT)
Received: from [192.168.178.49] ([212.86.54.163])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b43967350sm4084313b3a.103.2024.07.10.10.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 10:54:01 -0700 (PDT)
Message-ID: <9a33a68e-3cd2-4a51-b525-97516fe97b7f@suse.com>
Date: Wed, 10 Jul 2024 19:53:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <pvorel@suse.cz>, Andrea Cervesato <andrea.cervesato@suse.de>
References: <20240701-landlock-v1-0-58e9af649a72@suse.com>
 <20240701-landlock-v1-3-58e9af649a72@suse.com>
 <20240710155308.GB300896@pevik>
Content-Language: en-US
In-Reply-To: <20240710155308.GB300896@pevik>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 03/10] Add landlock SAFE_* macros
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

Hi Petr,

this is already done in the v2 which has not been sent yet.

On 7/10/24 17:53, Petr Vorel wrote:
> Hi Andrea, Li,
>
> ...
>> +++ b/include/tst_safe_macros.h
>> @@ -14,6 +14,7 @@
>>   #include <sys/stat.h>
>>   #include <sys/vfs.h>
>>   #include <sys/sysinfo.h>
>> +#include <linux/landlock.h>
> This will break build for more than half of the distros:
>
> https://github.com/pevik/ltp/actions/runs/9876952862
>
> It's mostly due missing <linux/landlock.h> on old distros, but there were also
> redefinition of 'landlock_net_port_attr' at least on Fedora.
>
> You even have some fixed version in your CI where only Leap 42 fails due
> different problem), please send it (or post a diff here).
> https://github.com/acerv/ltp/actions/runs/9778823237
>
> Kind regards,
> Petr

Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
