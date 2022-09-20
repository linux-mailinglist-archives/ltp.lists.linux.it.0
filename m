Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A995BE7E7
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Sep 2022 16:04:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E975B3CAD44
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Sep 2022 16:04:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3C1003CACFF
 for <ltp@lists.linux.it>; Tue, 20 Sep 2022 16:04:02 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 219BD6002A9
 for <ltp@lists.linux.it>; Tue, 20 Sep 2022 16:04:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1EFFC1F8A3;
 Tue, 20 Sep 2022 14:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663682641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AQ9FUsXs/xoJT8zzG5OT38VaulRW1r2bo0qtmpA9S1o=;
 b=gyOYhjZRGnosocuQM0QNehnv+sqqIBc3ZJgpCTVWyXhac1UYPz6tr3+wQLkL+vkGfkhrNq
 tqjGBdCHgceRhpCcEEwnbbsa1EdMmLQwMQx9+y3yiwQQtyEsy4R2aVJTApV4eobsoVXHuI
 zsoqT0i4+1U1b1hB3p9QQKNHAAC3DXE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663682641;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AQ9FUsXs/xoJT8zzG5OT38VaulRW1r2bo0qtmpA9S1o=;
 b=oSgX/9X9RmxHemfA6aTeKIOqpr8wdQTgDVm1CDwsSC+KHPTydYlDxZJhSReKhS5tUI4Rd6
 UButJv4a7YKCxNCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 093E21346B;
 Tue, 20 Sep 2022 14:04:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qV4WAVHIKWPiCgAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Tue, 20 Sep 2022 14:04:01 +0000
Message-ID: <f36b4bd0-83b6-071b-e5d4-b274b2691e9a@suse.cz>
Date: Tue, 20 Sep 2022 16:04:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
References: <20220704114523.10409-1-mdoucha@suse.cz>
 <62C560D5.7080209@fujitsu.com>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <62C560D5.7080209@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] msgget03: Set custom queue limit
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 06. 07. 22 11:14, xuyang2018.jy@fujitsu.com wrote:
> Hi Martin
> 
> I don't have objection for this patch.
> 
> But I think using system custom max value is more meaningful. How about
> setting timeout to 5min, I think it is enough.

The system max value is an arbitrary number that can be increased up to 
complete memory exhaustion. There's not much difference between checking 
the ENOSPC error quickly with low custom limit and running the test for 
2 minutes with the default limit.

> Also shmget03 uses same logic, so I guess we need to modify it too.

shmget03 is significantly faster on all archs, there's no risk of 
timeout at the moment.

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
