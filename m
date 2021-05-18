Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E32D0387405
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 10:30:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 79B2E3C30B3
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 10:30:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F0EC63C308D
 for <ltp@lists.linux.it>; Tue, 18 May 2021 10:30:47 +0200 (CEST)
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D5D2F60010F
 for <ltp@lists.linux.it>; Tue, 18 May 2021 10:30:46 +0200 (CEST)
Received: by mail-lf1-x143.google.com with SMTP id q7so11553814lfr.6
 for <ltp@lists.linux.it>; Tue, 18 May 2021 01:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ub3vNA5HbJixAdMFD9QWCjuS+E5d0Ei1x5nM8tKTW2s=;
 b=SGSKmya3TRki6GtU1uRYyuS/7YjRaFhHUWb5ffqES29fPBuTnZ/EIMc62yDkqkgETI
 XmG1sSwVcVoKmeXUecDDTtqV7z9dgnVRhmkp6tJ7M6+Lw3UL2N9S5CHaWQlZuDvesxZm
 qrI5/dgi8SLhQZGWOfkPW8/DfOFYlT6YK38qdNtCSlP4C/e07h7e3pyJz/dDy7/RNXWw
 8mH46bir134Z2lY47E7GT1qdfC0EEuQyU5JQMC8+CSCHq9YOzgBDG2NTwQZTaEv7LtiR
 8TTlwb1tZFhb1z1GqH9h/nc69CenT0gcIJQ89uV9zGfS+XEmOFJslLITunPLzl0uvOWa
 nyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ub3vNA5HbJixAdMFD9QWCjuS+E5d0Ei1x5nM8tKTW2s=;
 b=o6njSGIEFonZIyA73O+L3Op9jVz40nHl5ehkaGVk1h6yvsRWqTI3HbFzYpBf5Jw6N8
 Dr8UjzR8OkkJfWnEMvfDIJoGV7Pq28X9FabF4vk5KiQiSNz4YN6ujGGkys0sRRNdOWuS
 wG0Xk1CORVVEqherpuq1TCOnpNl3jC7uTO+RkjdO+KcKHMMw8L+WMxr7V2HT4C5Vdurr
 yP6RQ3T3GFNjBKAwdifJL14M98OWeFceDv1c1q4M2JogGQO+i5RA9buLATwJh0UwI7zM
 ISLSaxLfig+fZut1gGOAnFNuRMYFqXKxaWj8n4Pu62Ep0IYRUtUm+ZTfpN56Sj5O78t+
 pQ/A==
X-Gm-Message-State: AOAM530LIA1l6NK0rh33cUbFUA8I3xhBsr3SZFyUTzQvmIHqUAmVvkm4
 qCZUszSli0L7T8nXjXtF47Hb
X-Google-Smtp-Source: ABdhPJzG50FDhGAmR6OpCaTO0MH+KZo9OiEFezNzWLAYpX/yL6OaAVD7uZXzveGlXhXAciB+Ca2gtQ==
X-Received: by 2002:a05:6512:1281:: with SMTP id
 u1mr3233462lfs.443.1621326646219; 
 Tue, 18 May 2021 01:30:46 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id b29sm2212233lfo.247.2021.05.18.01.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 01:30:46 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20210517085637.16866-1-aleksei.kodanev@bell-sw.com>
 <YKNYkNOqsmhv9kSJ@pevik>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <7a5dec7a-ed23-2f62-a02f-75667df75835@bell-sw.com>
Date: Tue, 18 May 2021 11:30:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKNYkNOqsmhv9kSJ@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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

On 18.05.2021 09:02, Petr Vorel wrote:
> Hi Alexey,
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 

Hi Petr,

Thank you for review!

> Moving everything to /etc/hosts based setup is a great idea
> as we get rid of network setup related failures.
> 
> Do we lost any getaddrinfo() test coverage for bypassing DNS?

We may lose some DNS lookups queries because the files almost always
will be checked first by nss, and I think this is covered by another
test, dns-stress{01|02} (focus more on the server than the client).

> Just a few unimportant nits below (feel free to ignore them).
> Again, I'd be for merging this before release.
> 

