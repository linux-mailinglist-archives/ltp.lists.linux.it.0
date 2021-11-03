Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AC1444222
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 14:04:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01F5A3C72BC
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 14:04:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B88893C129E
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 14:04:55 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C1C156006F0
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 14:04:54 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 22B401FD2F;
 Wed,  3 Nov 2021 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635944694;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gSrGr6a4zWnYqzHKSl4TXEMRizQUl1ousqbP/rx+GxY=;
 b=aJrqwiickrOAb/uHnoaHy35bVsog/XtUTG0MItv0H+IjlZxl0GTh36jj1nIdZyX/lZzC2y
 irphy2xisy+7qKafWjGaKDVJi21M93Gz7c1ZOTn6ubKglMCZ7Vj8bK2/FbZmu/ylHllAO8
 TNju0z1kwiFSUPfkt7el4G1GPjaECiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635944694;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gSrGr6a4zWnYqzHKSl4TXEMRizQUl1ousqbP/rx+GxY=;
 b=haaI9YA/sRs8cKSOJRUbPtYMhZP7G08vSrz91wXU1TgMhvUHPJH/jkIydr6tDjxa0SdOII
 2g/wBsWplXqSeHDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0350C13CFF;
 Wed,  3 Nov 2021 13:04:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cV6ZOvWIgmGNZwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 03 Nov 2021 13:04:53 +0000
Date: Wed, 3 Nov 2021 14:04:52 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YYKI9I05hEjiKNiE@pevik>
References: <20211103120233.20728-1-chrubis@suse.cz>
 <20211103120233.20728-8-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103120233.20728-8-chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 7/7] docparse: Split into metadata and docparse
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

Hi Cyril,

there are still some failures
https://github.com/pevik/ltp/actions/runs/1416702471

make install has wrong path (it's on jobs with out-of-tree build and with
Fedora; it's visible in .github/workflows/ci.yml - MAKE_INSTALL but unfortunately GitHub Actions hide these variables):

https://github.com/pevik/ltp/runs/4092384478?check_suite_focus=true
install -m 00775   "/__w/ltp/ltp-build/metadata/ltp.json" /github/home/ltp-install/opt/ltp/metadata/ltp.json
install -m 00775   "/__w/ltp/ltp-build/metadata/docparse" /github/home/ltp-install/opt/ltp/metadata/docparse
install: cannot stat '/__w/ltp/ltp-build/metadata/docparse': No such file or directory
make[1]: *** [/__w/ltp/ltp/include/mk/env_post.mk:85: /github/home/ltp-install/opt/ltp/metadata/docparse] Error 1

Obviously path should be '/__w/ltp/ltp-build/metadata/../docparse'

Reproducing locally:
$ ./configure CC=clang
$ cd metadata
$ make
$ make install
mkdir -p "/opt/ltp/metadata"
install -m 00775   "ltp.git/metadata/ltp.json" /opt/ltp/metadata/ltp.json
install -m 00775   "ltp.git/metadata/docparse" /opt/ltp/metadata/docparse
install: cannot stat 'ltp.git/metadata/docparse': No such file or directory
make: *** [../include/mk/env_post.mk:85: /opt/ltp/metadata/docparse] Error 1

Kind regards,
Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
