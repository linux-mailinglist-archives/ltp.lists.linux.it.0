Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EBF3E8ACA
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 09:09:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D01E3C5DCD
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 09:09:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A0DB03C29B4
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 09:09:35 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F1F2B600C2F
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 09:09:34 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 234A722152
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 07:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628665774;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gSiBbOeWDQ7eaPb0PI2fSB7IaE6fnTI5BR9roBK/boA=;
 b=MA5teehgVaqgHnzDWvjjWVBZJ6cPo4dVI3Ahnz9M7OeGG6sWPq9LbOGiv6gTLyJoYqf6Dz
 1astxb4IXwB9SqIaA1h6vI0UV4puubFJJgBJILSwTzyop2WygfK2gwX9uzHoCU+0vm7mo/
 HKTuFvXqBvqzXQz6YSL5uwRmxs0FDgA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628665774;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gSiBbOeWDQ7eaPb0PI2fSB7IaE6fnTI5BR9roBK/boA=;
 b=YeFvOtcKnA8N3fmuNDep/8unHGcK4gxNGOcnEG8DZMU40JwUWBNQuIGK7QXai2FbcA1pHQ
 a3rFVQhBkldV5lBg==
Received: from g78 (rpalethorpe.tcp.ovpn1.nue.suse.de [10.163.17.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id D6124A3B85;
 Wed, 11 Aug 2021 07:09:33 +0000 (UTC)
References: <20210806111938.12007-1-rpalethorpe@suse.com>
 <28d60c6e-f29b-e17b-a34c-31142e872e3f@suse.cz>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Martin Doucha <mdoucha@suse.cz>
In-reply-to: <28d60c6e-f29b-e17b-a34c-31142e872e3f@suse.cz>
Date: Wed, 11 Aug 2021 08:09:30 +0100
Message-ID: <87y298laol.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] setsockopt08: Handle ENOPROTOOPT even with
 compatible config
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Martin,

Martin Doucha <mdoucha@suse.cz> writes:

> Hi,
>
> On 06. 08. 21 13:19, Richard Palethorpe via ltp wrote:
>> One or more necessary modules can be missing even if they are present
>> in the config.
>> 
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>> ---
>>  .../kernel/syscalls/setsockopt/setsockopt08.c | 24 +++++++++++++++----
>>  1 file changed, 20 insertions(+), 4 deletions(-)
>> 
>> diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt08.c b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
>> index 33892f9b1..d3cd5b5b2 100644
>> --- a/testcases/kernel/syscalls/setsockopt/setsockopt08.c
>> +++ b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
>> @@ -110,6 +110,7 @@ void run(void)
>>  	struct xt_entry_target *xt_entry_tgt =
>>  		((struct xt_entry_target *) (&ipt_entry->elems[0] + match_size));
>>  	int fd = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
>> +	int result;
>>  
>>  	xt_entry_match->u.user.match_size = (u_int16_t)match_size;
>>  	strcpy(xt_entry_match->u.user.name, "state");
>> @@ -126,10 +127,25 @@ void run(void)
>>  	ipt_replace->num_counters = 1;
>>  	ipt_replace->size = ipt_entry->next_offset;
>>  
>> -	TST_EXP_FAIL(setsockopt(fd, IPPROTO_IP, IPT_SO_SET_REPLACE, buffer, 1),
>> -		     EINVAL,
>> -		     "setsockopt(%d, IPPROTO_IP, IPT_SO_SET_REPLACE, %p, 1)",
>> -		     fd, buffer);
>> +	errno = 0;
>> +	if (setsockopt(fd, IPPROTO_IP, IPT_SO_SET_REPLACE, buffer, 1) == -1) {
>> +		switch (errno) {
>> +		case EINVAL:
>> +			result = TPASS;
>> +			break;
>> +		case ENOPROTOOPT:
>> +			result = TCONF;
>> +			break;
>> +		default:
>> +			result = TFAIL;
>> +		}
>> +	} else {
>> +		result = TFAIL;
>> +	}
>> +
>> +	tst_res(result | TERRNO,
>> +		"setsockopt(%d, IPPROTO_IP, IPT_SO_SET_REPLACE, %p, 1)",
>> +		fd, buffer);
>>  
>>  	SAFE_CLOSE(fd);
>>  }
>
> I think it'd be better to call tst_brk(TCONF) when setsockopt() returns
> ENOPROTOOPT. The CVE runfile iterates the test 100 times and this error
> will not change between iterations.

Ah, yes, this is a mistake, I will reroll the patch.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
