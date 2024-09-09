Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0A7971D76
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Sep 2024 17:05:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1725894323; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=z/C9+wbkl/wFPSXdidnRQywR1IBVWQaT34GVo/re8Dw=;
 b=H1EdKTjxUn85pHf2MXjZ71KoDVSOnyJntmMtsVdD6ysllL7qywW3q9Y9mNeed/8zYzNkv
 4Z6jJYWYFdn/q/vlA+2Mx3BuLCrqLIAixdPxGhXNt7bOjaywnqLTs+wbzko6TdBDOAnLPek
 C83PqiSP+HKJ23YBZzVKkzHU204UK8g=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A6F43C18FA
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Sep 2024 17:05:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7C15D3C0F6B
 for <ltp@lists.linux.it>; Mon,  9 Sep 2024 17:05:10 +0200 (CEST)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 68B36600847
 for <ltp@lists.linux.it>; Mon,  9 Sep 2024 17:05:09 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c26852af8fso5791044a12.2
 for <ltp@lists.linux.it>; Mon, 09 Sep 2024 08:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1725894309; x=1726499109; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8TiCiXGjGkM50HrCJ48ImvFzfPR3kc82M1NadfAtzVQ=;
 b=WpKIV54lNBVD4tgaG5RROo692aEcBh8YIkS8doIj1ZtOdczt+7PqBEUSu/8GXVcn2Z
 KvZ2a5N6gBu3mspfz7Tsf6T5gJLlSdH+jSZ2Ulvc6r6Jle3jNEas+oT2dIwuKAHMqWq+
 JwN0ZvW7QdaMmu9GPb+PMiWw56YUDpVvP77W1zOTTJZHfAGooOpYJBDbbldnlV34wx09
 KO4Rn5Iklq+4IfAMmpRD6i5gTGokqYgUKT2osm+Ujs4JQpWcvmWx4RWywPaQidnJdQ8/
 mp39aj56S7qASP8QMmifnuBSxZa5RJGQks1JKk575AyO1ZE6rDrio4QxenidQWUncLFV
 ZpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725894309; x=1726499109;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8TiCiXGjGkM50HrCJ48ImvFzfPR3kc82M1NadfAtzVQ=;
 b=QSMuDEIucVdfZUcLbPv60JulQ4PgE9b/b83wUm0f9NOdTLg+qQBYOAmUxft+iTvFOA
 LQPlMZLZOxjAdwQynQZOiJAEnGOUt2hw0fp85Q/dHSkRZQ9o0B1WO+3LblwRFa8qiNSh
 4Zpr/x2kLzhGb21Ec7qAx5IqjuhmW4fbX32YFM14Xvn4y8WmdwZKpiJFP0GVTgE/vWv6
 6iclsI/4Bqk2oSjKI+16fZSs8ZOGbvZgEKi2U9SViXOgz7TBPUp+jIo+VcV6y3CwZ32e
 u2kTAV5vhF+7ZUsiRxea5CrKFnj89+c4WNnwuSsugEHIQWSfg7mT7dpUl4hod1nGXQVI
 0mCQ==
X-Gm-Message-State: AOJu0YwBnMkX24eDt9bny88siWbdTUX4cpWleqzAMgcV5WAQsogTrJ5C
 kB4+oNDReM6wtSyqjqfHN862dG3nsxenWhiChwcUIAjWAmwIJm4KWktid3dpB4Q=
X-Google-Smtp-Source: AGHT+IFHJQdBUw7oQy7oucpY8PK8AZrRa6eEDv/jVPYJzhvEaupLhA+wOFkwfYt8pU99DRXnCcjeoQ==
X-Received: by 2002:a05:6402:35c1:b0:5c0:ad65:ebfa with SMTP id
 4fb4d7f45d1cf-5c3e94d3399mr8338718a12.0.1725894307888; 
 Mon, 09 Sep 2024 08:05:07 -0700 (PDT)
Received: from [192.168.178.49] ([212.86.51.89])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd8d9easm3059812a12.97.2024.09.09.08.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 08:05:07 -0700 (PDT)
Message-ID: <126dde73-c309-4fa2-80dd-d3ae4373a23d@suse.com>
Date: Mon, 9 Sep 2024 17:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cyril Hrubis <chrubis@suse.cz>, Andrea Cervesato <andrea.cervesato@suse.de>
References: <20240909-regen_shutup_lsp-v1-1-d65ad07b822f@suse.com>
 <Zt8C3wF_zgpBtrxC@yuki.lan>
Content-Language: en-US
In-Reply-To: <Zt8C3wF_zgpBtrxC@yuki.lan>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] Remove cleanup.c inclusion from syscalls
 generation
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!

On 9/9/24 16:14, Cyril Hrubis wrote:
> Hi!
>> Remove cleanup.c from syscalls.h as it is part of the old library and
>> its usage is discouraged. LSP(s) supporting C language correctly flag
>> this file as problematic. This patch ensures that the lapi/syscalls/regen.sh
>> script will no longer include cleanup.c, preventing unnecessary usage in
>> generated headers.
>>
>> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
>> ---
>>   include/lapi/syscalls/regen.sh | 6 ++++--
> Can we remove the cleanup.c as well? It does not seem to be used
> anywhere after this change.
Do we want to touch old library? I actually don't mind since we are 
going to remove everything there anyway, one day.
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/lapi/syscalls/regen.sh b/include/lapi/syscalls/regen.sh
>> index 97027e2f3..0dd3269bb 100755
>> --- a/include/lapi/syscalls/regen.sh
>> +++ b/include/lapi/syscalls/regen.sh
>> @@ -33,7 +33,6 @@ cat << EOF > "${output_pid}"
>>   #include <errno.h>
>>   #include <sys/syscall.h>
>>   #include <asm/unistd.h>
>> -#include "cleanup.c"
>>   
>>   #ifdef TST_TEST_H__
>>   #define TST_SYSCALL_BRK__(NR, SNR) ({ \\
>> @@ -41,8 +40,11 @@ cat << EOF > "${output_pid}"
>>   		"syscall(%d) " SNR " not supported on your arch", NR); \\
>>   })
>>   #else
>> +static void dummy_cleanup(void) __attribute__ ((unused));
> I do not think that we need this part, the function is always used
> because it's passed to the tst_brkm().
I actually had some warnings and that is needed unfortunately.
>> +static void dummy_cleanup(void) {}
>> +
>>   #define TST_SYSCALL_BRK__(NR, SNR) ({ \\
>> -	tst_brkm(TCONF, CLEANUP, \\
>> +	tst_brkm(TCONF, dummy_cleanup, \\
>>   		"syscall(%d) " SNR " not supported on your arch", NR); \\
>>   })
>>   #endif
>>
>> ---
>> base-commit: d3f1f93eda69905932bde4f66b44d72f9211909a
>> change-id: 20240909-regen_shutup_lsp-a35606a887b6
>>
>> Best regards,
>> -- 
>> Andrea Cervesato <andrea.cervesato@suse.com>
>>
>>
>> -- 
>> Mailing list info: https://lists.linux.it/listinfo/ltp
Andrea

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
