Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B125E3F2885
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 10:34:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 356CC3C4F08
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 10:34:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A9C273C0F90
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 10:34:41 +0200 (CEST)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D57AD1A009AC
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 10:34:40 +0200 (CEST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8E16040794
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 08:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629448472;
 bh=73t1bfvlWau5s82WCxq1HLQXc5LJmOu51jJTh/4JV0U=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=gIecL5m4HuhtQSFH4AHREkrH9zglCigesg0pufGvonHzOHAhpYZuEgfJPXpl8Ko24
 ztPx74X3I+EygjUhtY1EiBHLjGdEbI3VUKBH3is6x/1ZsAxOrNoPyqoLWcUgDvYkLr
 FaKj+HizawWDD3Q5YDgxIFjLZ0mI/uzhbEXhYTKCLSPF5mSIP/pFj3D3sCP1BppHGQ
 t/CjWKlTai8FU8xHfKnpb0LvuSo/EED+ngckcg7+asfmfla25HyR8GjwpEkVjtu/+S
 GuHjI6mBhCq10GCpUt0IO2ly7noy/4SheSdkQKS/0k7M1wDc8+q5IrOy0HaOqjTJJC
 uvPNh1NY6WoVg==
Received: by mail-ej1-f72.google.com with SMTP id
 s11-20020a170906060b00b005be824f15daso3411992ejb.2
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 01:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=73t1bfvlWau5s82WCxq1HLQXc5LJmOu51jJTh/4JV0U=;
 b=ue/7TvlM+04ZnlZQfCfay/iXgpd4UAsvp2gpE2drOnulL9iSSWUt9uw0227wYHzc8z
 f916gxnq6C0YR/uweY1N3b87wfIrHp/flzuj5T8oz8eFsJ5sNcRy2KrIKqRQx4W+JupB
 y8KhZjgVqpKpzmexovtnZKrcLbbg9iL4HYjs3UYWeazLMxsIPzurPJ+aSZHclRfZO//t
 ajLbbLTNm9OuenpJSie31QKjmPhkRnKB1E+JUzsiFAxHy/msLyz/s091J1LK7iSW6dYw
 WcCm0AV9PSonP1ciKH11RvK4Aq0N6XUczIYBTWWwuE0OksqRGYOygCwDKYW8yXk3rtWJ
 V/NQ==
X-Gm-Message-State: AOAM531ELZqm7pzyBAysGXr2v/+RgDkKTXV4nP9dtCh7+K8IqJ4uuk9B
 dpPsL71UB69nsY+8/MSItBbrFodHlEh/xkhqm8PRnjOGphmFC2nA3BGxShnVIZ0Apc7LyKWyaJg
 x1VyOlVlOhhOB5ico51GRJX0eP1ks
X-Received: by 2002:a05:6402:1c03:: with SMTP id
 ck3mr21154496edb.312.1629448472122; 
 Fri, 20 Aug 2021 01:34:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXHNBwA9FJIvToiRAOJgeg/jnac9rlObjQ4wKdeseRjxjh+cuj4CQ72Hm1jCdtg74nZPfoDQ==
X-Received: by 2002:a05:6402:1c03:: with SMTP id
 ck3mr21154483edb.312.1629448472023; 
 Fri, 20 Aug 2021 01:34:32 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id d3sm3152689edv.48.2021.08.20.01.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 01:34:31 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210629121047.100391-1-krzysztof.kozlowski@canonical.com>
 <20210629121047.100391-5-krzysztof.kozlowski@canonical.com>
 <YR6AAfuxrdw9wuZ/@yuki>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <fa2d4021-48b4-39ee-bdf9-b54e7055804e@canonical.com>
Date: Fri, 20 Aug 2021 10:34:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR6AAfuxrdw9wuZ/@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/4] syscalls/msgstress: tune limit of
 processes for small machines
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

On 19/08/2021 18:00, Cyril Hrubis wrote:
> Hi!
>> Forking the exactly amount of processes as the limit (either from
>> max_pids or from cgroups) is risky - OS might be doing some work and
>> interfere with the test.  Instead leave some reserve (hard-coded to
>> 500) for the OS so the test won't fail on fork failure.
> 
> Isn't 500 far too many? I would expect that 50 would be more than
> enough.

I wanted to stay on the safe side to avoid false failures especially
that even with 500 reserve there will be plenty of PIDs to stress the
system.

I can change it to 50.


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
