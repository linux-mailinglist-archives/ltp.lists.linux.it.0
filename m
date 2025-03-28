Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB9FA74A78
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Mar 2025 14:18:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1743167910; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=jU+brkVtOmypo7fvCiyffnjK6fya3rre5EwomHvdhbQ=;
 b=ZoXAk6RDgwPE+XNmWREtxPYI94UyTJRLA6hNkzq4cmofran7MNvUYB8SQzeJUcgTcRCat
 h8T+NlmGdymDfIDvCHlqppxYbk1E6P5mvC5z9Uvy833jEtzRkZZZRFBHYTVBDLMyqRLR7YJ
 h97DSX3sXBPqXOIkbMhM8sDbGGOgBsQ=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5C7123CA3DD
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Mar 2025 14:18:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 95C9E3C91B5
 for <ltp@lists.linux.it>; Fri, 28 Mar 2025 14:18:27 +0100 (CET)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 72311140045F
 for <ltp@lists.linux.it>; Fri, 28 Mar 2025 14:18:26 +0100 (CET)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so1712264f8f.3
 for <ltp@lists.linux.it>; Fri, 28 Mar 2025 06:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1743167906; x=1743772706; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UC7qmywPveYG7sR21BVO3MQgpnb+qq8fIdAYx3gWzO8=;
 b=giZwFDedxMYUr0JzntpK0jrfQUNiBhFYXiZBY0591wrJYJVC7an3tV+wgrY8p9WOY5
 nvPuvLJmNqis5rNT9/IVxiEAz5Wom1FY6Fpkt8PuhF+2TRU2khL1eGLkgxjOSEu49Lzc
 9nsCQBsnN9/m1ioSffYuiy9vE8u39icamBOOBdMki5azzHeje6ejmCKxxX+diwU4aM8Z
 YToIjybv1h1fUAFFscgwkUWbEPLEF5OFP3BWVkWK2IN1ye9nV5QNSgFmdInr4vJ91JLK
 hZRpcYFeoM+3MdxS6qEvncYFCoNQJk5MaCCCTz7b6QXfNwq6+dHvdKLiXzUMuvmoDwhq
 EF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743167906; x=1743772706;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UC7qmywPveYG7sR21BVO3MQgpnb+qq8fIdAYx3gWzO8=;
 b=gfKB9npa0KPMnP/3x++UZ+/mG9nmpKNe7Y1/NdJ+4Kqivvi1D9NhcyqGgU3S34sGB/
 s6RdCcCeXhlWOa1SHN6HHzGnb3R17904sEjXRedqwnecMjoq5Y/Djf2JdCcc1ArgLZXs
 SJe0AGRpcHS4PRP0OavN0X7ldnQaHJ4KRPIAN+MobMAvBNpBVYoq6ShMjHPqc8EPW5+e
 DQDeq+SIUIsRj8HQiNkaigA+Q/FzBVnIyE2ekDZphC7ECU1bN5CVGWMdDeeuU6aKJFf5
 ndEHsqGe8HpuTunrHa+nghKxwddr3WlqiQQHs22LH6fuTEJ+2HQqoMmb8isPznw4GtPP
 dcqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv+HsNe52CL71/XkvCjjfMKEKRT0MrZOpX6zay5szApJt0AEVI8QkDnCOaVU7w/y+aj08=@lists.linux.it
X-Gm-Message-State: AOJu0YyS3Jj/WpqjAYjUsKDYedeVE/gTjOlN/sbGjIoxbsANLOW2jGv1
 DvvZLd+qGV31JtXKXp89lZSlLdpnXHNz19ltRV99f2K9NmpPlHizBE0YrAo7cXo=
