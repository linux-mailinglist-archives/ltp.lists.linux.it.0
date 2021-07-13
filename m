Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB453C70D9
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 15:01:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3DFA3C8780
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 15:01:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 69EA83C2EB9
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 15:01:15 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AA5EF14004E1
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 15:01:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 061BC2045C;
 Tue, 13 Jul 2021 13:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626181274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=quptba6B0h4cWA8cNm7e23fHMrKFXtIhpbH6zYGZHpM=;
 b=q7ZLASoavAmND90LSE1RbYf8iqNIW0J79VdtgPunHEfLK19IbbVZ36J3icQj7i8E57yPWa
 KALJ76VEpbiCKzxsguUnogG7T+olhgRkJLYXqqyLVw2dc+ANBgzcDShf70/Jz67oKOW+S8
 sWR4eMBeMXEsmxtV8K3iIeDcb2OZF/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626181274;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=quptba6B0h4cWA8cNm7e23fHMrKFXtIhpbH6zYGZHpM=;
 b=/tHTDD55A5XEgdN+fejObHlJ6g0WN9vv4+39C+DCSo6+glB/TJ7IHHxlmJ+h9CVe5PaPca
 +VM9Rqlo5a8vjKDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D291A13AE9;
 Tue, 13 Jul 2021 13:01:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YFPwMJmO7WC3DAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 13 Jul 2021 13:01:13 +0000
Date: Tue, 13 Jul 2021 14:35:40 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YO2InGIKtRJOZPOy@yuki>
References: <9c05b592-e474-6a3e-2dc1-ec075a0bc558@canonical.com>
 <YO1/J2pTbSsX2dGb@yuki>
 <c253160b-7326-8583-9713-8b3978473c7d@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c253160b-7326-8583-9713-8b3978473c7d@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] Failing test on failing shell commands
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > We do have ROD (as a shorthand for "run or die") in the shell test
> > library, so this really should be:
> > 
> > 	ROD mkdir subgroup
> 
> Thanks. This will however fail entire suite (memcg_use_hierarchy_test)
> and other tests won't get executed. The failure could be only local, so
> other tests are still meaningful.

If you want to exit the subtest you really have to handle the return
values yourself, report the error, and return from the test function.

The question is which status to report. The TBROK status means that test
has failed setup phase and there is no point to continue, so this
probably should map to tst_res TWARN "...".

Another solution would be splitting the test into three seprate tests
so that we can use ROD.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