OK, I'll post v2 today.

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
> We might want to put this into docparse documentation, e.g:
> 
> /*\
>  * [Description]
>  *
>  * Basic getaddrinfo() tests.
>  *
>  * Test use LTP specific addresses and names added to /etc/hosts to avoid
>  * problems with DNS and hostname setup or conflicts with existing
>  * configuration.
>  */
> 
>> Also most of the duplicate code is now gone.
> 
>> Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
>> ---
>>  testcases/network/lib6/getaddrinfo_01.c | 1140 +++++------------------
>>  1 file changed, 235 insertions(+), 905 deletions(-)
> 
>> diff --git a/testcases/network/lib6/getaddrinfo_01.c b/testcases/network/lib6/getaddrinfo_01.c
>> index db252a998..23a279ed1 100644
> 
> ...
>> +static void gaiv(void)
>> +{
>> +	check_addrinfo(1, "basic lookup", hostname, 0, NULL, 0, 0, 0, NULL);
>> +	check_addrinfo_name("canonical name");
> 
> ...
>> +	check_addrinfo(1, "host+service", hostname, 7, "echo", 0, 0, 0, NULL);
>> +
>> +	check_addrinfo(1, "host+service, AI_PASSIVE", hostname, 9462, "9462",
>> +		       AI_PASSIVE, SOCK_STREAM, 0, test_passive);
>> +
>> +	check_addrinfo(0, "host+service, AI_NUMERICHOST", hostname, 7, "echo",
>> +		       AI_NUMERICHOST, SOCK_STREAM, 0, NULL);
>> +	if (TST_RET != EAI_NONAME)
>> +		tst_brk(TFAIL, "AI_NUMERICHOST: ret %ld exp %d (EAI_NONAME)",
>> +			TST_RET, EAI_NONAME);
>> +	tst_res(TPASS, "AI_NUMERICHOST: exp %ld (EAI_NONAME)", TST_RET);
>> +
>> +	check_addrinfo(1, "0+service, AI_PASSIVE", NULL, 9462, "9462",
>> +		       AI_PASSIVE, SOCK_STREAM, 0, test_passive_no_host);
>> +
>> +	check_addrinfo(0, "0+service", NULL, 9462, "9462",
>> +		       0, SOCK_STREAM, 0, test_loopback);
>> +	if (TST_RET == EAI_BADFLAGS) {
>> +		tst_res(TPASS, "0+service ('', '9462') returns %ld '%s'",
>> +			TST_RET, gai_strerror(TST_RET));
>> +	} else if (TST_RET) {
>> +		tst_brk(TFAIL, "0+service ('', '9462') returns %ld '%s'",
>> +			TST_RET, gai_strerror(TST_RET));
>>  	}
> nit: Maybe having check_addrinfo_badflags() which would do the verification
> would safe few lines of code duplicity.
> 
> ...
>> -	/* test 16, IPv6 host+service w/ AI_NUMERICHOST */
>> -	memset(&hints, 0, sizeof(hints));
>> -	strcpy(service, "echo");
>> -	servnum = 7;
>> -	hints.ai_family = AF_INET6;
>> -	hints.ai_flags = AI_NUMERICHOST;
>> -	TEST(getaddrinfo(hostname, service, &hints, &aires));
>> -	if (TEST_RETURN != EAI_NONAME) {
>> -		tst_resm(TFAIL, "getaddrinfo IPv6 AI_NUMERICHOST w/ hostname: "
>> -			 "returns %ld expected %d (EAI_NONAME)",
>> -			 TEST_RETURN, EAI_NONAME);
>> -		if (!TEST_RETURN)
>> -			freeaddrinfo(aires);
>> -		return;
>> +	check_addrinfo(0, "SOCK_STREAM/IPPROTO_UDP", NULL, 0, NULL, 0,
>> +		       SOCK_STREAM, IPPROTO_UDP, NULL);
>> +	if (!TST_RET)
>> +		tst_brk(TFAIL, "SOCK_STREAM/IPPROTO_UDP: unexpected pass");
>> +	tst_res(TPASS, "SOCK_STREAM/IPPROTO_UDP: failed as expected");
>> +
>> +	check_addrinfo(0, "socktype 0, 513", NULL, 513, "513", 0, 0, 0, NULL);
> And here also check_addrinfo_badflags() (if implemented)
> and nit: "socktype 0,513" (remove space)
> 
>> +	if (TST_RET == EAI_BADFLAGS) {
>> +		tst_res(TPASS, "socktype 0,513 returns %ld '%s'",
>> +			TST_RET, gai_strerror(TST_RET));
>> +	} else if (TST_RET) {
>> +		tst_brk(TFAIL, "socktype 0,513 returns %ld '%s'",
>> +			TST_RET, gai_strerror(TST_RET));
>>  	}
> 
> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
