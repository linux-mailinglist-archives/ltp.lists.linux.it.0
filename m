Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E846613891
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Oct 2022 15:00:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A6FE13CAC2D
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Oct 2022 15:00:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5A4B93CABC5
 for <ltp@lists.linux.it>; Mon, 31 Oct 2022 15:00:03 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 63CE71000456
 for <ltp@lists.linux.it>; Mon, 31 Oct 2022 15:00:01 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4C3371F987;
 Mon, 31 Oct 2022 14:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1667224801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1nui9r6sKPdbLSnHgBV8iKvfv0xcWc+Ra7KC6pA1CXE=;
 b=DMEmgR0N1L4N/0Dwu7fuCaWImGzvxog6TrP9Q2yqkF4g5q4hZlSE7y4DcpIVu/kKHiR5E3
 P//xM8vmG1tTM5b1+8C0sXy1685Uqa3DKdY5XWcEjkRcshKDfV3K3fv3uH5D+qdZh/poAR
 RjaP0TPEUqwI11XvaYRbeod2dhWoKic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1667224801;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1nui9r6sKPdbLSnHgBV8iKvfv0xcWc+Ra7KC6pA1CXE=;
 b=CvQZEC++zULOicV3GDdAALOurzFMUM4wzzEEv0HgtZ1JSd7bVVOEtdxUcfHtQozdBxdavt
 AtOut7f0e1wRP/Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 34B8D13451;
 Mon, 31 Oct 2022 14:00:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 51upC+HUX2OKbAAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Mon, 31 Oct 2022 14:00:01 +0000
Message-ID: <96b14089-f1bb-e634-d74b-75fe92e58efa@suse.cz>
Date: Mon, 31 Oct 2022 15:00:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Petr Vorel <pvorel@suse.cz>
References: <20221027140954.4094-1-akumar@suse.de> <Y1+zeo9kmWOl2yE3@pevik>
 <ad63ddb5-b443-c0ee-fb1b-748bded5f151@suse.cz> <Y1/SkicyE3Mg9Fpc@pevik>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <Y1/SkicyE3Mg9Fpc@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] setfsuid02: using -1 as invalid fsuid for
 setfsuid()
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

On 31. 10. 22 14:50, Petr Vorel wrote:
>> No, UID16_CHECK(invalid_uid, setfsuid); is the correct test call. The test
>> is supposed to verify that trying to set invalid_uid will fail, and the only
>> way to verify that it failed is to call setfsuid(invalid_uid) again and
>> check that it returns current_uid.
> I'm somehow blind today. UID16_CHECK() in compat_tst_16.h calls
> UID_SIZE_CHECK(), which just checks the uid value. I don't see setfsuid() call,
> IMHO that's done in SETFSUID().

It doesn't make sense to call UID16_CHECK() on a value that we'll never 
pass to a 16bit syscall, does it?

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
