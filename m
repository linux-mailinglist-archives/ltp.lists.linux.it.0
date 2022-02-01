Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0D14A5A70
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Feb 2022 11:46:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9E3E3C9892
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Feb 2022 11:46:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B6D8B3C97FA
 for <ltp@lists.linux.it>; Tue,  1 Feb 2022 11:46:25 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2B0D410005F7
 for <ltp@lists.linux.it>; Tue,  1 Feb 2022 11:46:24 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 50F7821634;
 Tue,  1 Feb 2022 10:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643712384;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S//nI82yGVQJrzoFhzJtaDnoLmfNZsiuCd2lzTPEiq4=;
 b=MSrZNVriV9uoIdTdBNExc2Db2CzWZrEVZnHdPn73SetigaI9xhirUvTCJFAua0vMeiW8pW
 xVmjudeNMj/URkE3b70G7HjJiiZaezRwLH3zNGRF1+u180a4lFi+bUR9uxLU/I1STWLMkf
 +pqU7cwLnz6q1frSseCrioEJlcmr0Nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643712384;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S//nI82yGVQJrzoFhzJtaDnoLmfNZsiuCd2lzTPEiq4=;
 b=j0+Jq+C77IGbyD2UO05itQpcrt7rrZvOMaFr1vSR11viK8PgKcLQIfs0sJtAYZqyU7Qb6I
 uJmSg9VaBSteF5Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1E87113D24;
 Tue,  1 Feb 2022 10:46:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zFKvBYAP+WHEGQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 01 Feb 2022 10:46:24 +0000
Date: Tue, 1 Feb 2022 11:46:22 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YfkPfjqRz9j2Jbuw@pevik>
References: <20220201094451.7651-1-pvorel@suse.cz>
 <YfkMR3oM/QD9a3I9@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YfkMR3oM/QD9a3I9@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] ci: Remove CentOS 8
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

> Hi!
> > It EOL in 12/2021 and CI is failing due removed repo:

> Since it's EOL we can't do anything else.

> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

> I wonder if we should add a different distribution instead. Maybe
> replace it with Fedora later on?
We have CentOS 7 (EOL 2024) and also fedora:latest, which is 35
(their devel called rawhide is currently 36).

Thus going to merge it with your ack.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
