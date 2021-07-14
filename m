Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9073C833B
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 12:49:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BF063C7506
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 12:49:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 23AF33C245D
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 12:49:41 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A4848600274
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 12:49:40 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F3F0A2028A;
 Wed, 14 Jul 2021 10:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626259780;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HDSfKTq3bezPNfy90pj1/KFHj1X8bybBj2yhrvafjVE=;
 b=ilNnt9fK1Fq6yBnS6znYz1F30QCIEyXFa52r3KqkuMfYF0UKc7caHoPOspP0ixxdKk2d+P
 kBDVImqYxSmrrm8V1FkSRmWWQ20NRFuWymLg8EjDCif+E9hpu76HcBENuRIt0B/odXFAy+
 KKecC1RR3Ed2UDOYpZC9dLDdDwExCqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626259780;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HDSfKTq3bezPNfy90pj1/KFHj1X8bybBj2yhrvafjVE=;
 b=Sta31Q1MTBoEfJ9Wef6AKT2YycglEcosHS0lUzE3zqdcTyBNj452PbIpxI+VQqE+ZlDxgH
 l64wlNKceBr/u3Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CAF4F13BFD;
 Wed, 14 Jul 2021 10:49:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wn6+L0PB7mCvNwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 14 Jul 2021 10:49:39 +0000
Date: Wed, 14 Jul 2021 12:49:38 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YO7BQjUuCP3ah5wu@pevik>
References: <20210714071158.15868-1-rpalethorpe@suse.com>
 <20210714071158.15868-4-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714071158.15868-4-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/8] doc: Add rules and recommendations list
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

Hi Richie,

obviously correct.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

> +++ b/doc/test-writing-guidelines.txt
> @@ -10,6 +10,11 @@ NOTE: See also
>        https://github.com/linux-test-project/ltp/wiki/Shell-Test-API[Shell Test API],
>        https://github.com/linux-test-project/ltp/wiki/LTP-Library-API-Writing-Guidelines[LTP Library API Writing Guidelines].

> +Rules and recommendations which are "machine checkable" should be
> +tagged with an ID like +LTP-XXX+. There will be a corresponding entry
> +in 'doc/rules.tsv'. When you run 'make check' or 'make check-test' it
nit: I'd make 'doc/rules.tsv' as link (for lazy people like me):
https://github.com/linux-test-project/ltp/tree/master/doc/rules.tsv[doc/rules.tsv]

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
