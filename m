Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB17D5A7E09
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Aug 2022 14:54:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3F7C3CA6D5
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Aug 2022 14:54:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DFC8D3C1351
 for <ltp@lists.linux.it>; Wed, 31 Aug 2022 14:54:05 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 00CCE600819
 for <ltp@lists.linux.it>; Wed, 31 Aug 2022 14:54:04 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 12C9821E77;
 Wed, 31 Aug 2022 12:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1661950443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+IrQEoxOw9h3kJDJCCe/3rAW1COCRrZvXBZ6Zhgu8pE=;
 b=kE5oFgwddvhZXiRvB+hM+F4AcexH6eqHVqLbkaKh5/mWxdLPnRTvVt0Vo1L3q4Xd1NR8W0
 c7oFdYrxBuAt7eVjaJfXhfvWQZS+l2baq58WCad0fnbDjnMCIFR8vRLbmvxSXYeKEJPCiK
 Da9VIWgvkImLRfKcXwsVXe23NM9xmwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1661950443;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+IrQEoxOw9h3kJDJCCe/3rAW1COCRrZvXBZ6Zhgu8pE=;
 b=NR03Zf+Mhgdrob/EmVEJ8hVpegIqQcrj+KCx1Ez+Fcgq8/JqiMEcsFmFVuuq2CCj/mNnDw
 bga4htSZi1/KtADg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F08D813A7C;
 Wed, 31 Aug 2022 12:54:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C1xaOepZD2PUJwAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Wed, 31 Aug 2022 12:54:02 +0000
Message-ID: <fb93f3bd-1a22-6a1d-c0ed-01eba39121bb@suse.cz>
Date: Wed, 31 Aug 2022 14:54:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>
References: <20220830135007.16818-1-mdoucha@suse.cz>
 <20220830135007.16818-4-mdoucha@suse.cz> <Yw4jYgDzNj9BAqOf@yuki>
 <45d76082-49f3-74bb-fd3c-6f5fd2d6136f@suse.cz> <Yw9ZCTP0l7FjRtLg@yuki>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <Yw9ZCTP0l7FjRtLg@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 03/10] ksm: Add max_runtime to tests
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

On 31. 08. 22 14:50, Cyril Hrubis wrote:
> Hi!
>> Alternatively, we could measure 1 full ksmd scan in setup() and then set
>> max_runtime dynamically. Each call of create_same_memory() would need
>> roughly 16 scan times. Time spent in ksm_child_memset() is included in
>> that estimate.
> 
> That sounds good as well, but I would still set the .max_runtime to
> rough guess in tst_test structure and then adjusted it in the test
> setup().

The current patch is a good enough guess for ~2-4GB machines. Or do you 
want to target bigger machines by default?

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
