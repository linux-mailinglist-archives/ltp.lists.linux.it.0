Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 465BA606FF8
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Oct 2022 08:22:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D03B3CB173
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Oct 2022 08:22:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D66123C9179
 for <ltp@lists.linux.it>; Fri, 21 Oct 2022 08:22:54 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 317B71000EC1
 for <ltp@lists.linux.it>; Fri, 21 Oct 2022 08:22:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 29BD81F461;
 Fri, 21 Oct 2022 06:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1666333373;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3uf00WGjBEHJVxeRmd/OK7TjP6c+kqNDvBnUSUc2vHE=;
 b=RTZtLxVtpiuUaUtyGKTshL0X15DTiByTJU6vTJPE71wnhEJrrfzHVa8zPINvTGqmooFL9r
 y1Z1eUooQRuqALzwtEd8N5L/CzpWtimse/mk4N5mNeZ6nR880Ej3i/UhAXw1uRdtzASw/p
 GJgas48w694gE9npEqtJDt0bkL+QZU0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1666333373;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3uf00WGjBEHJVxeRmd/OK7TjP6c+kqNDvBnUSUc2vHE=;
 b=wJSwmHdHvvxCuKsy9plyMSLTMMzjsyDgkNgVe7dDlwvkTviWjismLOF5Oq6mJrudytxanh
 9heONdJRk57wMzCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F3A011331A;
 Fri, 21 Oct 2022 06:22:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mTvwObw6UmMtEAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 21 Oct 2022 06:22:52 +0000
Date: Fri, 21 Oct 2022 08:22:51 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Akihiko Odaki <akihiko.odaki@daynix.com>, ltp@lists.linux.it,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
Message-ID: <Y1I6u1a7RAS1wmZL@pevik>
References: <20221020120741.212671-1-akihiko.odaki@daynix.com>
 <Y1GWOPpb+Z8hwhQd@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y1GWOPpb+Z8hwhQd@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/6] ftp/ftp01: Use tst_net.sh
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

Hi Akihiko,

I'm sorry I overlooked your message at v1
https://lore.kernel.org/ltp/9894db50-6319-a818-c995-3ba9ab102c4b@daynix.com/

I guess script expects $PASSWD to be set.
Also trying to follow the instruction, none of them (allowing root in
/etc/ftpusers or filling /root/.netrc with machine localhost) work for me:
https://github.com/linux-test-project/ltp/tree/master/testcases/network#ftp-and-telnet-setup

I suppose any ftpd implementation must be run on the remote server (localhost,
if tst_net.sh uses netns - the default or on remote host, if ssh is used).
Otherwise ftp command "user $RUSER $PASSWD" cannot work, right?

Although it should behave the same regardless netns or ssh is used,
how do you test v3, with ssh or with netns (the default)? Or both?

It'd be nice if there was connection detection in the setup and tst_brk TCONF if
login does not work. The best would be to have configuration in the setup() +
cleanup in the cleanup()).

There are tests, which do vsftpd configuration: ftp-download-stress.sh,
ftp-upload-stress.sh.

BTW in the past we seriously considered to delete these highlevel smoke tests.
LTP is concentrated to test kernel API and internals, thus we didn't see much
value with smoke tests like this (that's why they haven't been rewritten to use
new API), specially if they require complex setup and get false positives when
SUT not configured properly. That's why it'd be nice to at least TCONF (if not
doing whole setup).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
