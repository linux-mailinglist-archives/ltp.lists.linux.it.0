Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9AA3C9C15
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 11:46:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 904583C863F
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 11:46:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CDB603C65D4
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 11:46:00 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 420EC1A006A0
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 11:45:57 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 975631FDFD;
 Thu, 15 Jul 2021 09:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626342357;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ez7tFwj5Tz9QrwjlpLN9Sxl9MWaETxhLCITCBsQtHKM=;
 b=m4OY/jEhp+jhJCtsYHnNa7DzFDr4aecaUSqspD68AmEPjYXz/zP9bWkhzqwkQK8Lv68uWt
 E5fDKPafmO0p6HTwrJmm7zcSVAVMZ05PJ3xFKCbEM7WAcTVO0tN9RaJphXK4SzlvWXA0Jg
 B+5yJImipiZqrhj3O1gREO7dikWLHGc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626342357;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ez7tFwj5Tz9QrwjlpLN9Sxl9MWaETxhLCITCBsQtHKM=;
 b=Zb8btsFHMGqVyYlHBcFFcH6QMNQR77jBJKfv9iMUOYkJNFiIpjQZkF5Btfz/5N4Sa2HhIw
 +w63LC3T7F4qj7Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6397C13C31;
 Thu, 15 Jul 2021 09:45:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id U3D5FtUD8GAyDAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 15 Jul 2021 09:45:57 +0000
Date: Thu, 15 Jul 2021 11:45:55 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it, Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YPAD0y1Sq9H/bE7O@pevik>
References: <20210715083052.7138-1-pvorel@suse.cz>
 <YPACD9fqq2HpD3gC@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPACD9fqq2HpD3gC@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 0/5] 	Run tests in CI
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

Hi Cyril,

> Verified slightly modified version (see diff below):
> https://github.com/pevik/ltp/actions/runs/1033374720

Well, still some minor order issue with "In RPN: ..." (printed to stdout) being
at the end, but I give up and merge (unless you have explanation for it).
https://github.com/pevik/ltp/runs/3075175819?check_suite_focus=true#step:11:501

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
