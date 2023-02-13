Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 022E8694DEA
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Feb 2023 18:26:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B3BF13CBF85
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Feb 2023 18:26:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9A64C3C1047
 for <ltp@lists.linux.it>; Mon, 13 Feb 2023 18:26:14 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1A3FF1000608
 for <ltp@lists.linux.it>; Mon, 13 Feb 2023 18:26:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3F7911FEAF;
 Mon, 13 Feb 2023 17:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1676309173;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RRFxcdLKB7r/5qjHs03cIA6drF5duKnJBel+SM4xOVE=;
 b=sBxMbMllmzybjZXVlVoA8M9ILAPJ6pA4hjqjsG30YUPSW3gZqCBVAkjKzXjbOkgxhOttq1
 f3Dsemsib6S/HGpGAnFoX1E+8ZhgZYwPD0yeqV2M3nm+hKAJKrexeqfDTgHFLhmPTvlPRk
 NOM3EkSRlivS1LBRsd3lkISHvYj4GP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1676309173;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RRFxcdLKB7r/5qjHs03cIA6drF5duKnJBel+SM4xOVE=;
 b=gL1fOVZrvm94Da0i6UwanwIi8S8jcVwLj7B5DDBgs9UPuo3ORck8Ty41ZvdcxREXyYP/DT
 Tg36fwkofaMtyDDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E52CC1391B;
 Mon, 13 Feb 2023 17:26:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uT8WLLRy6mMdYAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 13 Feb 2023 17:26:12 +0000
Date: Mon, 13 Feb 2023 18:26:10 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Tarun Sahu <tsahu@linux.ibm.com>
Message-ID: <Y+pysr+HTTN/aAcX@pevik>
References: <20230125222703.19943-2-pvorel@suse.cz>
 <20230213152655.64295-1-tsahu@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230213152655.64295-1-tsahu@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] hugepage15: Resolve compile time warning
 generating with -O0
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Tarun,

thanks for rebasing. I dared to separate include change into it's own commit
(merged as 2 commits).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
