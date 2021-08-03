Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D21BF3DF264
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 18:22:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B64E3C87E7
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 18:22:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CC0423C30B0
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 18:22:07 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 34B6314010C9
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 18:22:06 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 582C820056;
 Tue,  3 Aug 2021 16:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628007726;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ncufLCyZ0VAgi7Z70nTPAUjMMoD2W5HHzflpwna1bNY=;
 b=DuFbBqC18a8JylObz5TF/J2sW1lzl9MYRY+VzPGmFg+psFUodmKZOvlz4Vr/Smz4WS/6RH
 qZXyBgX+pCtG0YrE/HSD74T9M9qdiX9mHQ+4AqubGRGKFLJgejWwtRNDMCzQeufTa1fZ/U
 WUywzCWK/KQj1qc4dtWCNckHlX7ETeI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628007726;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ncufLCyZ0VAgi7Z70nTPAUjMMoD2W5HHzflpwna1bNY=;
 b=H2DMguBJ8xuIMbLxKW9SVm0CZ8wOzLCxYhgOkVHLzl4IryLIsEBSBt5zZyb9nk5Jh7XW3W
 cFQJqjj2nqUvWADw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 1CC3113B74;
 Tue,  3 Aug 2021 16:22:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id +yZJBC5tCWERBwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 03 Aug 2021 16:22:06 +0000
Date: Tue, 3 Aug 2021 18:22:04 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>, ltp@lists.linux.it
Message-ID: <YQltLFTp3mRPqjQR@pevik>
References: <20210714140716.1568-1-pvorel@suse.cz>
 <20210714140716.1568-3-pvorel@suse.cz>
 <57d4c109-d01a-2c7f-39c7-41013e70abf9@bell-sw.com>
 <YQBD4w2nKwY2G1l+@pevik>
 <b0638d98-88d5-76d7-78a1-631c801d88ad@bell-sw.com>
 <YQg0LIXG8LK0OV74@pevik>
 <80a6cbec-50b7-9912-d682-915a1076bbec@bell-sw.com>
 <YQliykiyDtJwEKVK@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQliykiyDtJwEKVK@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,LOTS_OF_MONEY,MONEY_NOHTML,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] broken_ip: TCONF when test run on unsupported
 protocol
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey,

> --- testcases/network/stress/broken_ip/broken_ip-checksum
> +++ testcases/network/stress/broken_ip/broken_ip-checksum
> @@ -10,7 +10,10 @@ TST_TESTFUNC="do_test"

>  do_test()
>  {
> -	tst_res TINFO "Sending ICMPv$TST_IPVER with wrong chksum field for $NS_DURATION sec"
> +	TST_IPV6=
> +	TST_IPVER=4
> +
> +	tst_res TINFO "Sending ICMPv4 with wrong chksum field for $NS_DURATION sec"
>  	tst_icmp -t $NS_DURATION -s "0 100 500 1000 $NS_ICMP_SENDER_DATA_MAXSIZE" -c
>  	tst_ping
>  }

FYI merged commit which implements this.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
