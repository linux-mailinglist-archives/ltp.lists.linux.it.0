Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FA4811A17
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Dec 2023 17:52:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BCBE23CF51E
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Dec 2023 17:52:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4541E3CCAC9
 for <ltp@lists.linux.it>; Wed, 13 Dec 2023 17:52:03 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 252FA1A00EF9
 for <ltp@lists.linux.it>; Wed, 13 Dec 2023 17:52:01 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 080B81FD8B;
 Wed, 13 Dec 2023 16:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1702486320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J1SFJDFKvtTmh08CEKXgr8V+FtVPkQtA0aNwr1ROKK0=;
 b=MigSjoDAyc/OsU7CvS/Q9Hjq5aeECHuPeLr4GJ005R6TJsYcVBas6h12jAKhmvtr65ITM9
 k8Tx59wVR3GNOQn/4Qhi0ZPyq1n4NEB5JVPonZ0WRLfazzyF7+HgSesPtePHTnH787vIwu
 3Woa3VS0SA0mDtoO8I5/P3uJS8hTQAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1702486320;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J1SFJDFKvtTmh08CEKXgr8V+FtVPkQtA0aNwr1ROKK0=;
 b=pbIcULFftSoGXmXhNP8HU0iVkftqk6r7QJVt8cQnLMR6l7i4YbxnxYdA2XuhkhZxILflmU
 6yhbumnhIEwkSOAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1702486320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J1SFJDFKvtTmh08CEKXgr8V+FtVPkQtA0aNwr1ROKK0=;
 b=MigSjoDAyc/OsU7CvS/Q9Hjq5aeECHuPeLr4GJ005R6TJsYcVBas6h12jAKhmvtr65ITM9
 k8Tx59wVR3GNOQn/4Qhi0ZPyq1n4NEB5JVPonZ0WRLfazzyF7+HgSesPtePHTnH787vIwu
 3Woa3VS0SA0mDtoO8I5/P3uJS8hTQAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1702486320;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J1SFJDFKvtTmh08CEKXgr8V+FtVPkQtA0aNwr1ROKK0=;
 b=pbIcULFftSoGXmXhNP8HU0iVkftqk6r7QJVt8cQnLMR6l7i4YbxnxYdA2XuhkhZxILflmU
 6yhbumnhIEwkSOAQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E6A821391D;
 Wed, 13 Dec 2023 16:51:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id BDxHOC/heWU5bQAAn2gu4w
 (envelope-from <jack@suse.cz>); Wed, 13 Dec 2023 16:51:59 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 9965FA07E0; Wed, 13 Dec 2023 17:51:51 +0100 (CET)
Date: Wed, 13 Dec 2023 17:51:51 +0100
From: Jan Kara <jack@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20231213165151.qvbtrr546cnxm2ou@quack3>
References: <20231207194011.273027-1-pvorel@suse.cz>
 <20231212144821.rji2to3iiedyqxlm@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231212144821.rji2to3iiedyqxlm@quack3>
X-Spam-Score: -2.01
X-Spam-Level: 
X-Spam-Score: -2.07
X-Spamd-Result: default: False [-2.07 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[14];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 FREEMAIL_CC(0.00)[lists.linux.it,suse.cz,redhat.com,suse.com,fujitsu.com,linux.dev,vger.kernel.org,gmail.com];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-2.47)[97.59%]
X-Spam-Flag: NO
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/3] Add support bcachefs filesystem
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
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
 Brian Foster <bfoster@redhat.com>, fstests@vger.kernel.org,
 Richard Palethorpe <rpalethorpe@suse.com>, linux-bcachefs@vger.kernel.org,
 Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue 12-12-23 15:48:21, Jan Kara wrote:
> On Thu 07-12-23 20:40:08, Petr Vorel wrote:
> > Hi all,
> > 
> > @Amir @Jan, could you please have look on fanotify failures on Bcachefs?
> > fanotify13.c, fanotify15.c and fanotify16.c produce many errors.
> > 
> > To test, just apply this patchset and then run with LTP_SINGLE_FS_TYPE:
> > 
> > # LTP_SINGLE_FS_TYPE=bcachefs ./fanotify15
> 
> I suspect some catch with fsids but we'll see... I hopefully get to this
> tomorrow.

Ok, this was a bug in bch_encode_fh(). Fix submitted.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
