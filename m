Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A59040DB95
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Sep 2021 15:44:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 155263C897F
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Sep 2021 15:44:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2F47E3C1D7D
 for <ltp@lists.linux.it>; Thu, 16 Sep 2021 15:44:20 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A52831400537
 for <ltp@lists.linux.it>; Thu, 16 Sep 2021 15:44:19 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0967520230;
 Thu, 16 Sep 2021 13:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631799859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lj92ni2T0ekozxYtVmrHVHAsq6knre0JC6F30n/DNJE=;
 b=0eOO0g5JhupyjpW7aYNVjWHyT/bYB/WsLB6qG9AXZcKyiVPd7JDU31h2oVxlAp+kLZL0Be
 Z47cgANUfXEu31Xftsm5gohxHMOFCw8ykWEXyh2Zr9SnizFupbCo6jzbkGqzfmlvpy5GFk
 4dML/bu/kSk+nwBGqrE6yVLImwk8+Vc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631799859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lj92ni2T0ekozxYtVmrHVHAsq6knre0JC6F30n/DNJE=;
 b=kLdxMa6IwEuGDO2n47DhBGkISnPmw82+lFMnhYHep20ZhiqMRc/qaWMs9SCWfkmvd/JHKS
 JZLzUY+vmR0sM8Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E83FE13480;
 Thu, 16 Sep 2021 13:44:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rBOBNzJKQ2EVbgAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Thu, 16 Sep 2021 13:44:18 +0000
Message-ID: <dc4129ec-afe5-3d97-ff1d-326a217a63ad@suse.cz>
Date: Thu, 16 Sep 2021 15:44:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210915134505.22771-1-mdoucha@suse.cz>
 <20210915134505.22771-4-mdoucha@suse.cz> <YUM+76XsQB57U3rE@yuki>
 <1973857f-53fd-6f16-1f7d-d65a371f9c60@suse.cz> <YUNJ2yuO7UAylQNk@yuki>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <YUNJ2yuO7UAylQNk@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4] syscalls/utime03: Convert to new API
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

On 16. 09. 21 15:42, Cyril Hrubis wrote:
> Hi!
>>>> +	mintime = time(0);
>>>> +	TST_EXP_PASS(utime(TEMP_FILE, NULL));
>>>> +	maxtime = time(0);
>>>
>>> I wonder if this suffers the problem as the ipc timestamps:
>>>
>>> https://github.com/linux-test-project/ltp/commit/d37bde3defa12556ba7399f4131996f8e490490a
>>
>> Possibly. Let's find out, we can always fix the test in the next release.
> 
> I guess that it would also depend on a underlying filesystem and how
> timestamps are rounded in there, so I guess that we should turn on the
> .all_filesystems flag for the test as well. What do you think?

That sounds like a good idea.

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
