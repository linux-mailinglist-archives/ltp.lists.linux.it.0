Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D11F53B0759
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 16:25:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 885B73C9473
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 16:25:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5E6333C229E
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 16:25:04 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E0D081401113
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 16:25:03 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5E4BA1FD5D;
 Tue, 22 Jun 2021 14:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624371903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vTunMDmSdZtfUqxNm25SinLCbBRhUqj2Z4XQZQXGKNY=;
 b=htFvintxZgH0X8YnNEdqTSzuyCSYKntRc/540v/4ZeG/+7qHfi3Nr/Ds7gbhxkTvPvYHfA
 7t4XlCIAzDqu3ayj8KATJt/+k2or78UjwovJfgyAqqotsh+XHSc7+i4cYsgErxGs2odAHa
 /tnkzwLwQT3h5/nL70wof8pJDXvel+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624371903;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vTunMDmSdZtfUqxNm25SinLCbBRhUqj2Z4XQZQXGKNY=;
 b=q0mj4bWnXlu9YDzyGzsvPLucIhgt5ffb8mkRsWzDICCRmAR3xmyPB/CC4IcHO3cUuiH9MZ
 QcwpdkFlCARl5jDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 3BE50118DD;
 Tue, 22 Jun 2021 14:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624371903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vTunMDmSdZtfUqxNm25SinLCbBRhUqj2Z4XQZQXGKNY=;
 b=htFvintxZgH0X8YnNEdqTSzuyCSYKntRc/540v/4ZeG/+7qHfi3Nr/Ds7gbhxkTvPvYHfA
 7t4XlCIAzDqu3ayj8KATJt/+k2or78UjwovJfgyAqqotsh+XHSc7+i4cYsgErxGs2odAHa
 /tnkzwLwQT3h5/nL70wof8pJDXvel+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624371903;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vTunMDmSdZtfUqxNm25SinLCbBRhUqj2Z4XQZQXGKNY=;
 b=q0mj4bWnXlu9YDzyGzsvPLucIhgt5ffb8mkRsWzDICCRmAR3xmyPB/CC4IcHO3cUuiH9MZ
 QcwpdkFlCARl5jDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id PlJwDb/y0WCfWQAALh3uQQ
 (envelope-from <mdoucha@suse.cz>); Tue, 22 Jun 2021 14:25:03 +0000
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210615074045.23974-1-rpalethorpe@suse.com>
 <20210615074045.23974-3-rpalethorpe@suse.com> <YMirQoiYRYsDP7Sb@yuki>
 <87czsk51fc.fsf@suse.de> <1e7ecce7-2e46-ea46-3c5b-357d53a238c3@suse.cz>
 <YNHoS1L+0toUtAWT@yuki>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <3dfda1bd-3829-7188-6add-e1755e91df4f@suse.cz>
Date: Tue, 22 Jun 2021 16:25:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNHoS1L+0toUtAWT@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/3] API: Remove TST_ERR usage from
 rtnetlink/netdevice
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

On 22. 06. 21 15:40, Cyril Hrubis wrote:
> Hi!
>>> The test author is guaranteed that the library will not set TST_ERR
>>> except via the TEST macro and similar.
>>
>> Hi, who decided to guarantee this and where is the guarantee documented?

Guaranteeing that TST_RET and TST_ERR will not be modified makes sense
for SAFE_SYSCALL()s because they will be used extensively throughout
test code. But the case is not so clear for primarily setup()/cleanup()
functions like the af_alg, rtnetlink and netdevice libraries. And note
that the rtnetlink library allows you to check ACKs manually without
calling the two functions which will modify TST_ERR.

So again, where is the extent of this guarantee documented? I haven't
found any mention of it in the doc/ dir and Richie didn't add any docs
changes in his patchset either. Documenting this is necessary for both
test writers and library maintainers.

>> Changing the return value to always return errno will be a major PITA
>> because 95% of error handling happens after some safe_syscall() which
>> clobbers errno by calling tst_brk() after failure. And if you only want
>> to return error codes from rtnetlink ACK messages, then there's the
>> problem what to return when a safe_syscall() fails during cleanup().
> 
> For the current code it would be as easy as:

That code will only result in RTNL_SEND_VALIDATE() always returning 0
regardless of success or failure, except when tst_brk() terminates the
whole program.

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
