Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 341A647AA51
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Dec 2021 14:24:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C27D83C9172
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Dec 2021 14:24:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EAEC13C0B99
 for <ltp@lists.linux.it>; Mon, 20 Dec 2021 14:24:48 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 553391401176
 for <ltp@lists.linux.it>; Mon, 20 Dec 2021 14:24:47 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8D7C0212B5;
 Mon, 20 Dec 2021 13:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1640006687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KLdvXdm0rPlRXDA3ckaAzJTfRtzI/PJiszH0GOTECnw=;
 b=jTKJ23zobI6ERRcu7pBSszoFRb3K/aUt1AvJkigSmCsnM4+39N99U58ZnH9S2o4bwMelro
 FaPtJWq7xb+sk+njaDnV9DcoP3Q8nRVdWraCsVAA9A4e2KoomruyBlYlQ2t57Jrsu26Eni
 TK86g6yJO/osCaaVMS001BoTpfjGjd4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1640006687;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KLdvXdm0rPlRXDA3ckaAzJTfRtzI/PJiszH0GOTECnw=;
 b=XbFdvnvyyXz1HPteE+47E8MfGfYuLlE4wKXPseoS9+EI+GAcjGabVRPnkCfkwy+zvTHhAA
 nwTI0gri+IE5yuAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7AFD113CA1;
 Mon, 20 Dec 2021 13:24:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iucyHB+EwGEOewAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 20 Dec 2021 13:24:47 +0000
Date: Mon, 20 Dec 2021 14:26:17 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YcCEeStAPNW0nKPM@yuki>
References: <20211220095416.583323-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211220095416.583323-1-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/3] lib: add functions to adjust oom score
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
> This introduces function to LTP for adjusting the oom_score_adj of
                                   ^
				   to adjust

> target process, which may be helpful in OOM tests to prevent kernel
> killing the main or lib process during test running.
                                         ^
					 test run.
> The exported global tst_enable_oom_protection function can be used
> at anywhere you want to protect, but please remember that if you
> do enable protection on a process($PID) that all the children will
> inherit its score and be ignored by OOM Killer as well. So that's
> why tst_disable_oom_protection is recommended to combination in use.
                                                  ^
						  to be used in
						  combination.


Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
