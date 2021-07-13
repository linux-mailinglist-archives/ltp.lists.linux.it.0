Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBB33C704F
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 14:32:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A81833C877C
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 14:32:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 023623C66A7
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 14:32:29 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DF2AE600875
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 14:32:28 +0200 (CEST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 2499640562
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 12:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626179548;
 bh=32IhNfwKOCs6OPsF22rlileqx1SlWM3eeFCFRD4Qybk=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
 b=ayn/KqMGtx/ksY7pbTPvL4N5QV6nZ5ea6D1IfHcJfpPc4zZKIb3fdouk6nzsZVZ34
 i2YNo4kIz4NyESbaQvmdzeadRFvOBQo/z9rKYNyknpmYcK9YThk5X252iSkhJJuEOa
 +oYtbfJLSVF+Oomi3P3SwDRkW/jKEdeWVkqjtCAHD2/h8qiEDwl/vY+o/qNUfOnwq9
 0pTRWwSPWj17lV1ypBYe4zHkCO/zLIDjhfXZVcQsMf8x5FS11fYngFtC/VsgUwkBY7
 EAL4imQ1sZj+BKJSrVx+hIR/7UUOr+B/wxUF/Mq0Bkt32YK1xfAQkww4s25bs5v919
 chfDQGQl1MsWQ==
Received: by mail-ed1-f70.google.com with SMTP id
 n6-20020a05640205c6b02903a65bbc4aebso3952432edx.10
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 05:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=32IhNfwKOCs6OPsF22rlileqx1SlWM3eeFCFRD4Qybk=;
 b=obgVQj5GvjkPgj0+14cBrlwoYQaj23spVMY84O4pewLoUWTSTfYAFUTiitDu7rt+8h
 6JlEbKuSAoVkoCDCNtn4UYp74uzk7yshoc9w9y0J6ytKRQl5HPv1BLHTow5L4yZQioEs
 mGNT5XdqE4p0dmJ4RHiAfr8LdV0Q5vmMVcwEXmufIaZn0ChtisBrQGreMahHow537JMm
 Dm/BrTnoTlIPHTtHWP753wDhewUlkyj+KX/VWZxxnrXt190MyhabI9nw2ZvuSlU8Gjmi
 4yV6R9Ul89aT9dBoyxYruRvsgsAex7lEMnOI6zHzKpLQBQZ0JXmH5/SFnxVS5wpaY3CE
 d61A==
X-Gm-Message-State: AOAM532aDZeg+2nmxElEKx/msoeN+dpoKWGGnAP2anwWZmA+38jWbZi/
 95N9teHGssnbjSQYBdsgb5ya2QHUSrZkusjFJCI3Az/1n0dC6aw2D2gGR2BnXm6tCfyG2VyOkh9
 TG6Q3ESGu6nP0kBgKZcX3tMjfrlz2
X-Received: by 2002:aa7:c801:: with SMTP id a1mr5520489edt.293.1626179547684; 
 Tue, 13 Jul 2021 05:32:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdfPtiYXLwNPjH8BdQLJP7FAibVGpzHXY2qSi4XoM4tqrrDvcAmpdGsCt9VU8VS+dlCobsYQ==
X-Received: by 2002:aa7:c801:: with SMTP id a1mr5520472edt.293.1626179547569; 
 Tue, 13 Jul 2021 05:32:27 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id p5sm7997460ejm.115.2021.07.13.05.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 05:32:27 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <9c05b592-e474-6a3e-2dc1-ec075a0bc558@canonical.com>
 <YO1/J2pTbSsX2dGb@yuki>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <c253160b-7326-8583-9713-8b3978473c7d@canonical.com>
Date: Tue, 13 Jul 2021 14:32:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YO1/J2pTbSsX2dGb@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Failing test on failing shell commands
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 13/07/2021 13:55, Cyril Hrubis wrote:
> Hi!
>> I have a failing memcg_use_hierarchy_test (in
>> testcases/kernel/controllers/memcg/functional/) which hits unexpected
>> OOM on one of earlier commands, already in the test:
>>
>>  18         echo 1 > memory.use_hierarchy
>>  19         echo $PAGESIZE > memory.limit_in_bytes
>>  20 
>>  21         mkdir subgroup  
>> mkdir: cannot create directory ???subgroup???: Cannot allocate memory
>> /home/ubuntu/ltp-install/testcases/bin/memcg_use_hierarchy_test.sh: 22: cd: can't cd to subgroup
>>
>> The command did not fail, as there is no "set -e" and test fails later.
>> However there could be a case where such failure does not trigger later
>> issue and test is a false-positive.
>>
>> What is the practice for LTP shell tests to handle kind of preparation
>> commands? Maybe this should be something like:
> 
> We do have ROD (as a shorthand for "run or die") in the shell test
> library, so this really should be:
> 
> 	ROD mkdir subgroup

Thanks. This will however fail entire suite (memcg_use_hierarchy_test)
and other tests won't get executed. The failure could be only local, so
other tests are still meaningful.


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
