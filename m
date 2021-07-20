Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 964333CF9B0
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 14:36:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 667103C6CBA
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 14:36:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 92F6C3C6BE2
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 14:36:12 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 03DBE2009B2
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 14:36:11 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 758A4202DB;
 Tue, 20 Jul 2021 12:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626784571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yL/5YKU0V7uCxr24K+zn3ieR5zJQXZcT79myyZRRPQ8=;
 b=NS/qd6Vy9+A0fIhc5WNJdz25DC16hlV28GcLO2Qt0It1DpfnMN3mkvoxWj23hC1OL+jXZO
 3BHeBYPzXOeksfGSDv/eUFV0r2mtGHFnBVjRBsjCw2rKchcIS256HSyH5Re27ydFT7ezdM
 pOpptZzojc2vdfsXO1OFoap/d+VtNpg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626784571;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yL/5YKU0V7uCxr24K+zn3ieR5zJQXZcT79myyZRRPQ8=;
 b=BCWFXiLjk+A3WgoRpHfGU0ZgFJj9hUXwei0TbbTs6c88G9bzt1Y2tr6UuKeytBWcv4U+L5
 1DCDrDhg3g8F5cDQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 5D08613AB8;
 Tue, 20 Jul 2021 12:36:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id cB4RFTvD9mBrYQAAGKfGzw
 (envelope-from <mdoucha@suse.cz>); Tue, 20 Jul 2021 12:36:11 +0000
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210720103941.9767-1-mdoucha@suse.cz>
 <20210720103941.9767-3-mdoucha@suse.cz> <YPa7bSB8pNPrBDn8@yuki>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <e6033278-8e27-eed5-5f36-1dd09e68bf5a@suse.cz>
Date: Tue, 20 Jul 2021 14:36:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPa7bSB8pNPrBDn8@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] Add lockdown checks to init_module* and
 finit_module* tests
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

On 20. 07. 21 14:02, Cyril Hrubis wrote:
> Hi!
>> +static void lockdown_setup(struct tcase *tc)
>> +{
>> +	if (kernel_lockdown)
>> +		tc->exp_errno = EPERM;
>> +}
>> +
>>  static struct tcase tcases[] = {
>>  	{"invalid-fd", &fd_invalid, "", O_RDONLY | O_CLOEXEC, 0, 0, 0, bad_fd_setup},
>>  	{"zero-fd", &fd_zero, "", O_RDONLY | O_CLOEXEC, 0, 0, EINVAL, NULL},
>> -	{"null-param", &fd, NULL, O_RDONLY | O_CLOEXEC, 0, 0, EFAULT, NULL},
>> -	{"invalid-param", &fd, "status=invalid", O_RDONLY | O_CLOEXEC, 0, 0, EINVAL, NULL},
>> +	{"null-param", &fd, NULL, O_RDONLY | O_CLOEXEC, 0, 0, EFAULT,
>> +		lockdown_setup},
>> +	{"invalid-param", &fd, "status=invalid", O_RDONLY | O_CLOEXEC, 0, 0,
>> +		EINVAL, lockdown_setup},
>>  	{"invalid-flags", &fd, "", O_RDONLY | O_CLOEXEC, -1, 0, EINVAL, NULL},
>>  	{"no-perm", &fd, "", O_RDONLY | O_CLOEXEC, 0, 1, EPERM, NULL},
>>  	{"module-exists", &fd, "", O_RDONLY | O_CLOEXEC, 0, 0, EEXIST, NULL},
> 
> I'm slightly afraid that the order of checks may change over the time
> and we will get EPERM in all these cases, but maybe I'm just overly
> cautious. Other than this the code looks good.

I don't think we need to worry about that. With root privileges, the
EPERM error is returned when a kernel module does not have a valid
signature. How would something that is not even a valid kernel module in
the first place fail that check?

The only subtests that actually try to load a valid kernel module are
null-param, invalid-param and module-exists. All three of them now
handle lockdown correctly.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
