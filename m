Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9770F52E85E
	for <lists+linux-ltp@lfdr.de>; Fri, 20 May 2022 11:08:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01AB23CAB0D
	for <lists+linux-ltp@lfdr.de>; Fri, 20 May 2022 11:08:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 019413C4DB3
 for <ltp@lists.linux.it>; Fri, 20 May 2022 11:08:42 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E87B5608A8F
 for <ltp@lists.linux.it>; Fri, 20 May 2022 11:08:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 41FCB21AA3;
 Fri, 20 May 2022 09:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1653037721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dUoXbksPG20Xuof9n9FaA/1SlwgKajKVKINgZrFdDo4=;
 b=v4KoVhzfbUzkPWD0zM6Tj07ZyDcm+x3gf2NdhweYhX9l/MPp7eje2OCF6fyFXKHvHHeQDE
 F7lgwiIXCx4LebiBChYpD/8cQdbdOAgOFD2iRsefTXGNgcH56IYoY4DmNFcHfADnu+UEuS
 Zqa+0HK8gab6LfQJgXPXyFvs2Scg4eo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1653037721;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dUoXbksPG20Xuof9n9FaA/1SlwgKajKVKINgZrFdDo4=;
 b=XJv2FyiZkk7SsbDmSCLtlhld1I4MPwebiDoxavLBQbMV2RRWd894p77sO8PQkJddxi+kBH
 8cs/Z9K/8mlojpBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2EDD613A5F;
 Fri, 20 May 2022 09:08:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id seprCplah2I2ZQAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Fri, 20 May 2022 09:08:41 +0000
Message-ID: <10ee5852-9302-22d7-832c-f581ef94c336@suse.cz>
Date: Fri, 20 May 2022 11:08:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Petr Vorel <pvorel@suse.cz>
References: <20220519121056.1181-1-mdoucha@suse.cz>
 <20220519121056.1181-2-mdoucha@suse.cz> <YodY7QOisdpaI3KK@pevik>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <YodY7QOisdpaI3KK@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] pty04: Fix cleanup
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

On 20. 05. 22 11:01, Petr Vorel wrote:
> BTW C API would deserve (after the release) TBROK on -i0, which is already
> implemented in shell API:
> df01 1 TBROK: Number of iterations (-i) must be > 0

I don't see why. Running pty07 with -i0 was actually quite helpful in
debugging this issue. If a test fails when executed with -i0, it needs
to be fixed.

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
