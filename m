Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6176A401B4E
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 14:40:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 835493C9780
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 14:40:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A235A3C25E9
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 14:40:13 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B201B60084E
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 14:40:12 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 07AAB1FEF2;
 Mon,  6 Sep 2021 12:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630932012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XI6+hnOwLqPalQpsb9/49TDest25D0uKooCinjcX91Q=;
 b=abxSfZ2WUHoLtjeqUdW0d5AEfiNNxMrZFRK6wELVsgwi0P/VMxvG5r3IVqaB+KP1tlhROa
 EhhjZTHIODZI0MhHigafHyrW4XzES8PIt1yiN088kAKQSc4NLinwkJTAOU8tXf8+skYbn9
 7Vql08Caoke2Y7r4qleWbjwoXvWD0qg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630932012;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XI6+hnOwLqPalQpsb9/49TDest25D0uKooCinjcX91Q=;
 b=yTIfnBDWIB2SFC5ZhaRz8C1YN1Px5LCmYCpR9KfJ3HYhabMHJjFOMWYPPiG7GrS0CKleU/
 RkniohVmkVheDMBg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id E8B4F1396D;
 Mon,  6 Sep 2021 12:40:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id ZaG3NysMNmFbNAAAGKfGzw
 (envelope-from <mdoucha@suse.cz>); Mon, 06 Sep 2021 12:40:11 +0000
Message-ID: <528952e4-bebf-617e-4d3f-0aea39797584@suse.cz>
Date: Mon, 6 Sep 2021 14:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210903154848.18705-1-mdoucha@suse.cz>
 <20210903154848.18705-4-mdoucha@suse.cz> <YTYH4DdeUqsYeglK@yuki>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <YTYH4DdeUqsYeglK@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/7] Add user/group ID lookup helper functions
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

On 06. 09. 21 14:21, Cyril Hrubis wrote:
> Hi!
>> +	if (!ret) {
>> +		if (errno) {
>> +			tst_brk_(file, lineno, TBROK | TERRNO,
>> +				"getpwent() failed");
>> +		} else {
>> +			tst_brk_(file, lineno, TBROK,
>> +				"getpwent() failed: end of file");
>> +		}
> 
> I'm not sure if "no more users in the /etc/passwd" should be reported as
> an error.

The alternative would be that pretty much every test that calls
SAFE_GETPWENT() in setup() will need to check for NULL and explicitly
call tst_brk(). I don't see any use for allowing SAFE_GETPWENT() to
return NULL outside cleanup().

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