X-Gm-Gg: ASbGnct8rQP/NfTwGrUHTwGRBGRm15sxYSEWHiHijUYvEClZSgwJnt5yPSsX+nTb0uN
 XGatle/0hDbHG6WamMKttjPEmetDha/DpRqKTFruByJmV78z9vMmMVfH8nwCux7Ls0PQn6UWqS/
 +CgHmZMITG5BMKaJSNDZTU+om/PGEHhmMDWv4Zx06WDRnQbiE8/tlQz620K61/uBuI0RwX2UIF1
 fA5HrO+Ngs+jgquFf2+VyiDeuvGapqFKHMXmYdKVc6UEkFphki/yQJBeNzwjRaWYCafiS6tT57H
 whOd2jqr6XKd7lMUVZQkvKF5F9XIF3FOWZSRIti5npowMe4WSd+84r8DhLDpB+LI0Jlqc0ZGU8g
 g5oF3FXy9Q64uXfnCinUiblD3YI0fOQy18MLTdWFZu2etOpP/W0HegoIsa2mSfyt0YTzzNqW7NB
 S6tiEo3Pk=
X-Google-Smtp-Source: AGHT+IHyF99kNI2eKpwY3eNeTysFpog8guyNy89/u9oPI8+uRj5rD3BXkYEVYkDxwnE0VwSitQ23OA==
X-Received: by 2002:a05:6000:2ae:b0:399:79a7:95ac with SMTP id
 ffacd0b85a97d-39ad17606e0mr7001492f8f.41.1743167905706; 
 Fri, 28 Mar 2025 06:18:25 -0700 (PDT)
Received: from ?IPV6:2003:ef:2f1a:ea00:b220:7501:321e:5c31?
 (p200300ef2f1aea00b2207501321e5c31.dip0.t-ipconnect.de.
 [2003:ef:2f1a:ea00:b220:7501:321e:5c31])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e141sm2596647f8f.77.2025.03.28.06.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 06:18:25 -0700 (PDT)
Message-ID: <8b216cc2-8675-4f09-83d4-c9d4f78f1397@suse.com>
Date: Fri, 28 Mar 2025 14:18:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20250328095747.169011-1-pvorel@suse.cz>
Content-Language: en-US
In-Reply-To: <20250328095747.169011-1-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4 0/5] Update doc related Makefile
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
Cc: =?UTF-8?Q?Ricardo_B_=2E_Marli=C3=A8re?= <rbm@suse.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>

On 3/28/25 10:57, Petr Vorel wrote:
> Changes from v3 (all by Andrea):
>
> * Add setup (alias to .venv)
> * Move sphinx to requirements.txt (therefore remove handling in Makefile)
> * Add support also for fish (csh/tcsh ignored, supporting: fish, bash/zsh)
> * Use 'setup' instead of '.venv' in the top level doc target
>
> NOTE: 'distclean' of doc/ directory is not in the top level directory
> (IMHO not needed).
>
> Are we there yet?
>
> Kind regards,
> Petr
>
> Link to v3:
> https://patchwork.ozlabs.org/project/ltp/list/?series=449828&state=*
> https://lore.kernel.org/ltp/20250324234016.367228-1-pvorel@suse.cz/T/#t
>
> Link to v2:
> https://patchwork.ozlabs.org/project/ltp/list/?series=443894&state=*
> https://lore.kernel.org/ltp/20250211233552.1990618-1-pvorel@suse.cz/#r
>
> Link to v1:
> https://patchwork.ozlabs.org/project/ltp/patch/20250206143421.1571918-4-pvorel@suse.cz/
> https://lore.kernel.org/ltp/20250206143421.1571918-4-pvorel@suse.cz/
>
> Petr Vorel (5):
>    doc/Makefile: Remove also metadata/ltp.json
>    doc: Add sphinx to requirements.txt
>    doc/Makefile: Allow to create and use .venv
>    Makefile: Update 'doc' target, add 'doc-clean'
>    doc: Note 'make doc' in the building doc
>
>   Makefile                         |  8 +++++++-
>   doc/Makefile                     | 25 ++++++++++++++++++++++---
>   doc/developers/documentation.rst |  4 ++--
>   doc/requirements.txt             |  1 +
>   4 files changed, 32 insertions(+), 6 deletions(-)
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
