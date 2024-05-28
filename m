Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA488D142A
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2024 08:04:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1716876260; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=saQw5dopYv8BTBEAGgcogH8PoJLPYlBt4xH6NJSBeN8=;
 b=n7083Sm2m6nYMhCPqKelhhQR9eaArrPSATCDZ/5eEQaCZEkiZbNLMErKcZ3We/AztTzxi
 R2wXmbU8wXT3rAZtJlAkueQF8oKR6swLKkn8TGgdUXcT5IrsAmL0FHRwv3YY+gSIwiJRwdG
 qL6lYHxnHvWxyqzWHUzID6iQRQQ6zgg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76C4D3D0485
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2024 08:04:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EA0DF3CFCD7
 for <ltp@lists.linux.it>; Tue, 28 May 2024 08:04:07 +0200 (CEST)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4CF6C600901
 for <ltp@lists.linux.it>; Tue, 28 May 2024 08:04:07 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a621cb07d8fso44985866b.2
 for <ltp@lists.linux.it>; Mon, 27 May 2024 23:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1716876246; x=1717481046; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qwxDnZL0zr3LXRAON5rolx4TrZ00rQrKSKJQDh3a+74=;
 b=Im5ETr0/2he534XqtDnBwoYZrcAphcTG4bckC0kQMVXIxSzLupMLKbUyd2lg/HdVXz
 pGF9zAZhx2oQAypvQoujVe5ptJrZklpb/EdA9fsuHgQrcu8zmY23ZEMwR5zjegzNv2nT
 rQft3vBOWLDefUPmsN+/JMxvm3zgEZx6Hkzf/zvNjEhJbE/Ha70aQ3dE/sckJYxWk8lT
 njuEENfztg7ACKmv23Vm/I5IqzO9A23YJmb7t3Q+chpa6LLllRcN0FrxzDtjl6zj3z7H
 obDmLtC39qgbGSaDRfjDzEFNqDi2b7pDD2QPmqU0nAClUisRuT0WOBBSNcBji+DL1ryg
 x70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716876246; x=1717481046;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qwxDnZL0zr3LXRAON5rolx4TrZ00rQrKSKJQDh3a+74=;
 b=PgWjMDgP2zs6c7KQIr+e7YlH8u2/vxxmqdBrLcsb5kiCPstJcuw0EFfq1Mpv/U+bRJ
 7pIl/a4+kKGJsYqM0qPNLW5pW/56JEsUX/QS1NyMR0LehNOkULlsyiWM8qsHTD+MRJkC
 f15shBVNv2GX6W0qWcCKmg9gNx9S6aP+uXgVcSKuKq9JGBEtFitFUpzMN74oZqHcqkGR
 2ZY4CGhtvW2G9SHdxAzcB0gCmi4FrZ7eBhzRFKTk/cSMuiOB3Kq3/iuuzODLkAe84n3s
 QV3KvPe7TfU4aWEPf1l7NszSdq5rPosrQM4MqfehErKEykIQlZDR6BnvXdSe+705gZ46
 DFWA==
X-Gm-Message-State: AOJu0YzGYDfOnwsB9HDMU9154NOnBhWCtYSDxUHRgioH41Z5E4m1GYu+
 dfSiIaQ9p9JUNjIMNklJPclJloHFzePoYveTaCMqnDCFXt8TiJRb2Ka1cu1T+2e8cl5gmUDxVoT
 q
X-Google-Smtp-Source: AGHT+IGJ4/zYNqhNFz6hPF9raTEZTjpX7NffdBtSbbrY0F2bDXMCIeqsB1QzYmb2qbWsDjNHft1ZwQ==
X-Received: by 2002:a17:907:cb14:b0:a5a:5c0b:ff77 with SMTP id
 a640c23a62f3a-a62641b8c5amr672671466b.19.1716876246415; 
 Mon, 27 May 2024 23:04:06 -0700 (PDT)
Received: from [192.168.1.29] ([151.51.162.26])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cda6e1esm570663966b.215.2024.05.27.23.04.06
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 23:04:06 -0700 (PDT)
Message-ID: <37603272-8ea2-4828-96df-4b6381cc26ad@suse.com>
Date: Tue, 28 May 2024 08:04:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ltp@lists.linux.it
References: <20240527222947.374475-1-pvorel@suse.cz>
Content-Language: en-US
In-Reply-To: <20240527222947.374475-1-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 0/2] lib: Add TINFO_WARN
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!

I'm not sure about this. Why not enabling TINFO + TWARN combination instead?

tst_res(TINFO | TWARN, "my message");

On 5/28/24 00:29, Petr Vorel wrote:
> Hi,
>
> if we found this useful, is it worth to implement it also in the shell
> API?
>
> Regardless the result, should it be TDEBUG backported to the shell API?
>
> Kind regards,
> Petr
>
> Petr Vorel (2):
>    lib: Add TINFO_WARN
>    tree: Use TINFO_WARN
>
>   include/tst_res_flags.h                         |  6 +++++-
>   include/tst_test.h                              |  2 +-
>   lib/newlib_tests/tst_res_flags.c                |  1 +
>   lib/tst_ansi_color.c                            |  1 +
>   lib/tst_res.c                                   | 12 ++++++++----
>   lib/tst_supported_fs_types.c                    |  2 +-
>   lib/tst_test.c                                  |  3 +++
>   testcases/kernel/mem/hugetlb/lib/hugetlb.c      |  4 ++--
>   testcases/kernel/syscalls/ipc/semctl/semctl08.c |  2 +-
>   9 files changed, 23 insertions(+), 10 deletions(-)
>
Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
