Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD533F288C
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 10:35:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC8923C4F2C
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 10:35:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 512613C4EC2
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 10:35:17 +0200 (CEST)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 85C9F60095F
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 10:35:17 +0200 (CEST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9B5863F321
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 08:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629448516;
 bh=KXpkgou9RprxxgTd833s/3QRY3zgwlMrkuKoEU4YeiI=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=RBw1TeObuXBZhlc9zbTNO7Y1H9aXQzWbba7dSrebIplNqeyBtc9abZBsv0ibMhLLz
 vgFkkOeABGYO0nv23B0VgPQdTRIXSq0e+NPf5mtamJ7B176E+ARJ770ZBIVivTuNni
 XJYl/Le+m1uZEvmLU9F8akaz0wJRzLBfZhxoNo+BQ2l9XW1HzRHvrQvR+Nlj7rQhwH
 EKzwwkDygVLjlKbY5UAhPVURo9i+RPcOuDg/t3ED8i3ouRWftr5gp9q25OkMJspim4
 Zvc2mIdJf3oqdAkyiDBEMXIdeSB12VB1NGjcGKzCQy9/Fgq7CW8mN8oXrYTPX5NsIC
 blDnRsOTAfpvw==
Received: by mail-ed1-f72.google.com with SMTP id
 dd25-20020a056402313900b003bed8169691so4220768edb.7
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 01:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KXpkgou9RprxxgTd833s/3QRY3zgwlMrkuKoEU4YeiI=;
 b=qnEzDSZhHsA7M8em2Jc02nhW0gvY9UUV6b2USuBII7LXO225DGEWP2dQMYl38fHaNy
 tcKbS82P9B+qNI/7EMz1j8Xnq/4Nd4miV8BYTYaj4VD78wg7fKcankiEKhQq5ul4bll0
 ghKm7AQ4gj6Ppy0CLlZbtpYz/61njNKM4rXixtWnbu4V6V1ZkgFCy1dqV1vMELXC/bRq
 h2k8TeSEnqVB+fk5xW0QDad0B2394EK6G99Il05qyi4coLnZxCc9pcLanZMy8a8e46s4
 HXbWPCX28ShA4fX4b5XC+DeFQMV8rrhvp8ltQR1dTeMk6uMbxkkiJfOdqYtrVrE1Ob1a
 afRA==
X-Gm-Message-State: AOAM531/7CxcyMJffwxJWvsG3RQPDjzqPyO1b8DGN9cUZ9K4zEv+2Q66
 ZfsI+mMOshb3cwC1dMMJiI29PaoTiVIrUiGwdVttw1Y4qe5Y026Qj/jnuWinfMZTTJfqbkaze4U
 fUEpmkGNX3xkePIsAx6geSbc/FY3/
X-Received: by 2002:a05:6402:5206:: with SMTP id
 s6mr21053222edd.151.1629448516147; 
 Fri, 20 Aug 2021 01:35:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfGDx8OqZFQza/w79kbaBi6qSVEsUIiX2/p+xTo4yncUCNuv9FftgdhIeWaHwvAOFnFNXN2w==
X-Received: by 2002:a05:6402:5206:: with SMTP id
 s6mr21053214edd.151.1629448516058; 
 Fri, 20 Aug 2021 01:35:16 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id i11sm3119366edu.97.2021.08.20.01.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 01:35:15 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210629121047.100391-1-krzysztof.kozlowski@canonical.com>
 <20210629121047.100391-4-krzysztof.kozlowski@canonical.com>
 <YR5/qcQyAiFjmVR0@yuki>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b6ea17f6-e31f-8056-c5a1-776a5970eebc@canonical.com>
Date: Fri, 20 Aug 2021 10:35:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR5/qcQyAiFjmVR0@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/4] syscalls/msgstress03: fix fork failure on
 small memory systems
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

On 19/08/2021 17:58, Cyril Hrubis wrote:
> Hi!
>> +	free_pids = tst_get_free_pids(cleanup);
>> +	if (free_pids < 0) {
>> +		tst_brkm(TBROK, cleanup, "Can't obtain free_pid count");
>> +	} else if (!free_pids) {
>> +		tst_brkm(TBROK, cleanup, "No free pids");
>> +	}
> 
> This looks like copy&paste from msgstress04.c, can we please move this
> snippet to the library function instead?
> 

I can move it.


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
