Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A459D3EEB09
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 12:33:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3459D3C57BC
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 12:33:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1389E3C2304
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 12:33:25 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6A14F1000A57
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 12:33:25 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 80A231FF2C;
 Tue, 17 Aug 2021 10:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629196404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3qyKplVmv16zEbgkRyxGI7q1Op7gbvdUwqFlOu4g5Q=;
 b=hjNDrnOhaASk551veAr8DlD99Y5bDl3EyRImjnI8O7WgyMex5tHYWm8BxRQ7IRJo3wyscr
 GzOENWlriT2Ku5xmgtxTuXmf2nIgUkNu83x9AeaZHJWe6WCL0mIyVxJIMClMgmyYHUjK9I
 hRle6rtzHbNgfJ+o7Hh0GZz5JCEyy8I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629196404;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3qyKplVmv16zEbgkRyxGI7q1Op7gbvdUwqFlOu4g5Q=;
 b=s/9wcHF+d0pYbpdo0PeL+9Kn7CUXQm+TTSIFPreFGtQiPd/8A6Vx3BI2AeCKRvNCsnZBHD
 F8WJxUKkbzqYVSBA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 6D2FC13318;
 Tue, 17 Aug 2021 10:33:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 4MSBGXSQG2ECGAAAGKfGzw
 (envelope-from <mdoucha@suse.cz>); Tue, 17 Aug 2021 10:33:24 +0000
To: rpalethorpe@suse.de
References: <20210806154557.19551-1-mdoucha@suse.cz>
 <20210806154557.19551-3-mdoucha@suse.cz> <87sfz8l68q.fsf@suse.de>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <f1b416ce-cacf-55be-a7cd-bcff821d0ec7@suse.cz>
Date: Tue, 17 Aug 2021 12:33:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87sfz8l68q.fsf@suse.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] Add test for CVE 2018-13405
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

On 17. 08. 21 12:23, Richard Palethorpe wrote:
> Hello Martin,
> 
> Martin Doucha <mdoucha@suse.cz> writes:
>> +static void setup(void)
>> +{
>> +	struct stat buf;
>> +	struct passwd *ltpuser = SAFE_GETPWNAM("nobody");
>> +	struct group *ltpgroup = SAFE_GETGRNAM("bin");
> 
> These might not exist on some systems. I think you can just pick
> arbitrary UID/GID numbers instead. No need to check the user/group
> databases.

I'm planning to rewrite this test after the first two patches get
merged. See previous discussion under the creat08 patch.


>> +static void cleanup(void)
>> +{
>> +	SAFE_SETREUID(-1, orig_uid);
> 
> Why are you doing this? I am assuming the temp dir will be deleted by
> the parent process.

That assumption is incorrect.

https://github.com/linux-test-project/ltp/commit/3833d44a2ba3773359d3b35a2108af691d75b4f9

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
