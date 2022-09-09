Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDC95B3B10
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Sep 2022 16:49:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A0983CAA6F
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Sep 2022 16:49:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3E4523CA598
 for <ltp@lists.linux.it>; Fri,  9 Sep 2022 16:49:09 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C0933600F57
 for <ltp@lists.linux.it>; Fri,  9 Sep 2022 16:49:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 24C2E228A3;
 Fri,  9 Sep 2022 14:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1662734948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pk0IGPgS+p1qSEczH81oNGHMDuhK3CK6Qhak4KafOi0=;
 b=oVs2pJbEoys6kC+aLEGqS5DmE6ujk0NBJH4yc0JOAZwStwCkN4GvopFe5XGX2ubGXbNf8E
 urZyP+6tV14gD5oTkIfkCJ7comdFHoQQ9+zPf9XYirMbEL5klhi/3ukrbLKRZucqeOmbG3
 9AI8kUQXfgYLb6UK9IXcbgXg10UrkFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1662734948;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pk0IGPgS+p1qSEczH81oNGHMDuhK3CK6Qhak4KafOi0=;
 b=5mdWVSgQ0KRR8+ZIBA4P9Bja8c93MdevUK10ip20FDHNXPQZYU1mK1DaOf+Ur98Kgj6en6
 DGoOuJRchY5e9KDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1373B13A93;
 Fri,  9 Sep 2022 14:49:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GYDWA2RSG2PMYwAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Fri, 09 Sep 2022 14:49:08 +0000
Message-ID: <5aae1278-8c6c-febf-7ee3-fe5e508ffdd1@suse.cz>
Date: Fri, 9 Sep 2022 16:49:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Petr Vorel <pvorel@suse.cz>
References: <20220902133710.1785-1-pvorel@suse.cz>
 <20220902133710.1785-5-pvorel@suse.cz> <YxsKz9j1mVHIhcfw@yuki>
 <Yxsbtrcv+FEMvBfH@pevik> <Yxsgg8f7vOFdXV3q@yuki> <YxskoojodIaNuI6G@pevik>
 <70df29e7-0097-c698-b6ba-e3f87da3893f@suse.cz> <YxtMFw25BfJaEsji@pevik>
 <5e01e854-7cc6-7b08-d1f8-7f0709fbc07d@suse.cz> <YxtR/1NJIabAqd5V@pevik>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <YxtR/1NJIabAqd5V@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/9] tst_supported_fs: Support skip list when
 query single fs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 09. 09. 22 16:47, Petr Vorel wrote:
>> One more thing, the skiplist check should be done before availability check.
>> It's faster and it'll save you work when you're trying to fix tests that
>> shouldn't be skipped.
> Good point. I guess you mean just to reverse order in
> tst_fs_is_supported_skiplist(), right?

Exactly.

> +++ lib/tst_supported_fs_types.c
> @@ -137,17 +137,10 @@ enum tst_fs_impl tst_fs_is_supported(const char *fs_type)
>   enum tst_fs_impl tst_fs_is_supported_skiplist(const char *fs_type, const char
>   					      *const *skiplist)
>   {
> -	int ret;
> -
> -	ret = tst_fs_is_supported(fs_type);
> -
> -	if (!ret)
> -		return ret;
> -
>   	if (tst_fs_in_skiplist(fs_type, skiplist))
>   		return TST_FS_UNSUPPORTED;
>   
> -	return ret;
> +	return tst_fs_is_supported(fs_type);
>   }
>   
>   const char **tst_get_supported_fs_types(const char *const *skiplist)

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
