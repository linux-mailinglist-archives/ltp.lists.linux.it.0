Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD8E3E8E26
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 12:09:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B4033C6FF3
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 12:09:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EE8CB3C31A3
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 12:09:46 +0200 (CEST)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 764DC10009D9
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 12:09:46 +0200 (CEST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id C99E63F04C
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 10:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628676585;
 bh=VABVAirqhJR9TshP7XFJrIuwXkowldrXKrS+ikeDa18=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=FgU545wl6KBzMKt8jCa7jltZXABRIO7LwFRuVXFmMvVgDVHrPivzIRe00i32Ls38D
 sk2vPDXkunqtn5WRf7TmIrhzjgaZXD4HwN/LUPhYgodOGa87mdd7oUWZW/5Ptbzoob
 I3FGd00yFM7MQvbF1YC0fd6c18EIzpNiJamT/HDuf7wJ/sQ8g6YtvqMTlGwiANp8fm
 7kIW60Q/+d15Ve4tkBDI/WscaOyAzuKg15KcbNv0fCpCyAxTFy2vBqkASDXsUlCt0V
 Iioum8W01hFSiAXtTJ1JBOTS6+nVHxnCyLjxQWPjyPnI/3KZHUA8r+oTKUzHpwfKKZ
 roo7Zgv6WUDmg==
Received: by mail-ed1-f70.google.com with SMTP id
 y22-20020a0564023596b02903bd9452ad5cso946851edc.20
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 03:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VABVAirqhJR9TshP7XFJrIuwXkowldrXKrS+ikeDa18=;
 b=PWV8aQ7lZGh9LHXz6jZI1vcyoJeMf/o2/3Ek/FCtGc2+oZplTSl1H/qsoqGqfRAhH2
 y5OhOl30GcTP0thGr+u8S/T3i/AYdAIioxoAu/BMwwmvM2NEC7PumQf8VhxYQZ/EXPf1
 1UlNZWh8WGVZlySxG+i8jYUAiv46gtrJsCVtqMcxfiYaDu46062e9xXNWW5fggnTqAEA
 5oJBCawyrAFDiYJlI7Pz4Ye5CnuixswDWExoNJO0iTbAJ+WslwRafydx1bTXJN0QByKc
 w72mUyfwjxKFPbruswTdlVDaQOwzoRqMkxsTsoJ/KGcaWmFkIJu6MaKkS9E7JkFwXU5W
 W0/A==
X-Gm-Message-State: AOAM532xL6+zcI5ZY5wOxDdxT3Tp851XaLEFQijjlbfbJz6DOjhaE3mw
 L0It8nF7wE+KI+E6EG/Syi3jnm4qrqRZ/7hZXEQ5r0XB8Qyw3e5ayeSpgIR4xuVaUECmor8xQhu
 s2W5NMYiRdb9/JkNWc4bQJggiVMth
X-Received: by 2002:a17:906:144e:: with SMTP id
 q14mr2920572ejc.19.1628676585360; 
 Wed, 11 Aug 2021 03:09:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBNbY7DXyvWF97MGa/YoOY3lzLZu7pFgAEm2TtiLz+heHoL9MmUxvkM3INAs1oqBfZNaCu/A==
X-Received: by 2002:a17:906:144e:: with SMTP id
 q14mr2920560ejc.19.1628676585205; 
 Wed, 11 Aug 2021 03:09:45 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id f26sm11028175edu.4.2021.08.11.03.09.44
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 03:09:44 -0700 (PDT)
To: ltp@lists.linux.it
References: <20210713161556.63096-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3ed326d8-292a-21df-6bb3-d3f1b68fedd4@canonical.com>
Date: Wed, 11 Aug 2021 12:09:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713161556.63096-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers/memcg: document non-hierarchical on
 v5.11
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 13/07/2021 18:15, Krzysztof Kozlowski wrote:
> Since kernel v5.11, there is no non-hierarchical mode, so mention it in
> the code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../kernel/controllers/memcg/functional/memcg_lib.sh | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

Any comments here?


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
