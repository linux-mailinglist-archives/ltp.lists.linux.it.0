Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C9F397235
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 13:19:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB5383C8014
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 13:19:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 974DE3C5A31
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 13:19:15 +0200 (CEST)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 075A21000D39
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 13:19:14 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id s25so18646932ljo.11
 for <ltp@lists.linux.it>; Tue, 01 Jun 2021 04:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+cGaaS4H2djPYXLxBd18YgBXIDKfsuAMomGp9abSLIw=;
 b=O74JnLF1Icbsb896R09UXdCoaq4e47VWiJqySB0oQVQNi8u2/gJnbp1g0oR6so6wZS
 zsGoQeAo2sNzGGi5GVOPfiAGsEQdr/75CE/gL1VWU5Y+emURXV5T7OvvSwuB+xaqeCze
 xITkR8JtpI14r8rickyM5p1NJIPpnU7scwBtE6D8DIXFBzMYm/FCUtjAGUDYppGYjSCX
 BLMI+GuWsVGc9AfiXkB57RoRs2Ld11DibRtdZCWS2yZfkmna9a/TNy/oqnZfqm0iHVvo
 ZJ2qaCzprmfnSwObHbuWQbb5REsdcGKeD59AUlu8uYWJj+EVY3BAIPSp5ZZP3tTooQgf
 sbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+cGaaS4H2djPYXLxBd18YgBXIDKfsuAMomGp9abSLIw=;
 b=b2LsiPwtVjMHLunLBv+bW+Sj8R79IXZQwUNxeVm7ePbPlD4tNYnzEHuNAOlk7FKw3A
 ebThG8Pkplm4hebrzAO9jz7ZG1a3aul3TP45lt28+q5oNTELQTt8wNCZNRcCrrMz0Z54
 p2NgadGgjagsUseoKITtWFXP5MkMN8515S7ksXu2bTFmjEFj5mLnmcUUZMYJeU66WlVl
 o4B56rPTMXNFvnrK+tfJ1xkh3jp1SVZHpsNKwKWQVAg+eC+dHEfps/1ZtL58XKaDjpDi
 ySXvldI5HYhmDHaWD90ZcGfNNx/1WQd10Fh4qSCfoU/Dupz6PvJMO4MALpF3yymdbxVb
 /FJw==
X-Gm-Message-State: AOAM5316PtTuY/Ly1tx/Zl3yiiaVRud3eZcOSpn1abouJet2MDGknJgv
 5oqxZVObASxR81FkglM/VlroOsh6bBNOec0=
X-Google-Smtp-Source: ABdhPJwSnsbkhHUB/HcHfDDzHeJI58CCc63+Q69TK96qz0UhZQUY+KmUPX5fBxPyOe4Lw6e2jnVorg==
X-Received: by 2002:a2e:b888:: with SMTP id r8mr13462861ljp.121.1622546354211; 
 Tue, 01 Jun 2021 04:19:14 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id n1sm780156lfi.208.2021.06.01.04.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 04:19:13 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20210601094807.77790-1-aleksei.kodanev@bell-sw.com>
 <YLYHRQYBwKz+JTlU@pevik>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <3b122ce4-170d-6e7c-7c30-62016b151dea@bell-sw.com>
Date: Tue, 1 Jun 2021 14:19:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLYHRQYBwKz+JTlU@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.5 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] network/lib6/getaddrinfo01: rewrite with the
 new API + use static hostnames
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

On 01.06.2021 13:09, Petr Vorel wrote:
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
> ...
>> -	tst_resm(TPASS, "getaddrinfo IPv6 SOCK_STREAM/IPPROTO_UDP hints");
>> +	if (access(host_file, W_OK))
> I guess we don't have to bother with R_OK|W_OK (required R_OK for SAFE_CP()),
> as no sane system would have disabled read permission on hosts file.

I think so, and the root will still be able to read it...

> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>

Merged, thanks for review Petr!

> 
> Thanks!
> 
> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
