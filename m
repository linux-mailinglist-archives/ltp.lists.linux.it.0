Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EBA5AD5A5
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Sep 2022 17:01:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7B0E3CA990
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Sep 2022 17:01:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 32C803C1B7E
 for <ltp@lists.linux.it>; Mon,  5 Sep 2022 17:01:24 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7228F60082A
 for <ltp@lists.linux.it>; Mon,  5 Sep 2022 17:01:22 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5B5F21FA34;
 Mon,  5 Sep 2022 15:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1662390082;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nHMiqgqc3eNoArwYR8Quh8TfMgICkY4ivZD8uo5p1Tk=;
 b=m0po4SEWtEHa1k0DDKIdyYcDytOcZuKJiy8HBCsHGoMDqDIcZb1pIjk+bVHkQGVI73A0J5
 HEChf5PtQYjJ4oq/pHt4DGIXylGbN/y51x006MhxPE6M97cP5YXHkcKMg0CVx0Se9PPBx2
 QtotnK2f/sU+SUQGHHL904/yUrzB4qQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1662390082;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nHMiqgqc3eNoArwYR8Quh8TfMgICkY4ivZD8uo5p1Tk=;
 b=Hhh21KMVZ1WoOVCA0RZ4cGwikaFY9ZXjlIgV6Dxy77N3i9KxWjEPa6HaeBSVA8FtNkY+iK
 3hvg+HoBk7kEOPAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0184613A66;
 Mon,  5 Sep 2022 15:01:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MP2sOEEPFmPrTAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 05 Sep 2022 15:01:21 +0000
Date: Mon, 5 Sep 2022 17:01:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Avinesh Kumar <akumar@suse.de>, ltp@lists.linux.it
Message-ID: <YxYPP1ORbaFGVXje@pevik>
References: <20220902063341.21705-1-akumar@suse.de>
 <YxYLhe3E/nWg1xs0@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YxYLhe3E/nWg1xs0@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] unlink08: use TST_EXP_FAIL(),
 turn comment into docparse and reword, copyright update
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

Hi Avinesh,

FYI I also make subject shorter (it should be ~50 characters, the rest should go
to the blank separated log body.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
