Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DDF43CA8E
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 15:26:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 775563C6BE4
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 15:26:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4111E3C697C
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 15:26:03 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 49227100195B
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 15:26:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 89E7A212B7;
 Wed, 27 Oct 2021 13:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635341162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Kww13JzqpyvhpCNmJ+elKD8zd4c1oaqSCFMrFMFH60=;
 b=QszY3CT4V3otB5KNmyqb/++VamVJ/NjQo6SZqLXj7COBAED07Jb6c9IlFoqUNSGULn2l+I
 /yE4KmXnpi8ejQp8rfHk5hSiQWg1zUtLBs22SzcbuRyyfiYF3IQqCrecuXIby4MscTTZOb
 eVTKM6BdIioWw01ywvw3O1NMRrERUcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635341162;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Kww13JzqpyvhpCNmJ+elKD8zd4c1oaqSCFMrFMFH60=;
 b=YLYWeHEbg/O+Y7vawdCfJmglHfoVrnbNrvA+JcrWkIL2e9YYohZNvtFq1zDiWE3pXPwy8B
 KCKIb0G2GRYWG/Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 68DB513D55;
 Wed, 27 Oct 2021 13:26:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oLHDFmpTeWE2JwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 27 Oct 2021 13:26:02 +0000
Date: Wed, 27 Oct 2021 15:26:52 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YXlTnLceG4Qhyf6n@yuki>
References: <20211014012533.18205-1-zhanglianjie@uniontech.com>
 <20211014012533.18205-4-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211014012533.18205-4-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/5] syscalls/clone06: Convert to new API
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
> +	const char *env_val = getenv(ENV_ID);
> +	if (!env_val) {
> +		tst_res(TFAIL, "Variable " ENV_ID " not defined in child");
> +		exit(-1);

I've changed these two exit(-1) in child to just exit(0), since the test
result is propagated automatically (by the tst_res(TFAIL, ...) call) and
the child shouldn't do anything else than exit(0).

And pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
