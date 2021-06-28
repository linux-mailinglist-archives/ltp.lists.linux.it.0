Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 509063B6615
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 17:50:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 978873C6E9A
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 17:50:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E707B3C19DA
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 17:50:13 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E9AFA200139
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 17:50:12 +0200 (CEST)
Received: from mail-ed1-f72.google.com ([209.85.208.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lxtWV-0001P5-Qr
 for ltp@lists.linux.it; Mon, 28 Jun 2021 15:50:11 +0000
Received: by mail-ed1-f72.google.com with SMTP id
 dy23-20020a05640231f7b0290394996f1452so9894967edb.18
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 08:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IKZZZLKR+nsrijbvTY0NZB1hrbE4r5oE5hMCzDNOFc4=;
 b=qXuHEdzX7qQr0nxfzpOLBYbGb9zzwbmhbsar1OuiCs6dj+cJ7PL2ZQ+buXzi0ZnJZG
 x7yFuvzagpA50AP2fd/2vOWJDltPRJn4cSbP0PAqPRpyUMAB7dLRybDYcUAT4zwEInDp
 COFXzjEG3XGsqNWcgRjc2+D442elKpWwxglpytpdt99bZ/fdLcFDduVyFqPsF72VJjpc
 b/Wp8l01N1rFGOzg+OYElPoAZusvELIKAYZ6sAENMyFLuh3eOFB7tXNSeZ5ZFjz39t92
 zR/O5TlRHR/CrnSbgNc1DT+K2h7DF74yqs+T0LIzhlGhf+0aRZpa50GvCkklHTOFhBXk
 TfBQ==
X-Gm-Message-State: AOAM531/aqkjooErmQNbQ4iF0RLLWTHiuXsuWV4Hzks1n+GMfiA5Pi2H
 OsakhJF/dgpgrfku7i5he/Qd6gk23YxA2MgQLvFeeOHJ8Kvfin0K3RBcIqX0HY9hLZTATgeatYI
 SPC/Um+d4O+NhefmH7XbqRCZfrCpI
X-Received: by 2002:a17:906:e29a:: with SMTP id
 gg26mr24940078ejb.59.1624895411272; 
 Mon, 28 Jun 2021 08:50:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOdqSqhznDSHRhzFbQwBaxjU0BmHVh2CgVRG3WlFiehjEcAdlPVYfAzs6Kpdl5SZWG+YViAA==
X-Received: by 2002:a17:906:e29a:: with SMTP id
 gg26mr24940071ejb.59.1624895411169; 
 Mon, 28 Jun 2021 08:50:11 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id c6sm9545504ede.17.2021.06.28.08.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 08:50:10 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20210623135912.81156-1-krzysztof.kozlowski@canonical.com>
 <20210623135912.81156-2-krzysztof.kozlowski@canonical.com>
 <YNnhawovD2P/JBHu@pevik>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <c02beb1f-31f8-8902-8be8-27b4bf9ecfe2@canonical.com>
Date: Mon, 28 Jun 2021 17:50:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNnhawovD2P/JBHu@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/4] include/tst_pid.h: fix language typo
 (subtraction)
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

On 28/06/2021 16:49, Petr Vorel wrote:
> Hi Krzysztof,
> 
>>  /*
>> - * Returns number of free pids by substarction of the number of pids
>> + * Returns number of free pids by subtraction of the number of pids
>>   * currently used ('ps -eT') from max_pids
> Because you change the description of this function in the next commit,
> I'd just fix this simple typo in 2nd commit. But of course it's not wrong
> (prevents keeping the fix even if we'd removed second commit).

The commits should do only one thing (fix one bug, bring one feature if
possible) and the next commit does not touch that line. There is no
re-doing of the same change in next commit.

Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
