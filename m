Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 391AA404853
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Sep 2021 12:19:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DBCB23C8EDB
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Sep 2021 12:19:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DCDE83C21F5
 for <ltp@lists.linux.it>; Thu,  9 Sep 2021 12:19:53 +0200 (CEST)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 890BA601E7C
 for <ltp@lists.linux.it>; Thu,  9 Sep 2021 12:19:52 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1ED6D3F302
 for <ltp@lists.linux.it>; Thu,  9 Sep 2021 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631182788;
 bh=usWlcnqGegPQQei+FQBhc13OX2xP7GetkvX/6GixQUQ=;
 h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=LdLL9oyrbTHdrZVpk+8AQ6PbD7OV32J5D3viyBbtXu0DmXJqOJpO87gEYLsjl9STV
 3LitETp4Ee3Wf1sE+Uw/iadSsOBzUhN9CvpdjLps+2XaQpPd5K4Ftsji8Bwz1K/7n+
 gPhzn1T1/kC7YNafJBA/V1XZYSgKunvA71mozaWwNIMSLBzUKuCTw2ROG4lpbjcyK7
 xX4cj4aQTtaS+CQ89xUNPLLKGOJC0z17j8R6fp7RAGDJafR00w2OVky3wsSmTuf8tj
 NIuiwuPjCTWr5jBv4bWRFhYuKDGUnZy0LnJI0Jr5tUbIZ2bH7GNLIuZiD+W0foF2So
 GUu7vxWbdBH2g==
Received: by mail-wm1-f71.google.com with SMTP id
 c4-20020a1c9a04000000b002e864b7edd1so578138wme.6
 for <ltp@lists.linux.it>; Thu, 09 Sep 2021 03:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=usWlcnqGegPQQei+FQBhc13OX2xP7GetkvX/6GixQUQ=;
 b=rWtqgRWjF/tnw9oaT5EF98gcVNHf1l0meH0uHtvci0i2YQ13fh9AyjHMrBf874NF3s
 Hjcohnw8oNY8luUj5USTW+eSoC2OqsTRqxOpv+0oXQ3NfB+WEg0EDfQ0Y0PeSzinAKxF
 ZEynY6J3NNjW+zB+KyQPk+uqquVdGD2BTlVyXx1bQD47Dl4nmQSF90DgNaagN887Sf5p
 TcOoIr3LyutoTayHXjMwwaROaTTE120l0+F4WO8ujmZzEeXGJZzK06Y9wLoqN6ELpxFB
 AtYJ7mIJwQjFF0ZRaQFR0KtpqsGSPBkq1YIRaxWB9Tz+pz1ncU1EWaHIB2vhq7mAPdKa
 T4UA==
X-Gm-Message-State: AOAM533D8l3K6tCC7FHyHsvKZTYtU9smA4wumVcZzFcBoZ2pHl49Zms/
 WVgl/c4xzZfshrP+CLOTWLKevdrrc+Uta/8O09dHC4RgwbbuXaVdkapkoQZwW9oWacm67wYv8qx
 OSmPmsUHVcMrAgaYRSthGEuJEvqZn
X-Received: by 2002:a7b:c20f:: with SMTP id x15mr2112126wmi.143.1631182787157; 
 Thu, 09 Sep 2021 03:19:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwixYiUZrI5GIXZQQwY/GVXCIMLtYtNShgH/s07Rny+ouusCIS3JMv+rRafl/w/Vor02uTbg==
X-Received: by 2002:a7b:c20f:: with SMTP id x15mr2112111wmi.143.1631182786972; 
 Thu, 09 Sep 2021 03:19:46 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.90])
 by smtp.gmail.com with ESMTPSA id n4sm1096616wme.31.2021.09.09.03.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 03:19:46 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210720150520.17612-1-krzysztof.kozlowski@canonical.com>
 <YTjTAG4bFHce9QTu@yuki>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <bf3e06a6-08f2-37d4-1104-d0b5f5621bdf@canonical.com>
Date: Thu, 9 Sep 2021 12:19:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTjTAG4bFHce9QTu@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers: detect previous test failure on
 cgroup mounts
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

On 08/09/2021 17:13, Cyril Hrubis wrote:
> Hi!
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../kernel/controllers/cgroup_fj/cgroup_fj_common.sh   |  4 ++--
>>  .../controllers/memcg/control/memcg_control_test.sh    | 10 ++++++----
>>  .../controllers/memcg/stress/memcg_stress_test.sh      |  8 ++++----
>>  3 files changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/testcases/kernel/controllers/cgroup_fj/cgroup_fj_common.sh b/testcases/kernel/controllers/cgroup_fj/cgroup_fj_common.sh
>> index 5594fe9de426..53ab637e8910 100755
>> --- a/testcases/kernel/controllers/cgroup_fj/cgroup_fj_common.sh
>> +++ b/testcases/kernel/controllers/cgroup_fj/cgroup_fj_common.sh
>> @@ -123,10 +123,10 @@ cleanup()
>>      fi
>>  
>>      if grep -q "$mount_point" /proc/mounts; then
>> -        umount "$mount_point"
>> +        EXPECT_PASS umount "$mount_point"
>>      fi
>>  
>>      if [ -e "$mount_point" ]; then
>> -        rmdir "$mount_point"
>> +        EXPECT_PASS rmdir "$mount_point"
>>      fi
>>  }
>> diff --git a/testcases/kernel/controllers/memcg/control/memcg_control_test.sh b/testcases/kernel/controllers/memcg/control/memcg_control_test.sh
>> index 4d9f1bb5d586..626f5e676831 100644
>> --- a/testcases/kernel/controllers/memcg/control/memcg_control_test.sh
>> +++ b/testcases/kernel/controllers/memcg/control/memcg_control_test.sh
>> @@ -53,6 +53,8 @@ STATUS_PIPE="$TMP/status_pipe"
>>  PASS=0
>>  FAIL=1
>>  
>> +. test.sh
> 
> We cannot casually include the test.sh in testcases that does not use
> the shell library as that will change the behavior of the tst_ commands.
> 
> Due to historicall reason we have two sets of tst_resm/tst_brkm/..., one
> set are actuall binaries with the tst_foo name and the second set is
> provided by the test.sh library. It's unfortunate but the binary
> commands are still used in a few places and it's hard to even find out
> where, since we have to look for shell scripts that does not source
> (even indirectly test.sh) but use the tst_resm interfaces.
> 
> So unless you have reviewed the test carefully and made sure that it
> works well with the test.sh library this will possibly introduce subtle
> breakage.

I tested the change but I think I did not review it in mentioned aspect.

> 
> The changes in the other two shell scripts looks good.
> 

I'll send a v2 with a reduced scope of changes.


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
