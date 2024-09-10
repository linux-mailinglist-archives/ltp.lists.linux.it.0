Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D27DF973803
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Sep 2024 14:52:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1725972774; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=DAisaHfYGB21wRrmXIZXFab4Zsy1x+ULtTOT/CgrPAA=;
 b=WKmkOItBdMMueQDItWSGj+sVs+i/U6VtD6p7saSHzdjXeH2l8ekTFz/alWCx6c1rnBhiZ
 8jI4abmsVABJAWsQA6bQL1/D+Zn01K4Pe1u6Ub3cQzRH1htGke90qhF6tNxbLfnXGeZHflk
 cZvAYqXu8OSqfdHZOjBxG1Ky1LPer5g=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 588C53C1A9C
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Sep 2024 14:52:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 634643C1A84
 for <ltp@lists.linux.it>; Tue, 10 Sep 2024 14:52:52 +0200 (CEST)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BADC5601B1A
 for <ltp@lists.linux.it>; Tue, 10 Sep 2024 14:52:51 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c275491c61so6833673a12.0
 for <ltp@lists.linux.it>; Tue, 10 Sep 2024 05:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1725972771; x=1726577571; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q25U/uXSEXS0BeCLV8tHMdMpIgTYdwm9orGDHZe+bDU=;
 b=aQhggdodHJ+rtdkhXUdYGYDyWOQAfshFKWkBTmzYR/0PBR05NTWwWZ5SDSmENIlPcB
 XpCTIGmFrpgS+dNVaJ6RM9aPnY+SNxNnSYMzMV9MmfRLNoEOZCSfpOop1BCgTTyOfTLQ
 0dLDG4sVfGmQZFylkcJeGVBOULImx1HtGVzCm/1K+cvHNv5H/HmElXpQZWFMkPkgNY+5
 6hifXyyzhU6SW7twVL+qZwozSZqiIShQH+Li6dZfdcAmjsEZsZh7cIxnJZ2SeMJtsaal
 fVYg1Xeu08DYmwU+bFKgoFhCKrI/kXmmx+YKtHLl4qge1bR8kFN3gDpo3yA6KTwyAt6K
 h+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725972771; x=1726577571;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q25U/uXSEXS0BeCLV8tHMdMpIgTYdwm9orGDHZe+bDU=;
 b=pOdQe2lz7Br+eivQWle7t9YONRJDr/ytGtCH41FRjC6GPwECSHY7KeXyO79wVawIvK
 YYtB9ei6GYK1rNxoMhjvFCpbsVxlwolub99IQY20I/5XBza3CFcq/OLAu4+didPkAlqk
 IyJgUeo/WR5NFshrvLbTGd9uIO+tNzbYAYGeDLLfT9hrMIAV//aYQ8Ynz0wv0830Tw36
 PYtkXaSaS3HUfdeHU48Z6CzZ0jZzDIRmcgSYwXNz397bCR4D1ykfmyQHi7RWWhqbV8kS
 tt/cq1niAqsclObLeZIkQCd8uXhyUHmxABkFKdcnTXYGpwIdxJA359ciV6XvYG1IZaoJ
 f7Og==
X-Gm-Message-State: AOJu0YwSnTfugwz1VSEHdQzrGMXlSNeITSPpg2dLCwJAn8WZ/3vJ1t55
 PPUELny7mBlTIsnGw6Jni9W1i6xwp/QvFOprg4dy/gAaxIA367ZFjlm72jSYnDI=
X-Google-Smtp-Source: AGHT+IFBHhOhsKaFiQvPrjN4m44zbBROd4TKMPSb6kYdNQ020cLNhyzsjq56nbL2qb2VqQmMVRHYiw==
X-Received: by 2002:a05:6402:13c3:b0:5c4:a0d:78df with SMTP id
 4fb4d7f45d1cf-5c40a0d9c30mr414177a12.35.1725972770623; 
 Tue, 10 Sep 2024 05:52:50 -0700 (PDT)
Received: from [10.232.133.87] ([88.128.90.9])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c409572cd4sm315773a12.27.2024.09.10.05.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 05:52:50 -0700 (PDT)
Message-ID: <9050127e-f58d-40a5-b49b-43f1907d3f10@suse.com>
Date: Tue, 10 Sep 2024 14:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cyril Hrubis <chrubis@suse.cz>, Andrea Cervesato <andrea.cervesato@suse.de>
References: <20240910-regen_shutup_lsp-v2-1-528f552c6c1d@suse.com>
 <ZuA9LGa_cQPO8Ka_@yuki.lan>
Content-Language: en-US
In-Reply-To: <ZuA9LGa_cQPO8Ka_@yuki.lan>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] Remove cleanup.c inclusion from syscalls
 generation
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

Pushed thanks!

On 9/10/24 14:35, Cyril Hrubis wrote:
> Hi!
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
