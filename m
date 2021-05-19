Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E0C388833
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 09:32:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E51153C30BE
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 09:32:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7F02E3C183E
 for <ltp@lists.linux.it>; Wed, 19 May 2021 09:32:12 +0200 (CEST)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C60F8600D39
 for <ltp@lists.linux.it>; Wed, 19 May 2021 09:32:11 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id v8so12608017lft.8
 for <ltp@lists.linux.it>; Wed, 19 May 2021 00:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oLsicdS2GUOmWzAp7jZnMsjHvnFYfGW8pJx8Msgi+Wc=;
 b=aHYt3806Qsn84j4oMc9QhQJNL3rQBDGEG/391jAjqsmIKfJl5bzY9yh6Sv7ikTssKD
 s7MTZszy5OyvA/hzvdycczEzDqT8CYzaeCNVhvMU2lFJ5XMTafHjf0dkS1XYpyVshewz
 TVBhehqHZKIHb6arOUSPYHWcu1qMypekFddsjYnrWIg8nEMeaUFk2EdGOF/8+ZumYDko
 Tiis6zDQUqJDnit5rapNl8cfrynWb4earNcFqbaFGA0pgunw/6BfmPSPzD8MFKfwzD1K
 g/tq0m3QLXrWdv78I2e2L0l9WQKH3dQXzJsZiw7yCqU5OdL6w9M13DEZPW/AhHECRL26
 q+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oLsicdS2GUOmWzAp7jZnMsjHvnFYfGW8pJx8Msgi+Wc=;
 b=gMVEhGET3+mvxKWc/Lmr7n1JsyFw/91RemwuaG18oYRDTwVEkVxLawe01uGFQXBIFd
 19k6TPEF8uRxaDsmhC+g2hY6Fpa4EWUXvrY5MuZkHig87VD4Pm5+vshtSMH0DJIXonHJ
 jQsjeYHLYJWX9Rc49euKDVK2cKtUvPyWyTBOJfJ98kiUstuedi88g4+2hOyEkKYZapzT
 v1Q0+FOH4WOOLUu/Edk/osYl06o4qD/LA2p5uhgFrBmid7DZDGXEkt8comjPWX4VMcEU
 XypsUC377ZbA18Z/ww7F0wnCLhyIUHRycy9L/fMNkaXw8IEVCt1jrF2QnRPEcONcgfsH
 YSQg==
X-Gm-Message-State: AOAM531lJbQAU0248CIgl58Dh/FIiFjqhmj8ZO4O0YLjown2p924TaxP
 nHzgDXWUk07/8oOJ/sYbfAi+
X-Google-Smtp-Source: ABdhPJyHjT4ahAYgMeF1mkPwqxfP5noOfzPPw3IPJi5XKM8zEiJvrRtZ8HV1Sy1b9hfwX4vX02HieA==
X-Received: by 2002:a19:7010:: with SMTP id h16mr2179124lfc.146.1621409531171; 
 Wed, 19 May 2021 00:32:11 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id c21sm2555927lfc.80.2021.05.19.00.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 00:32:10 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20210518091422.41857-1-aleksei.kodanev@bell-sw.com>
 <YKQSTR1wkB/U81Em@pevik>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <b7744613-ee02-c4a5-e5ed-da3da60a6e7b@bell-sw.com>
Date: Wed, 19 May 2021 10:32:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKQSTR1wkB/U81Em@pevik>
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

On 18.05.2021 22:15, Petr Vorel wrote:
> Hi Alexey,
> 
> ...
>> +static void setup(void)
>> +{
>> +	unsigned int i;
>> +	int fd;
> ...
>> +	SAFE_CP(host_file, "hosts");
> One more thing, could we check for /etc/hosts before?

Hi Petr,

Yes, why not. I assume it can be read-only, but I hope we won't hide a
configuration bug with this...

> Because we want to TCONF on systems without it not TBROK.
> And I guess there are embedded systems without it out there.
> 
> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
