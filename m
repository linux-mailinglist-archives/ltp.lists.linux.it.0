Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDC36EF0F3
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Apr 2023 11:19:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 911763CBB47
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Apr 2023 11:19:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E37DE3CBB60
 for <ltp@lists.linux.it>; Wed, 26 Apr 2023 11:19:25 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 56F4C60025B
 for <ltp@lists.linux.it>; Wed, 26 Apr 2023 11:19:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9472D1FDCD;
 Wed, 26 Apr 2023 09:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1682500763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=liB64bwTZLxXf95TezWP3RYRBSaFQ8yzz7iS1fweyhA=;
 b=qkQQswDBIK+pNAiveCwsUwCvb98fpMPRjdv8YubGzJv2dksd6Qumw4ECBpoxRkyYWG2LAK
 XLsBYR+BhdSQSF7xBQCe6gtS4xeriOpsqJGTvMcZI+qm9Ivz4ZpCoeqHwK6V00dZC8c9WM
 WjCqGOt1UTZuENxGC5UhqxNlM8j9pts=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1682500763;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=liB64bwTZLxXf95TezWP3RYRBSaFQ8yzz7iS1fweyhA=;
 b=hvtuVHZigz4+y2rzjv+mUKW0vSLn9IBc1pRf1pKuKGnrUUNI/eEwVHidPAzZVLI+SnTV4M
 4tHAutwXTFXXKhCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E90B138F0;
 Wed, 26 Apr 2023 09:19:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id itn6HZvsSGShNQAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Wed, 26 Apr 2023 09:19:23 +0000
Message-ID: <5caf6d8e-e58c-0cb4-bc46-1a0d8dc56190@suse.cz>
Date: Wed, 26 Apr 2023 11:19:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>
References: <20230421145746.5704-1-mdoucha@suse.cz> <ZEjcFS+yZewIinvL@rei>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <ZEjcFS+yZewIinvL@rei>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/5] KVM: Add helper functions for accessing
 GDT/LDT
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
Cc: ltp@lists.linux.it, nstange@suse.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 26. 04. 23 10:08, Cyril Hrubis wrote:
> Hi!
> I did have a look at the patchset and I do not see anything wrong, but I
> cannot really review the code without spending a weeks reading the AMD
> CPU manuals. What about sending v2 with the runtest file change and
> CCing the x86@kernel.org mailing list? Hopefully some of the kernel devs
> on that list will have a bit of time to check the actual correctness of
> the code...

I've CC'd Nicolai who wrote the original KVM tests. If he approves, I'd 
say it'd good enough to merge. I've tested the code on AMD machines and 
it works and successfully reproduces the CVE on affected kernels.

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
