Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A85B5A7A18
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Aug 2022 11:23:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3DEDA3CA6BA
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Aug 2022 11:23:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F18673CA0B0
 for <ltp@lists.linux.it>; Wed, 31 Aug 2022 11:23:20 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 24BD91A0090E
 for <ltp@lists.linux.it>; Wed, 31 Aug 2022 11:23:19 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7AB1D2224B;
 Wed, 31 Aug 2022 09:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1661937799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fiJSlqKbo1mqwqQx81aIewwCAoke3RSBmBwdcivBndk=;
 b=h3xCGS7Up+IZEV240JABSFgTzpUZ1hLYIGrUqnfbtrKyIIPMQbgKND4VwxsJMUebwphc1b
 v16cQG6PxCrTykrK9qt5DHavey9tVjvwACBwmVtyt9LcAFsDJmQwKNaYztLhi0IPGR7Zyz
 ek7Gz4e8Xfb3r6t5fo42LnS3tx6kHX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1661937799;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fiJSlqKbo1mqwqQx81aIewwCAoke3RSBmBwdcivBndk=;
 b=1l/s/UGqf45YJL5vQvhsp8NYmndW+jxrko5WjC60zQH6USuAPIOpZ1oudFr55MRfDpLkEr
 eCCyKW5fYYhtqdBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D7F51332D;
 Wed, 31 Aug 2022 09:23:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S80PEocoD2OuQwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 31 Aug 2022 09:23:19 +0000
Date: Wed, 31 Aug 2022 11:25:18 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <Yw8o/igtdRCALl1x@yuki>
References: <20220830135007.16818-1-mdoucha@suse.cz>
 <20220830135007.16818-7-mdoucha@suse.cz> <Yw8aBE5SNZmY+mrd@pevik>
 <256a2476-dff0-dfe0-8913-4cfdd38c8a6d@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <256a2476-dff0-dfe0-8913-4cfdd38c8a6d@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 06/10] copy_file_range01: Add max_runtime
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

Hi!
> > LGTM (test uses all_filesystems, but 20 for all possible filesystems should be OK).
> Hmm, I've missed the .all_filesystems setting here. In that case the 
> test should take ~2 seconds per filesystems and the patch is not needed. 
> Feel free to discard it then.

I would still vote for adding something as .max_runtime = 5 or something
like this so that it's obvious that the test can run for a few seconds
per run() call especially on slower disks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
