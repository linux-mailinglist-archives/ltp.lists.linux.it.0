Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6E0387650
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 12:19:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5786B3CA3DB
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 12:19:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AB8F73C604C
 for <ltp@lists.linux.it>; Tue, 18 May 2021 12:19:49 +0200 (CEST)
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BFDA160115D
 for <ltp@lists.linux.it>; Tue, 18 May 2021 12:19:48 +0200 (CEST)
Received: by mail-lj1-x241.google.com with SMTP id w4so10876313ljw.9
 for <ltp@lists.linux.it>; Tue, 18 May 2021 03:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=84hLILhHX17DTvqifLyTDqwYOj2lY9lzX1RB3Md+1BU=;
 b=ieZ+BhwoJLCqn8rwZaZUVHVOpderE5TQxICN2kCYVagBl5x5zgsiIdU2gL6S6sUKD7
 YnpR0/pKHi8hsVX1rW6xhtWQ1cgW4lzr4ghwg451mCwPw1OHGvTEtOnsUwauosQizJi7
 PeGa1itvGnWiGVePaNauwLY+7HXgGRHVqxo3LmbofhLeenWuGwg2mdQxl7jwbGlIKh2/
 0+hcZC0xyuou6wqNLXsSZrJdu0qp8WCGNEHcQqV7I3Podg0UZg+s81CThE91nC2cTtHZ
 xWhvTDaphnf/v1gB5YpdzbICwkXFZGu02tV2cP+gi5Yfsnpf74pFNqhdgyh1rge2AwcG
 NZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=84hLILhHX17DTvqifLyTDqwYOj2lY9lzX1RB3Md+1BU=;
 b=sLaG98wNAdnInF8vaUoys1k0vZTcN/N5vWdKTFQwbg2puUkJXuSduU4wDEAqW6DLHk
 8yK34p1xuq3YqNj0pacBogXzTLGcGjf+T2S9SX/N+6OB3hU9YVzV/istKSWQVLgnCCx6
 2xmZgJTgJT9yX1WQBxqYMGgesESc2C/OmhIo9DTXV2Eofuv1vhnB5kP5M5c+SKGjLf3y
 1iLP/lm03HErHT41EjAcgtlzHpWgPsRO3TgE95y5FY0yW8wwlVs+5tBFsCWUNjw3329k
 LkLBoFKiHzqk6qrqYpfZDanYMnAjKf5c3e4Jf6ahSyuOMWpOB0bG7VAS47yz2ma3eiNO
 igOw==
X-Gm-Message-State: AOAM532p4Yq8V3n4p1QXwUg5u1XJhvoLZxlP1NduXlMOw3jQeInOtVQH
 YwgR1g5NtkxY8uTm5IlDCzSkhOJv5hmc+AM=
X-Google-Smtp-Source: ABdhPJx7h9l7rPoD2jWzphVLz1yYhoUIB6VhRZ2EZ5XXRg6av1GRhO6AXwzcOUbGdv5m9+Wbel7o3w==
X-Received: by 2002:a2e:a373:: with SMTP id i19mr3509517ljn.49.1621333188185; 
 Tue, 18 May 2021 03:19:48 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id p2sm2271230lfc.115.2021.05.18.03.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:19:47 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20210517085637.16866-1-aleksei.kodanev@bell-sw.com>
 <YKLKn3o7A38/nyjt@pevik>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <235d2495-92af-7638-c468-9456dd202296@bell-sw.com>
Date: Tue, 18 May 2021 13:19:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKLKn3o7A38/nyjt@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/lib6/getaddrinfo01: rewrite with the new
 API + use static hostnames
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

On 17.05.2021 22:57, Petr Vorel wrote:
> Hi Alexey,
> 
>> The test is now independent of various machine settings
>> regarding the test host name as it adds predefined names
>> and aliases to /etc/hosts file and restores it to its
>> original state after completing the test.
> 
>> This should fix the following failures:
>> * when gethostname() returns an alias name that doesn't
>>   match canonical name;
>> * No AAAA record for the returned name from gethostname().
> 
>> Addresses and names added to /etc/hosts are more or less
>> unique, so that there are no conflicts with the existing
>> configuration.
> 
>> Also most of the duplicate code is now gone.
> 
> Thanks a lot. On a first look looks very nice, I'll try to review tomorrow.
> I'd be for merging this before release as the old code is broken.

Yeah, I'm for it too.

> 
>> Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
> Congratulations to a new job. That explains why NFS related patches didn't
> reached you. FYI nfs-utils related "Fix NFSv4 export of tmpfs filesystems" patch
> from Neil Brown [1], fix for my bug report (with naive attempt to fix it) found
> with LTP NFS tests [2].

Thanks Petr! Nice catch!

> 
> Kind regards,
> Petr
> 
> [1] https://lore.kernel.org/linux-nfs/162122673178.19062.96081788305923933@noble.neil.brown.name/
> [2] https://lore.kernel.org/linux-nfs/YILQip3nAxhpXP9+@pevik/T/#t
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
