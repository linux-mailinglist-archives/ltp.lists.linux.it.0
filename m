Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CC66A3B18DE
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 13:27:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9DF443C6FD9
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 13:27:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 515EE3C2E72
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 13:27:45 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C3601600A51
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 13:27:44 +0200 (CEST)
Received: from mail-ed1-f70.google.com ([209.85.208.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lw12l-0004RG-Ay
 for ltp@lists.linux.it; Wed, 23 Jun 2021 11:27:43 +0000
Received: by mail-ed1-f70.google.com with SMTP id
 r15-20020aa7da0f0000b02903946a530334so1107703eds.22
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 04:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xsq1nUQH9tnbBfC4JG0cxakrv4EeA7wp3wFPUFZ0id8=;
 b=NP5G9eZKCgV5B87DKgO/4zANH85uhJb9+6QDzbxqkCLedcYAOk84GC3192xz0DLIkP
 GWwYXcgwtWKHcCQcvi887iffv78CY17kib1CeFIpL4rshT9dbCUkmp7IF6I43jNh8d/c
 KtGb/cOpdbwiIusr8OQoyB2YivCu12Nz8lcRpO1pyURHuJS9O2+yaz1ThOx4zlz0I8Lm
 dcV2UC6MN3RFAMKFrbpZBWwS2blik3XTa5VLzixxGmseWvc/rU0FDKXve0FWY7CaZsUk
 nY6HAsXPxdJkmzXroxleKIC742voF+Xw/seeb3X5zYb80dEOk15r/HutLpAsGt182hCa
 zg8A==
X-Gm-Message-State: AOAM532QXTZWR8WPPoH0Y8FynjR32WvR9OphiP9484LVkgun4zPpp38q
 +WAPsOf0/56WwtFaJx7WaMlrpfxOLWKJk9hm2ENBP1Y7KL1d4+mhzveH2CNXE8XtpIhiWT0QJCO
 uv3fKqPCYgBk/muraUPE97nP6ohuX
X-Received: by 2002:aa7:d707:: with SMTP id t7mr11623006edq.11.1624447662782; 
 Wed, 23 Jun 2021 04:27:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxExJwZRdSa0QgFvqyB1gAyK5y3u+lfZUzkGBKjxPis5ybxM7dydQWqEt5HRtK1oHiycDc/vQ==
X-Received: by 2002:aa7:d707:: with SMTP id t7mr11622996edq.11.1624447662602; 
 Wed, 23 Jun 2021 04:27:42 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id gz17sm883951ejc.91.2021.06.23.04.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 04:27:42 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210622111440.74722-1-krzysztof.kozlowski@canonical.com>
 <YNMOr/9X8J3NaAMZ@yuki>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <7e086a3e-afd5-7b54-e04f-2db7893f3778@canonical.com>
Date: Wed, 23 Jun 2021 13:27:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YNMOr/9X8J3NaAMZ@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/msgstress03: fix fork failure on
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

On 23/06/2021 12:36, Cyril Hrubis wrote:
> Hi!
>> +/*
>> + * Get the effective session UID - either one invoking current test via sudo
>> + * or the real UID.
>> + */
>> +int get_session_uid(void)
>> +{
>> +	const char *sudo_uid;
>> +
>> +	sudo_uid = getenv("SUDO_UID");
>> +	if (sudo_uid) {
>> +		int real_uid;
>> +
>> +		TEST(sscanf(sudo_uid, "%u", &real_uid));
>> +		if (TEST_RETURN != 1) {
>> +#ifdef DEBUG
>> +			tst_resm(TINFO, "No SUDO_UID from env");
>> +#endif
>> +		} else {
>> +			return real_uid;
>> +		}
>> +	}
>> +
>> +	return getuid();
>> +}
>> +
>>  /*
>>   * rm_shm() - removes a shared memory segment.
>>   */
>> @@ -218,3 +243,36 @@ int get_max_msgqueues(void)
>>  	fclose(f);
>>  	return atoi(buff);
>>  }
>> +
>> +/*
>> + * Get the limit of processes for current session configured by systemd user.slice.
>> + * This also applies to root user.
>> + */
>> +int get_pids_limit(void)
>> +{
>> +	int real_uid, ret;
>> +	char path[PATH_MAX];
>> +	long unsigned int max_pids;
>> +
>> +	real_uid = get_session_uid();
>> +	if (TEST_RETURN != 1) {
>> +		tst_resm(TINFO, "Cannot get UID");
>> +		return -1;
>> +	}
>> +
>> +	ret = snprintf(path, sizeof(path),
>> +		       "/sys/fs/cgroup/pids/user.slice/user-%d.slice/pids.max",
>> +		       real_uid);
>> +	if (ret < 0 || (size_t)ret >= sizeof(path))
>> +		return -1;
>> +
>> +	if (access(path, R_OK) != 0) {
>> +		tst_resm(TINFO, "Cannot read session user limits from '%s'", path);
>> +		return -1;
>> +	}
>> +
>> +	SAFE_FILE_SCANF(cleanup, path, "%lu", &max_pids);
>> +	tst_resm(TINFO, "Found limit of processes %lu (from %s)", max_pids, path);
>> +
>> +	return max_pids;
>> +}
> 
> This is quite generic functionality so we may as well put it into the
> include/tst_pid.h and lib/tst_pid.c as tst_get_pids_limit().

Sure, I can move it there.

> And we do already have tst_get_free_pids_() in there so we can substract
> that as well if applicable to make it a bit more precise.

I can just merge the code into tst_get_free_pids_(). It's basically the
same purpose - how many processes can we have more.

> 
> Also I think that it may make sense to put the part that substract some
> constant to leave room for the rest of the system to the library as
> well. There is no point in having this heuristic in each test.

Or pass it as argument to the tst_get_pids_limit()?


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
